## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ebs"></a> [ebs](#module\_ebs) | ./modules/storage/ebs | n/a |
| <a name="module_eip"></a> [eip](#module\_eip) | ./modules/networking/eip | n/a |
| <a name="module_sg"></a> [sg](#module\_sg) | ./modules/security/sg | n/a |
| <a name="module_spark"></a> [spark](#module\_spark) | ./modules/compute/spark | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | value of private\_key\_path | `string` | `"/home/ubuntu/ubuntu-aws-test1.pem"` | no |

## Outputs

No outputs.
