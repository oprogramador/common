#!/bin/bash

cd /home/pierre
mkdir -p backup
filename=pierre_copy_`date +'%Y-%m-%d_%H-%M-%S'`
sudo zip --symlinks -r $filename.zip pierre_copy
zip P__ZIP_E_BACKUP_PASS__ $filename.zip.zip $filename.zip
for i in `find pierre_copy*.zip`; do sudo mv $i backup/; done
