variable "env" {
  default = "demo"
}

variable "subnet_id" {
  default = "subnet-00fd808287b760d95"
}

variable "vpc_security_group_ids" {
  default = ["sg-08392367e518fa376"]
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