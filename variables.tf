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
  default = {
    path    = "/"
    matcher = "200"
  }
}

variable "target_type" {}

variable "target_ids" {
  default = []
}