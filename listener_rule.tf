resource "aws_alb_listener_rule" "main" {
  count        = var.create_load_balancer ? 1 : 0
  listener_arn = aws_lb_listener.http.0.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.0.arn
  }

  condition {
    host_header {
      values = var.service_hosts
    }
  }
}

resource "aws_lb_listener" "https" {
  count             = var.create_load_balancer ? 1 : 0
  load_balancer_arn = aws_lb.main.0.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.0.arn
  }
}