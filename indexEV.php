<?php
	ob_start();
	require_once("PHP/classeSessions.php");
	$sesion = new sesion();
	//session_destroy();
	$usuari = $sesion->get("userName");
	$permis = $sesion->get("idTypeUser");
	
	if($usuari){
?>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<meta charset='utf-8'/>
		<link rel="shortcut icon" href="images/iconEscolesVerdes.ico" />
		<title> Índex Reutilització Llibres </title>
		<link href="style/style_ev.css" rel="stylesheet" type="text/css">
		<script src="jquery-2.1.4.min.js"></script>		
	</HEAD>
	<BODY>
		<div id="div_logo">
			<center>
				<img src="images/logo.png"></img>
			</center>
		</div>
		<div id="div_cos">			
			<div id="div_contingut" style="text-align:center" class="container">
				<h1><center>Programa Web de Reutilització de Llibres de Text</center></h1>
				<div id="Fila1">
					<h2>Comprovants de Recollida!</h2>
					<form action="" method="post"><!--javascript:void(0);" method="get">-->					
						<fieldset class="clearfix">						
							<button class="iconesG1" style="background: url(images/iconesIndex/R1.png)" type="submit" name="R1"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/R2.png)" type="submit" name="R2"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/R3.png)" type="submit" name="R3"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/R4.png)" type="submit" name="R4"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/R5.png)" type="submit" name="R5"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/R6.png)" type="submit" name="R6"/></button>
						</fieldset>
					</form>					
				</div>
				
				<div id="Fila2">
					<h2>Comprovants de Venda!</h2>
					<form action="" method="post"><!--javascript:void(0);" method="get">-->					
						<fieldset class="clearfix">						
							<button class="iconesG1" style="background: url(images/iconesIndex/V1.png)" type="submit" name="V1"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/V2.png)" type="submit" name="V2"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/V3.png)" type="submit" name="V3"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/V4.png)" type="submit" name="V4"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/V5.png)" type="submit" name="V5"/></button>
							<button class="iconesG1" style="background: url(images/iconesIndex/V6.png)" type="submit" name="V6"/></button>
						</fieldset>
					</form>					
				</div> 
			</div>
		</div>
		
		<?php
			if(isset($_POST['R1'])){
				$sesion->set("course",100);
				header('Location: FormRecollida.php');
			}else if(isset($_POST['R2'])){
				$sesion->set("course",200);
				header('Location: FormRecollida.php');
			}else if(isset($_POST['R3'])){
				$sesion->set("course",300);
				header('Location: FormRecollida.php');
			}else if(isset($_POST['R4'])){
				$sesion->set("course",400);
				header('Location: FormRecollida.php');
			}else if(isset($_POST['R5'])){
				$sesion->set("course",500);
				header('Location: FormRecollida.php');
			}else if(isset($_POST['R6'])){
				$sesion->set("course",600);
				header('Location: FormRecollida.php');
			}
		?>		
		<div id="div_footer">
			<p>
				Fet per Miquel Gessé Bernadas - 2015 <br>
				Contacta a: "correu@nom.com"
			</p>
		</div>


	</BODY>
<?php
	
	}else{
		echo("Les dades de l'usuari no són correctes: ".$usuari);
		header('Location: escolesverdes.php');
	}
?>