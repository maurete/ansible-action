# Ansible playbook action

This action allows running an Ansible playbook. It comes with `boto3` and the AWS CLI preinstalled.

## Inputs

### `playbook`

**Required** the name of the playbook to execute.

### `arguments`

Extra arguments for the playbook.

### `working_directory`

Set a different working directory. By default the project root is used.

### `aws_access_key_id`

AWS Access Key ID.

### `aws_secret_access_key`

AWS Secret Access Key.

### `aws_session_token`

AWS Session Token

### `aws_region`

AWS Region, e.g. us-east-1

## Outputs

### `command`

The actual ansible-playbook command to be executed.

## Example usage

```yaml
uses: maurete/ansible-action@main
with:
  playbook: playbook.yml
```
