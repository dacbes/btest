echo "[INFO]: Available problems are:"
for dir in $(ls -F /etc/btest | grep / | cut -d "/" -f1)
do
        echo $dir

done
