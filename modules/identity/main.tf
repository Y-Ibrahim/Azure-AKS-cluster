data "azuread_user" "admins" {
  for_each            = toset(var.aks_admin_users)
  user_principal_name = each.value
}

data "azuread_user" "admin_users" {
  for_each            = toset(var.aks_admin_users)
  user_principal_name = each.value
}

resource "azuread_group" "aks_admins" {
  display_name     = "AKS-${var.name}-admins"
  security_enabled = true
  description      = "Cluster administrators for ${var.name} cluster"

  members = [
    for user in data.azuread_user.admin_users : user.object_id
  ]
}
