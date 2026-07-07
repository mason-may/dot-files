#!/bin/bash

# Define session name
SESSION="iso-sender"

# Define directories
ISO_SENDER_DIR="$HOME/source/iso-message-sender/"
GENERAL_NOTES_DIR="$HOME/notes"

# Kill existing session if it exists
tmux kill-session -t "$SESSION" 2>/dev/null

# Start a new tmux session and create the first window (main development)
tmux new-session -d -s "$SESSION" -n "main" -c "$ISO_SENDER_DIR"

# Split the main window into two vertical panes
tmux split-window -v -t "$SESSION:main" -c "$ISO_SENDER_DIR"

# Split the bottom pane horizontally to create a third pane for logs/monitoring
tmux split-window -h -t "$SESSION:main.1" -c "$ISO_SENDER_DIR"

# Resize panes: top pane 60%, bottom left 25%, bottom right 25%
tmux resize-pane -t "$SESSION:main.0" -p 60
tmux resize-pane -t "$SESSION:main.1" -p 20
tmux resize-pane -t "$SESSION:main.2" -p 20

# Set up the panes
# Top pane: main development/editing
tmux send-keys -t "$SESSION:main.0" "# Main development pane - ready for editing" C-m

# Bottom left pane: build/test commands
tmux send-keys -t "$SESSION:main.1" "# Build and test pane" C-m

# Bottom right pane: logs/monitoring
tmux send-keys -t "$SESSION:main.2" "# Logs and monitoring pane" C-m

# Create second window for testing
tmux new-window -t "$SESSION:" -n "test" -c "$ISO_SENDER_DIR"
tmux send-keys -t "$SESSION:test" "# Testing environment" C-m

# Create third window for git operations
tmux new-window -t "$SESSION:" -n "git" -c "$ISO_SENDER_DIR"
tmux send-keys -t "$SESSION:git" "git status" C-m

# Create fourth window for notes
tmux new-window -t "$SESSION:" -n "notes" -c "$GENERAL_NOTES_DIR"

# Select the first window and top pane as default
tmux select-window -t "$SESSION:main"
tmux select-pane -t "$SESSION:main.0"

# Attach to session
tmux attach-session -t "$SESSION"
