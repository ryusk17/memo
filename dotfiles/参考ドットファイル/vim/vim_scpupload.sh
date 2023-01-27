#!/bin/bash

if [ $# -ne 1 ]; then
  echo "<username>@<ipaddress>を指定してください。" 1>&2
  exit 1
fi

scp ~/Dropbox/vim/.vimrc $1:~/
scp ~/Dropbox/vim/vimfiles/ $1:~/
scp -r ~/Dropbox/vim/.vimrc_local_linux $1:~/

