<?php
	ob_start();
	require_once("PHP/classeSessions.php");
	$sesion = new sesion();
	//session_destroy();
	//Accedim a recollir les dades.	
	include('PHP/dataBaseFunctions.php');
	include('PHP/funcionslogin.php');	
?>
<!DOCTYPE HTML>
<HTML>
	<HEAD>
		<meta charset='utf-8'/>
		<link rel="shortcut icon" href="images/iconEscolesVerdes.ico" />
		<title> Programara Reutilització Llibres INS Narcís Monturiol </title>
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
				<div id="login">					
					<form action="" method="post"><!--javascript:void(0);" method="get">-->
						<fieldset class="clearfix">
							<p>
								<span class="fontawesome-user"><img src="images/user_icon.png"></img></span>
								<input type="text" placeholder="Usuari" name="user" required>
							</p><!--onBlur="if(this.value == '') this.value = 'Username'" onFocus="if(this.value == 'Username') this.value = ''" required></p> --><!-- JS because of IE support; better: placeholder="Username" -->
							<p>
								<span class="fontawesome-lock"><img src="images/key_icon.png"></span>
								<input type="password"  placeholder="Clau" name="pass" required>
							</p><!-- onBlur="if(this.value == '') this.value = 'Password'" onFocus="if(this.value == 'Password') this.value = ''" required></p> <!-- JS because of IE support; better: placeholder="Password" -->
							<p>
								<input type="submit" placeholder="Valida" name="login">
							</p>
							<?php
								if(isset($_POST['login'])){
									header('Location: indexEV.php');
									echo 'ID tipus usuari: '.$idTypeUser.' Nom: '.$_POST['user'].'.';
									if(isset($_POST['user']) && isset($_POST['pass'])){
										$idTypeUser = checkTypeUser($_POST['user'],$_POST['pass']);
										echo 'ID tipus usuari: '.$idTypeUser.' Nom: '.$_POST['user'].'.';
										if($idTypeUser > 0){
											echo 'ID tipus usuari: '.$idTypeUser.' Nom: '.$_POST['user'].'.';
											
											$sesion->set("userName",$_POST['user']);
										
											$sesion->set("idTypeUser",$idTypeUser);
											
											
											header('Location: indexEV.php');						
										}else{
											echo "L'usuari i/o la clau introduïdes no són correctes!";
											
										}
									}else{
										//INserta datos
									}
								}							
							?>
							<?php 
								if(isset($_POST['err'])){
									echo '<font color="red">  Usuario y contraseña incorrectos</font><p></p>';	
								}
								
							?>
						</fieldset>
					</form>
					<p>						
						<span class="fontawesome-arrow-right"></span>
					</p>
				</div> 		
			</div>
		</div>
		<div id="div_footer">
			<p>
				Fet per Miquel Gessé Bernadas - 2015 <br>
				Contacta a: "correu@nom.com"
			</p>
		</div>		
				
	</BODY>
</HTML>
