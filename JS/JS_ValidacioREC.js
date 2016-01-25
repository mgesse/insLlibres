//GLOBAL VAR
var procedimentCorrecte = false;
var errorTextDuplicateBookCollect = 
"El proper llibre consta com a entregat. Revisa els llibres que duu i/o parla amb l'alumne dels llibres que ja ha portat!";

function validaDades(){
	//PAS 1 - Validem que el nom es vàlid.
	var pasValidacio = validaNom();
	
	if(pasValidacio === true){
		//PAS 2 - Llibres marcats!
		var llibresMarcats = comprovaLlibresMarcats();
		
		//PAS 3 - Verificar que dels llibres triats, no n'ha portat cap, i la cuota!
		//OPERACIO - IDALUMNE - IDASSIGNATURA LLIBRE
		if(llibresMarcats === true){
			//Verificarem que el llibre de l'assignatura que porta no ha estat entregat amb anterioritat.
			var llibresTriats = verificaDadesLlibreAlumne(document.getElementsByClassName("marcador"));
		}
		
		//console.log("Sí triat! - Número de Llibre posat: "+num);	//Aquí falla, i ja ens va bé per aturar!
		
		//PAS 4 - Verificar que dels llibres triats, els números de llibres NO hagin estat portats (repetits)
		//OPERACIO - NUMLLIBRE - IDLLIBRE
		if(llibresTriats === true){
			verificaDadesNumeroLlibre(document.getElementsByClassName("marcador"));
		}
		
		
		//PAS 5 - Verificar si l'alumne ja havia pagat
		//OPERACIO - IDALUMNE - IDLLIBRE
		
	}else{
		
	}
}

//PAS 4 - Comprovar que dels llibres marcats, els números no es repeteixin i sigui apte per entregar.
function verificaDadesNumeroLlibre(llibres){
	for (var i = 0; i < llibres.length; i++) {
		if(llibres[i].checked){
			llibreTriat = true;
			var idLlibre = llibres[i].id.split("_");	//Separem el ID
			console.log("PAS 4: Nº ID del llibre "+idLlibre[0]);
			
			var x = i + 1;
			var num = $("#"+x+"_numLlibre").val();			//1_numLlibre (index)
			console.log("Número de Llibre posat: "+num);
			checkDatabase(2, idLlibre[0], num);	//Operació 1: obtenir llista assignatures donades de l'alumne | IDBOOKDATA | BOOKNUMBER
			if(procedimentCorrecte === true){
				procedimentCorrecte = false;
				console.log("Ha anat bé - PAS 4");
				
				//Comprovem que el número de llibre es apte per recollir.
				var llibreApte = sessionStorage.getItem("bookState");
				console.log("Dades de LlibreApte: "+llibreApte);
			}
		}
	}
}



