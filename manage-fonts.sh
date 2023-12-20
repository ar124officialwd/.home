#!/bin/zsh

# Default values
fonts_dir="$PWD/.home/.fonts"
archive_name="fonts.tar.xz"
extract_path="$HOME/.fonts"

while getopts "d:c" opt; do
    case $opt in
        d)
            custom_path=$OPTARG
            ;;
        c)
            extract=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
    esac
done

# Generate or update the archive with max compression
generate_archive() {
    if [ ! -f "$archive_name" ]; then
        echo "Creating $archive_name with max compression..."
        find "$fonts_dir" -name '*.ttf' -exec tar --transform='s|.*/||' -caf "$archive_name" {} +
        echo "$archive_name created successfully."
        manage_font_prompt_user "Do you want to delete everything from $fonts_dir? (y/n)"
    else
        echo "$archive_name already exists. Updating..."
        find "$fonts_dir" -name '*.ttf' -exec tar --transform='s|.*/||' -caf "$archive_name" {} +
        echo "$archive_name updated successfully."
        manage_font_prompt_user "Do you want to delete everything from $fonts_dir? (y/n)"
    fi
}

# Extract the archive to the specified path
extract_archive() {
    if [ -z "$custom_path" ]; then
        echo "Error: -d option is required for extraction."
        exit 1
    fi

    echo "Extracting $archive_name to $custom_path..."
    tar xJf "$archive_name" -C "$custom_path"
    echo "$archive_name extracted to $custom_path."
}

# Prompt user for confirmation
manage_font_prompt_user() {
    read -q "?$1 "
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
}

# Check if -c option is provided
if [ "$extract" = true ]; then
    extract_archive
else
    generate_archive

    # If -d option is provided, extract to custom path
    if [ -n "$custom_path" ]; then
        extract_archive
    fi
fi

# If confirmed, delete everything from source directory
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -rf "$fonts_dir"
    echo "Everything deleted from $fonts_dir."
fi

