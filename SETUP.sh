CENTOS_QCOW2="CentOS-Stream-GenericCloud-9-20210611.1.x86_64.qcow2"

echo "Downloading CentOS Stream image..."
curl -O https://cloud.centos.org/centos/9-stream/x86_64/images/$CENTOS_QCOW2

echo "Converting QCOW2 CentOS Stream image to RAW format for Docker..."
qemu-img convert -f qcow2 -O raw $CENTOS_QCOW2 centos-stream-9.raw

echo "Importing Raw CentOS image into Docker..."
docker import centos-stream-9.raw centos-stream-9

echo "Deleting CentOS stream image..."
rm $CENTOS_QCOW2
