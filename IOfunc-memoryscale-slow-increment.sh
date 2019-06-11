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
./partestcputenancy.sh 100 100  >> ~/memscale-slow-increment_SR-L_parcputen100100.csv
aws lambda update-function-configuration --function-name IO --timeout 240 > /dev/null
done
}
export -f memscalecold

memscalewarm() {
totalruns=$1
for (( i=1 ; i <= $totalruns; i++ ))
do
sleep 10
./partestcputenancy.sh 100 100  >> ~/memscale-slow-inc146_SR-B_parcputen100100.csv
done
}
export -f memscalewarm

echo "FIRST WILL CONDUCT ALL COLD RUNS, TESTING IMPACT OF CONTAINER CREATION WITH INCREASING MEM SIZE"
echo "One cold run, 128mb-----------------------------------------------------------------------------------------"
memscalecold 128 1
echo "One cold run, 130mb-----------------------------------------------------------------------------------------"
memscalecold 130 1
echo "One cold run, 132mb-----------------------------------------------------------------------------------------"
memscalecold 132 1
echo "One cold run, 134mb-----------------------------------------------------------------------------------------"
memscalecold 134 1
echo "One cold run, 136mb-----------------------------------------------------------------------------------------"
memscalecold 136 1
echo "One cold run, 138mb-----------------------------------------------------------------------------------------"
memscalecold 138 1
echo "One cold run, 140mb-----------------------------------------------------------------------------------------"
memscalecold 140 1
echo "One cold run, 142mb-----------------------------------------------------------------------------------------"
memscalecold 142 1
echo "One cold run, 144mb-----------------------------------------------------------------------------------------"
memscalecold 144 1
echo "One cold run, 146mb-----------------------------------------------------------------------------------------"
memscalecold 146 1
