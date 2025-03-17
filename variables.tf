variable "region" {
  type        = string
  description = "Region where AWS resources will be provisioned."
}
variable "environment" {

}
variable "service_name" {
  type        = string
  description = "Name of the service to be used in ECS or similar identifier."
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster where the service will be deployed."
}

#variable "vpc_id" {
#  type        = string
#  description = "VPC ID where service-related resources will be provisioned."
#}

#variable "private_subnets" {
#  type        = list(string)
#  description = "List of private subnet IDs where the service will be deployed."
#}

variable "service_port" {
  type        = number
  description = "Port on which the service will be accessible."
}

variable "service_cpu" {
  type        = number
  description = "Amount of CPU allocated for the service, specified in ECS CPU units."
}

variable "service_memory" {
  type        = number
  description = "Amount of memory allocated for the service, specified in MB."
}

#variable "service_listener" {
#  type        = string
#  description = "ARN do listener do Application Load Balancer que será usado pelo serviço."
#}

variable "service_task_execution_role" {
  type        = string
  description = "ARN of the ECS task execution role that the service will use to execute."
}

variable "service_launch_type" {
  description = "Configuration of Launch Types by capacity providers available in the cluster"
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  default = [{
    capacity_provider = "SPOT"
    weight            = 100
  }]
}

variable "service_task_count" {
  type        = number
  description = "Number of task instances to be run simultaneously in the service."
}

variable "service_hosts" {
  type        = list(string)
  description = "List of hosts associated with the service, typically specified for DNS configurations."
}

variable "service_healthcheck" {
  type        = map(any)
  description = "Service health check configuration, including path and protocol."
}

variable "environment_variables" {
  type        = list(map(string))
  description = "List of environment variables to be passed to the service."
}

variable "capabilities" {
  type        = list(string)
  description = "List of capabilities, such as EC2 or FARGATE"
}


#### Scale ###
variable "autoscaling_enabled" {
  type = bool
  description = "Enabled autoscaling to tasks"
  default = false
}
variable "scale_type" {
  type        = string
  description = "Type of scaling, such as 'cpu', 'cpu_tracking', 'memory', or 'requests_tracking'."
  default     = null
}

variable "task_minimum" {
  type        = number
  description = "Minimum number of tasks that should be running for the service."
  default     = 1
}

variable "task_maximum" {
  type        = number
  description = "Maximum number of tasks that can be running for the service."
  default     = 2
}


variable "scale_out_cpu_threshold" {
  type        = number
  description = "CPU utilization threshold value that, when exceeded, triggers a scale-out action, in percentage."
  default     = 80
}

variable "scale_out_adjustment" {
  type        = number
  description = "Number of tasks to increase during a scale-out action."
  default     = 1
}

variable "scale_out_comparison_operator" {
  type        = string
  description = "Comparison operator used for scale-out condition, such as 'GreaterThanOrEqualToThreshold'."
  default     = "GreaterThanOrEqualToThreshold"
}

variable "scale_out_statistic" {
  type        = string
  description = "Statistic used for scale-out condition, such as 'Average' or 'Sum'."
  default     = "Average"
}

variable "scale_out_period" {
  type        = number
  description = "Duration of the evaluation period for scaling out, in seconds."
  default     = 60
}

variable "scale_out_evaluation_periods" {
  type        = number
  description = "Number of evaluation periods required to trigger a scale-out action."
  default     = 2
}

variable "scale_out_cooldown" {
  type        = number
  description = "Período de cooldown após uma ação de escala para cima, em segundos."
  default     = 60
}

variable "scale_in_cpu_threshold" {
  type        = number
  description = "CPU utilization threshold value that, when below, triggers a scale-in action, in percentage."
  default     = 30
}

variable "scale_in_adjustment" {
  type        = number
  description = "Quantidade de tarefas para reduzir durante uma ação de escala para baixo."
  default     = -1
}

variable "scale_in_comparison_operator" {
  type        = string
  description = "Comparison operator used for scale-in condition, such as 'LessThanOrEqualToThreshold'."
  default     = "LessThanOrEqualToThreshold"
}

variable "scale_in_statistic" {
  type        = string
  description = "Statistic used for scale-in condition, such as 'Average' or 'Sum'."
  default     = "Average"
}

variable "scale_in_period" {
  type        = number
  description = "Duration of the evaluation period for scaling in, in seconds."
  default     = 120
}

variable "scale_in_evaluation_periods" {
  type        = number
  description = "Number of evaluation periods required to trigger a scale-in action."
  default     = 3
}

variable "scale_in_cooldown" {
  type        = number
  description = "Período de cooldown após uma ação de escala para baixo, em segundos."
  default     = 120
}

variable "scale_tracking_cpu" {
  type        = number
  description = "Valor de utilização de CPU alvo para o rastreamento de escala, em percentual."
  default     = 80
}

variable "scale_out_memory_threshold" {
  type = number
  description = "Memory utilization threshold value that, when below, triggers a scale-out action, in percentage."
  default = 80 
}
variable "scale_in_memory_threshold" {
  type = number
  description = "Memory utilization threshold value that, when below, triggers a scale-in action, in percentage."
  default = 30
}
variable "scale_tracking_memory" {
  type        = number
  description = "Valor de utilização de memory alvo para o rastreamento de escala, em percentual."
  default     = 80
}

#variable "alb_arn" {
#  type        = string
#  description = "ARN do Application Load Balancer usado para rastreamento de solicitações."
#  default     = null
#}
#
variable "scale_tracking_requests" {
  type        = number
  description = "Número alvo de solicitações por segundo (TPS) para o rastreamento de escala."
  default     = 0
}

variable "container_image" {
  type        = string
  description = "Container image to be used in the service."
}

## Variables Load Balancer

variable "load_balancer_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
}

variable "load_balancer_type" {
  description = "Type of load balancer"
  type        = string
}

variable "ssm_vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ssm_public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
  sensitive   = false
}

variable "ssm_private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "ssm_database_subnet_ids" {
  description = "Database subnet IDs"
  type        = list(string)
  default = []
}

## Variables to use secrets and ssm parameters store at task definition------
variable "secret_names" {
  description = "List of secret names in AWS Secrets Manager"
  type = list(string)
  default = []
}

variable "ssm_parameter_names" {
  description = "List of parameter names in AWS SSM Parameter Store"
  type = list(object({
    name : string
    valueFrom : string
  }))
  default = []
}
variable "secrets" {
    description = "List of parameter names in AWS SSM Parameter Store"
  type = list(object({
    name : string
    valueFrom : string
  }))
  default = []
}

variable "certificate_arn" {
  type = string
}