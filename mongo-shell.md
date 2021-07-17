---
title: MongoDB training with Özgür Entegrasyon
description: BSON&JSON
description: MongoDB Eğitim
description: MongoDB CRUD | MongoDB Backup | MongoDB Restore | MongoDB Replica Set
description: Özgür Entegrasyon | www.ozgurentegrasyon.com
author: Ergün Elvan Bilsel
comment: MongoDB eğitimi için gitbook ile hazırlanmış bir web sayfası. A gitbook web page for MongoDB Training.
---

# Mongo Shell - Find



![](gitbook/images/assets/sorucevap.png)

| JSON | BSON |
| :--- | :--- |
| mongoimport | mongorestore |
| mongoexport | mongodump |

![](gitbook/images/assets/bson-json.png)

### Sample Data Restore

Aşağıdaki link üzerinden eğitim için kullanacağımız örnek datalara ulaşabilirsiniz.

['Sample Data Page'](https://erelbi.github.io/mongodb_sample_data/)

___

```text
show dbs;
```

![](gitbook/images/assets/showdbs.png)

```text
use sample_airbnb
show collections;
```

![](gitbook/images/assets/show-collections.png)

### Find & FindOne

```text
use sample_mflix
show collections
db.movies.findOne()
```

![](gitbook/images/assets/find.png)

```text
db.movies.find()
```

![](gitbook/images/assets/find2.png)

**Type "it" for more**

```text
it
```

#### Pretty\(\)

```text
db.movies.find().pretty()
```

#### Count\(\)

```text
db.movies.find().count()
```

### Find\({'filed':'value'}\)

```text
db.movies.find({'year':1983})
```

### Subdocument Find

```text
db.movies.find({'year':1983, 'imdb.rating':6.2})
```

![](gitbook/images/assets/find3.png)

```text
db.movies.find({'year':1983, 'imdb.rating':6.2,'countries':['Italy']}).pretty()
```

![](gitbook/images/assets/find4.png)

### Find Filter Filed \(3F\) \( Böyle bir Tabir Yok :\)\)

```text
db.movies.find({'year':1983, 'imdb.rating':6.2},{'cast':1}).pretty()
```

![](gitbook/images/assets/find5.png)

### MongoDB Quiz-1

[https://forms.gle/8M3PBmYM5vT5mybr8](https://forms.gle/8M3PBmYM5vT5mybr8)

