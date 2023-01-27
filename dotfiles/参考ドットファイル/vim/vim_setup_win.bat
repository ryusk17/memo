mklink C:%HOMEPATH%\_vimrc %CD%\.vimrc
mklink C:%HOMEPATH%\_gvimrc %CD%\.gvimrc
cp .\.vimrc_local_win C:\%HOMEPATH%\.vimrc_local_win
mklink /D C:%HOMEPATH%\vimfiles %CD%\vimfiles

