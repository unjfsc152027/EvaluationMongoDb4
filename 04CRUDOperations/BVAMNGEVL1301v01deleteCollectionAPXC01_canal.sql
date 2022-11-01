
/*===========================================================================================
	Proyecto					:	
	Modulo						:	
	Programa/Funcion			:	 
	Analista					:	ALDV
	Fecha Inicio/Termino		:	
	Objetivo					:	delete()
	Descripcion					:	Eliminar los elementos de una collection
									deleteOne
									deleteMany
=============================================================================================*/

use BVADesarrollo

#1. Actualizar en masivo
db.APXc01_canal.deleteMany(
	{"txt_usr":"MIGRACION"}
);


#2. Eliminar todos los datos

db.ALMC01_Categoria.deleteMany({})
:::
isadesarrollo> db.ALMC01_Categoria.deleteMany({})
{ acknowledged: true, deletedCount: 11 }
isadesarrollo>
:::

#3. Eliminar con una condicion

db.ALMC01_Categoria.deleteMany({"qty":200})

:::
isadesarrollo> db.ALMC01_Categoria.deleteMany({"qty":200})
{ acknowledged: true, deletedCount: 2 }
isadesarrollo>
:::

#4. Eliminar con una condicion el primero que identifica
db.ALMC01_Categoria.deleteOne({"qty":270})

isadesarrollo> db.ALMC01_Categoria.deleteOne({"qty":270})
{ acknowledged: true, deletedCount: 1 }
isadesarrollo>

#5. Cuenta la cantidad de documentos: Antes, elimina y despues

isadesarrollo> db.ALMC01_Categoria.find({"qty":270}).count()
3
isadesarrollo> db.ALMC01_Categoria.deleteOne({"qty":270})
{ acknowledged: true, deletedCount: 1 }
isadesarrollo> db.ALMC01_Categoria.find({"qty":270}).count()
2
isadesarrollo>

