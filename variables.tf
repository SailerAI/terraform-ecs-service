variable "region" {
  type        = string
  description = "Região onde os recursos do AWS serão provisionados."
}
variable "environment" {

}
variable "service_name" {
  type        = string
  description = "Nome do serviço a ser utilizado no ECS ou identificador similar."
}

variable "cluster_name" {
  type        = string
  description = "Nome do cluster ECS onde o serviço será implantado."
}

#variable "vpc_id" {
#  type        = string
#  description = "ID da VPC onde os recursos relacionados ao serviço serão provisionados."
#}

#variable "private_subnets" {
#  type        = list(string)
#  description = "Lista de IDs das subnets privadas onde o serviço será implantado."
#}

variable "service_port" {
  type        = number
  description = "Porta na qual o serviço estará acessível."
}

variable "service_cpu" {
  type        = number
  description = "Quantidade de CPU alocada para o serviço, especificada em unidades de CPU do ECS."
}

variable "service_memory" {
  type        = number
  description = "Quantidade de memória alocada para o serviço, especificada em MB."
}

#variable "service_listener" {
#  type        = string
#  description = "ARN do listener do Application Load Balancer que será usado pelo serviço."
#}

variable "service_task_execution_role" {
  type        = string
  description = "ARN da role de execução de tarefas do ECS que o serviço usará para executar."
}

variable "service_launch_type" {
  description = "Configuração dos Launch Types pelos capacity providers disponíveis no cluster"
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
  description = "Número de instâncias da tarefa a serem executadas simultaneamente no serviço."
}

variable "service_hosts" {
  type        = list(string)
  description = "Lista de hosts associados ao serviço, geralmente especificados para configurações DNS."
}

variable "service_healthcheck" {
  type        = map(any)
  description = "Configuração do health check do serviço, incluindo caminho e protocolo."
}

variable "environment_variables" {
  type        = list(map(string))
  description = "Lista de variáveis de ambiente que serão passadas para o serviço."
}

variable "capabilities" {
  type        = list(string)
  description = "Lista de capacidades, como EC2 ou FARGATE"
}

variable "scale_type" {
  type        = string
  description = "Tipo de escalabilidade, como 'cpu', 'cpu_tracking' ou 'requests_tracking'."
  default     = null
}

variable "task_minimum" {
  type        = number
  description = "Número mínimo de tarefas que devem ser executadas pelo serviço."
  default     = 3
}

variable "task_maximum" {
  type        = number
  description = "Número máximo de tarefas que podem ser executadas pelo serviço."
  default     = 10
}


variable "scale_out_cpu_threshold" {
  type        = number
  description = "Valor de limiar de utilização de CPU que, quando excedido, aciona uma ação de escala para cima, em percentual."
  default     = 80
}

variable "scale_out_adjustment" {
  type        = number
  description = "Quantidade de tarefas para aumentar durante uma ação de escala para cima."
  default     = 1
}

variable "scale_out_comparison_operator" {
  type        = string
  description = "Operador de comparação usado para a condição de escala para cima, como 'GreaterThanOrEqualToThreshold'."
  default     = "GreaterThanOrEqualToThreshold"
}

variable "scale_out_statistic" {
  type        = string
  description = "Estatística usada para a condição de escala para cima, como 'Average' ou 'Sum'."
  default     = "Average"
}

variable "scale_out_period" {
  type        = number
  description = "Duração do período de avaliação para escala para cima, em segundos."
  default     = 60
}

variable "scale_out_evaluation_periods" {
  type        = number
  description = "Número de períodos de avaliação necessários para acionar uma escala para cima."
  default     = 2
}

variable "scale_out_cooldown" {
  type        = number
  description = "Período de cooldown após uma ação de escala para cima, em segundos."
  default     = 60
}

variable "scale_in_cpu_threshold" {
  type        = number
  description = "Valor de limiar de utilização de CPU que, quando abaixo, aciona uma ação de escala para baixo, em percentual."
  default     = 30
}

variable "scale_in_adjustment" {
  type        = number
  description = "Quantidade de tarefas para reduzir durante uma ação de escala para baixo."
  default     = -1
}

variable "scale_in_comparison_operator" {
  type        = string
  description = "Operador de comparação usado para a condição de escala para baixo, como 'LessThanOrEqualToThreshold'."
  default     = "LessThanOrEqualToThreshold"
}

variable "scale_in_statistic" {
  type        = string
  description = "Estatística usada para a condição de escala para baixo, como 'Average' ou 'Sum'."
  default     = "Average"
}

variable "scale_in_period" {
  type        = number
  description = "Duração do período de avaliação para escala para baixo, em segundos."
  default     = 120
}

variable "scale_in_evaluation_periods" {
  type        = number
  description = "Número de períodos de avaliação necessários para acionar uma escala para baixo."
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
  description = "Imagem do container a ser utilizada no serviço."
}

## Variables Load Balancer

variable "load_balancer_internal" {
  description = "Se o load balancer é interno"
  type        = bool
}

variable "load_balancer_type" {
  description = "Tipo do load balancer"
  type        = string
}

variable "ssm_vpc_id" {
  description = "ID do VPC"
  type        = string
}

variable "ssm_public_subnet_ids" {
  description = "IDs das subredes públicas"
  type        = list(string)
  sensitive   = false
}

variable "ssm_private_subnet_ids" {
  description = "IDs das subredes privadas"
  type        = list(string)
}

variable "ssm_database_subnet_ids" {
  description = "IDs das subredes de banco de dados"
  type        = list(string)
  default = [  ]
}

## Variables to use secrets ans ssm parameters store at task definition------
variable "secret_names" {
  description = "Lista de nomes dos segredos no AWS Secrets Manager"
  type = list(string)
  default = []
}

variable "ssm_parameter_names" {
  description = "Lista de nomes dos parâmetros no AWS SSM Parameter Store"
  type = list(object({
    name : string
    valueFrom : string
  }))
  default = []
}
variable "secrets" {
    description = "Lista de nomes dos parâmetros no AWS SSM Parameter Store"
  type = list(object({
    name : string
    valueFrom : string
  }))
  default = []
}
