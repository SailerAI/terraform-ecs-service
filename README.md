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
| [aws_appautoscaling_policy.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.memory_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.memory_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.target_tracking_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.target_tracking_memory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.target_tracking_requests](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.memory_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
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
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Enabled autoscaling to tasks | `bool` | `false` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | List of capabilities, such as EC2 or FARGATE | `list(string)` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS cluster where the service will be deployed. | `string` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Container image to be used in the service. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | List of environment variables to be passed to the service. | `list(map(string))` | n/a | yes |
| <a name="input_load_balancer_internal"></a> [load\_balancer\_internal](#input\_load\_balancer\_internal) | Whether the load balancer is internal | `bool` | n/a | yes |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Type of load balancer | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where AWS resources will be provisioned. | `string` | n/a | yes |
| <a name="input_scale_in_adjustment"></a> [scale\_in\_adjustment](#input\_scale\_in\_adjustment) | Number of tasks to reduce during a scale-in action. | `number` | `-1` | no |
| <a name="input_scale_in_comparison_operator"></a> [scale\_in\_comparison\_operator](#input\_scale\_in\_comparison\_operator) | Comparison operator used for scale-in condition, such as 'LessThanOrEqualToThreshold'. | `string` | `"LessThanOrEqualToThreshold"` | no |
| <a name="input_scale_in_cooldown"></a> [scale\_in\_cooldown](#input\_scale\_in\_cooldown) | Cooldown period after a scale-in action, in seconds. | `number` | `120` | no |
| <a name="input_scale_in_cpu_threshold"></a> [scale\_in\_cpu\_threshold](#input\_scale\_in\_cpu\_threshold) | CPU utilization threshold value that, when below, triggers a scale-in action, in percentage. | `number` | `30` | no |
| <a name="input_scale_in_evaluation_periods"></a> [scale\_in\_evaluation\_periods](#input\_scale\_in\_evaluation\_periods) | Number of evaluation periods required to trigger a scale-in action. | `number` | `3` | no |
| <a name="input_scale_in_memory_threshold"></a> [scale\_in\_memory\_threshold](#input\_scale\_in\_memory\_threshold) | Memory utilization threshold value that, when below, triggers a scale-in action, in percentage. | `number` | `30` | no |
| <a name="input_scale_in_period"></a> [scale\_in\_period](#input\_scale\_in\_period) | Duration of the evaluation period for scaling in, in seconds. | `number` | `120` | no |
| <a name="input_scale_in_statistic"></a> [scale\_in\_statistic](#input\_scale\_in\_statistic) | Statistic used for scale-in condition, such as 'Average' or 'Sum'. | `string` | `"Average"` | no |
| <a name="input_scale_out_adjustment"></a> [scale\_out\_adjustment](#input\_scale\_out\_adjustment) | Number of tasks to increase during a scale-out action. | `number` | `1` | no |
| <a name="input_scale_out_comparison_operator"></a> [scale\_out\_comparison\_operator](#input\_scale\_out\_comparison\_operator) | Comparison operator used for scale-out condition, such as 'GreaterThanOrEqualToThreshold'. | `string` | `"GreaterThanOrEqualToThreshold"` | no |
| <a name="input_scale_out_cooldown"></a> [scale\_out\_cooldown](#input\_scale\_out\_cooldown) | Cooldown period after a scale-out action, in seconds. | `number` | `60` | no |
| <a name="input_scale_out_cpu_threshold"></a> [scale\_out\_cpu\_threshold](#input\_scale\_out\_cpu\_threshold) | CPU utilization threshold value that, when exceeded, triggers a scale-out action, in percentage. | `number` | `80` | no |
| <a name="input_scale_out_evaluation_periods"></a> [scale\_out\_evaluation\_periods](#input\_scale\_out\_evaluation\_periods) | Number of evaluation periods required to trigger a scale-out action. | `number` | `2` | no |
| <a name="input_scale_out_memory_threshold"></a> [scale\_out\_memory\_threshold](#input\_scale\_out\_memory\_threshold) | Memory utilization threshold value that, when below, triggers a scale-out action, in percentage. | `number` | `80` | no |
| <a name="input_scale_out_period"></a> [scale\_out\_period](#input\_scale\_out\_period) | Duration of the evaluation period for scaling out, in seconds. | `number` | `60` | no |
| <a name="input_scale_out_statistic"></a> [scale\_out\_statistic](#input\_scale\_out\_statistic) | Statistic used for scale-out condition, such as 'Average' or 'Sum'. | `string` | `"Average"` | no |
| <a name="input_scale_tracking_cpu"></a> [scale\_tracking\_cpu](#input\_scale\_tracking\_cpu) | Target CPU utilization value for scaling tracking, in percentage. | `number` | `80` | no |
| <a name="input_scale_tracking_memory"></a> [scale\_tracking\_memory](#input\_scale\_tracking\_memory) | Target memory utilization value for scaling tracking, in percentage. | `number` | `80` | no |
| <a name="input_scale_tracking_requests"></a> [scale\_tracking\_requests](#input\_scale\_tracking\_requests) | Número alvo de solicitações por segundo (TPS) para o rastreamento de escala. | `number` | `1` | no |
| <a name="input_scale_type"></a> [scale\_type](#input\_scale\_type) | Type of scaling, such as 'cpu', 'cpu\_tracking', 'memory', or 'requests\_tracking'. | `string` | `null` | no |
| <a name="input_secret_names"></a> [secret\_names](#input\_secret\_names) | List of secret names in AWS Secrets Manager | `list(string)` | `[]` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | List of parameter names in AWS SSM Parameter Store | <pre>list(object({<br/>    name : string<br/>    valueFrom : string<br/>  }))</pre> | `[]` | no |
| <a name="input_service_cpu"></a> [service\_cpu](#input\_service\_cpu) | Amount of CPU allocated for the service, specified in ECS CPU units. | `number` | n/a | yes |
| <a name="input_service_healthcheck"></a> [service\_healthcheck](#input\_service\_healthcheck) | Service health check configuration, including path and protocol. | `map(any)` | n/a | yes |
| <a name="input_service_hosts"></a> [service\_hosts](#input\_service\_hosts) | List of hosts associated with the service, typically specified for DNS configurations. | `list(string)` | n/a | yes |
| <a name="input_service_launch_type"></a> [service\_launch\_type](#input\_service\_launch\_type) | Configuration of Launch Types by capacity providers available in the cluster | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = number<br/>  }))</pre> | <pre>[<br/>  {<br/>    "capacity_provider": "SPOT",<br/>    "weight": 100<br/>  }<br/>]</pre> | no |
| <a name="input_service_memory"></a> [service\_memory](#input\_service\_memory) | Amount of memory allocated for the service, specified in MB. | `number` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service to be used in ECS or similar identifier. | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | Port on which the service will be accessible. | `number` | n/a | yes |
| <a name="input_service_task_count"></a> [service\_task\_count](#input\_service\_task\_count) | Number of task instances to be run simultaneously in the service. | `number` | n/a | yes |
| <a name="input_service_task_execution_role"></a> [service\_task\_execution\_role](#input\_service\_task\_execution\_role) | ARN of the ECS task execution role that the service will use to execute. | `string` | n/a | yes |
| <a name="input_ssm_database_subnet_ids"></a> [ssm\_database\_subnet\_ids](#input\_ssm\_database\_subnet\_ids) | Database subnet IDs | `list(string)` | `[]` | no |
| <a name="input_ssm_parameter_names"></a> [ssm\_parameter\_names](#input\_ssm\_parameter\_names) | List of parameter names in AWS SSM Parameter Store | <pre>list(object({<br/>    name : string<br/>    valueFrom : string<br/>  }))</pre> | `[]` | no |
| <a name="input_ssm_private_subnet_ids"></a> [ssm\_private\_subnet\_ids](#input\_ssm\_private\_subnet\_ids) | Private subnet IDs | `list(string)` | n/a | yes |
| <a name="input_ssm_public_subnet_ids"></a> [ssm\_public\_subnet\_ids](#input\_ssm\_public\_subnet\_ids) | Public subnet IDs | `list(string)` | n/a | yes |
| <a name="input_ssm_vpc_id"></a> [ssm\_vpc\_id](#input\_ssm\_vpc\_id) | VPC ID | `string` | n/a | yes |
| <a name="input_task_maximum"></a> [task\_maximum](#input\_task\_maximum) | Maximum number of tasks that can be running for the service. | `number` | `2` | no |
| <a name="input_task_minimum"></a> [task\_minimum](#input\_task\_minimum) | Minimum number of tasks that should be running for the service. | `number` | `1` | no |

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