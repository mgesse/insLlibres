<?php
//Funcions

	function getBookData($idCourse){		
		$bd = openDB();
		$retorn = false;
		if($bd != false){
			$sql = $bd->prepare("SELECT bd.idbookData, bd.booktitle, bd.bookSubtitle, p.publisherName, bd.collectPrice
								FROM bookData AS bd
								INNER JOIN publishers AS p ON bd.idPublisher = p.idPublisher								 
								WHERE bd.idBookCourse = ? AND bd.activeBookCollect = true;");
			$sql->bindParam(1, $idCourse, PDO::PARAM_INT);			
			$sql->execute();			
			$resultat = $sql->fetchAll(PDO::FETCH_ASSOC);			
			if($resultat){
				$retorn = $resultat;
			}else{
				echo "FAIL - ID CURS: ".$idCourse;
				$retorn = false;
			}
		}
		$bd = null;
		return $retorn;
	}
	
	//Permet Obtenir els noms i cognoms dels alumnes del curs triat.
	function getStudentsCourseCollect($idCourse){
		$bd = openDB();
		$retorn = false;
		if($bd != false){
			//En funció del curs..
			if($idCourse == 100){
				$sql = $bd->prepare("SELECT idStudent, studentName FROM students WHERE idCourseCollect = 101 OR idCourseCollect = 102");
			}else if($idCourse == 200){
				$sql = $bd->prepare("SELECT idStudent, studentName FROM students WHERE idCourseCollect = 201 OR idCourseCollect = 202");
			}else if($idCourse == 300){
				$sql = $bd->prepare("SELECT idStudent, studentName FROM students WHERE idCourseCollect = 301 OR idCourseCollect = 302");
			}else if($idCourse == 400){
				$sql = $bd->prepare("SELECT idStudent, studentName FROM students WHERE idCourseCollect = 401 OR idCourseCollect = 402 OR idCourseCollect = 403");
			}else if($idCourse == 500){
				$sql = $bd->prepare("SELECT idStudent, studentName FROM students WHERE idCourseCollect = 501 OR idCourseCollect = 502");
			}else if($idCourse == 600){
				$sql = $bd->prepare("SELECT idStudent, studentName FROM students WHERE idCourseCollect = 601 OR idCourseCollect = 602");
			}else{
				return false;
			}
			
			$sql->execute();			
			$resultat = $sql->fetchAll(PDO::FETCH_ASSOC);			
			if($resultat){
				$retorn = $resultat;
			}else{
				echo "FAIL - ID CURS: ".$idCourse;
				$retorn = false;
			}		
		}
		$bd = null;
		return $retorn;		
	}
?>