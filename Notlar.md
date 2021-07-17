---
title: MongoDB training with Özgür Entegrasyon
description: MongoDB Eğitim | MongoDB CRUD | MongoDB Backup | MongoDB Restore | MongoDB Replica Set | Özgür Entegrasyon | www.ozgurentegrasyon.com
author: Ergün Elvan Bilsel
comment: MongoDB eğitimi için gitbook ile hazırlanmış bir web sayfası. A gitbook web page for MongoDB Training.
---

Hatalar ve çözümlerin tutulduğu bir sayfa

# Operation not permitted

```json
{"t":{"$date":"2021-07-17T14:06:36.827+03:00"},"s":"I",  "c":"CONTROL",  "id":23331,   "ctx":"main","msg":"Could not set permissions on pid file {path_string}: {ec_message}","attr":{"path_string":"/var/run/mongodb/mongod.pid","ec_message":"Operation not permitted"}}
```

Çözüm:

```sh
sudo kill $(sudo lsof -t -i:27017) 
sudo rm -rf /tmp/mongodb-27017.sock
sudo rm -f /var/lib/mongo/mongod.lock
sudo rm -f /var/run/mongodb/mongod.pid
sudo mkdir -p  /var/run/mongodb/
touch /var/run/mongodb/mongod.pid
sudo chown -R  mongod:mongod /var/run/mongodb/
sudo chown mongod:mongod /var/run/mongodb/mongod.pid

```
```sh
sudo systemct   start mongod
```

# Address already in use

```json
{"t":{"$date":"2021-07-17T15:35:19.840+03:00"},"s":"E",  "c":"STORAGE",  "id":20568,   "ctx":"initandlisten","msg":"Error setting up listener","attr":{"error":{"code":9001,"codeName":"SocketException","errmsg":"Address already in use"}}}
```
Çözüm:

```sh
sudo fuser -k 27017/tcp
```

```sh
systemctl start mongod

```

