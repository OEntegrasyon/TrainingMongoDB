---
description: Sorgu operatörlerini kullanarak hızlı çözümler
---

# Comparison Operators

## Karşılaştırma

| Operatör | Açıklaması | Sembol |
| :--- | :--- | :--- |
| $eq | EQual to | = |
| $ne | Not Equal to | **≠** |
| $gt | Greater Than | &gt; |
| $lt | Less Than | &lt; |
| $gte | Greater Than or Equal to | ≥ |
| $lte | Less Than or Equal to | ≤ |

> {&lt;field&gt;} :{ &lt;operator&gt;:&lt;value&gt;}}

**Yolculuk süresinin**\(tripduration\) 70 saniye veya daha az olduğu ve **kullanıcının türünün**\(user type\) Abone olmadığı tüm belgeleri bulalım:

```text
use sample_training
db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": { "$ne": "Subscriber" } }).pretty()
```

```text
{
	"_id" : ObjectId("572bb8232b288919b68af7cd"),
	"tripduration" : 66,
	"start station id" : 460,
	"start station name" : "S 4 St & Wythe Ave",
	"end station id" : 460,
	"end station name" : "S 4 St & Wythe Ave",
	"bikeid" : 23779,
	"usertype" : "Customer",
	"birth year" : "",
	"gender" : 0,
	"start station location" : {
		"type" : "Point",
		"coordinates" : [
			-73.96590294,
			40.71285887
		]
	},
	"end station location" : {
		"type" : "Point",
		"coordinates" : [
			-73.96590294,
			40.71285887
		]
	},
	"start time" : ISODate("2016-01-02T11:49:11Z"),
	"stop time" : ISODate("2016-01-02T11:50:18Z")
}
```



