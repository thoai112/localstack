# LocalStack GitHub Actions

The LocalStack Team presents a collection of GitHub Actions to facilitate local development and testing on your GitHub Actions workflows.

### This repository includes the following GitHub Actions:

- [Setup LocalStack](./setup-localstack)
- [Setup Local Tools](./setup-local-tools)
- [LocalStack Terraform Deploy](./tflocal-deploy)

## Setup LocalStack

The Setup LocalStack action enables you to set up LocalStack in your GitHub Actions workflow. You can specify the Docker image tag, whether to use LocalStack Pro, and any configuration variables for LocalStack. For more information, see the Setup LocalStack [README](./setup-localstack/README.md).

## Setup Local Tools

The Setup Local Tools action assists you in setting up several local development tools, including awslocal, terraform, and terraform-local. You can specify the versions and credentials for Terraform and whether to install a wrapper for Terraform calls. For more information, see the Setup Local Tools [README](./setup-local-tools/README.md).

## LocalStack Terraform Deploy

The tflocal deploy action allows you to deploy Terraform on LocalStack. It consists of three steps: initializing Terraform, applying the Terraform configuration, and commenting on the pull request with the status of the Terraform deployment. For more information, see the tflocal deploy [README](./tflocal-deploy/README.md).
