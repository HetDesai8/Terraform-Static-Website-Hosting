# Terraform-Static-Website-Hosting
Terraform Infrastructure for hosting a static website for global reach and scalability 

TASK Defination
1) Create a vpc with Internet Gateway, a set of public and private subnets in 3 AZ's
2) Define Security Groups for all the 3 EC2 instances
3) Setup 3 ec2 instances on public subnet
4) Add 2GB EBS volumn per instance
5) Ensure the default index.html page is accessible and should show the IP address of the instance serving request
6) Setup an Application Load Balancer to distribute traffic to all the 3 instance servers in a round-robin fashion which means that request to the application load balancer on port 80 will get redirected to all the 3 different servers.
7) validate website is being served over ALB public DNS.

Optimization 
1) Create an AMI of the EC2 instance
2) Modify the Terraform code to create launch configuration/template with the AMI created in the above step with the same instance specification
3) Modify the Terraform code to create Auto Scaling Group (ASG) with the above launch template to scale in when the CPU utilizaton if > 80% and scale out when CPU < 80%

Further optimization 
1) Create a CloudFront Distribution -> Web-Distribution and point to ALB Public endpoint


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
