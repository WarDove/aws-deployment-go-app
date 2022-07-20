#!/bin/bash
for i in `seq 1 2 5`
  do  
    ssh-keyscan -t rsa,dsa 10.0.${i}.4 >> ~/.ssh/known_hosts
    scp /tmp/artifact.tgz ubuntu@10.0.${i}.4:/tmp; ssh ubuntu@10.0.${i}.4 "sudo killall main"
    ssh ubuntu@10.0.${i}.4 "tar xvzf /tmp/artifact.tgz --directory /home/ubuntu"
    ssh ubuntu@10.0.${i}.4 "sudo ./main &" & 
  done
