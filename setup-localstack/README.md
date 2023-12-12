## Setup LocalStack GitHub Action

This GitHub action, Setup LocalStack, allows you to set up LocalStack in your GitHub Actions workflow.

## Inputs

| Variables | Default | Usage |
|---|---|---|
| `image-tag` | `latest`|The LocalStack Docker image tag you want to use. By default, this is set to latest, but you must specify a value. |
| `use-pro` | `false` | A boolean flag indicating whether to use LocalStack Pro. This feature requires a valid API key. |
| `configuration` | ` ` | Any configuration variables you want to use for LocalStack. For ex. `DEFAULT_REGION=us-east-1 DEBUG=1` |

## How to Use

In your GitHub Actions workflow, you can use this action with the following step:

```yaml
- name: Set Up LocalStack
  uses: localstack/setup-localstack@v1
  with:
    image-tag: 'your-image-tag'
    use-pro: 'true-or-false'
    configuration: 'your-configuration'
  env:
    LOCALSTACK_API_KEY: ${{ secrets.LOCALSTACK_API_KEY }}
```
Replace `your-image-tag` with the LocalStack Docker image tag you want to use, `true` or `false` with whether you want to use LocalStack Pro (if true, make sure you have a valid API key), and `your-configuration` with any LocalStack configuration variables you want to use with space separated key-value pairs. For example, `DEFAULT_REGION=us-east-1 DEBUG=1`.


The action consists of a single step,
- `setup-localstack` that runs the setup-localstack.sh script to set up LocalStack with the specified inputs.