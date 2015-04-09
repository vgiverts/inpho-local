
echo $1

cp $1 FA000001.JPG
cp $1 test.jpg

echo "uploading FA"
curl -i -F name=file -F filedata=@FA000001.jpg http://flashair/upload.cgi

echo "uploading test"
curl -i -F name=file -F filedata=@test.jpg http://flashair/upload.cgi