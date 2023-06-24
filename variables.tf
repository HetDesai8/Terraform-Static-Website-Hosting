variable "ami" {
  type    = string
  default = "ami-005f9685cb30f234b"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "het"
}

variable "az" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_public" {
  type    = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "subnet_cidr_private" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "subnet_cidr_database" {
  type    = list(string)
  default = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
}

variable "sg_name_prefix" {
  type = string
  default = "khushi-carpenter-sg"
}

variable "sg_ingress_rules" {
  default = [
  { type = "tcp", from_port = 80, to_port = 80, cidr_blocks = ["0.0.0.0/0"] },
  { type = "tcp", from_port = 22, to_port = 22, cidr_blocks = ["0.0.0.0/0"] }
]
}

variable "subnets_a" {
  type = number
  default = 0
}

variable "subnets_b" {
  type = number
  default = 1
}

variable "subnets_c" {
  type = number
  default = 2
}