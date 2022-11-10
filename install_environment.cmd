@echo off

echo Press Any Key To Start Environment Installation...
pause

python -m venv venv

cmd /k "call venv/scripts/activate.bat & pip install -r requirements.txt & call venv/scripts/deactivate.bat & echo Finish! & pause & exit"



