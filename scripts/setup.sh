#!/usr/bin/env bash
set -e

if ! command -v python3.11 >/dev/null 2>&1; then
  echo "Python 3.11 was not found."
  echo "Install it from https://www.python.org/downloads/"
  exit 1
fi

python3.11 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

echo
echo "Setup complete."
echo "Activate with: source .venv/bin/activate"
echo "Then run: python scripts/check_environment.py"
