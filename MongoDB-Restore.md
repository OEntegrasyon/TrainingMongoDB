---
title: MongoDB training with Özgür Entegrasyon
description: MongoDB Restore
description: MongoDB Eğitim
description: MongoDB CRUD | MongoDB Backup | MongoDB Restore | MongoDB Replica Set
description: Özgür Entegrasyon | www.ozgurentegrasyon.com
author: Ergün Elvan Bilsel
comment: MongoDB eğitimi için gitbook ile hazırlanmış bir web sayfası. A gitbook web page for MongoDB Training.
---

# Restore

Yedekleme verilerini geri yüklemek için MongoDB'nin mongorestore komutu kullanılır. Bu komut, yedekleme dizinindeki tüm verileri geri yükler.

```sh
mongorestore
```

mongorestore komutu aşağıdaki forma sahiptir:

```sh
mongorestore <opsiyonlar> <bağlantı ayarları> <içe aktarım için dosya veya dizin>
```


## Gerekli Erişim
Erişim denetimi etkinleştirilmiş bir MongoDB dağıtımına verileri geri yüklemek için, veriler system.profile toplama verilerini içermiyorsa ve --oplogReplay seçeneği olmadan mongorestore çalıştırırsanız, geri yükleme rolü verileri yedeklerden geri yüklemek için gerekli ayrıcalıkları sağlar.

Yedekleme verileri system.profile toplama verilerini içeriyorsa veya mongorestore'u --oplogReplay seçeneğiyle çalıştırıyorsanız, ek ayrıcalıklara ihtiyacınız vardır:

|  system.profile |  --oplogReplay |
| --------------- | -------------- |
|   Yedekleme verileri system.profile toplama verilerini içeriyorsa ve hedef veritabanı system.profile koleksiyonunu içermiyorsa, program aslında system.profile belgelerini geri yüklemese bile mongorestore koleksiyonu oluşturmaya çalışır.              |      --oplogReplay ile çalıştırmak için, anyResource üzerinde anyAction olan kullanıcı tanımlı bir rol oluşturun.          |


# mongoimport

mongoimport aracı, mongoexport tarafından oluşturulan bir JSON, CSV  dışa aktarımından veya potansiyel olarak başka bir üçüncü taraf dışa aktarma aracından içeriği içe aktarmak için bir yol sağlar.

> [!DANGER|style:flat]
> Tam ölçekli içe aktarımlar için mongoimport ve mongoexport'u kullanmayın, çünkü bunlar veri türü bilgilerini güvenilir bir şekilde oluşturmayabilir. Bu tür işlevsellik için mongodump ve mongorestore'u kullanın.