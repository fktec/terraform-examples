# MINIKUBE
variable "minikube_install_force" {
  description = "# Se existir uma versão do Minikube instalada localmente, deseja continuar (s/n)?"
  type        = string
  # default     = "n"
}

# SCRIPTS
variable "minikube_install_scripts" {
  description = "Caminho dos scripts para instalação do Minikube por sistema operacional."
  type        = map(string)
  default     = {
    "default" = "samples/linux/scripts/minikube-linux-install.sh"
    "linux" = "samples/linux/scripts/minikube-linux-install.sh"
    "windows" = "samples/windows/scripts/minikube-windows-install.sh"
  }
}

variable "minikube_uninstall_scripts" {
  description = "Caminho dos scripts para desinstalação do Minikube por sistema operacional."
  type        = map(string)
  default     = {
    "default" = "samples/linux/scripts/minikube-linux-uninstall.sh"
    "linux" = "samples/linux/scripts/minikube-linux-uninstall.sh"
    "windows" = "samples/windows/scripts/minikube-windows-uninstall.sh"
  }
}
