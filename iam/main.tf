provider "aws" {
  region = "us-east-2"
}

#Create IAM user
resource "aws_iam_user" "myUSer" {
  name = "Kundan"
}

#Create IAM Policy
resource "aws_iam_policy" "customPolicy" {
  name   = "EC2Acess"
  policy = <<EOF
    #enter your policy
  EOF
}

#Attached Policy to IAM user
resource "aws_iam_policy_attachment" "policyBind" {
  name       = "attachment"
  users      = [aws_iam_user.myUSer.name]
  policy_arn = aws_iam_policy.customPolicy.arn

}