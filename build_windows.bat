@echo off

set BUILD_TYPE=Release

@REM :windows_arm64
@REM cmake -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -S . -B build\win-arm64 -A ARM64
@REM cmake --build build\win-arm64

:windows_x64
cmake -DLLAMA_STATIC=ON -DCMAKE_BUILD_TYPE=%BUILD_TYPE% -S . -B build\win-x64 -A x64
cmake --build build\win-x64 --config Release