#!/bin/bash
#make_empty_file.sh
echo "Writing to /tmp/empty_file.bin"
touch /tmp/empty_file.bin

let gb="1024*1000*5"
df=`df -Pk . | sed 1d | grep -v used | awk '{ print $4 "\t" }'`

while [ $gb -lt $df ]
do
    dd if=/dev/zero bs=2048 count=1000 >> /tmp/empty_file.bin
    sleep 2
    df=`df -Pk . | sed 1d | grep -v used | awk '{ print $4 "\t" }'`
    free=$((df/1024))
    echo "$free Megabytes free..."
done