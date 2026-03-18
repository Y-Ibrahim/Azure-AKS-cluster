variable "namespace" {
  description = "Namespace for ArgoCD installation"
  type        = string
  default     = "argocd"
}

variable "argocd_version" {
  description = "Version of ArgoCD Helm chart"
  type        = string
  default     = "9.4.14"
}

variable "service_type" {
  description = "Service type for ArgoCD server"
  type        = string
  default     = "ClusterIP"
}

variable "ingress_enabled" {
  description = "Enable ingress for ArgoCD server"
  type        = bool
  default     = false
}

variable "ingress_hosts" {
  description = "Ingress hosts for ArgoCD server"
  type        = list(string)
  default     = []
}

variable "ingress_tls" {
  description = "TLS configuration for ingress"
  type        = list(map(string))
  default     = []
}

variable "dex_enabled" {
  description = "Enable Dex for SSO"
  type        = bool
  default     = false
}

variable "notifications_enabled" {
  description = "Enable notifications"
  type        = bool
  default     = false
}

variable "ha_enabled" {
  description = "Enable high availability"
  type        = bool
  default     = false
}

variable "argocd_admin_password" {
  description = "Admin password for ArgoCD"
  type        = string
  sensitive   = true
}

variable "server_secretkey" {
  description = "Server secret key"
  type        = string
  sensitive   = true
}
