# Terraform and Serverless Framework

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=pdaambrosio_terraform_serverless&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=pdaambrosio_terraform_serverless) &nbsp; &nbsp;[![CodeFactor](https://www.codefactor.io/repository/github/pdaambrosio/terraform_serverless/badge)](https://www.codefactor.io/repository/github/pdaambrosio/terraform_serverless)

In short, this project will provisioning on AWS:

* Four S3 Buckets (Three for images and one for lambdas deployment)
* Four Lambdas to apply filter on images
* One ApiGateway
* One instance of DynamoDB
* One SNS queue and one SQS

## Requirements

* Serverless Framework 3.80
* Terraform 1.1.9

Both must be properly configured with your AWS programmatic key.

This link helps you install and configure the AWS CLI to get your programmatic key.:

* https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html
