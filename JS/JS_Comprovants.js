//(function(){
	'use strict';
    window.addEventListener('load',init,false);
	var elements;
	function init(){
		//console.log('dfgdfg');
		elements = document.getElementsByClassName('marcador');		
		//console.log(elements);
		//console.log('1r CHB: '+elements[0].id+' - Estat CHB: '+elements[0].checked);
		getData();
	}
	
	function canviCHB(id){
		//console.log('Canviat: '+id);
		var sumaLlibres = $("#maxBookSelectedEV").html();
		if($("#"+id).is(':checked')) {		
			console.log('Si entra');
			changePrice(id,true);
			$("#"+id+"_INF").text("✓");
			sumaLlibres = parseInt(sumaLlibres) + 1;
		}else{
			console.log('No entra');
			changePrice(id,false);
			$("#"+id+"_INF").text(" ");
			sumaLlibres = parseInt(sumaLlibres) - 1;
		}
		$("#maxBookSelectedEV").text(sumaLlibres);
		$("#maxBookSelectedEV_INF").text(sumaLlibres);
	}
	
	function changePrice(fullid,state){
		var id = splitIDfromGet(fullid,1);
		//var splitArray = fullid.split("_");
		//var id = splitArray[1];
		if(state){
			//Obtenim el preu
			var price = getPrice(id);
			//Fer la divisió
			var finalPrice = dividirPreu(price);
			//Canviar al formulari
			$("#finalPrice_"+id).text(finalPrice);
			$("#finalPrice_INF_"+id).text(finalPrice);
		}else{
			$("#finalPrice_"+id).text("0,00");
			$("#finalPrice_INF_"+id).text("0,00");
		}
		
		//Fer la suma global.
		var preuTotal = sumTotalPrice();
		$("#totalPrice").text(preuTotal);
		$("#totalPrice_INF").text(preuTotal);
		
		//Posar el tick corresponent a la part inferior.
		
	}
	
	//Realitza la separació de l'ID.
	function splitIDfromGet(id,pos){
		var splitArray = id.split("_");
		return splitArray[pos];
	}
	
	function getPrice(id){
		console.log('ID: '+id);
		var price = $("#originalPrice_"+id).html();
		console.log('PREU: '+price);
		return price;
	}
	
	function dividirPreu(price){		
		var price = price.replace(",",".");
		var auxPrice = price * 0.5 / 10;
		//console.log('AUX PRICE: '+auxPrice);		
		var auxPrice2 = ''+auxPrice+'';
		//console.log('auxPrice2: '+auxPrice2);
		var numAux = auxPrice2.split("");
		//console.log('numAux: '+numAux+' Limit: '+numAux.length);
		var auxPrice = "";
		var controlTalla = false;
		var index = 1;
		for(var i = 0; i < numAux.length; i++){
			if(numAux[i] == "."){
				controlTalla = true;
				auxPrice = auxPrice + numAux[i];
			}else{
				if(index < 4){
					if(index === 3){
						auxPrice = auxPrice + '0';
					}else{
						auxPrice = auxPrice + numAux[i];
					}
					if(controlTalla == true){
						index = index + 1;
					}
				}				
			}
			//console.log('I: '+i+' FINAL: '+numAux.length);
		}
		controlTalla = false;
		index = 0;
		//console.log('AUX PRICE 2: '+auxPrice);
		//1- Si és de tres o més decimals, cal arrodonir.
		var num = Math.round(auxPrice*100)/100;
		//console.log('num: '+num+' i x10: '+num*10);
		
		//2-Convertim a un número llegible
		var total = num*10;
		var operand = ''+total+'';
		
		//3- Si el total te un carro de números, hem d'arrodonir novament.
		for(var i = 0; i < operand.length; i++){
			var caracter = operand.charAt(i);
			//console.log('car: '+caracter);
			if(controlTalla == true){
				index = index + 1;
			}
			if(caracter == '.'){
				controlTalla = true;
			}			
		}
		
		//Cas que NO tingui cap decimal, els hi posem.
		if(index === 0){
			total = total + '.00';
		}else if(index === 1){
			total = total + '0';
		}
		
		
		//Cas que tingui més de 2 números decimals, arrodonim
		if(index > 2){
			var totalAux = total;
			total = Math.round(totalAux*Math.pow(10,2))/Math.pow(10,2);
			total = total + '0';
		}
		//console.log('VALOR DE TOTAL: '+total);
		//3- Cal canviar els punts per comes.
		var total = total.replace(".",",");
		return total;
		
	}
	
	function sumTotalPrice(){
		var preusARecuperar = document.getElementsByClassName('preus');		
		//console.log(preusARecuperar);
		//console.log(preusARecuperar[5].id);
		var preuTotal = 0.00;
		for(var i = 0; i < preusARecuperar.length; i++){
			//console.log('Preus: '+$("#"+preusARecuperar[i].id).html());
			var preuText = $("#"+preusARecuperar[i].id).html();
			var preu = preuText.replace(",",".");
			preuTotal = preuTotal + parseFloat(preu);
			//console.log('Preu Total: '+preuTotal+' - Preu: '+preu);
		}
		preuTotal = Math.round(preuTotal*Math.pow(10,2))/Math.pow(10,2);
		preuTotal = preuTotal.toString();
		var controlTalla = false;
		var index = 0;
		//Comprovem els números.
		for(var i = 0; i < preuTotal.length; i++){
			var caracter = preuTotal.charAt(i);			
			if(controlTalla == true){
				index = index + 1;
			}
			if(caracter == '.'){
				controlTalla = true;
			}			
		}
		
		//Cas que NO tingui cap decimal, els hi posem.
		if(index === 0){
			preuTotal = preuTotal + '.00';
		}else if(index === 1){
			preuTotal = preuTotal + '0';
		}
		//console.log('REU TOTA: '+preuTotal+' Index: '+index);
		preuTotal = preuTotal.replace(".",",");
		return preuTotal;
	}
	
	function comprovaTecla(fullid,e){
		var id = splitIDfromGet(fullid,0);
		//console.log('ID del lloc on escric: '+id);		
		var keynum = window.event ? window.event.keyCode : e.which;
		//console.log('Codi tecla: '+keynum);
		if ((keynum == 8) || (keynum == 46) || (keynum > 95) && (keynum < 106)){
			return true;
		}		
		var testChar = /\d/.test(String.fromCharCode(keynum));
		//return /\d/.test(String.fromCharCode(keynum));
		if(testChar){
			
		}
		return testChar;
	}
	
	//Replica el número de llibre de la part superior a la inferior.
	function replicaNumLlibre(fullid,e){
		var id = splitIDfromGet(fullid,0);
		//console.log('ReplicaNumLlibre: '+id);		
		//console.log("Contingut a copiar: " +document.getElementById(id+"_numLlibre").value );
		var nouText = document.getElementById(id+"_numLlibre").value;		
		$("#"+id+"_INF_numLlibre").text(nouText);		
	}
	
	//Replica el número de llibre de la part superior a la inferior.
	function canviAlumne(fullid){
		var id = splitIDfromGet(fullid,0);
		var nom = $("#alumnes option:selected").html();
		//console.log('ReplicaNumLlibre: '+nom);
		$("#nomAlumne_INF").text(nom);	
		//getData();
	}
	
	function getData(){
		var f = new Date();
		var dataActual = f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear();
		console.log(dataActual);
		$("#dataINF").text(dataActual);	
		$("#dataSUP").text(dataActual);	
	}
	
//})();