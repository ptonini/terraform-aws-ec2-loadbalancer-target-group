resource "aws_lb_target_group" "this" {
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc.id
  target_type = var.target_type
  health_check {
    enabled             = try(var.health_check["enabled"], false)
    path                = try(var.health_check["path"], null)
    matcher             = try(var.health_check["matcher"], null)
    protocol            = try(var.health_check["protocol"], var.protocol)
    port                = try(var.health_check["port"], null)
    healthy_threshold   = try(var.health_check["healthy_threshold"], null)
    interval            = try(var.health_check["interval"], null)
    timeout             = try(var.health_check["timeout"], null)
    unhealthy_threshold = try(var.health_check["unhealthy_threshold"], null)
  }
}

resource "aws_lb_target_group_attachment" "this" {
  for_each         = toset(var.target_ids)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = each.value
}

