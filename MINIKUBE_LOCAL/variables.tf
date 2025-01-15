# SYSTEM
variable "system_password" {
  description = "# Senha para execuções de administrador no sistema."
  type = string
  # sensitive = true
}

variable "operating_system" {
  description = "Sistema operacional."
  type        = string
  # default     = "linux"

  validation {
    condition     = can(regex("linux|windows", var.operating_system))
    error_message = "Sistema operacional inválido."
  }
}

variable "system_architecture" {
  description = "Arquitetura do sistema operacional."
  type        = string
  # default     = "amd64"

  validation {
    condition     = can(regex("amd64", var.system_architecture))
    error_message = "Arquitetura do sistema operacional inválido."
  }
}
