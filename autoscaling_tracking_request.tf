resource "aws_appautoscaling_policy" "target_tracking_requests" {

  count = var.autoscaling_enabled && var.scale_type == "requests_tracking" ? 1 : 0

  name = format("%s-%s-requests-tracking", var.cluster_name, var.service_name)

  resource_id        = aws_appautoscaling_target.main[0].resource_id
  service_namespace  = aws_appautoscaling_target.main[0].service_namespace
  scalable_dimension = aws_appautoscaling_target.main[0].scalable_dimension

  policy_type = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value       = var.scale_tracking_requests
    scale_in_cooldown  = var.scale_in_cooldown
    scale_out_cooldown = var.scale_out_cooldown

    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = "${aws_lb.main.arn_suffix}/${aws_alb_target_group.main.arn_suffix}"
    }

  }

}