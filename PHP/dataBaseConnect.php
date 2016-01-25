<?php
	function openDB(){
		//echo("Funcio openDB");
		//$database = "llibres2015";
		$database = "reutilitzaciov1-1-0";
		$host = "localhost";
		$username = "root";
		$password = "";
		try{
			//Establim connexió amb la BBDD
			$bd = new PDO('mysql:host='.$host.';dbname='.$database.'',$username,$password);	//Posar lo del charset!!!!!!!
			
		}catch(PDOException $e){
			print "Error! ".$e->getMassage()."<br>";
			die($e->getMassage());
		}
		
		if($bd){
			return $bd;
		}else{
			return false;
		}
	}
 ?>