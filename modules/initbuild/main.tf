resource "null_resource" "build" {
  provisioner "local-exec" {
    command = "make"
    working_dir = local.working_dir_path
    interpreter=["bash", "-c"]
    environment = {
        TAG = var.image_tag
        REGISTRY_ID = data.aws_caller_identity.current.account_id
        REPOSITORY_REGION = var.aws_region
        APP_NAME = var.app_name
        ENV_NAME = var.environment
    }
  }
}
