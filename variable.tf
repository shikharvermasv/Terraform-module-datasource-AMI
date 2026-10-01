variable "env" {
  default = "demo"
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

# for_each: instance name -> instance type
variable "instances" {
  type = map(string)
  default = {
    web = "t3.micro"
    app = "t3.micro"
  }
}

# count: how many identical worker nodes to spin up
variable "worker_count" {
  default = 2
}
