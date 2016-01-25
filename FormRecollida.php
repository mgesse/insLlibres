<?php
	//Accedim a recollir les dades.
	include('PHP/dataBaseConnect.php');
	include('PHP/dataBaseFunctions.php');
	//Obtenir les dades dels llibres
	ob_start();
	require_once("PHP/classeSessions.php");
	$sesion = new sesion();
	//session_destroy();
	if($sesion->get("course")){
		$course = $sesion->get("course");
	}else{
		$course = 500;
	}
	$arrayLlibres = getBookData($course);
	//Obtenir la llista d'alumenes.
	$arrayAlumnes = getStudentsCourseCollect($course);
?>
<!DOCTYPE HTML>
<HTML>
	<HEAD>
		<meta charset='utf-8'/>
		<font face="Trebuchet MS" size="6" color="blue"></font>
		<title> Taula Comprovants Recollida - INS Narcís Monturiol </title>
		<script src="jquery-2.1.4.min.js"></script>
		<script src="JS/JS_Comprovants.js"></script>
		<script src="JS/JS_ValidacioREC.js"></script>
		<link href="style/style_ev.css" rel="stylesheet" type="text/css">
	</HEAD>
	
	<BODY>
		<?php
			$maxPos = count($arrayLlibres);
			//echo "<br>MAX: ".$maxPos." <br>";
			//echo "<br>Nom Materia: ".$arrayLlibres[0]['bookSubtitle']." <br>";				
		?>
		<table border='1'>
			<tr>
				<td style='text-align:center;' colspan='6'>INS N. MONTURIOL - ESCOLES VERDES - REUTILITZACIÓ DE LLIBRES - RECOLLIDA</td>
			</tr>
			<tr>
				<td style='text-align:center;'></td>
				<td style='text-align:center;'>Tria l'Alumne: </td>
				<td style='text-align:center;'colspan='2'>Curs: </td>
						
				<td style='text-align:center;'>Ref: </td>
				<td style='text-align:center;'>Data: </td>
			</tr>
			<tr>
				<td style='text-align:center;'></td>
				<td style='text-align:center;'>
					<select name='alumnes' id='alumnes' onchange='canviAlumne(this.id)'>
						<option value='0'>Sense Especificar</option>
						<?php
							if($arrayAlumnes){
								foreach($arrayAlumnes as $fila){
									echo "<option value=".utf8_encode($fila['idStudent']).">".utf8_encode($fila['studentName'])."</option>";
								}
							}
						?>
					</select>
				</td>
				<td style='text-align:center;'colspan='2'>
					<?php
						switch($course){
							case 100:	$courseName = "1r d'ESO";
										break;
							case 200:	$courseName = "2n d'ESO";
										break;			
							case 300:	$courseName = "3r d'ESO";
										break;
							case 400:	$courseName = "4rt d'ESO";
										break;
							case 500:	$courseName = "1r de BATX";
										break;
							case 600:	$courseName = "2n de BATX";
										break;
						}
						echo $courseName;
					?>						
				</td>
				<td style='text-align:center;'> </td>
				<td style='text-align:center;'> <label id='dataSUP'>00/00/0000</label></td>
			</tr>
			<tr>
				<td style='text-align:center;'></td>
				<td style='text-align:center;'><B>MATÈRIA I TÍTOL DEL LLIBRE</B></td>
				<td style='text-align:center;'><B>EDITORIAL</B></td>
				<td style='text-align:center;'><B>NÚM. LLIBRE</B></td>
				<td style='text-align:center;'><B>PVP 2014-15 </B></td>
				<td style='text-align:center;'><B>IMPORT A REC.</B></td>
			</tr>
			<?php
				$index = 1;
				//<td style='text-align:center;'>".utf8_encode($fila['booktitle'])." ".utf8_encode($fila['bookSubtitle'])."</td>
				foreach($arrayLlibres as $fila){
					echo "
						<tr>
							<td width='20px' style='text-align:center;'><input type='checkbox' class='marcador' onchange='canviCHB(this.id)' name='option1' id=".$fila['idbookData']."_".$index." value=".$fila['idbookData']."_".$index."></td>
							<td style='text-align:center;'> <label id='bookName_".$index."'> ".utf8_encode($fila['booktitle'])." ".utf8_encode($fila['bookSubtitle'])."</label></td>
							<td style='text-align:center;'>".utf8_encode($fila['publisherName'])."</td>
							<td style='text-align:center;'><input style='width:50px;height:15px;text-align:center;' type='text' onkeydown='return comprovaTecla(this.id,event)' onkeyup='return replicaNumLlibre(this.id,event)' id='".$index."_numLlibre'></td>
							<td style='text-align:center;'> <label id='originalPrice_".$index."'>".$fila['collectPrice']."</label></td>
							<td style='text-align:center;'> <label class='preus' id='finalPrice_".$index."'>0,00</label></td>
						</tr>							
					";
					$index = $index + 1;
				}
			?>					
			<tr>
				<td style='text-align:center;'> <label id="maxBookSelectedEV">0</label> </td>
				<td style='text-align:center;' colspan='3'> Còpia per a Escoles Verdes</td>	
				<td style='text-align:center;'><b>Total:  </b></td>						
				<td style='text-align:center;'><b><label id='totalPrice'>0,00 </label>€</b></td>
			</tr>					
		</table>
		-----------✄----------✄----------✄--------------✄------------✄---------✄------------✄---------
		<br>
		<table border='1'>
			<tr>
				<td style='text-align:center;' colspan='6'>INS N. MONTURIOL - ESCOLES VERDES - REUTILITZACIÓ DE LLIBRES - RECOLLIDA</td>
			</tr>
			<tr>
				<td style='text-align:center;'></td>
				<td style='text-align:center;'>Tria l'Alumne: </td>
				<td style='text-align:center;'colspan='2'>Curs: </td>
				
				<td style='text-align:center;'>Ref: </td>
				<td style='text-align:center;'>Data: </td>
			</tr>
			<tr>
				<td style='text-align:center;'></td>
				<td style='text-align:center;'>
					<label id='nomAlumne_INF'>Sense Especificar</label>
				</td>
				<td style='text-align:center;'colspan='2'><?php echo $courseName; ?></td>
				<td style='text-align:center;'> </td>
				<td style='text-align:center;'><label id='dataINF'>00/00/0000</label></td>
			</tr>
			<tr>
				<td style='text-align:center;'></td>
				<td style='text-align:center;'><B>MATÈRIA I TÍTOL DEL LLIBRE</B></td>
				<td style='text-align:center;'><B>EDITORIAL</B></td>
				<td style='text-align:center;'><B>NÚM. LLIBRE</B></td>
				<td style='text-align:center;'><B>PVP 2014-15 </B></td>
				<td style='text-align:center;'><B>IMPORT A REC.</B></td>
			</tr>
			<?php
				$index = 1;
				//✓ <--- CODI ASCII TICK 
				foreach($arrayLlibres as $fila){
					echo "
						<tr>									
							<td width='20px' style='text-align:center;'><label id=".$fila['idbookData']."_".$index."_INF> </label></td>
							<td style='text-align:center;'>".utf8_encode($fila['booktitle'])." ".utf8_encode($fila['bookSubtitle'])."</td>
							<td style='text-align:center;'>".utf8_encode($fila['publisherName'])."</td>
							<td style='text-align:center;'> <label id='".$index."_INF_numLlibre'></td>
							<td style='text-align:center;'> <label id='originalPrice_INF_".$index."'>".$fila['collectPrice']."</label></td>
							<td style='text-align:center;'> <label id='finalPrice_INF_".$index."'>0,00</label></td>
						</tr>							
					";
					$index = $index + 1;
				}
			?>			
			<tr>
				<td style='text-align:center;'> <label id="maxBookSelectedEV_INF">0</label> </td>
				<td style='text-align:center;' colspan='3'> Còpia per a l'Alumne</td>	
				<td style='text-align:center;'><b>Total:  </b></td>
				<td style='text-align:center;'><b><b><label id='totalPrice_INF'>0,00 </label>€</b></td>
			</tr>			
		</table>
		<button id='procediment' value='Tramet les Dades' onClick='validaDades()'>Valida les Dades al Servidor</button>
		<form action="FormRecollida.php" method="post">
			<button type="submit" name="retorn"> - Enrere - </button>			
			<?php 
				if(isset($_POST['retorn'])){
					$sesion->set("course",0);
					header('Location: indexEV.php');
				}
			?>
		</form>
	</BODY>
</HTML>