locals {
environment         = "dev"
app_name            = "html"
aws_profile         = "default"
aws_account         = "064173783062"
aws_region          = "eu-central-1"
image_tag           = "0.0.1"
app_count           = 2
working_dir         =  "../../html"
#github_path_url     = "https://github.com/Yagorus/Demo4_Bot"
#git_trigger        = "PUSH"
#git_pattern_branch  = "^refs/heads/terragrunt$"
#buildspec_path      = "providers/dev"
#buildspec_file      = "buildspec.yml"
}

inputs = {
    bucket_name     = format("%s-%s-s3", local.app_name, local.environment)
    environment         = local.environment
    app_name            = local.app_name
    aws_profile         = local.aws_profile
    aws_account         = local.aws_account
    aws_region          = local.aws_region
    image_tag           = local.image_tag
    app_count           = local.app_count
    working_dir         = local.working_dir
}

remote_state {
    backend = "s3" 

    config = {
        encrypt = true
        bucket = format("%s-%s-s3", local.app_name, local.environment)
        key =  format("%s/terraform.tfstate", path_relative_to_include())
        region  = local.aws_region
        profile = local.aws_profile
  }
}
