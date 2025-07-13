
output "aws_account_id" {
    value = data.aws_caller_identity.current.account_id
    sensitive = true
}

output "aws_region" {
    value = data.aws_region.current.name
}

# output "vpc_id" {
#     value = data.aws_vpc.current.id
# }

output "availability_zones" {
    value = data.aws_availability_zones.available.names
}

output "s3_bucket_policy" {
    value = data.aws_iam_policy_document.s3_bucket_policy.json
}