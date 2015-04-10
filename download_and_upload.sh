
### $1 generally should contain backend_ip

flashair_ip=192.168.0.1

flashair_url="http://${flashair_ip}/upload.cgi"
backend_url="http://162.243.156.228:9000/img"

echo "backend = ${backend_url}"
echo "flashair_url = ${flashair_url}"

curl ${backend_url} > test.jpg

ln -fs test.jpg FA000001.JPG

touch prev.jpg

cmp test.jpg prev.jpg

if [ $? -ne 0 ]; then

    echo "FILE HAS CHANGED ON ${backend_url}, let's upload"

    echo "uploading FA"
    curl -i -F name=file -F filedata=@FA000001.jpg ${flashair_url}
    
    echo "uploading test"
    curl -i -F name=file -F filedata=@test.jpg ${flashair_url}
fi

cp test.jpg prev.jpg