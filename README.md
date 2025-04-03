# Cloudflare Terraform
Welcome! This repository is dedicated to managing Cloudflare infrastructure with Terraform.

## Table of Contents
- [Third parties](#third-parties)
- [Pre environment](#pre-environment)
- [Usage](#usage)
- [License](#license)
- [Disclaimer](#disclaimer)

### Third parties
In order to keep secrets safe, I used some tools to accomplish this goal. <br>
https://docs.aws.amazon.com/kms/ <br>
https://github.com/getsops/sops <br>
https://github.com/gruntwork-io/terragrunt <br>
https://github.com/cloudflare/cf-terraforming <br>

All projects have their own license. Please, check them out. 

### Pre environment
1. Create a KMS Key in AWS
2. Install SOPS tool
3. Install Terragrunt tool
4. Install cf-terraforming
5. Clone current cloudflare infraestructure (cf-terraforming)


### Cloning current cloudflare infraestructure
1. Export variables 
```sh
$ export CLOUDFLARE_API_TOKEN='YOURAPITOKEN'
$ export CLOUDFLARE_ZONE_ID='YOURZONEID'
$ export CLOUDFLARE_EMAIL='YOURCLOUDFLAREMAIL'
```

2. Execute command to export existing configuration 
```sh
$ cf-terraforming generate --email $CLOUDFLARE_EMAIL --token $CLOUDFLARE_API_TOKEN -z $CLOUDFLARE_ZONE_ID --resource-type  cloudflare_dns_record > existing_cloudflare_config.tf
```

3. Execute command to import existing configuration
```sh
#It returns one line per DNS record. Copy & Paste one at a time 
$ cf-terraforming import --resource-type "cloudflare_dns_record" --email $CLOUDFLARE_EMAIL --key $CLOUDFLARE_API_KEY --zone $CLOUDFLARE_ZONE_ID 

$ terragrunt import cloudflare_dns_record.terraform_managed_resource_example1djdtgdfdfjdndv...
20:04:57.084 STDOUT terraform: cloudflare_dns_record.terraform_managed_resource_example1djdtgdfdfjdndv1: Importing from ID "example1djdtgdfdfjdndv"...
20:04:58.217 STDOUT terraform: cloudflare_dns_record.terraform_managed_resource_example1djdtgdfdfjdndv: Import prepared!
20:04:58.220 STDOUT terraform:   Prepared cloudflare_dns_record for import
20:04:58.220 STDOUT terraform: cloudflare_dns_record.terraform_managed_resource_example1djdtgdfdfjdndv: Refreshing state... [id=example1djdtgdfdfjdndv]
20:04:59.025 STDOUT terraform: 
20:04:59.025 STDOUT terraform: Import successful!
20:04:59.025 STDOUT terraform: The resources that were imported are shown above. These resources are now in
20:04:59.025 STDOUT terraform: your Terraform state and will henceforth be managed by Terraform.
20:04:59.025 STDOUT terraform: 

$ terragrunt import cloudflare_dns_record.terraform_managed_resource_example2dpplkkmnjicndv...
20:05:51.084 STDOUT terraform: cloudflare_dns_record.terraform_managed_resource_example2dpplkkmnjicndv: Importing from ID "example2dpplkkmnjicndv"...
20:05:52.217 STDOUT terraform: cloudflare_dns_record.terraform_managed_resource_example2dpplkkmnjicndv: Import prepared!
20:05:52.220 STDOUT terraform:   Prepared cloudflare_dns_record for import
20:05:52.220 STDOUT terraform: cloudflare_dns_record.terraform_managed_resource_example2dpplkkmnjicndv1: Refreshing state... [id=example2dpplkkmnjicndv]
20:05:53.025 STDOUT terraform: 
20:05:53.025 STDOUT terraform: Import successful!
20:05:53.025 STDOUT terraform: The resources that were imported are shown above. These resources are now in
20:05:53.025 STDOUT terraform: your Terraform state and will henceforth be managed by Terraform.
20:05:53.025 STDOUT terraform: 
```

### Usage
Instead of using terraform, it necessary to use terragrunt in order to access to secrets.

```sh
# Clone the repository
$ git clone https://github.com/asantar0/cloudflare-terraform.git

# Navigate to the project directory
$ cd cloudflare-terraform

# Install dependencies
$ terraform init

# Plan
$ terragrunt plan

# Apply
$ terragrunt apply

# Destroy
$ terragrunt destroy
```

### License
This project is licensed under the MIT License. See the LICENSE file for more details.

### Disclaimer
This project is provided as-is, and the authors are not responsible for any damages or losses resulting from its use. Always test security measures in a staging environment before applying them to a prod site.
