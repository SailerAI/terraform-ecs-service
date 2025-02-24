# terraform-ecs-service
ECS Service terraform Module 

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_listener_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule) | resource |
| [aws_alb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.service_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.service_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_security_group.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.lb_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.lb_ingress_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.lb_ingress_80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_secretsmanager_secret.secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_ssm_parameter.database_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.public_subnet_ids](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.ssm_params](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.vpc_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Lista de capacidades, como EC2 ou FARGATE | `list(string)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do cluster ECS onde o serviço será implantado. | `string` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Imagem do container a ser utilizada no serviço. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Lista de variáveis de ambiente que serão passadas para o serviço. | `list(map(string))` | n/a | yes |
| <a name="input_load_balancer_internal"></a> [load\_balancer\_internal](#input\_load\_balancer\_internal) | Se o load balancer é interno | `bool` | n/a | yes |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Tipo do load balancer | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Lista de IDs das subnets privadas onde o serviço será implantado. | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Região onde os recursos do AWS serão provisionados. | `string` | n/a | yes |
| <a name="input_scale_in_adjustment"></a> [scale\_in\_adjustment](#input\_scale\_in\_adjustment) | Quantidade de tarefas para reduzir durante uma ação de escala para baixo. | `number` | `-1` | no |
| <a name="input_scale_in_comparison_operator"></a> [scale\_in\_comparison\_operator](#input\_scale\_in\_comparison\_operator) | Operador de comparação usado para a condição de escala para baixo, como 'LessThanOrEqualToThreshold'. | `string` | `"LessThanOrEqualToThreshold"` | no |
| <a name="input_scale_in_cooldown"></a> [scale\_in\_cooldown](#input\_scale\_in\_cooldown) | Período de cooldown após uma ação de escala para baixo, em segundos. | `number` | `120` | no |
| <a name="input_scale_in_cpu_threshold"></a> [scale\_in\_cpu\_threshold](#input\_scale\_in\_cpu\_threshold) | Valor de limiar de utilização de CPU que, quando abaixo, aciona uma ação de escala para baixo, em percentual. | `number` | `30` | no |
| <a name="input_scale_in_evaluation_periods"></a> [scale\_in\_evaluation\_periods](#input\_scale\_in\_evaluation\_periods) | Número de períodos de avaliação necessários para acionar uma escala para baixo. | `number` | `3` | no |
| <a name="input_scale_in_period"></a> [scale\_in\_period](#input\_scale\_in\_period) | Duração do período de avaliação para escala para baixo, em segundos. | `number` | `120` | no |
| <a name="input_scale_in_statistic"></a> [scale\_in\_statistic](#input\_scale\_in\_statistic) | Estatística usada para a condição de escala para baixo, como 'Average' ou 'Sum'. | `string` | `"Average"` | no |
| <a name="input_scale_out_adjustment"></a> [scale\_out\_adjustment](#input\_scale\_out\_adjustment) | Quantidade de tarefas para aumentar durante uma ação de escala para cima. | `number` | `1` | no |
| <a name="input_scale_out_comparison_operator"></a> [scale\_out\_comparison\_operator](#input\_scale\_out\_comparison\_operator) | Operador de comparação usado para a condição de escala para cima, como 'GreaterThanOrEqualToThreshold'. | `string` | `"GreaterThanOrEqualToThreshold"` | no |
| <a name="input_scale_out_cooldown"></a> [scale\_out\_cooldown](#input\_scale\_out\_cooldown) | Período de cooldown após uma ação de escala para cima, em segundos. | `number` | `60` | no |
| <a name="input_scale_out_cpu_threshold"></a> [scale\_out\_cpu\_threshold](#input\_scale\_out\_cpu\_threshold) | Valor de limiar de utilização de CPU que, quando excedido, aciona uma ação de escala para cima, em percentual. | `number` | `80` | no |
| <a name="input_scale_out_evaluation_periods"></a> [scale\_out\_evaluation\_periods](#input\_scale\_out\_evaluation\_periods) | Número de períodos de avaliação necessários para acionar uma escala para cima. | `number` | `2` | no |
| <a name="input_scale_out_period"></a> [scale\_out\_period](#input\_scale\_out\_period) | Duração do período de avaliação para escala para cima, em segundos. | `number` | `60` | no |
| <a name="input_scale_out_statistic"></a> [scale\_out\_statistic](#input\_scale\_out\_statistic) | Estatística usada para a condição de escala para cima, como 'Average' ou 'Sum'. | `string` | `"Average"` | no |
| <a name="input_scale_tracking_cpu"></a> [scale\_tracking\_cpu](#input\_scale\_tracking\_cpu) | Valor de utilização de CPU alvo para o rastreamento de escala, em percentual. | `number` | `80` | no |
| <a name="input_scale_tracking_requests"></a> [scale\_tracking\_requests](#input\_scale\_tracking\_requests) | Número alvo de solicitações por segundo (TPS) para o rastreamento de escala. | `number` | `0` | no |
| <a name="input_scale_type"></a> [scale\_type](#input\_scale\_type) | Tipo de escalabilidade, como 'cpu', 'cpu\_tracking' ou 'requests\_tracking'. | `string` | `null` | no |
| <a name="input_secret_names"></a> [secret\_names](#input\_secret\_names) | Lista de nomes dos segredos no AWS Secrets Manager | `list(string)` | `[]` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Lista de nomes dos parâmetros no AWS SSM Parameter Store | <pre>list(object({<br/>    name : string<br/>    valueFrom : string<br/>  }))</pre> | `[]` | no |
| <a name="input_service_cpu"></a> [service\_cpu](#input\_service\_cpu) | Quantidade de CPU alocada para o serviço, especificada em unidades de CPU do ECS. | `number` | n/a | yes |
| <a name="input_service_healthcheck"></a> [service\_healthcheck](#input\_service\_healthcheck) | Configuração do health check do serviço, incluindo caminho e protocolo. | `map(any)` | n/a | yes |
| <a name="input_service_hosts"></a> [service\_hosts](#input\_service\_hosts) | Lista de hosts associados ao serviço, geralmente especificados para configurações DNS. | `list(string)` | n/a | yes |
| <a name="input_service_launch_type"></a> [service\_launch\_type](#input\_service\_launch\_type) | Configuração dos Launch Types pelos capacity providers disponíveis no cluster | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = number<br/>  }))</pre> | <pre>[<br/>  {<br/>    "capacity_provider": "SPOT",<br/>    "weight": 100<br/>  }<br/>]</pre> | no |
| <a name="input_service_memory"></a> [service\_memory](#input\_service\_memory) | Quantidade de memória alocada para o serviço, especificada em MB. | `number` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Nome do serviço a ser utilizado no ECS ou identificador similar. | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | Porta na qual o serviço estará acessível. | `number` | n/a | yes |
| <a name="input_service_task_count"></a> [service\_task\_count](#input\_service\_task\_count) | Número de instâncias da tarefa a serem executadas simultaneamente no serviço. | `number` | n/a | yes |
| <a name="input_service_task_execution_role"></a> [service\_task\_execution\_role](#input\_service\_task\_execution\_role) | ARN da role de execução de tarefas do ECS que o serviço usará para executar. | `string` | n/a | yes |
| <a name="input_ssm_database_subnet_ids"></a> [ssm\_database\_subnet\_ids](#input\_ssm\_database\_subnet\_ids) | IDs das subredes de banco de dados | `list(string)` | n/a | yes |
| <a name="input_ssm_parameter_names"></a> [ssm\_parameter\_names](#input\_ssm\_parameter\_names) | Lista de nomes dos parâmetros no AWS SSM Parameter Store | <pre>list(object({<br/>    name : string<br/>    valueFrom : string<br/>  }))</pre> | `[]` | no |
| <a name="input_ssm_private_subnet_ids"></a> [ssm\_private\_subnet\_ids](#input\_ssm\_private\_subnet\_ids) | IDs das subredes privadas | `list(string)` | n/a | yes |
| <a name="input_ssm_public_subnet_ids"></a> [ssm\_public\_subnet\_ids](#input\_ssm\_public\_subnet\_ids) | IDs das subredes públicas | `list(string)` | n/a | yes |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | ID do VPC | `string` | n/a | yes |
| <a name="input_task_maximum"></a> [task\_maximum](#input\_task\_maximum) | Número máximo de tarefas que podem ser executadas pelo serviço. | `number` | `10` | no |
| <a name="input_task_minimum"></a> [task\_minimum](#input\_task\_minimum) | Número mínimo de tarefas que devem ser executadas pelo serviço. | `number` | `3` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID da VPC onde os recursos relacionados ao serviço serão provisionados. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssm_database_subnet_paths"></a> [ssm\_database\_subnet\_paths](#output\_ssm\_database\_subnet\_paths) | Paths for all database subnet IDs stored in SSM Parameter Store |
| <a name="output_ssm_private_subnet_id"></a> [ssm\_private\_subnet\_id](#output\_ssm\_private\_subnet\_id) | n/a |
| <a name="output_ssm_private_subnet_paths"></a> [ssm\_private\_subnet\_paths](#output\_ssm\_private\_subnet\_paths) | Paths for all private subnet IDs stored in SSM Parameter Store |
| <a name="output_ssm_public_subnet_details"></a> [ssm\_public\_subnet\_details](#output\_ssm\_public\_subnet\_details) | List of public subnet details with paths and IDs stored in SSM Parameter Store |
| <a name="output_ssm_public_subnet_paths"></a> [ssm\_public\_subnet\_paths](#output\_ssm\_public\_subnet\_paths) | Paths for all public subnet IDs stored in SSM Parameter Store |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->