/*===========================================================================================	Proyecto					:		Modulo						:		Programa/Funcion			:	 	Analista					:	ALDV	Fecha Inicio/Termino		:		Objetivo					:	Crear una colecci�n de datos, que se graba en formato BSON.									sin embargo se define en formato JSON.	Descripcion					:	=============================================================================================*/// 1. Activar el uso de una base de datos
use aemsaprueba
// 2. Create un collectiondb.createCollection("C_CLIENTE"){ "ok" : 1 }
// 3. Crear una collecci�n, si la colecci�n no existe se creara
db.CEDefinirCollection.insert({'cod_idio':'ES', 'txt_desc':'Arquitectura Host'});db.CEDefinirCollection.insert({'cod_idio':'ES', 'txt_desc':'Pass'});

// 3. Mostar el contenido del BJON en formato JSON
db.CEDefinirCollection.find()
