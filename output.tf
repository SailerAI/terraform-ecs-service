output "vpc_id" {
  value     = data.aws_ssm_parameter.vpc_id.value
  sensitive = true
}

# output "load_balancer_arn" {
#   value     = var.create_load_balancer ? aws_lb.main[0].arn : null # Condicional
#   sensitive = true
# }

# output "load_balancer_listener_http_arn" {
#   value     = var.create_load_balancer ? aws_lb_listener.http[0].arn : null # Condicional
#   sensitive = true
# }


output "ssm_public_subnet_paths" {
  value = [
    for i in range(length(data.aws_ssm_parameter.public_subnet_ids)) : data.aws_ssm_parameter.public_subnet_ids[i].name
  ]
  description = "Paths for all public subnet IDs stored in SSM Parameter Store"
  sensitive   = true
}

# output "load_balancer_dns" {
#   value     = var.create_load_balancer ? aws_lb.main[0].dns_name : null # Condicional
#   sensitive = true
# }

output "ssm_private_subnet_paths" {
  value = [
    for i in range(length(data.aws_ssm_parameter.private_subnet_ids)) : data.aws_ssm_parameter.private_subnet_ids[i].name
  ]
  description = "Paths for all private subnet IDs stored in SSM Parameter Store"
  sensitive   = true
}


output "ssm_database_subnet_paths" {
  value = [
    for i in range(length(data.aws_ssm_parameter.database_subnet_ids)) : data.aws_ssm_parameter.database_subnet_ids[i].name
  ]
  description = "Paths for all database subnet IDs stored in SSM Parameter Store"
  sensitive   = true
}

output "ssm_private_subnet_id" {
  value     = data.aws_ssm_parameter.private_subnet_ids[*].value
  sensitive = true
}

output "ssm_public_subnet_details" {
  value = [
    for param in data.aws_ssm_parameter.public_subnet_ids : {
      path = param.name
      id   = param.value
    }
  ]
  description = "List of public subnet details with paths and IDs stored in SSM Parameter Store"
  sensitive   = true
}

