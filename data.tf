#data "aws_alb" "main" {
#  arn = var.alb_arn
#}

data "aws_ssm_parameter" "vpc_id" {
  name = var.ssm_vpc_id
}

data "aws_ssm_parameter" "public_subnet_ids" {
  count = length(var.ssm_public_subnet_ids)
  name  = element(var.ssm_public_subnet_ids, count.index)
}

data "aws_ssm_parameter" "private_subnet_ids" {
  count = length(var.ssm_private_subnet_ids)
  name  = element(var.ssm_private_subnet_ids, count.index)
}

data "aws_ssm_parameter" "database_subnet_ids" {
  count = length(var.ssm_database_subnet_ids)
  name  = element(var.ssm_database_subnet_ids, count.index)
}


## Get ARNs on Secrets Managers

data "aws_secretsmanager_secret" "secrets" {
  for_each = toset(format("/%s/%s/%s", var.environment, var.service_name, var.secret_names))
  name     = each.value
}

# Get ARNs on AWS SSM Parameter Store
data "aws_ssm_parameter" "ssm_params" {
  for_each = toset(var.ssm_parameter_names)
  name     = each.value
}