//PAS 3 - COmprovar que no ha dut cap altre llibre de la mateixa assignatura
function verificaDadesLlibreAlumne(llibres){
	var dadesCorrectes = false;
	for (var i = 0; i < llibres.length; i++) {
		console.log("Dades per a l'ID: "+llibres[i].id);
		if(llibres[i].checked){
			llibreTriat = true;
			//1 - Obtenir el llistat de les assignatures dels llibres que ja ha entregat l'alumne al passar per aquí
			//a) Si la llista torna buida, passem a inserir tots els llibres directament.
			//b) Si torna amb llibres es comparen si els ID de la llista coincideixen amb els que duu l'usuari marcats.
			//Obtenim l'ID de l'alumne que hi ha triat.
			var idAlumne = getIDStudent();
			checkDatabase(1, idAlumne, "null");	//Operació 1: obtenir llista assignatures donades de l'alumne | ID ALUMNE | NULL
			
			if(procedimentCorrecte === true){
				procedimentCorrecte = false;
				console.log("Ha anat bé");
				var cll = comprovaLlistaLlibres(1,llibres);
				
				if(cll == true){
					console.log("Verificació de repetició de llibres: CORRECTA");
				}else{
					var sufix = cll.split("_");
					console.log("Sufix pos 0: "+sufix[0]+" - Sufix pos 1: "+sufix[1]);
					var textLlibre = document.getElementById("bookName_"+sufix[1]+"").textContent;
					if(sufix[0] == 151 || sufix[0] == 251 || sufix[0] == 351 || sufix[0] == 451 || sufix[0] == 452 || sufix[0] == 551 || sufix[0] == 651){
						console.log("Control de la QUOTA: "+sufix[2]);						
						if(sufix[2] == "QE"){
							console.log("S'ha de desmarcar la quota");
							alert("L'Alumne ja ha pagat la "+textLlibre+" i per tant se li ha de DESMARCAR!");
						}else if(sufix[2] == "QM"){
							console.log("S'ha de marcar la quota");
							alert("L'Alumne NO ha pagat la "+textLlibre+" i per tant se li ha de MARCAR!");
						}
						
					}else{
						console.log("Verificació de repetició de llibres: INCORRECTA");					
						
						//var textLlibre = document.getElementById("bookName_"+sufix[1]+"").textContent;
						alert(errorTextDuplicateBookCollect +": "+textLlibre);
					}				
				}
				
			}else{
				alert("Hi ha hagut un error amb les dades del servidor!");
			}
			
			
			//Crida a funció de resolució.
		}else{
			console.log("No triat!");
		}
	}
	
	if(cll == true){
		dadesCorrectes = true;
	}else{
		dadesCorrectes = false;
	}
	
	return dadesCorrectes;
	
}

function comprovaLlistaLlibres(operacio,llibres){
	if(operacio === 1){
		var dadesString = sessionStorage.getItem("listOfStudentBookCollect");
		var dadesJSON = JSON.parse(dadesString);
		console.log("Dades normals JSON: "+dadesJSON);
		console.log("Accedint a les dades internes del JSON: "+dadesJSON.txt[0].idBookData);
		//console.log("Limit com si fos array: "+dadesJSON.txt.length);
		//console.log("Limit array llibres formulari: "+llibres.length);
		
		//REVISIÓ DE LA QUOTA
		var curs = llibres[0].id.split("");
		//console.log("Hauria de sortir un 1: "+curs[0]);
		
		if(curs[0] == 1){	//1r d'ESO
			//Determinar si l'usuari ha marcat la quota.
			for(var i=0; i < llibres.length;i++){
				console.log("DINS DE DETERMINAR QUOTA");
				var idLlibreComplet = llibres[i].id.split("_");
				console.log("VAL: "+idLlibreComplet[0]);
				if(idLlibreComplet[0] == 151){
					//Comprovar si està marcat o no.
					console.log("Quota 1r ESO");
					
					var quotaBBDD = null;
					for(var j = 0; j < dadesJSON.txt.length; j++){
						if(dadesJSON.txt[j].idBookData == 151){
							quotaBBDD = true;
							console.log("La quota s'ha trobat marcada a la BBDD");
							break;
						}else{
							quotaBBDD = false;
							console.log("La quota NO s'ha trobat marcada a la BBDD");
						}
					}
					if(llibres[i].checked){
						//Si està marcat, s'ha de verificar que NO estigui a la llista.
						console.log
						if(quotaBBDD === true){
							//MALAMENT - ERROR
							return llibres[i].id+"_QE";	//Quota Errada
						}else{
							//CERT
						}
					}else{
						//Si no està marcat, s'ha de verificar que ESTÀ a la llista.
						if(quotaBBDD === true){
							//CERT
						}else{
							//MALAMENT - ERROR
							console.log("LA QUOTA NO HA ESTAT MARCADA!");
							return llibres[i].id+"_QM";	//Quota Marcada
						}
					}
				}
			}
		}
		
		var limit = dadesJSON.txt.length;
		//Comprovar llibre per llibre. (ID Book Data)
		for(var i=0; i < llibres.length;i++){
			if(llibres[i].checked){
				var idLlibre = llibres[i].id.split("_");	//Separem el ID
				for(var j = 0; j < dadesJSON.txt.length; j++){
					console.log("Llibre Marcat: "+idLlibre[0]+" - Llibre Llegit de la BBDD: "+dadesJSON.txt[j].idBookData);
					if(idLlibre[0] ==	dadesJSON.txt[j].idBookData){
						return llibres[i].id;
					}
				}
			}
		}
		
		//S'HA DE COMPROVAR QUE UN ALUMNE QUE NO HA PAGAT LES QUOTES, LES HA DE MARCAR. I PEL CONTRARI, SI JA HO HA FET, CAL DESMARCAR-LA
		//Fer abans de revisar els llibres, detectar quin curs és el del formulari en base al id de la materia 151 = 1r ESO
		return true;
	}
	
}

