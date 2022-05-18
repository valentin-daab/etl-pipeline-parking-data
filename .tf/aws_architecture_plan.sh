#!/usr/bin/env bash

# Run this script pointing to all libraries required to package them for the Lambda.

terraform init

cp -r /Users/daabv/Desktop/GitHub1/parking-strasbourg/venv/lib/site-packages/boto3 ../lambda_payloads/parking_payload/
cp -r /Users/daabv/Desktop/GitHub1/parking-strasbourg/venv/lib/site-packages/requests ../lambda_payloads/parking_payload/

cp /Users/daabv/Desktop/GitHub1/parking-strasbourg/parking_data.py ../lambda_payloads/parking_payload/
cp /Users/daabv/Desktop/GitHub1/parking-strasbourg/config/get_url.py ../lambda_payloads/parking_payload/config/
cp /Users/daabv/Desktop/GitHub1/parking-strasbourg/tools/get_parking_info.py ../lambda_payloads/parking_payload/tools/

cd ../lambda_payloads/parking_payload/

zip -r ../../payload.zip *

cd ../../.tf/

terraform plan

