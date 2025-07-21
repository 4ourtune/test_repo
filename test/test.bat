@echo off
setlocal EnableDelayedExpansion

echo [1/3] Create CMake...
cmake -B build

if %errorlevel% neq 0 (
    echo CMake failed to create!
    exit /b %errorlevel%
)

echo [2/3] Build...
cmake --build build

if %errorlevel% neq 0 (
    echo Faile to build!
    exit /b %errorlevel%
)

echo [3/3] Run test_runner...
.\build\Debug\test_runner.exe

endlocal
pause
