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
3. Install Terragunt tool
4. Install cf-terraforming
5. Clone current cloudflare infraestructure (cf-terraforming)

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
