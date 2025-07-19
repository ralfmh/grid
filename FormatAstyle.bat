:: This assumes you have astyle.exe (https://sourceforge.net/projects/astyle/) in your path or this folder.
@echo off
setlocal
echo Running AStyle on %TARGET_FOLDER%...
astyle --options=.astylerc --suffix=none --recursive "src/*.nvgt" "test/*.nvgt"
echo Formatting complete!
pause