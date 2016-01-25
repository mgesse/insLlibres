<?php
	include('PHP/dataBaseConnect.php');
	//include('PHP/dataBaseFunctions.php');
	
	function checkTypeUser($user,$password){
		$bd = openDB();
		$retorn = false;
		if($bd != false){
			$sql = $bd->prepare("SELECT `idTypeUser` FROM `users` WHERE userName = ? AND password = ?");
			$sql->bindParam(1, $user, PDO::PARAM_STR);
			$sql->bindParam(2, $password, PDO::PARAM_STR);
			$sql->execute();			
			$resultat = $sql->fetchAll(PDO::FETCH_ASSOC);			
			if($resultat){
				foreach ($resultat as $fila){					
					foreach($fila as $valor){
						$retorn = $valor;
					}
				}				
				//$retorn = $idCicle;
				echo "Valor de Retorn: ".$retorn;
			}else{
				//echo "FAIL - ID CURS: ".$idCourse;
				$retorn = false;
			}
		}
		$bd = null;
		return $retorn;
	}








?>