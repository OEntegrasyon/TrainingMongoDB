---
title: MongoDB training with Özgür Entegrasyon
description: MongoDB Eğitim | MongoDB CRUD | MongoDB Backup | MongoDB Restore | MongoDB Replica Set | Özgür Entegrasyon | www.ozgurentegrasyon.com
author: Ergün Elvan Bilsel
comment: MongoDB eğitimi için gitbook ile hazırlanmış bir web sayfası. A gitbook web page for MongoDB Training.
---

MongoDB Replica Set veri tabanının yedekli olmasını sağlar; bu sayede donanım arızası veya hizmet kesintilerinden dolayı  aksaklıklardan kurtulmanıza olanak sağlar.

Replica Set iki veya  daha fazla üye olması gerekmektedir.

# Örnek Kurulum

Fedora 34 sunucusu üzerine ReplicaSet kurulumu gerçekleştireceğiz.

> [!TIP|style:flat]
> Fedora 34 Kurulumu için ilk sayfayı inceleyiniz. MongoDB kurulumunu tamamlayınız.


MongoDB'nin config dosyası /etc dizinin altında bulunmaktadır.
cp komutu ile toplam üç adet config dosyası elde edeceğiz.

```sh
cp -p /etc/mongod.conf  /etc/mongod2.conf
cp -p /etc/mongod.conf  /etc/mongod3.conf
```
Config dosyasında görüldüğü üzere log dosyasının yazılcağı yer ve veri tabanı dosya dizini,
port ayarları, erişim ayarları, güvenlik gibi bir çok parametre göze çarpmaktadır.

## Örnek Config Dosyası

```text
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# Where and how to store data.
storage:
  dbPath: /var/lib/mongo
  journal:
    enabled: true
#  engine:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1  # Enter 0.0.0.0,:: to bind to all IPv4 and IPv6 addresses or, alternatively, use the net.bindIpAll setting.


#security:

#operationProfiling:

#replication: 

#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:
```

İki adet veri tabanı dosya dizini oluşturalım.

```sh
mkdir -p /var/lib/{mongo2,mongo3}
chown -R mongod:mongod /var/lib/mongo*
```
## Yapılandırma
 * Dışardan erişim sağlamak için  sunucunun ip adresi bindIp parametrine eklenir.
 * storage --> dbPath kısmına dizin bilgileri eklenir.
 * replication --> repSetName kısımına replica set ismi girilir.
 * Port Bilgisi düzenlenir.

## Birinci Düğüm

```text
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# Where and how to store data.
storage:
  dbPath: /var/lib/mongo
  journal:
    enabled: true
#  engine:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27017
  bindIp: 192.168.122.201  # Enter 0.0.0.0,:: to bind to all IPv4 and IPv6 addresses or, alternatively, use the net.bindIpAll setting.


#security:

#operationProfiling:

replication: 
  replSetName:  testReplicaSet

#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:
```
## İkinci Düğüm

```text
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod2.log

# Where and how to store data.
storage:
  dbPath: /var/lib/mongo2
  journal:
    enabled: true
#  engine:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27018
  bindIp: 192.168.122.201  # Enter 0.0.0.0,:: to bind to all IPv4 and IPv6 addresses or, alternatively, use the net.bindIpAll setting.


#security:

#operationProfiling:

replication: 
  replSetName:  testReplicaSet

#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:
```

## Üçüncü Düğüm

```text
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod3.log

# Where and how to store data.
storage:
  dbPath: /var/lib/mongo3
  journal:
    enabled: true
#  engine:
#  wiredTiger:

# how the process runs
processManagement:
  fork: true  # fork and run in background
  pidFilePath: /var/run/mongodb/mongod.pid  # location of pidfile
  timeZoneInfo: /usr/share/zoneinfo

# network interfaces
net:
  port: 27019
  bindIp: 192.168.122.201  # Enter 0.0.0.0,:: to bind to all IPv4 and IPv6 addresses or, alternatively, use the net.bindIpAll setting.


#security:

#operationProfiling:

replication: 
  replSetName:  testReplicaSet

#sharding:

## Enterprise-Only Options

#auditLog:

#snmp:
```
> [!DANGER|style:flat]
> Log dosyası, port ve veri tabanı dizini farklı olmalıdır!

Dosyaları düzenledikten sonra  mongoDB uygulaması ayar dosyaları referans gösterilerek başlanır.

```sh
mongod -config /etc/mongod.conf
mongod -config /etc/mongod2.conf
mongod -config /etc/mongod3.conf
```

