resource "aws_codedeploy_app" "example_app" {
  name     = "demo-codedp"
}

data "aws_iam_role" "existing_codedeploy_role" {
  name = var.existing_codedeploy_role
}

resource "aws_codedeploy_deployment_group" "example_deployment_group" {
  app_name   = aws_codedeploy_app.example_app.name
  deployment_group_name = "example-deployment-group"
  service_role_arn = data.aws_iam_role.existing_codedeploy_role.arn
  
  
  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = var.deployment_type
  }

  
  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [var.your_alb_listener_arn]
      }

      target_group {
        name = "example-target-group"
      }
    }
  }

}
resource "aws_lb" "demo-lb" {
  name               = "demo-lb-terraform"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls.id]

  enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    Environment = "production"
  }
}
