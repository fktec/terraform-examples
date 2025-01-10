# BASE ---------------
variable "minikube_options" {
  description = "Opções gerais relacionadas a configurações no Minikube.."
  default     = {
    "minikube_auto_approve_conditions" = "true"
  }
}

# CUSTOM ---------------
variable "system_password" {
  description = "Senha para execuções de administrador no sistema."
  type = string
  default = null
}

variable "operating_system" {
  description = "Sistema operacional."
  type        = string
  default = "linux"

  validation {
    condition     = can(regex("linux|windows", var.operating_system))
    error_message = "Sistema operacional inválido."
  }
}

variable "system_architecture" {
  description = "Arquitetura do sistema operacional."
  type        = string
  default = "amd64"

  validation {
    condition     = can(regex("amd64", var.system_architecture))
    error_message = "Arquitetura do sistema operacional inválido."
  }
}

variable "minikube_install_scripts" {
  description = "Caminho dos scripts para instalação do Minikube por sistema operacional."
  type        = map(string)
  default     = {
    "default" = "samples/linux/default-install.sh"
    "linux" = "samples/linux/scripts/minikube-linux-install.sh"
    "windows" = "samples/windows/minikube-windows-install.sh"
  }
}

variable "minikube_uninstall_scripts" {
  description = "Caminho dos scripts para desinstalação do Minikube por sistema operacional."
  type        = map(string)
  default     = {
    "default" = "samples/linux/default-uninstall.sh"
    "linux" = "samples/linux/minikube-linux-uninstall.sh"
    "windows" = "samples/windows/minikube-windows-uninstall.sh"
  }
}