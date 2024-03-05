#!/bin/sh
echo "Computing md5sum for localfile";md5sum localfile>>output.txt;
echo "Computing md5sum for remotefile";md5sum remotefile>>output.txt;
echo "Am sleeping for 30 seconds"
sleep 30
echo "This job was executed on this node:"
hostname -f
exit 
