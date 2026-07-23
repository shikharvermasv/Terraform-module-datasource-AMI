output "ami_id_used" {
  value = data.aws_ami.amazon_linux.id
}

output "named_instance_ids" {
  value = { for k, v in aws_instance.named : k => v.id }
}

output "named_instance_private_ips" {
  value = { for k, v in aws_instance.named : k => v.private_ip }
}

output "worker_instance_ids" {
  value = aws_instance.worker[*].id
}

output "worker_private_ips" {
  value = aws_instance.worker[*].private_ip
}