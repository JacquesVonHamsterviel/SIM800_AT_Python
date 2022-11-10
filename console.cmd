@echo off
cmd /k "call venv/scripts/activate.bat & python console.py & call venv/scripts/deactivate.bat & pause & exit"
