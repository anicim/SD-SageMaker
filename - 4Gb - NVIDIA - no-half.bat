:: git pull
@echo off

for /d %%x in (tmp\tmp*,tmp\pip*,tmp\gradio\*) do rd /s /q "%%x" 2>nul || ("%%x" && exit /b 1) & del /q tmp\tmp* > nul 2>&1 & rd /s /q pip\cache 2>nul

set APPDATA=tmp
set USERPROFILE=tmp
set TEMP=tmp
set PYTHON=
set GIT=
set VENV_DIR=

set CUDA_MODULE_LOADING=LAZY 
set NUMEXPR_MAX_THREADS=8
set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.9,max_split_size_mb:512
set COMMANDLINE_ARGS=--autolaunch --theme=dark --disable-safe-unpickle  --xformers --lowvram --no-half

:: --medvram --lowvram --listen --api --opt-sdp-attention --xformers  --opt-channelslast

call webui.bat
