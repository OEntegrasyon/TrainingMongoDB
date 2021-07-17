---
title: MongoDB training with Özgür Entegrasyon
description: MongoDB BackUp
---

> [!TIP|style:flat]
> Mongo Shell-Find Sayfasındaki tabloyu inceleyiniz.


MongoDB'de veritabanının yedeğini oluşturmak için mongodump komutunu kullanmalısınız. 
Bu komut, sunucunuzun tüm verilerini döküm dizinine dökecektir.
Veri miktarını sınırlayabileceğiniz veya uzak sunucunuzun yedeğini oluşturabileceğiniz birçok seçenek vardır.


# Dump

27017 port noktasında çalışan yerel bir MongoDB örneğine bağlanmak ve içeriği dışa aktarmak için varsayılan ayarları kullanmak için;
herhangi bir komut satırı seçeneği olmadan mongodump'u çalıştırabilirsiniz. (Kimlik Doğrulama Gerekmiyorsa!)

```sh
mongodump
```

Komut, 127.0.0.1 ve 27017 numaralı bağlantı noktasında çalışan sunucuya bağlanacak ve sunucunun tüm verilerini /bin/dump/ dizinine 

mongodump komutu aşağıdaki forma sahiptir:

```sh
mongodump <ayarlar> <bağlantı-ayarları>
```

| Syntax      | Açıklama    | Örnek |
| ----------- | ----------- | ----- |
| mongodump --host HOST_NAME --port PORT_NUMBER  |   Bu komut, belirtilen mongod örneğinin tüm veritabanlarını yedekleyecektir.          | mongodump --host 127.0.0.1 --port 27017      |
| mongodump --dbpath DB_PATH --out BACKUP_DIRECTORY         |    Bu komut, yalnızca belirtilen veritabanını belirtilen dizine yedekleyecektir.         |   mongodump --dbpath /data/db/ --out /data/backup/    |
| mongodump --collection COLLECTION --db DB_NAME         |     Bu komut, belirtilen veritabanının yalnızca belirtilen koleksiyonunu yedekleyecektir.        |   mongodump --collection mycol --db test    |

# Export

mongoexport, bir MongoDB örneğinde depolanan verilerin JSON veya CSV dışa aktarımını üreten bir yardımcı programdır.

> [!DANGER|style:flat]
> Tam ölçekli yedeklemeler için mongoimport ve mongoexport'u kullanmayın, çünkü bunlar veri türü bilgilerini güvenilir bir şekilde oluşturmayabilir. Bu tür işlevsellik için mongodump ve mongorestore'u kullanın.


```sh
mongoexport --db users --collection contacts --csv --out /opt/backups/contacts.csv
```

Yukarıdaki Örnekte görüldüğü üzere DB,Collection  ve kayıt formatı belirtilerek dosya istenilen dizine export ediliyor.

Son örnekte ise uzak bir istemcideki veriler json formatı ile çekiliyor.

```sh
mongoexport --host mongodb1.example.net --port 27017 --username user --password pass --collection contacts --db marketing --out mdb1-examplenet.json
```