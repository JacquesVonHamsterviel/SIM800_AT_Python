@echo off
cmd /k "call venv/scripts/activate.bat & python main.py config/id.ini & call venv/scripts/deactivate.bat & pause & exit"
