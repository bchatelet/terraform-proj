## Automatic deployment for MongoDb with  Terraform on an EC2 server

## Modules

| Name    | Source                      | Version |
| ------- | --------------------------- | ------- |
| ebs     | ./modules/storage/ebs       | n/a     |
| eip     | ./modules/networking/eip    | n/a     |
| mongodb | ./modules/databases/mongodb | n/a     |
| sg      | ./modules/security/sg       | n/a     |

## Inputs (in variables.tf)

| Name             | Description                                                    | Type     | Default | Required |
| ---------------- | -------------------------------------------------------------- | -------- | ------- |:--------:|
| private_key_path | Local private key path. The public key must be declared on Aws | `string` | `       | yes      |
| region           | Region used on Aws account                                     | `string` |         | yes      |
| key_name         | key name                                                       | `string` |         | yes      |
| instance_type    | Type of instance                                               | `string` |         | yes      |

## Outputs

From each module, to export values.
