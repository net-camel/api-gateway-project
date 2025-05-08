data "aws_iam_policy_document" "api_gateway_project_policy" {
	statement {
		sid = 00001
		actions = [	
 			"dynamodb:DeleteItem",
            "dynamodb:GetItem",
            "dynamodb:PutItem",
            "dynamodb:Query",
            "dynamodb:Scan",
            "dynamodb:UpdateItem"
		]
		
		resources = [
			"*"
		]
	}
	statement {
		actions = [
			"logs:CreateLogGroup",
		    "logs:CreateLogStream",
            "logs:PutLogEvents"
		]
		resources = [
			"*"
		]
		effect = "Allow"
	}
}

data "aws_iam_policy_document" "api_gateway_project_role" {
	statement {
		effect = "Allow"
		actions = ["sts:AssumeRole"]
		principals {
			type = "Service"
			identifiers = ["lambda.amazonaws.com"]
		}
	}
}
