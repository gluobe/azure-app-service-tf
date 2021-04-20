# Azure App Service with Terraform

## Configuration 

Create a file called `my.tfvars`

```
# You app name, use only lowercase characters
team_name = "team"

# Azure settings
resource_group = "rg-name"
location = "northeurope"
tags = {
  key = "value"
}

# Github Settings
git_user = "user"
git_password = "<Personal Access Token>"
git_account = "<Github repository owner>"
git_host = "<Registry Domain>"
git_image = "repository/image:tag"

# Custom Domain
dns_rg = "dns-zone-resource-group"
dns_zone = "example.com"
```

