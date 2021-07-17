---
title: MongoDB training with Özgür Entegrasyon
description: MongoDB Eğitim | MongoDB CRUD | MongoDB Backup | MongoDB Restore | MongoDB Replica Set | Özgür Entegrasyon | www.ozgurentegrasyon.com
author: Ergün Elvan Bilsel
comment: MongoDB eğitimi için gitbook ile hazırlanmış bir web sayfası. A gitbook web page for MongoDB Training.
---

# Replica

Replica Set, temelde aynı veri kümesini koruyan birden çok sunucu üzerinde çalışan birden çok mongod işlemidir. 
Replica Set en az üç düğüme sahip olabilir. 
Bir replika setindeki bu çoklu düğümler farklı roller oynar ve hepsi birlikte tek bir replika seti oluşturur.

# Roles

* Primary
* Secondary
* Arbiter

## Primary node

Replika setin ana sunucusudur ve tüm okuma ve yazma işlemleri bunun üzerinde yapılacaktır.

## Secondary node

İkincil düğüm, birincil düğümle eşitlenir ve böylece birincil düğümün aynı veri kümesinin kopyasını tutar. Bir çoğaltma kümesinde birden çok ikincil düğüm olabilir. Birincil düğümün kullanılamaması durumunda, mevcut ikincil düğümler arasında bir seçim başlatacak ve bu düğümlerden biri, bu replika setinin bir sonraki birincil düğümü olacak ve normal işlemlere devam edecek, böylece veritabanı istemcilerine yüksek veri kullanılabilirliği sağlayacaktır.

# Arbiter

En önemlisi, bu, verilerin herhangi bir kopyasını tutmayacak, yalnızca hangi düğümün bir sonraki birincil olacağına karar vermek için seçimlerde oy kullanacaktır. Birden fazla ikincil düğümün bir sonraki birincil düğüm olmak için yarıştığı altyapılarda yaygın olarak kullanılan bu, seçim süresinin azaltılmasına yardımcı olacaktır.