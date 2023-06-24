data "aws_ami" "custom" {
  most_recent = true

  filter {
    name   = "name"
    values = ["het-ami"]
  }
}

module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name = "het-asg"

  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type   = "EC2"
  vpc_zone_identifier = module.vpc.public_subnets
  target_group_arns   = module.alb.target_group_arns
  security_groups     = [aws_security_group.sg[0].id]

  # Launch template
  launch_template_name        = "het-launchTemplate"
  launch_template_description = "Launch template"
  update_default_version      = true
  image_id      = data.aws_ami.custom.id
  instance_type = var.instance_type

  scaling_policies = {
    my-policy = {
      policy_type               = "TargetTrackingScaling"
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 80.0
      }
    }
  }

  tag_specifications = [
    {
      resource_type = "instance"
      tags = { Name = "het",
      Owner = "desaihet8@gmail.com" }
    }

  ]

  tags = {
    Name  = "het"
    Owner = "desaihet8@gmail.com"
  }
}