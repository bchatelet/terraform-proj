## Requirements

| Name                                 | Version  |
| ------------------------------------ | -------- |
| [terraform](#requirement\_terraform) | >= 1.0.0 |
| aws                                  | ~> 4.0   |

## Providers

No providers.

## Modules

| Name                | Source                   | Version |
| ------------------- | ------------------------ | ------- |
| [eip](#module\_eip) | ./modules/networking/eip | n/a     |
| [emr](#module\_emr) | ./modules/emr            | n/a     |
| iam                 | ./modules/iam            | n/a     |
| [s3](#module\_s3)   | ./modules/s3             | n/a     |
| security            | ./modules/security       | n/a     |
| sg                  | ./modules/security/sg    | n/a     |
| vpc                 | ./modules/vpc            | n/a     |

## Resources

No resources.

## Inputs

| Name                                                     | Description | Type           | Default                                                       | Required |
| -------------------------------------------------------- | ----------- | -------------- | ------------------------------------------------------------- |:--------:|
| [applications](#input\_applications)                     | n/a         | `list(string)` | <pre>[<br>  "Hadoop",<br>  "Ganglia",<br>  "Spark"<br>]</pre> | no       |
| core\_ebs\_size                                          | n/a         | `number`       | `"2"`                                                         |          |
| [core\_instance\_count](#input\_core\_instance\_count)   | n/a         | `number`       | `"1"`                                                         | no       |
| [core\_instance\_type](#input\_core\_instance\_type)     | n/a         | `string`       | `"m4.xlarge"`                                                 | no       |
| [ingress\_cidr\_blocks](#input\_ingress\_cidr\_blocks)   | n/a         | `string`       | `"1"`                                                         | no       |
| [key\_name](#input\_key\_name)                           | n/a         | `string`       | `"aws-ubuntu-test1"`                                          | no       |
| [master\_ebs\_size](#input\_master\_ebs\_size)           | n/a         | `number`       | `"2"`                                                         | no       |
| [master\_instance\_type](#input\_master\_instance\_type) | n/a         | `string`       | `"m4.large"`                                                  | no       |
| name                                                     | n/a         | `string`       | `"spark-cluster"`                                             | no       |
| [region](#input\_region)                                 | n/a         | `string`       | `"eu-west-3"`                                                 | no       |

## Outputs

| Name                                                | Description |
| --------------------------------------------------- | ----------- |
| [id](#output\_id)                                   | n/a         |
| [master\_public\_dns](#output\_master\_public\_dns) | n/a         |
| [name](#output\_name)                               | n/a         |
