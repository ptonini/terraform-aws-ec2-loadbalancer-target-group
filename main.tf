resource "aws_lb_target_group" "this" {
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc.id
  target_type = var.target_type
  health_check {
    path    = var.health_check.path
    matcher = var.health_check.matcher
  }
}

resource "aws_lb_target_group_attachment" "this" {
  for_each         = toset(var.target_ids)
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = each.value
}

