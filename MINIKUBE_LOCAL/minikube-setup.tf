provider "null" {
  alias = "provider-setup"
}

locals {
  minikube_install_scrip_file_path = lookup(var.minikube_install_scripts, var.operating_system, var.minikube_install_scripts["default"])
}

# Instalação do Minikube -------------------------------------------------------
resource "null_resource" "minikube_install" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    when    = create
    command = "bash ${local.minikube_install_scrip_file_path} '${var.system_password}' ${var.operating_system} ${var.system_architecture} ${var.minikube_install_force}"
  }

}

# Desinstalação do Minikube -------------------------------------------------------
resource "null_resource" "minikube_uninstall" {
  triggers = {
    system_password = var.system_password
    minikube_uninstall_scrip_file_path = lookup(var.minikube_uninstall_scripts, var.operating_system, var.minikube_uninstall_scripts["default"])
  }

  provisioner "local-exec" {
    when    = destroy
    command = "bash ${self.triggers["minikube_uninstall_scrip_file_path"]} '${self.triggers["system_password"]}'"
  }

}

