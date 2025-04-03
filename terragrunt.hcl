locals {
    secrets = yamldecode(sops_decrypt_file("${get_parent_terragrunt_dir()}/cloudflare.dev.yaml"))
    #secrets = yamldecode(sops_decrypt_file("cloudflare.dev.yaml"))
}

inputs = {
   api_token = local.secrets.api_token
   zone_id   = local.secrets.zone_id
   domain    = local.secrets.domain
}