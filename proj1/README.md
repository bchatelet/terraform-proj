## Requirements

| Name                                 | Version  |
| ------------------------------------ | -------- |
| [terraform](#requirement\_terraform) | >= 1.0.0 |
| [aws](#requirement\_aws)             | ~> 4.0   |

## Providers

No providers.

## Modules

| Name                    | Source                   | Version |
| ----------------------- | ------------------------ | ------- |
| [ebs](#module\_ebs)     | ./modules/storage/ebs    | n/a     |
| [eip](#module\_eip)     | ./modules/networking/eip | n/a     |
| [sg](#module\_sg)       | ./modules/security/sg    | n/a     |
| [spark](#module\_spark) | ./modules/compute/spark  | n/a     |

## Resources

No resources.

## Inputs

| Name                                             | Description                 | Type     | Default                               | Required |
| ------------------------------------------------ | --------------------------- | -------- | ------------------------------------- |:--------:|
| [private\_key\_path](#input\_private\_key\_path) | value of private\_key\_path | `string` | `"/home/ubuntu/ubuntu-aws-test1.pem"` | no       |

## Outputs

No outputs.
