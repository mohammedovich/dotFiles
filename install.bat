@echo off
REM Need to:
REM     Alter to work both on 32 and 64
REM     Install msygit notepad++, console2 and vim, perhaps via http://chocolatey.org/
@echo "Assumes you've installed git, notepad++ and gvim" 
@cmd /c mklink %USERPROFILE%\_vimrc %CD%\userroot\vim_add
@mkdir %USERPROFILE%\.vim\bundle
@git clone http://github.com/gmarik/vundle %USERPROFILE%\.vim\bundle\vundle
@vim -c ":BundleInstall" -c ":q!"