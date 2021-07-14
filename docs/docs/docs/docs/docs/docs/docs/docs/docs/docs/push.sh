#!/bin/bash
gitbook build &&
sleep 1 & echo "Dosyalar Oluşturuldu"
cp -p -r _book/* docs/
rm -rf /docs/docs
git add .
sleep 1  & echo "Dosyalar Ekleniyor"
read -p "Commit Giriniz:   " desc
git commit -m $desc
git push  origin master
