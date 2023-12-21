#!/bin/zsh

PATH=""

if hash npm 2>/dev/null; then
    npm install --location=global \
        nodemon pm2 serve \
        @angular/cli @ionic/cli react-scripts \
        sequelize-cli
else
    echo "\`npm\` command not found. Maybe you want to run \`FNM\` / \`Nodejs\` task first?"
    exit 1
fi