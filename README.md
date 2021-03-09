# Azure App Service with Terraform

## Configuration 

Create a file called `my.tfvars`

```
# You app name, use only lowercase characters
app_name = "someapp"

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
```
