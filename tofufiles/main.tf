# API Gateway with Lambda Function project
# REST calls to the API will call specific functions based on the method (GET, POST, DELETE)

terraform {

	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 5.97.0"
		}
	}
}

provider "aws" {
	region = "us-east-1"
}

resource "aws_iam_policy" "api_gateway_project_policy" {
	name = "api_gateway_project_policy"
	path = "/"
	policy = data.aws_iam_policy_document.api_gateway_project_policy.json
}

resource "aws_iam_role" "api_gateway_project_role" {
	name = "api_gateway_project_role_lambda"
	path = "/"
	assume_role_policy = data.aws_iam_policy_document.api_gateway_project_role.json
}

resource "aws_iam_role_policy_attachment" "api_gateway_project_attachment" {
	role = aws_iam_role.api_gateway_project_role.name
	policy_arn = aws_iam_policy.api_gateway_project_policy.arn
}

resource "aws_dynamodb_table" "dynamodb_table" {
	name = "api_gateway_project_table"
	read_capacity = 5
	write_capacity = 5
}
