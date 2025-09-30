resource "aws_security_group" "lb" {
  count  = var.create_load_balancer ? 1 : 0 # Criado apenas se create_load_balancer for true  
  name   = format("%s-%s-lb", var.service_name, var.environment)
  vpc_id = data.aws_ssm_parameter.vpc_id.value

}

resource "aws_security_group_rule" "lb_egress" {
  count             = var.create_load_balancer ? 1 : 0
  security_group_id = aws_security_group.lb[0].id # Note o [0] para acessar a instância condicional
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
}

resource "aws_security_group_rule" "lb_ingress_80" {
  count             = var.create_load_balancer ? 1 : 0
  security_group_id = aws_security_group.lb[0].id # Note o [0] para acessar a instância condicional
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow HTTP traffic"
}

resource "aws_security_group_rule" "lb_ingress_443" {
  count             = var.create_load_balancer ? 1 : 0
  security_group_id = aws_security_group.lb[0].id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow HTTPS traffic"
}

resource "aws_lb" "main" {
  count                            = var.create_load_balancer ? 1 : 0
  name                             = format("%s-%s-lb", var.service_name, var.environment)
  internal                         = var.load_balancer_internal
  load_balancer_type               = var.load_balancer_type
  subnets                          = data.aws_ssm_parameter.public_subnet_ids[*].value
  security_groups                  = var.create_load_balancer ? [aws_security_group.lb[0].id] : [] # 
  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = false

}

resource "aws_lb_listener" "http" {
  count             = var.create_load_balancer ? 1 : 0
  load_balancer_arn = aws_lb.main[0].arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


