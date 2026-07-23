# --- for_each: one instance per entry in var.instances map ---
resource "aws_instance" "named" {
  for_each = var.instances

  ami           = data.aws_ami.amazon_linux.id
  instance_type = each.value
  subnet_id     = var.subnet_id

  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = false

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-${each.key}"
  })
}

# --- count: N identical worker instances ---
resource "aws_instance" "worker" {
  count = var.worker_count

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id

  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = false

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-worker-${count.index}"
  })
}

# #terraform block
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~>6.0"
#     }
#   }
# }

# # provider block
# provider "aws" {

#   region = "us-west-2"
#   default_tags {
#     tags = {
#       Name        = "2392829"
#       cco_trainee = "2392829@cognizant.com"
#     }
#   }

# }

# #data source
# data "aws_ami" "ubuntu" {
#     most_recent = true

#     filter {
#         name = "name"
#         values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#     }

#     filter {
#       name = "virtualization-type"
#       values = ["hvm"]
#     }

#     owners = ["099720109477"]
# }

# data "aws_caller_identity" "current_aws" {

# }



# #resource block
# resource "aws_vpc" "demo_vpc" {
#     cidr_block = var.vpc_cidr

#     tags = {
#         Name = "demo_vpc"
#     }
# }

# resource "aws_subnet" "public_subnet" {
#     vpc_id                  = aws_vpc.demo_vpc.id
#     cidr_block              = var.public_subnet_cidr
#     map_public_ip_on_launch = false

#     tags = {
#         Name = "demo_public_subnet"
#     }
# }

# resource "aws_subnet" "private_subnet" {
#     vpc_id     = aws_vpc.demo_vpc.id
#     cidr_block = var.private_subnet_cidr

#     tags = {
#         Name = "demo_private_subnet"
#     }
# }

# resource "aws_internet_gateway" "igw" {
#     vpc_id = aws_vpc.demo_vpc.id
#     tags = {
#         Name = "demo-igw"
#     }
# }

# resource "aws_route_table" "public_rt" {
#     vpc_id = aws_vpc.demo_vpc.id

#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.igw.id
#     }

#     tags = {
#         Name = "demo_pub_rt"
#     }
# }

# resource "aws_route_table_association" "association" {
#     subnet_id      = aws_subnet.public_subnet.id
#     route_table_id = aws_route_table.public_rt.id
# }



# resource "aws_security_group" "demo-sg" {
#     name   = "demo_sg"
#     vpc_id = aws_vpc.demo_vpc.id

#     tags = {
#         Name = "demo_sg"
#     }
# }



# #variables
# variable "vpc_cidr" {
#     default = "10.0.0.0/16"
# }

# variable "public_subnet_cidr" {
#     default = "10.0.1.0/24"
# }

# variable "private_subnet_cidr" {
#     default = "10.0.2.0/24"
# }

# #output
# output "aws_caller_identity" {
#     value = data.aws_caller_identity.current_aws.id
# }

# output "ami" {
#     value = data.aws_ami.ubuntu.id
# }