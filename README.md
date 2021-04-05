# Ansible playbook action

This action allows running an Ansible playbook. It comes with `boto3` and the AWS CLI preinstalled.

## Inputs

### `playbook`

**Required** the name of the playbook to execute.

### `arguments`

Extra arguments for the playbook.

### `working-directory`

Set a different working directory. By default the project root is used.

### `aws-access-key-id`

AWS Access Key ID.

### `aws-secret-access-key`

AWS Secret Access Key.

### `aws-session-token`

AWS Session Token

### `aws-region`

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
