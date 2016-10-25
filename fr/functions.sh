#!/bin/bash
#Pour EJP indiquez votre region dans la variable jw_pg_dg_region (nord,sud,ouest,paca)
#Pour les heures de lever et de coucher soleil il faut votre ville, en minuscule sans accents, apostrophes
# dans la variable jv_pg_dg_ville

#plus d'info domogeek.entropialux.com

#EJP region
	jw_pg_dg_region=nord

#SOLEIL ville
	jv_pg_dg_ville=bordeaux

jarvis_tempo () {
	couleur=$(curl -s "http://domogeek.entropialux.com/tempoedf/$1")
	echo $couleur
}


jarvis_fete () {
	fete=$(curl -s "http://domogeek.entropialux.com/feastedsaint/now")
	echo $fete
}


jarvis_lever_soleil () {


	result=$(curl -s "http://domogeek.entropialux.com/sun/$jv_pg_dg_ville/sunrise/now")
	echo $result

}

jarvis_coucher_soleil () {


	result=$(curl -s "http://domogeek.entropialux.com/sun/$jv_pg_dg_ville/sunset/now")
	echo $result

}

jarvis_ejp () {
#pas teste en dehors de None

	ejp=$(curl -s "http://domogeek.entropialux.com/ejpedf/$jw_pg_dg_region/$1")

	if [ $ejp = "True" ]
	 then
		echo "Jounée en EJP"

	elif [ $ejp = "False" ]
	 then
		echo "Nous ne  sommes pas en journée  EJP"

	elif [ $ejp = " " ]
	 then
		echo "RAS"

	elif [ $ejp = "None" ]
	 then
		echo  "Pas de précision sur le tarif"
        fi


}

