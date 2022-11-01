#Pasos para crear un usuario autenticado


## A. Crear un usuario root o Administrador
use admin

-- Crear un super usuario
db.createUser(
  {
    user: "ADIAZ06",
    pwd: "adiaz06",
    roles: [ { role: "root", db: "admin" } ]
  }
);
:::
	{ ok: 1 }
:::

## B. Crear un usuario desarrollo con su rol
db.createUser(
  {
    user: "P028036",
    pwd: "bbva1908",
    roles: [ { role: "readWrite", db: "isadesarrollo" } ]
  }
);
:::
{ ok: 1 }
:::
-- Crear un usuario con su rol y más de una base de datos
db.createUser(
  {
    user: "P028036",
    pwd: "bbva1908",
    roles: [ { role: "readWrite", db: "isadesarrollo" },
			 { role: "readWrite", db: "unjfscdevelop" }
			]
  }
);
:::
{ ok: 1 }
:::
## C. Eliminar un usuario

db.dropUser("P028036");

{ ok: 1 }

## D. Listar usuarios

db.getUsers()

:::

{
  users: [
    {
      _id: 'admin.ADIAZ06',
      userId: new UUID("ff5bdbd7-b6a8-4af6-ab32-44734b93bb6d"),
      user: 'ADIAZ06',
      db: 'admin',
      roles: [ { role: 'root', db: 'admin' } ],
      mechanisms: [ 'SCRAM-SHA-1', 'SCRAM-SHA-256' ]
    },
    {
      _id: 'admin.P028036',
      userId: new UUID("7e5f8dd4-cd5e-42c5-97ce-9415b1cd928e"),
      user: 'P028036',
      db: 'admin',
      roles: [
        { role: 'readWrite', db: 'unjfscdevelop' },
        { role: 'readWrite', db: 'isadesarrollo' }
      ],
      mechanisms: [ 'SCRAM-SHA-1', 'SCRAM-SHA-256' ]
    }
  ],
  ok: 1
}

:::

## C. Reiniciar el servicio de mongod

mongod --port 27015 --dbpath D:\MongoDB --auth

## D. Conexion a mongo con el usuario y a una base de datos

-- Conexion fallada
mongosh --host localhost --port 27015 -u P0383 -p 2787 --authenticationDatabase admin

:::
G:\Test\EvaluationMongo\02Comand>mongosh --host localhost --port 27015 -u P0383 -p 2787 --authenticationDatabase admin
Current Mongosh Log ID: 633a36ed2fa39c13a903053b
Connecting to:          mongodb://<credentials>@localhost:27015/?directConnection=true&serverSelectionTimeoutMS=2000&authSource=admin&appName=mongosh+1.6.0
MongoServerError: Authentication failed.
:::

-- Conexion a una base de datos que no tengo acceso
mongosh --host localhost --port 27015 -u ADIAZ06 -p adiaz06 --authenticationDatabase isadesarrollo

:::
G:\Test\EvaluationMongo\02Comand>mongosh --host localhost --port 27015 -u ADIAZ06 -p adiaz06 --authenticationDatabase isadesarrollo
Current Mongosh Log ID: 633a374dcb18b0211ec6b4dc
Connecting to:          mongodb://<credentials>@localhost:27015/?directConnection=true&serverSelectionTimeoutMS=2000&authSource=isadesarrollo&appName=mongosh+1.6.0
MongoServerError: Authentication failed.
:::


-- Conexion a una base de datos que tengo acceso "admin" con el usuario ADIAZ06
mongosh --host localhost --port 27015 -u ADIAZ06 -p adiaz06 --authenticationDatabase admin

:::
G:\Test\EvaluationMongo\02Comand>mongosh --host localhost --port 27015 -u ADIAZ06 -p adiaz06 --authenticationDatabase admin
Current Mongosh Log ID: 633a386daa34e3eeaf16f8ab
Connecting to:          mongodb://<credentials>@localhost:27015/?directConnection=true&serverSelectionTimeoutMS=2000&authSource=admin&appName=mongosh+1.6.0
Using MongoDB:          6.0.1
Using Mongosh:          1.6.0

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

------
   The server generated these startup warnings when booting
   2022-10-02T20:07:30.573-05:00: This server is bound to localhost. Remote systems will be unable to connect to this server. Start the server with --bind_ip <address> to specify which IP addresses it should serve responses from, or with --bind_ip_all to bind to all interfaces. If this behavior is desired, start the server with --bind_ip 127.0.0.1 to disable this warning
------

------
   Enable MongoDB's free cloud-based monitoring service, which will then receive and display
   metrics about your deployment (disk utilization, CPU, operation statistics, etc).

   The monitoring data will be available on a MongoDB website with a unique URL accessible to you
   and anyone you share the URL with. MongoDB may use this information to make product
   improvements and to suggest MongoDB products and deployment options to you.

   To enable free monitoring, run the following command: db.enableFreeMonitoring()
   To permanently disable this reminder, run the following command: db.disableFreeMonitoring()
------

test>
:::


## E. Conexion a mongo con el usuario y a una base de datos

use isadesarrollo
db.createUser(
  {
    user: "P028036",
    pwd: "bbva1908",
    roles: [ { role: "readWrite", db: "isadesarrollo" }
			]
  }
);

use unjfscdevelop
db.createUser(
  {
    user: "P028036",
    pwd: "bbva1908",
    roles: [ { role: "readWrite", db: "unjfscdevelop" }
			]
  }
);

## F. Conexión a la base de datos

-- Conexion errada
mongosh --host localhost --port 27015 -u ADIAZ06 -p adiaz06 --authenticationDatabase isadesarrollo
:::
G:\Test\EvaluationMongo\02Comand>mongosh --host localhost --port 27015 -u ADIAZ06 -p adiaz06 --authenticationDatabase isadesarrollo
Current Mongosh Log ID: 633a3a47a84536e59373787d
Connecting to:          mongodb://<credentials>@localhost:27015/?directConnection=true&serverSelectionTimeoutMS=2000&authSource=isadesarrollo&appName=mongosh+1.6.0
MongoServerError: Authentication failed.

:::

-- Conexion a isadesarrollo
mongosh --host localhost --port 27015 -u P028036 -p bbva1908 --authenticationDatabase isadesarrollo

:::
G:\Test\EvaluationMongo\02Comand>mongosh --host localhost --port 27015 -u P028036 -p bbva1908 --authenticationDatabase isadesarrollo
Current Mongosh Log ID: 633a3a735eab61c57400c5df
Connecting to:          mongodb://<credentials>@localhost:27015/?directConnection=true&serverSelectionTimeoutMS=2000&authSource=isadesarrollo&appName=mongosh+1.6.0
Using MongoDB:          6.0.1
Using Mongosh:          1.6.0

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

test> show dbs
isadesarrollo  8.00 KiB
test>

:::

-- Conexion a unjfscdevelop

mongosh --host localhost --port 27015 -u P028036 -p bbva1908 --authenticationDatabase unjfscdevelop

:::
G:\Test\EvaluationMongo\02Comand>mongosh --host localhost --port 27015 -u P028036 -p bbva1908 --authenticationDatabase unjfscdevelop
Current Mongosh Log ID: 633a3aa04bb31f101def53fc
Connecting to:          mongodb://<credentials>@localhost:27015/?directConnection=true&serverSelectionTimeoutMS=2000&authSource=unjfscdevelop&appName=mongosh+1.6.0
Using MongoDB:          6.0.1
Using Mongosh:          1.6.0

For mongosh info see: https://docs.mongodb.com/mongodb-shell/

test>

:::

