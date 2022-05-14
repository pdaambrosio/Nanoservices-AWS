# Terraform and Serverless Framework

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=pdaambrosio_terraform_serverless&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=pdaambrosio_terraform_serverless) &nbsp; &nbsp;[![CodeFactor](https://www.codefactor.io/repository/github/pdaambrosio/terraform_serverless/badge)](https://www.codefactor.io/repository/github/pdaambrosio/terraform_serverless)

In short, this project will provisioning on AWS:

* Four S3 Buckets (Three for images and one for lambdas deployment)
* Four Lambdas to apply filter on images
* An ApiGateway
* An instance of DynamoDB
* A SNS queue and one SQS
* A instance of OpenSearch

Attention.: I'm considering that you will use some Linux distribution for this project.

## Requirements

* Node.js 14.19.1
* NPM 8.8.0
* Serverless Framework 3.80
* Terraform 1.1.9

Both must be properly configured with your AWS programmatic key.

This link helps you install and configure the AWS CLI to get your programmatic key.:

* https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html

And use these links to configure Node.js, Terraform and Serverless Framework.:

* https://nodejs.org/en/download/package-manager/
* https://www.terraform.io/downloads
* https://www.serverless.com/framework/docs/providers/fn/guide/quick-start

## Installation

To build this proveject is very simple, all commands were added in a make file.
Since deploying OpenSearch is a long process, I'll show the output of the commands for follow along.

Now, just clone the repository and run the following command:

```bash
make init
make deploy
```

Because to the OpenSearch deployment is a long process, I will not show the output of the commands.

And for description of each command, please refer to the make file with bellow command.
    
```bash
make help
```