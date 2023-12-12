## LocalStack terraform deploy GitHub Action

This GitHub action, tflocal deploy, allows you to deploy Terraform on LocalStack.

## Inputs
| Variables | Default | Usage |
|---|---|---|
| `path` | `terraform`| The path to your Terraform directory. By default, this is set to terraform, but it is not required. |
| `github-token` | `None` | Your GitHub token. This is a required input for the action. |

## How to Use

In your GitHub Actions workflow, you can use this action with the following step:

```yaml
- name: Deploy Terraform on LocalStack
  uses: localstack/tflocal-deploy@v1
  with:
    path: 'path-to-your-terraform'
    github-token: ${{ secrets.GITHUB_TOKEN }}
```
Replace `path-to-your-terraform` with the path to your Terraform directory if it is not `terraform` folder.

The action consists of three steps,

- `tf-init` It initializes Terraform in the directory specified in the path input.
- `tf-deploy` It applies the Terraform configuration. If any error occurs during this step, the action will continue to the next step.
- `pr-comment` If the event triggering the workflow is a pull request, this step will comment on the pull request with the status of the Terraform deployment. The comment will include a link to more information about the LocalStack GitHub action.
