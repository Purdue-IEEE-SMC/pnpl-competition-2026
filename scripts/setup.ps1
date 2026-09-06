$ErrorActionPreference = "Stop"

if (-not (Get-Command py -ErrorAction SilentlyContinue)) {
    Write-Host "Python launcher 'py' was not found."
    Write-Host "Install Python 3.11 from https://www.python.org/downloads/"
    exit 1
}

py -3.11 -m venv .venv
& .\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

# You may need to run the following as the pnpl github ReadeMe has a unicode character that cannot be read 
# Error msg: UnicodeDecodeError: 'charmap' codec can't decode byte 0x8d

# $env:PYTHONUTF8="1"
# python -m pip install -r requirements.txt

Write-Host ""
Write-Host "Setup complete."
Write-Host "Activate with: .venv\Scripts\Activate.ps1"
Write-Host "Then run: python scripts/check_environment.py"
