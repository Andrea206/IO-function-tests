#!/bin/bash

# JSON object to pass to Lambda Function
#json={"\"name\"":"\"Fred\u0020Smith\",\"param1\"":1,\"param2\"":2,\"param3\"":3}
#json={"\"name\"":"\"\",\"calcs\"":2500000,\"sleep\"":0,\"loops\"":25}

#SR
#json={"\"name\"":"\"\",\"numfiles\"":10,\"fileops\"":"\"SR\",\"numfileops\"":10,\"optype\"":"\"B\",\"nodelete\"":"\"false\""}

#TR
json={"\"name\"":"\"\",\"numfiles\"":100,\"fileops\"":"\"TR\",\"numfileops\"":1000,\"optype\"":"\"L\",\"nodelete\"":"\"false\""}


# echo $json


echo "Invoking Lambda function using API Gateway"
##time output=`curl -s -H "Content-Type: application/json" -X POST -d  $json https://4k8a0ku5g5.execute-api.us-east-1.amazonaws.com/calcs_test`
##time output=`curl -s -H "Content-Type: application/json" -X POST -d  $json {INSERT API GATEWAY URL HERE}`

echo ""
##echo "CURL RESULT:"
#echo $output
##echo ""
##echo ""
#exit



##echo "Invoking Lambda function using AWS CLI"
time output=`aws lambda invoke --invocation-type RequestResponse --function-name IO --region us-west-2 --payload $json /dev/stdout | head -n 1 | head -c -2 ; echo`
## Was not able to use aws cli successfully, had to use REST call ##
##time output=`curl -s -H "Content-Type: application/json" -X POST -d  $json https://f3b7si0tr5.execute-api.us-west-2.amazonaws.com/IO_dev`

#aws lambda invoke --invocation-type RequestResponse --function-name logtest --region us-east-1 --payload $json /dev/stdout
echo ""
echo "AWS CLI RESULT:"
echo $output
echo ""
