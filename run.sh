#!/usr/bin/env bash
# Run Auto Job Applier with virtual environment activation

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_PATH="$SCRIPT_DIR/setup/.venv"

if [ ! -d "$VENV_PATH" ]; then
  echo "Virtual environment not found at $VENV_PATH" >&2
  echo "Run setup/setup_venv.sh first." >&2
  exit 1
fi

# shellcheck disable=SC1090
source "$VENV_PATH/bin/activate"

# Ensure required dependencies are installed
if ! python -c "import pyautogui" >/dev/null 2>&1; then
  echo "Installing Python dependencies..."
  pip install -r "$SCRIPT_DIR/requirements.txt"
fi

python runAiBot.py "$@"