function checkDatabase(operacio, dada1, dada2){
	var jsonTx = { // Tx -> Transmission || Rx -> Reception
		request: operacio,
		data1: dada1,
		data2: dada2
	};
	//localhost/ProjecteProgramaWeb/jsonFunctionsDB.php?q={"request":1,"data1":"1","data2":"null"}
	console.log("Enviant....: "+JSON.stringify(jsonTx));	//q={"request":1,"data1":"1","data2":"null"}
	$.ajax({
		data: "q="+JSON.stringify(jsonTx),
		type: "POST",
		dataType: "json",
		url: "./PHP/jsonFunctionsDB.php",
		async: false,
		cache: false,
	})
	.done(function( data, textStatus, jqXHR ){			
		console.log('Retorn de Dades: '+JSON.stringify(data));
		if(operacio === 1){
			procedimentCorrecte = true;
			sessionStorage.setItem("listOfStudentBookCollect", JSON.stringify(data));
		}else if(operacio === 2){
			procedimentCorrecte = true;
			sessionStorage.setItem("bookState", JSON.stringify(data));
		}
	})
	.fail(function( jqXHR, textStatus, errorThrown ) {
		if ( console && console.log ) {
			console.log( "La solicitud a fallado: " +  textStatus);
			console.log( "La solicitud a fallado: " +  errorThrown);
			console.log( "La solicitud a fallado: " +  jqXHR);
		}
	});
}



function comprovaLlibresMarcats(){
	//Obtenir els llibres triats. Desar en un objecte(?) - Obtenir per class "marcador"
		var llibres = document.getElementsByClassName("marcador");
		var llibreTriat = false;
		for (var i = 0; i < llibres.length; i++) {
			console.log("Dades per a l'ID: "+llibres[i].id);
			if(llibres[i].checked){
				llibreTriat = true;
				//PAS 2.1 - Verificar que del llibre marcat, disposa de número!
				var x = i + 1;
				var num = $("#"+x+"_numLlibre").val();			//1_numLlibre (index)
				if(num == ""){
					alert("Hi ha un llibre amb una numerció no vàlida, si el llibre no te cap número assignat, insereix el número 0");
					return false;
				}
				console.log("Sí triat! - Número de Llibre posat: "+num);
			}else{
				console.log("No triat!");
			}
		}
		if(!llibreTriat){
			alert("ERROR: Has de triar com a mínim 1 Llibre!!");
			return false;
		}
		return true;		
}

function validaNom(){
	var idAlumne = getIDStudent();
	//console.log("ID de l'alumne triat: "+idAlumne);
	
	if(idAlumne < 1){
		alert("ERROR: Has de triar un nom d'Alumne vàlid!");
		return false;
	}else if(idAlumne > 0){
		return true;
	}else{
		alert("ERROR INESPERAT: Torna-ho a intentar i verifica que les dades que vols introduïr són correctes. Si torna a passar avisa als caps de projecte!");
		return false;
	}	
}

//Funcions de Get and Set
function getIDStudent(){
	//Obtenim el ID de la part superior.
	return $("#alumnes").val();
}