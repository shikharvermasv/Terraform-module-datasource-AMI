# Terraform AMI Data Source

A hands-on Terraform learning project demonstrating how AWS data sources can dynamically retrieve an Amazon Linux AMI and use it for EC2 provisioning.

The project also demonstrates Terraform's `for_each` and `count` meta-arguments for creating multiple EC2 instances.

## What this project demonstrates

### AWS AMI Data Source

The configuration uses the AWS AMI data source to find the most recent matching Amazon Linux 2 AMI:

```hcl
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
}
```

This avoids hardcoding an AMI ID into the EC2 resource configuration.

### `for_each`

The `for_each` meta-argument creates named instances from a map:

```hcl
instances = {
  web = "t3.micro"
  app = "t3.micro"
}
```

Each instance receives its own key and instance type.

### `count`

The `count` meta-argument is used to create a configurable number of identical worker instances:

```hcl
worker_count = 2
```

### Locals

Local values are used to create common naming and tagging information.

### Outputs

The configuration exposes:

* AMI ID used
* Named instance IDs
* Named instance private IPs
* Worker instance IDs
* Worker instance private IPs

## Architecture

```text
                    Terraform
                        │
                        ▼
              AWS AMI Data Source
                        │
                        ▼
               Latest matching AMI
                        │
              ┌─────────┴─────────┐
              ▼                   ▼
          for_each              count
              │                   │
              ▼                   ▼
        Named EC2s           Worker EC2s
        web / app             worker-0...
```

## Terraform Concepts Practiced

This repository was created as part of hands-on Terraform and AWS learning.

Concepts covered:

* AWS data sources
* AMI discovery
* `most_recent`
* Resource meta-arguments
* `for_each`
* `count`
* Maps
* Lists
* Local values
* `merge()`
* Terraform variables
* Terraform outputs
* Dynamic EC2 provisioning
* AWS provider configuration

## Repository Structure

```text
Terraform-module-datasource-AMI/
├── data.tf
├── local.tf
├── main.tf
├── output.tf
├── provider.tf
└── variable.tf
```

## Getting Started

### Prerequisites

* Terraform
* AWS CLI
* An AWS account
* AWS credentials configured locally
* An existing VPC subnet
* An existing security group

### Configure your AWS resources

Provide your own subnet and security group IDs through Terraform variables.

Example:

```hcl
subnet_id = "YOUR_SUBNET_ID"

vpc_security_group_ids = [
  "YOUR_SECURITY_GROUP_ID"
]
```

### Initialize Terraform

```bash
terraform init
```

### Review the plan

```bash
terraform plan
```

### Apply the configuration

```bash
terraform apply
```

### View outputs

```bash
terraform output
```

### Destroy the resources

```bash
terraform destroy
```

## Learning Context

This repository represents a hands-on Terraform exercise focused on understanding AWS data sources and Terraform resource iteration.

It was created while learning Terraform and AWS infrastructure provisioning.

For a more complete implementation of AWS infrastructure and container deployment, see:

**[Infrastructure Provisioning & Container Deployment Platform](https://github.com/shikharvermasv/cloud-infrastructure-provisioner)**

## Note

This is a learning project and is not intended to represent a production-ready infrastructure architecture.
