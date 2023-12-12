## Setup Local Tools GitHub Action

This GitHub action, Setup Local Tools, facilitates the configuration of several local development tools in your GitHub Actions workflow.

## Inputs

| Variables | Default | Usage |
|---|---|---|
| `awslocal` | `false`| Determines whether to set up awslocal. |
| `terraform` | `false` | Determines whether to set up terraform. |
| `terraform-version` | `latest` | Defines the version of Terraform to set up. |
| `terraform-cli_config_credentials_hostname` | `app.terraform.io` | Specifies the hostname of a Terraform Cloud/Enterprise instance to place within the credentials block of the Terraform CLI configuration file. |
| `terraform-cli_config_credentials_token` | `None` | Specifies the API token for a Terraform Cloud/Enterprise instance to place within the credentials block of the Terraform CLI configuration file. |
| `terraform_wrapper` | `true` | Determines whether to install a wrapper to wrap subsequent calls of the terraform binary and expose its STDOUT, STDERR, and exit code as outputs named stdout, stderr, and exitcode respectively. |
| `tflocal` | `false` | Determines whether to set up terraform-local. |


## How to Use

Include the action in your GitHub Actions workflow with the following configuration:

```yaml
- name: Set Up Local Tools
  uses: localstack/setup-local-tools@v1
  with:
    awslocal: 'true'
    terraform: 'true'
    terraform-version: 'your-version'
    tflocal: 'true'
```
Adjust the boolean values (`true` or `false`), and `your-token` with your specific settings.

The action will conditionally run setup scripts or other actions based on your inputs:
- If awslocal is set to true, the action will run a script to set up awslocal.
- If terraform is set to true, the action will use the HashiCorp's setup-terraform GitHub action to set up Terraform with the provided version and credentials.
- If tflocal is set to true, the action will run a script to set up terraform-local.