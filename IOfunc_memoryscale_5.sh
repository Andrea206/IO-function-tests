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
./partestcputenancy.sh 100 100  >> ~/memscale-5_SR-L_parcputen100100.csv
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
echo "Ten cold runs, 128mb-----------------------------------------------------------------------------------------"
memscalecold 128 5
echo "Ten cold runs, 256mb-----------------------------------------------------------------------------------------"
memscalecold 256 5
echo "Ten cold runs, 384mb-----------------------------------------------------------------------------------------"
memscalecold 384 5
echo "Ten cold runs, 512mb-----------------------------------------------------------------------------------------"
memscalecold 512 5
echo "Ten cold runs, 640mb-----------------------------------------------------------------------------------------"
memscalecold 640 5
echo "Ten cold runs, 768mb-----------------------------------------------------------------------------------------"
memscalecold 768 5
echo "Ten cold runs, 896mb-----------------------------------------------------------------------------------------"
memscalecold 896 5
echo "Ten cold runs, 1024mb-----------------------------------------------------------------------------------------"
memscalecold 1024 5
echo "Ten cold runs, 1152mb-----------------------------------------------------------------------------------------"
memscalecold 1152 5
echo "Ten cold runs, 1280mb-----------------------------------------------------------------------------------------"
memscalecold 1280 5
echo "Ten cold runs, 1408mb-----------------------------------------------------------------------------------------"
memscalecold 1408 5
echo "Ten cold runs, 1536mb-----------------------------------------------------------------------------------------"
memscalecold 1536 5

echo "Ten warm - warmup run 128mb"
memscalecold 128 1
echo "TEN WARM - WARM RUNS 128 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 256mb"
memscalecold 256 1
echo "TEN WARM - WARM RUNS 256 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 384mb"
memscalecold 384 1
echo "TEN WARM - WARM RUNS 384 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 512mb"
memscalecold 512 1
echo "TEN WARM - WARM RUNS 512 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 640mb"
memscalecold 640 1
echo "TEN WARM - WARM RUNS 640 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 768mb"
memscalecold 768 1
echo "TEN WARM - WARM RUNS 768 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 896mb"
memscalecold 896 1
echo "TEN WARM - WARM RUNS 896 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 1024mb"
memscalecold 1024 1
echo "TEN WARM - WARM RUNS 1024 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 1152mb"
memscalecold 1152 1
echo "TEN WARM - WARM RUNS 1152 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 1280mb"
memscalecold 1280 1
echo "TEN WARM - WARM RUNS 1280 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 1408mb"
memscalecold 1408 1
echo "TEN WARM - WARM RUNS 1408 MB-------------------------------------------------------------------------------"
memscalewarm 10
echo "Ten warm - warmup run 1536mb"
memscalecold 1536 1
echo "TEN WARM - WARM RUNS 1536 MB-------------------------------------------------------------------------------"
memscalewarm 10
