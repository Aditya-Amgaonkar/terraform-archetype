provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "my_aws_users" {
    source   = "../../modules/aws/iam_user"
    username = ["test_user"]
    policy   = aws_iam_policy.ec2_full.arn
}