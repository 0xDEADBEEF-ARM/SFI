#!/bin/bash
setterm -cursor off
while :
do	
clear;
sensors | awk '/^Tctl/ {print "CPU  : " $2}';
sensors | awk '/edge/  {print "GPU  : " $2}';
sensors | awk '/Composite/ {print "NVME : " $2}';
sensors | awk '/fan1:/ {print "FAN  : " $2 " " $3}';
echo MEMORY: -------------; 
ps axch -o cmd:15,%mem --sort=-%mem | head -n 2;
echo CPU: ----------------; 
ps axch -o cmd:15,%cpu --sort=-%cpu | head -n 2;
echo ---------------------;
sleep 10; 
done;

