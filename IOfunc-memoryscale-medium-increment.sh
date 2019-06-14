#!/bin/bash
# IOfunc-memoryscale-medium-increment
# Test that increments memoroy setting for each IO lambda call by 50MB, from 128MB to  628MB

# Original code by Dr. Wes Lloyd
# Modified by Andrea Moncada

# requires curl, the gnu parallel package, the bash calculator, jq for json processing, and the awscli
#
# script requires packages:
# apt install parallel bc jq awscli curl
#
# To use this parallel test script, create files to provide your function name and AWS gateway URL
# file: parurl        Provide URL from AWS-Gateway
# file: parfunction   Provide AWS Lambda function name on a single line text file

memscalecold() {
totalruns=$2
memory=$1
for (( i=1 ; i <= $totalruns; i++ ))
do
aws lambda update-function-configuration --function-name IO --timeout 240 > /dev/null
aws lambda update-function-configuration --function-name IO --timeout 300 > /dev/null
aws lambda update-function-configuration --function-name IO --memory-size=$memory
sleep 10
#./partestcputenancy.sh 100 100
./partestcputenancy.sh 100 100 >> ~/IOfunc-memoryscale-medium-increment_SR_B.csv
aws lambda update-function-configuration --function-name IO --timeout 240 > /dev/null
done
}
export -f memscalecold

echo "TESTING IMPACT OF CONTAINER CREATION WITH INCREASING MEM SIZE, 50MB INCREMENTS"
echo "One cold run, 128mb-----------------------------------------------------------------------------------------"
memscalecold 128 1
echo "One cold run, 178mb-----------------------------------------------------------------------------------------"
memscalecold 178 1
echo "One cold run, 228mb-----------------------------------------------------------------------------------------"
memscalecold 228 1
echo "One cold run, 278mb-----------------------------------------------------------------------------------------"
memscalecold 278 1
echo "One cold run, 328mb-----------------------------------------------------------------------------------------"
memscalecold 328 1
echo "One cold run, 378mb-----------------------------------------------------------------------------------------"
memscalecold 378 1
echo "One cold run, 428mb-----------------------------------------------------------------------------------------"
memscalecold 428 1
echo "One cold run, 478mb-----------------------------------------------------------------------------------------"
memscalecold 478 1
echo "One cold run, 528mb-----------------------------------------------------------------------------------------"
memscalecold 528 1
echo "One cold run, 578mb-----------------------------------------------------------------------------------------"
memscalecold 578 1
echo "One cold run, 628mb-----------------------------------------------------------------------------------------"
memscalecold 628 1
