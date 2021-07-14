#!/bin/bash
gitbook build > /dev/null 2>&1
sleep 1 &&
echo "Dosyalar Oluşturuldu"
rsync -av _book/* docs/
#rm -rf /docs/docs
#git add .
#sleep 1  & echo "Dosyalar Ekleniyor"
#read -p "Commit Giriniz:   " desc &&
#git commit -m $desc  &&
#git push  origin master &&
