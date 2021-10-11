#Creating users
resource "aws_iam_user" "newusers" {
  count = length(var.username)
  name  = element(var.username, count.index)
}

resource "aws_iam_user_policy_attachment" "ec2-user-full" {
  count        = length(var.username)
  user         = element(aws_iam_user.newusers.*.name, count.index)
  policy_arn   = var.policy
}