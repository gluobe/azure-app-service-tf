variable "location" {
  type = string
}
variable "tags" {
  type = map(any)
  default = {
   operator = "cicd"
  }
}
variable "resource_group" {}
variable "team_name" {}
variable "git_user" {}
variable "git_password" {}
variable "git_account" {}
variable "git_host" {}
variable "git_image" {}

variable "dns_rg" {}
variable "dns_zone" {}
