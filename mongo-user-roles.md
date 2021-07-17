---
title: MongoDB training with Özgür Entegrasyon
description: MongoDB Eğitim | MongoDB CRUD | MongoDB Backup | MongoDB Restore | MongoDB Replica Set | Özgür Entegrasyon | www.ozgurentegrasyon.com
author: Ergün Elvan Bilsel
comment: MongoDB eğitimi için gitbook ile hazırlanmış bir web sayfası. A gitbook web page for MongoDB Training.
---

# Database User Roles

Her veritabanı aşağıdaki istemci rollerini içerir:

## read

Aşağıdaki süreçlere okuma erişimi sağlar:

* changeStream
    *  Oplog'u takip etme karmaşıklığı ve riski olmadan gerçek zamanlı veri değişikliklerine erişmesine olanak sağlar.
* collStats
    *   Koleksiyonlar için girilen komutların istatisliklerini gösteririr.
* dbHash
    *   db.runcommand() komutunun dbHash çıktısının md5 değerini gösterir.
* dbStats
    * dbStats Komut verilen bir veritabanı için depolama istatistiklerini gösterir. 
* find
* killCursors
* listIndexes
* listCollections
    * Bir veritabanındaki koleksiyonlar ve görünümler hakkında bilgileri gösterir.

## readWrite

Okuma rolünün tüm ayrıcalıklarını ve ayrıca  system.js koleksiyonundaki verileri değiştirme yeteneği sağlar.

* collStats
* convertToCapped
* createCollection
* dbHash
* dbStats
* dropCollection
* createIndex
* dropIndex
* find
* insert
* killCursors
* listIndexes
* listCollections
* remove
* renameCollectionSameDB
* update


# Database Administration Roles

Her veritabanı aşağıdaki veritabanı yönetim rollerini içerir:

## dbAdmin

Dizin oluşturma ve istatistik toplama gibi yönetim görevlerini gerçekleştirme yeteneği sağlar. 
Bu rol, kullanıcı ve rol yönetimi için ayrıcalıklar vermez.

## dbOwner

Veritabanı sahibi, veritabanı üzerinde herhangi bir yönetim eylemi gerçekleştirebilir. 
Bu rol, readWrite, dbAdmin ve userAdmin rolleri tarafından verilen ayrıcalıkları birleştirir.

## userAdmin

Geçerli veritabanında roller ve kullanıcılar oluşturma ve değiştirme yeteneği sağlar. userAdmin rolü, kullanıcıların kendileri de dahil olmak üzere herhangi bir kullanıcıya herhangi bir ayrıcalık vermelerine izin verdiğinden, rol ayrıca dolaylı olarak veritabanına veya yönetici veritabanı kapsamına alınmışsa cluster'a süper kullanıcı erişimi sağlar.

---
**NOTE**

userAdmin rolü vermenin güvenlikle ilgili sonuçlarını anlamak önemlidir:
bir veritabanı için bu role sahip bir kullanıcı, kendisine bu veritabanında herhangi bir ayrıcalık atayabilir. 
Yönetici veritabanında userAdmin rolünün verilmesi, bir kümeye dolaylı olarak süper kullanıcı erişimi sağladığı için daha fazla güvenlik etkisine sahiptir. 
Yönetici kapsamı ile, userAdmin rolüne sahip bir kullanıcı, userAdminAnyDatabase dahil olmak üzere cluster çapında roller veya ayrıcalıklar verebilir.

---


# Cluster Administration Roles

Yönetici veritabanı, yalnızca tek bir veritabanı yerine tüm sistemi yönetmek için aşağıdaki rolleri içerir. 
Bu roller, cluster ve replica set yönetim işlevlerini içerir ancak bunlarla sınırlı değildir.

## clusterAdmin

Bu rol, clusterManager, clusterMonitor ve hostManager rolleri tarafından verilen ayrıcalıkları birleştirir. 
Ayrıca bu rol, dropDatabase eylemini sağlar.

## clusterManager

 Bu role sahip bir kullanıcı, sırasıyla parçalama ve çoğaltmada kullanılan yapılandırma ve yerel veritabanlarına erişebilir.

 ## clusterMonitor
 
 MongoDB Bulut Yöneticisi gibi izleme araçlarına salt okunur erişim sağlar.

 ## hostManager

 Sunucuları izleme ve yönetme yeteneği sağlar.

# Backup and Restoration Roles

Verileri yedeklemek ve geri yüklemek için aşağıdaki rolleri içerir:

## backup

Verileri yedeklemek için gereken minimum ayrıcalıkları sağlar. 
Bu rol, MongoDB Cloud Manager yedekleme aracısını, Ops Manager yedekleme aracısını kullanmak veya mongodump kullanmak için yeterli ayrıcalıklar sağlar.

## restore

Veriler system.profile toplama verilerini içermiyorsa ve mongorestore'u --oplogReplay seçeneği olmadan çalıştırırsanız, yedeklerden verileri geri yüklemek için gerekli ayrıcalıkları sağlar.

---
**NOTE**

Yedekleme verileri system.profile toplama verilerini içeriyorsa veya --oplogReplay ile çalıştırıyorsanız, ek ayrıcalıklara ihtiyacınız vardır.

---


# All-Database Roles

 Tüm veritabanları için geçerli olan ayrıcalıklar sağlar.

 ## readAnyDatabase

Yerel ve yapılandırma dışındaki tüm veritabanlarında okunanla aynı salt okunur ayrıcalıkları sağlar. 
Bu rol ayrıca cluster  üzerinde listDatabases eylemini sağlar.

## readWriteAnyDatabase

Local ve yapılandırma dışındaki tüm veritabanlarında readWrite ile aynı ayrıcalıkları sağlar. 
Bu rol ayrıca bir bütün olarak küme üzerinde listDatabases eylemini sağlar.

## userAdminAnyDatabase

Local ve yapılandırma dışındaki tüm veritabanlarında userAdmin olarak kullanıcı yönetimi işlemlerine aynı erişimi sağlar.


## dbAdminAnyDatabase

Yerel ve yapılandırma dışındaki tüm veritabanlarında dbAdmin ile aynı ayrıcalıkları sağlar.


# Superuser Roles

Birkaç rol, dolaylı veya doğrudan sistem genelinde süper kullanıcı erişimi sağlar. 
Aşağıdaki roller, herhangi bir kullanıcıya herhangi bir veritabanında herhangi bir ayrıcalık atama yeteneği sağlar; 
bu rollerden birine sahip kullanıcıların herhangi bir veritabanında kendilerine herhangi bir ayrıcalık atayabilecekleri anlamına gelir: 
dbOwner rolü, admin veritabında verildiğinde
userAdmin rolü, admin veritabında verildiğinde
userAdminAnyDatabase rolü

## root
Aşağıdaki rollerin operasyonlarına ve tüm kaynaklarına birleştirilmiş erişim sağlar: 
* readWriteAnyDatabase 
* dbAdminAnyDatabase 
* userAdminAnyDatabase 
* clusterAdmin
* restore
* backup


# Internal Role

## __system

Bu  rol, sahibine veritabanındaki herhangi bir nesneye karşı herhangi bir işlem yapma hakkı verir.

> [!DANGER|style:flat]
> İstisnai durumlar dışında, bu rolü uygulamaları veya yöneticilere temsil eden kullanıcı nesnelerine atamayın.

