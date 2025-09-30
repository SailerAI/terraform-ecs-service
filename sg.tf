resource "aws_security_group" "main" {

  name = format("%s-%s", var.cluster_name, var.service_name)

  vpc_id = data.aws_ssm_parameter.vpc_id.value

  dynamic "ingress" {
    for_each = var.create_load_balancer ? ["lb_ingress"] : (length(var.task_ingress_cidrs_no_lb) > 0 ? ["worker_ingress"] : [])
    content {
      from_port = var.service_port
      to_port   = var.service_port
      protocol  = "tcp"

      # Se o Load Balancer existir, permita o tráfego apenas do Security Group do LB.
      security_groups = ingress.key == "lb_ingress" ? [aws_security_group.lb[0].id] : null
      # Se não houver LB e task_ingress_cidrs_no_lb não for vazio, use esses CIDR blocks.
      cidr_blocks = ingress.key == "worker_ingress" ? var.task_ingress_cidrs_no_lb : null
    }
  }


  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}