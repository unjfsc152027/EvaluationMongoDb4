# Lectura de una archivo js

## A. Ubicarse en la carpeta donde se encuentra el archivo *.js

## B. Iniciar el servicio y conectarse a mongo por shell o mongo compas

test> use isadesarrollo
:::
switched to db isadesarrollo
:::

##C. Mostrar la collections
isadesarrollo> show collections
:::
ALMC01_Categoria
:::

##D. Cargar los datos en la collections (Revisar el archivo js)
isadesarrollo> load('ISAMNGEVL06LoadC_VideoDataSet.js')
:::
true
:::

##E. Mostrar la collections
isadesarrollo> show collections
:::
ALMC01_Categoria
EVLC01_video
:::

##F. Contar la cantidad de documentos
isadesarrollo> db.EVLC01_Video.find().count()
:::
2234
:::