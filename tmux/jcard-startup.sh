#!/bin/bash

# Define session name
SESSION="jcard"

# Define directories for each window
JCARD_DIR="$HOME/source/marqeta-jpos/"
JCARD_LOGS_DIR="/var/log/jcard/"
GENERAL_NOTES_DIR="$HOME/notes"

# Kill existing session if it exists
tmux kill-session -t "$SESSION" 2>/dev/null

# Start a new tmux session and create the first window (jcard)
tmux new-session -d -s "$SESSION" -n "jcard" -c "$JCARD_DIR"

# Split the jcard window into two vertical panes and set the correct directory
tmux split-window -v -t "$SESSION:jcard" -c "$JCARD_DIR"

# Send the Maven command to the lower pane but don't block execution
tmux send-keys -t "$SESSION:jcard.1" "mqc --mq01 --account-name mq01-qa --role-name team-transaction-engine-dev --region-name us-east-1 && mvn -pl jcard -am package -DskipTests=true" C-m

# Create the second window for logs
tmux new-window -t "$SESSION:" -n "jcard logs" -c "$JCARD_LOGS_DIR"
# The change directory is to get zsh to look correct
tmux send-keys -t "$SESSION:jcard logs" "cd .. && cd jcard" C-m  # Open Vim in the window

# Create the third window for general Vim
tmux new-window -t "$SESSION:" -n "general notes" -c "$GENERAL_NOTES_DIR"

# Select the first window as the default
tmux select-window -t "$SESSION:jcard.0"

# Attach to session
tmux attach-session -t "$SESSION"
