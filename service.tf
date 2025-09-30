resource "aws_ecs_service" "main" {
  name    = var.service_name
  cluster = var.cluster_name

  task_definition = aws_ecs_task_definition.main.arn

  desired_count = var.service_task_count

  enable_execute_command             = true
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  dynamic "capacity_provider_strategy" {
    for_each = var.service_launch_type

    content {
      capacity_provider = capacity_provider_strategy.value.capacity_provider
      weight            = capacity_provider_strategy.value.weight
    }
  }

  dynamic "ordered_placement_strategy" {
    for_each = var.service_launch_type == "EC2" ? [1] : []
    content {
      type  = "spread"
      field = "attribute:ecs.availability-zone"
    }
  }

  network_configuration {
    security_groups = [
      aws_security_group.main.id
    ]

    subnets          = data.aws_ssm_parameter.private_subnet_ids[*].value
    assign_public_ip = false
  }

  dynamic "load_balancer" {
    for_each = aws_alb_listener_rule.main != null ? [1] : []
    content {
      target_group_arn = aws_alb_target_group.main.arn
      container_name   = var.service_name
      container_port   = var.service_port
    }
  }

  lifecycle {
    ignore_changes = [
      desired_count
    ]
  }

  #   platform_version = "LATEST"

  depends_on = [aws_lb.main]

}