output "aks_admin_group_id" {
  value = azuread_group.aks_admins.object_id
}
