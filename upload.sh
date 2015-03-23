id | grep -q btest
if [ $? -ne 0 ]
then
        echo ERROR: $(whoami) no pertenece al grupo btest
        exit 1
fi

if [[ ! -f ./manifest.txt ]]
then
{
	echo "ERROR: No existe manifest.txt"
	exit 1
}
fi

name=$(grep "^NAME" manifest.txt | cut -d " " -f2)
echo "INFO: Creamos la variable $name"
source=$(grep "^SOURCE" manifest.txt | cut -d " " -f2)
echo "INFO: Creamos la variable $source"
input=$(grep "^IN" manifest.txt | cut -d ":" -f2-)
echo "INFO: Creamos la variable $input"

if [[ -d /etc/btest/$name ]]
then
{
	echo "INFO: El directorio ya existe"
}
else
{
	mkdir /etc/btest/$name
	echo "INFO: Creacion de directorio /etc/btest/$name"
}
fi

if [[ -f ./manifest.txt ]]
then
{
	cp manifest.txt /etc/btest/$name
	echo "INFO: Copia de manifest.txt realizada"
}
fi

for i in $input;
do
{
	if [[ -f $i ]]
	then
	{
		cp $i /etc/btest/$name
	}
	else
	{
		echo "ERROR: Copia de input $i no encontrado"
		exit 1
	}
	fi
}
done

if [[ -f ./$source ]]
then
{
	cp $source /etc/btest/$name
	echo "INFO: Copia de $source realizada"
}
else
{
	echo "ERROR: Copia de $source NO REALIZADA"
}
fi

if [[ -f ./$source ]]
then
{
	indent -linux /etc/btest/$name/$source
	echo "INFO: Identado de $source realizada"
}
else
{
	echo "ERROR: Identado de $source NO REALIZADA"
}
fi	

if [[ -f ./$source ]]
then
{
	base=$(grep -i ^source manifest.txt | cut -d "." -f1 | cut -d " " -f2)
	cc /etc/btest/$name/$source -o /etc/btest/$name/$base.exe
	echo "INFO: Compilado de $source realizada"
}
else
{
	echo "ERROR: Compilado de $source NO REALIZADA"
}
fi
