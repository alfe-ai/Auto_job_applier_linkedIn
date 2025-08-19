#!/usr/bin/env bash
set -e

VENV_DIR=".venv"

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
    echo "Created virtual environment at $VENV_DIR";
else
    echo "Using existing virtual environment at $VENV_DIR";
fi

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Upgrade pip to the latest version
pip install --upgrade pip

# Install required Python packages
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
fi

# Deactivate the virtual environment
deactivate

cat <<INFO
Virtual environment setup complete.
To activate it, run:
  source $VENV_DIR/bin/activate
INFO

