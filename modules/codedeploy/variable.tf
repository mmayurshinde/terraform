variable "deployment_type" {
  description = "deployment_type"
  default     = "IN_PLACE"
}

variable "existing_codedeploy_role" {
  description = "existing codedeploy role"
  default     = "codedp_role"
}

variable "your_alb_listener_arn" {
  description = "existing codedeploy role"
  default     = "arn:aws:elasticloadbalancing:ap-southeast-2:905418178286:loadbalancer/app/demo-loadbalancer/c01448d2ec067fe6"
}