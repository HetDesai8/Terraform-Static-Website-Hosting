# Terraform-Static-Website-Hosting
Terraform Infrastructure for hosting a static website for global reach and scalability 


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | ~> 8.0 |
| <a name="module_asg"></a> [asg](#module\_asg) | terraform-aws-modules/autoscaling/aws | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.cf_dist](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | n/a | `string` | `"ami-005f9685cb30f234b"` | no |
| <a name="input_az"></a> [az](#input\_az) | n/a | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"het"` | no |
| <a name="input_sg_ingress_rules"></a> [sg\_ingress\_rules](#input\_sg\_ingress\_rules) | n/a | `list` | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 80,<br>    "to_port": 80,<br>    "type": "tcp"<br>  },<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 22,<br>    "to_port": 22,<br>    "type": "tcp"<br>  }<br>]</pre> | no |
| <a name="input_sg_name_prefix"></a> [sg\_name\_prefix](#input\_sg\_name\_prefix) | n/a | `string` | `"khushi-carpenter-sg"` | no |
| <a name="input_subnet_cidr_database"></a> [subnet\_cidr\_database](#input\_subnet\_cidr\_database) | n/a | `list(string)` | <pre>[<br>  "10.0.7.0/24",<br>  "10.0.8.0/24",<br>  "10.0.9.0/24"<br>]</pre> | no |
| <a name="input_subnet_cidr_private"></a> [subnet\_cidr\_private](#input\_subnet\_cidr\_private) | n/a | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_subnet_cidr_public"></a> [subnet\_cidr\_public](#input\_subnet\_cidr\_public) | n/a | `list(string)` | <pre>[<br>  "10.0.4.0/24",<br>  "10.0.5.0/24",<br>  "10.0.6.0/24"<br>]</pre> | no |
| <a name="input_subnets_a"></a> [subnets\_a](#input\_subnets\_a) | n/a | `number` | `0` | no |
| <a name="input_subnets_b"></a> [subnets\_b](#input\_subnets\_b) | n/a | `number` | `1` | no |
| <a name="input_subnets_c"></a> [subnets\_c](#input\_subnets\_c) | n/a | `number` | `2` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"10.0.0.0/16"` | no |

## Outputs

No outputs.
