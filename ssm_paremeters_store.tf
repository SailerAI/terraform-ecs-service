#resource "aws_ssm_parameter" "lb_arn" {
#  name = format("/%s/%s/lb/arn",var.service_name,var.environment)
#  type = "String"
#  value = aws_lb.main.arn
#}
#
#resource "aws_ssm_parameter" "lb_listener_http_arn" {
#  name = format("/%s/%s/lb/listener/http/arn",var.service_name,var.environment)
#  type = "String"
#  value = aws_lb_listener.http.arn
#}
