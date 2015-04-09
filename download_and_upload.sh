
echo $1

curl $1 > test.jpg

cp test.jpg FA000001.JPG

echo "uploading FA"
curl -i -F name=file -F filedata=@FA000001.jpg http://flashair/upload.cgi

echo "uploading test"
curl -i -F name=file -F filedata=@test.jpg http://flashair/upload.cgi
