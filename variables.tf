variable "location" {
  type = string
}
variable "tags" {
  type = map(any)
}
variable "resource_group" {}
variable "app_name" {}
variable "git_user" {}
variable "git_password" {}
variable "git_account" {}
variable "git_host" {}
variable "git_image" {}

variable "dns_rg" {}
variable "dns_zone" {}
