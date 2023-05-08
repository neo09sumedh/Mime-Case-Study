output instance_profile_id{
    value = aws_iam_instance_profile.web_instance_profile.id
}
output bucket{
    value = aws_s3_bucket.apps_bucket.bucket
}