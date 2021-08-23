#target group
resource "aws_lb_target_group" "web1-tg" {
  name     = "web1-tg"
  port     = 9001
  protocol = "HTTP"
  vpc_id   = "vpc-01cf98f5afb156c90"
  target_type = "instance"
}

#target group attachment
resource "aws_lb_target_group_attachment" "web1-tg-attach" {
  target_group_arn = aws_lb_target_group.web1-tg.arn
  target_id        = aws_instance.ap-web-01.id
  port             = 9001
}

resource "aws_lb_target_group_attachment" "web2-tg-attach" {
  target_group_arn = aws_lb_target_group.web1-tg.arn
  target_id        = aws_instance.ap-web-02.id
  port             = 9001
}

#alb
resource "aws_lb" "web1-alb" {
  name               = "web1-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ap-web-01.id]
  subnets            = ["subnet-2f1c5263", "subnet-e7170e8f", "subnet-e3128398"]

  tags = {
    Environment = "web1-alb"
  }
}

#alb-listner
resource "aws_lb_listener" "web1-alb-listner" {
  load_balancer_arn = aws_lb.web1-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web1-tg.arn
  }
}