![](gitbook/images/assets/mongo-rep.png)

Veri tabanlarının çalışır vaziyette olduğunu kontrol etmek için netstat çıktısı ile açık olan ve portların PID'si üzerinden kontrol sağlanmıştır.


> [!TIP|style:flat]
> netstat komutu için net-tools paketinin kurulu olması gerekmektedir.  “ps aux | grep mongod”  komutu kullanılarak kontrol sağlanabilir.

## Replica Kurulumu

Veri tabanlarının çalıştığını teyit ettik. Replica set ortamını ayağa kaldırmak için sırası ile  veritabanlarına bağlanacağız ve kurulumu gerçekleştireceğiz.

### Birinci Düğüm

```sh
mongo -host 192.168.122.201 -port 27017
```
```sh
rs.initiate()
```

```json
{
	"info2" : "no configuration specified. Using a default configuration for the set",
	"me" : "192.168.122.201:27017",
	"ok" : 1,
	"$clusterTime" : {
		"clusterTime" : Timestamp(1627289895, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	},
	"operationTime" : Timestamp(1627289895, 1)
}
```
### İkinci ve Üçüncü düğüm

İkinci  ve Üçüncü düğüm yapılandırması mevcut kuruluma başladığımız Primary üzerinden yapılandırmaya devam ediyoruz.

```sh
rs.add("192.168.122.201:27018")
rs.add("192.168.122.201:27019")
```


![](gitbook/images/assets/mongoSet.png)

## Replica Kontrol

```sh
rs.status()
```


```json
[
	{
		"_id" : 0,
		"name" : "192.168.122.201:27017",
		"health" : 1,
		"state" : 1,
		"stateStr" : "PRIMARY",
		"uptime" : 3885,
		"optime" : {
			"ts" : Timestamp(1627292136, 1),
			"t" : NumberLong(1)
		},
		"optimeDate" : ISODate("2021-07-26T09:35:36Z"),
		"syncSourceHost" : "",
		"syncSourceId" : -1,
		"infoMessage" : "",
		"electionTime" : Timestamp(1627289895, 2),
		"electionDate" : ISODate("2021-07-26T08:58:15Z"),
		"configVersion" : 3,
		"configTerm" : 1,
		"self" : true,
		"lastHeartbeatMessage" : ""
	},
	{
		"_id" : 1,
		"name" : "192.168.122.201:27018",
		"health" : 1,
		"state" : 2,
		"stateStr" : "SECONDARY",
		"uptime" : 1981,
		"optime" : {
			"ts" : Timestamp(1627292136, 1),
			"t" : NumberLong(1)
		},
		"optimeDurable" : {
			"ts" : Timestamp(1627292136, 1),
			"t" : NumberLong(1)
		},
		"optimeDate" : ISODate("2021-07-26T09:35:36Z"),
		"optimeDurableDate" : ISODate("2021-07-26T09:35:36Z"),
		"lastHeartbeat" : ISODate("2021-07-26T09:35:41.783Z"),
		"lastHeartbeatRecv" : ISODate("2021-07-26T09:35:42.212Z"),
		"pingMs" : NumberLong(0),
		"lastHeartbeatMessage" : "",
		"syncSourceHost" : "192.168.122.201:27017",
		"syncSourceId" : 0,
		"infoMessage" : "",
		"configVersion" : 3,
		"configTerm" : 1
	},
	{
		"_id" : 2,
		"name" : "192.168.122.201:27019",
		"health" : 1,
		"state" : 2,
		"stateStr" : "SECONDARY",
		"uptime" : 1967,
		"optime" : {
			"ts" : Timestamp(1627292136, 1),
			"t" : NumberLong(1)
		},
		"optimeDurable" : {
			"ts" : Timestamp(1627292136, 1),
			"t" : NumberLong(1)
		},
		"optimeDate" : ISODate("2021-07-26T09:35:36Z"),
		"optimeDurableDate" : ISODate("2021-07-26T09:35:36Z"),
		"lastHeartbeat" : ISODate("2021-07-26T09:35:41.782Z"),
		"lastHeartbeatRecv" : ISODate("2021-07-26T09:35:41.010Z"),
		"pingMs" : NumberLong(0),
		"lastHeartbeatMessage" : "",
		"syncSourceHost" : "192.168.122.201:27018",
		"syncSourceId" : 1,
		"infoMessage" : "",
		"configVersion" : 3,
		"configTerm" : 1
	}
]
```

