variable "port" {
  default = 80
}

variable "protocol" {
  default = "HTTP"
}

variable "vpc" {
  type = object({
    id = string
  })
}

variable "health_check" {
  type = object({
    enabled             = optional(bool, false)
    path                = optional(string)
    matcher             = optional(string)
    protocol            = optional(string, "HTTP")
    port                = optional(number)
    healthy_threshold   = optional(string)
    interval            = optional(string)
    timeout             = optional(string)
    unhealthy_threshold = optional(string)
  })
  default = {}
}

variable "target_type" {}

variable "target_ids" {
  type    = set(string)
  default = []
}

variable "autoscaling_groups" {
  type    = set(string)
  default = []
}