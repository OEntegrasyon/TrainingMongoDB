---
title: MongoDB training with Özgür Entegrasyon
description: Mongo Create User & Role
description: MongoDB Eğitim
description: MongoDB CRUD | MongoDB Backup | MongoDB Restore | MongoDB Replica Set
description: Özgür Entegrasyon | www.ozgurentegrasyon.com
author: Ergün Elvan Bilsel
comment: MongoDB eğitimi için gitbook ile hazırlanmış bir web sayfası. A gitbook web page for MongoDB Training.
---

# Create User

MongoDB'de kullanıcı yöneticisi oluşturma, createUser yöntemi kullanılarak yapılır. Aşağıdaki örnek bunun nasıl yapılabileceğini göstermektedir.

```sh
use admin

db.createUser(
{	user: "HasanPasa",
	pwd: "1773",

	roles:[{role: "userAdminAnyDatabase" , db:"admin"}]}
    )

```

```text
Successfully added user: {
	"user" : "HasanPasa",
	"roles" : [
		{
			"role" : "userAdminAnyDatabase",
			"db" : "admin"
		}
	]
}

```
İlk adım, oluşturulması gereken "kullanıcı adı" ve "şifre"nin belirlenmesidir.
İkinci adım, kullanıcı için bir rol atamaktır. Veritabanı yöneticisi olması gerektiğinden, bu durumda "userAdminAnyDatabase" rolünü atadık.
Bu rol, kullanıcının MongoDB'deki tüm veritabanlarında yönetici ayrıcalıklarına sahip olmasını sağlar. db parametresi, bu kullanıcı için bilgileri tutan MongoDB içindeki özel bir Meta veritabanı olan yönetici veritabanını belirtir.

```sh

db.system.users.find({},{user:1,roles:1})

```

```text

{ "_id" : "admin.HasanPasa", "user" : "HasanPasa", "roles" : [ { "role" : "userAdminAnyDatabase", "db" : "admin" } ] }

```


## Security Enable

MongoDb'yi Durduruyoruz
```sh

db.adminCommand( { shutdown: 1 } )

```


```text

mongod -f /etc/mongod.conf 
about to fork child process, waiting until server is ready for connections.
forked process: 1131
child process started successfully, parent exiting

```

## Test

Şimdi "mongo" komutu ile giriş yapalım ve database'leri görelim

```text
MongoDB shell version v4.4.4
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("9a0c162c-fdd5-457b-a769-f977fad187a4") }
MongoDB server version: 4.4.4
> show dbs;
```
Database'ler görülmeyecektir.

## DB AUTH

Şimdi Kullanıcı adı ve şifresi ile giriş yapalım.

```sh

db.auth("HasanPasa","1773")

```

```text

> show dbs;
admin               0.000GB
config              0.000GB
local               0.000GB
sample_airbnb       0.051GB
sample_analytics    0.009GB
sample_geospatial   0.001GB
sample_mflix        0.040GB
sample_restaurants  0.006GB
sample_training     0.032GB
sample_weatherdata  0.002GB
test 

```

Yada

```sh
mongo --port 27017  --authenticationDatabase "admin" -u "HasanPasa" -p "1773"
```




