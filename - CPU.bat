:: git pull
@echo off

for /d %%x in (tmp\tmp*,tmp\pip*,tmp\gradio\*) do rd /s /q "%%x" 2>nul || ("%%x" && exit /b 1) & del /q tmp\tmp* > nul 2>&1 & rd /s /q pip\cache 2>nul

set APPDATA=tmp
set USERPROFILE=tmp
set TEMP=tmp
set PYTHON=
set GIT=
set VENV_DIR=
set NUMEXPR_MAX_THREADS=16
set COMMANDLINE_ARGS=--autolaunch --theme=dark --disable-safe-unpickle --skip-torch-cuda-test --use-cpu all --precision full --no-half

call webui.bat
