<?php
	include 'dataBaseConnect.php';
	//get the q parameter from URL
	$qObj=json_decode($_REQUEST["q"]);
	$request = $qObj->request;
	$data1 = $qObj->data1;
	$data2 = $qObj->data2;
	
	if($request == 1){	//Comprovar que d'un llibre marcat, n'havia portat cap d'igual amb anterioritat.
		$hint=true;	
		//Construim la sentencia SQL
		//$codiSql = 'SELECT b.idBookData FROM studentbookcollect AS sbc INNER JOIN books AS b ON sbc.idBook = b.idBook WHERE sbc.idStudent = ?';		
		//Cridem a la funció per a demanar les dades.
		
		$hint = consultaDades($request,$data1,$data2);
		
	}else if($request == 2){
		$hint = true;
		$hint = consultaDades($request,$data1,$data2);
	}
	
	//Set output to "no suggestion" if no hint were found
	//or to the correct values
	$response = Array();
	if ($hint == false){
		$response['txt']="no suggestion";
		//$response['txt']=$request;
	}else if($hint === 4){
		$response['txt']= "CON EST";
	}else if($hint === 5){
		$response['txt']= "CON EST - RES FAIL";
	}else if($hint){
		//print_r($hint); echo "<br>";
		$response['txt']= $hint;
		//$response['txt']= "CON EST - RES OK - VIS FAIL";
	}

	//output the response
	echo json_encode($response);


	function consultaDades($request,$data1,$data2){
		
		$connexio = openDB();
		
		if($connexio){
			$var = 1;
			if($request == 1){
				//M'he quedat aquí, que no està gaire clar com fer la continuació sense reescriure les mateixes funcions.
				//$codiSql = 'SELECT count(b.idBookData) as idBookData FROM studentbookcollect AS sbc INNER JOIN books AS b ON sbc.idBook = b.idBook WHERE sbc.idStudent = ?';
				$codiSql = 'SELECT b.idBookData FROM studentbookcollect AS sbc INNER JOIN books AS b ON sbc.idBook = b.idBook WHERE sbc.idStudent = ?';
				$consulta = $connexio->prepare($codiSql);
				$consulta->bindParam(1,$data1, PDO::PARAM_INT);	//ID Estudiant.
			}else if($request == 2){
				$codiSql = 'SELECT `idBookState` FROM `books` WHERE `idBookData` = ? AND `bookNumber` = ?';
				$consulta = $connexio->prepare($codiSql);
				$consulta->bindParam(1,$data1, PDO::PARAM_INT);
				$consulta->bindParam(2,$data1, PDO::PARAM_INT);
			}
			
			$consulta->execute();	
			$resultat = $consulta->fetchAll(PDO::FETCH_ASSOC);
			//print_r($resultat);
			
			if($resultat){			//Si troba dades
				return $resultat;		
			}else if(!$resultat){	//Si es null
				return 5;
			}else if($connexio){	//Si la connexió falla
				return 4;
			}else{					//Si passa alguna cosa que ni Déu sap que collons ha passat, passem per aquí :D
				return false;
			}
		}		
	}




?>