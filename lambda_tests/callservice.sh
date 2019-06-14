#!/bin/bash

# JSON object to pass to IO Lambda Function example
#json={"\"name\"":"\"\",\"numfiles\"":100,\"fileops\"":"\"TR\",\"numfileops\"":100,\"optype\"":"\"L\",\"nodelete\"":"\"false\""}



#SR - L
#json={"\"name\"":"\"\",\"numfiles\"":10,\"fileops\"":"\"SR\",\"numfileops\"":10,\"optype\"":"\"B\",\"nodelete\"":"\"false\""}

#SR - B
#json={"\"name\"":"\"\",\"numfiles\"":10,\"fileops\"":"\"SR\",\"numfileops\"":10,\"optype\"":"\"B\",\"nodelete\"":"\"false\""}


#TR
json={"\"name\"":"\"\",\"numfiles\"":100,\"fileops\"":"\"TR\",\"numfileops\"":1000,\"optype\"":"\"L\",\"nodelete\"":"\"false\""}
echo $json

echo "Invoking Lambda function using API Gateway"

echo ""

##echo "Invoking Lambda function using AWS CLI"
time output=`aws lambda invoke --invocation-type RequestResponse --function-name IO --region us-west-2 --payload $json /dev/stdout | head -n 1 | head -c -2 ; echo`

echo ""
echo "AWS CLI RESULT:"
echo $output
echo ""
