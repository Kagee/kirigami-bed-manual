@echo off
rem https://stackoverflow.com/a/5370380
rem Loop on multiple input files and auto
rem trim them using magick "!item_%%n!" -trim "!item_%%n!"
setlocal ENABLEDELAYEDEXPANSION
rem Take the cmd-line, remove all until the first parameter
set "params=!cmdcmdline:~0,-1!"
set "params=!params:*" =!"
set count=0

rem Split the parameters on spaces but respect the quotes
for %%G IN (!params!) do (
  set /a count+=1
  set "item_!count!=%%~G"
  rem echo !count! %%~G
)

rem list the parameters
for /L %%n in (1,1,!count!) DO (
  rem echo %%n #!item_%%n!#
  magick "!item_%%n!" -bordercolor white -border 10x10 "!item_%%n!"
)
rem pause

REM ** The exit is important, so the cmd.ex doesn't try to execute commands after ampersands
exit