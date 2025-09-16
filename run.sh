#!/bin/bash

# Find out where we are
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Script directory: $SCRIPT_DIR"

# Change to the script directory
cd "$SCRIPT_DIR"

# Check if .venv exists
if [ ! -d ".venv" ]; then
    echo "Error: .venv directory not found in $SCRIPT_DIR"
    echo "Please create a virtual environment first with: python3 -m venv .venv"
    exit 1
fi

# Activate the venv
source .venv/bin/activate
echo "Venv activated."

# Install dependencies
if [ ! -f "requirements.txt" ]; then
    echo "Installing dependencies..."
    pip install -r requirements.txt
else
    echo "No requirements found, skipping dependency installation."
fi

# Check if main.py exists
if [ ! -f "main.py" ]; then
    echo "Error: main.py not found in $SCRIPT_DIR"
    exit 1
fi

# Run the Python script
python main.py