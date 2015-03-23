path=$(pwd)
cd /
cd etc/btest

if [[ ! -d /etc/btest/$1 ]]
then
{
    echo "[ERROR]: El problema $1 no existe "
    exit 1
}
fi

if [[ -d /etc/btest/AAA ]]
then
{
    echo "[INFO]: El directorio AAA ya existe"
}
else
{
	mkdir /etc/btest/AAA
}
fi

cp /etc/btest/$1/test1.c /etc/btest/AAA
#cp /etc/btest/$1/in1.txt /etc/btest/AAA
#cp /etc/btest/$1/in2.txt /etc/btest/AAA

indent -linux /etc/btest/AAA/test1.c
cc /etc/btest/AAA/test1.c -o /etc/btest/AAA/test1.exe

./AAA/test1.exe
mv out?.txt AAA

if [[ -d /etc/btest/BBB ]]
then
{
    echo "[INFO]: El directorio BBB ya existe"
}
else
{
    mkdir /etc/btest/BBB
}
fi

if [[ ! -f ./$2 ]]
then
{
    echo "[ERROR]: Falta fichero $2"
    exit 1
}
fi

cp /etc/btest/$2 /etc/btest/BBB
#cp /etc/btest/in1.txt /etc/btest/BBB
#cp /etc/btest/in2.txt /etc/btest/BBB

indent -linux /etc/btest/BBB/$2
cc /etc/btest/BBB/$2 -o /etc/btest/BBB/mysolution.exe -std=c99

if [[ $? -eq 0 ]]
then
{
    echo "[INFO]: La solucion $2 compila correctamente"
	path=$(pwd)
	cd BBB
	./mysolution.exe
	cd $path
}
else
{
	echo "[ERROR]: La solucion $2 tiene errrores de compilacion"
    exit 1
}
fi

if diff -q AAA/out1.txt BBB/out1.txt & diff -q AAA/out2.txt BBB/out2.txt
then
{
echo "[INFO]: Los ficheros de salida son iguales. Solucion $2 VALIDA"
}
else
{
echo "[INFO]: Los ficheros de salida no son iguales. Solucion $2 NO valida"
}
fi

rm -r AAA
rm -r BBB
cd $path
