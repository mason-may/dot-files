#!/bin/bash

# Define session name
SESSION="dev-session"

# Define directories for each window
JCARD_DIR="$HOME/projects/jcard"
JCARD_LOGS_DIR="$HOME/projects/jcard/logs"
GENERAL_VIM_DIR="$HOME/projects"

# Start a new tmux session and create the first window (jcard)
tmux new-session -d -s "$SESSION" -n "jcard" -c "$JCARD_DIR"

# Split the jcard window into two vertical panes
tmux split-window -v -t "$SESSION:jcard"

# In the lower pane, run the Maven command
tmux send-keys -t "$SESSION:jcard.1" "mvn -pl jcard -am package -DskipTests=true" C-m

# Create the second window for logs
tmux new-window -t "$SESSION" -n "jcard logs" -c "$JCARD_LOGS_DIR"

# Create the third window for general Vim
tmux new-window -t "$SESSION" -n "general vim" -c "$GENERAL_VIM_DIR"
tmux send-keys -t "$SESSION:general vim" "vim" C-m  # Open Vim in the window

# Select the first window as the default
tmux select-window -t "$SESSION:1"

# Attach to session
tmux attach-session -t "$SESSION"

