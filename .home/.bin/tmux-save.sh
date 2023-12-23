#!/bin/bash

# Save tmux environment
tmux saveb - | gzip -c > ~/.tmux/resurrect/autosave.tmux

