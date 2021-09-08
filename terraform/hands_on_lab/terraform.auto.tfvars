# NOTE: Cloud credentials should be set in environment variables.
#       https://www.terraform.io/docs/providers/aws/index.html#environment-variables

# These variables should be set, at minimum. See `variables.tf` for others.

owner             = "terraform-hol"
region            = "us-east-1"
workstations      = "1"
namespace         = "terraform-hol"
training_username = "student"
training_password = "P@ssw0rd01"

#---------------------------------------------------
# To specify a version different from the default
#---------------------------------------------------
# terraform_url = "https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip"


#--------------------------------------------------------------------------
# To specify the EC2 instance type (default is t2.medium)
#--------------------------------------------------------------------------
# ec2_type = "m5.large"
