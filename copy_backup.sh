cd /home/pierre
mkdir -p backup
for i in `find pierre_copy*.zip`; do sudo mv $i backup/; done
sudo zip -r pierre_copy_`date +'%Y-%m-%d_%H-%M-%S'`.zip pierre_copy
for i in `find pierre_copy*.zip`; do sudo mv $i backup/; done
cd /home/pierre/backup
grive
