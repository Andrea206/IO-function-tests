#!/bin/bash
# IOfunc_memoryscale

# Original code by Dr. Wes Lloyd
# Modified by Andrea Moncada
memscalecold() {
totalruns=$2
memory=$1
for (( i=1 ; i <= $totalruns; i++ ))
do
timestamp=$(date +"-%m-%d-%Y-%H%M%S")
aws lambda update-function-configuration --function-name IO --timeout 240 > /dev/null
aws lambda update-function-configuration --function-name IO --timeout 300 > /dev/null
aws lambda update-function-configuration --function-name IO --memory-size=$memory
sleep 10
./partestcputenancy.sh 100 100  >> ~/memscale-small_SR-L_parcputen100100.csv
aws lambda update-function-configuration --function-name IO --timeout 240 > /dev/null
done
}
export -f memscalecold

memscalewarm() {
totalruns=$1
for (( i=1 ; i <= $totalruns; i++ ))
do
sleep 10
./partestcputenancy.sh 100 100  >> ~/memscale_5_SR-L_parcputen100100.csv
done
}
export -f memscalewarm

echo "FIRST WILL CONDUCT ALL COLD RUNS, TESTING IMPACT OF CONTAINER CREATION WITH INCREASING MEM SIZE"
echo "Five cold runs, 128mb-----------------------------------------------------------------------------------------"
memscalecold 128 5
echo "Five cold runs, 256mb-----------------------------------------------------------------------------------------"
memscalecold 256 5
echo "Five cold runs, 384mb-----------------------------------------------------------------------------------------"
memscalecold 384 5
echo "Five cold runs, 512mb-----------------------------------------------------------------------------------------"
memscalecold 512 5
echo "Five cold runs, 640mb-----------------------------------------------------------------------------------------"
memscalecold 640 5
echo "Five cold runs, 768mb-----------------------------------------------------------------------------------------"
memscalecold 768 5
echo "Five cold runs, 896mb-----------------------------------------------------------------------------------------"
memscalecold 896 5
