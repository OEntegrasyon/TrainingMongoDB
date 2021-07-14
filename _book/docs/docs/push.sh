#!/bin/bash
gitbook build > /dev/null 2>&1
sleep 1 &&
echo "Dosyalar Oluşturuldu"
rsync -av _book/* docs/ > /dev/null 2>&1
rm -rf /docs/docs > /dev/null 2>&1
echo "Dosyalar Kopyalandı" 
git add .
sleep 1 
echo "Dosyalar Ekleniyor"
read -p "Commit Giriniz:   " desc 
#git commit -m $desc  &&
#git push  origin master &&
