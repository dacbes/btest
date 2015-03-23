path=$(pwd)
cd /
cd etc/btest

if [[ ! -d $1 ]]
then
{
    echo "[ERROR]: Problem $1 not found. No manifest to display."
    exit 1
}
fi

echo "[INFO] Manifest for problem $1 found:"
cat /etc/btest/$1/manifest.txt

cd $path
