provider "null" {}

resource "null_resource" "minikube-install" {

  triggers = {
    # SYSTEM VARIABLES
    # system_password = var.system_password
    operating_system = var.operating_system
    system_architecture = var.system_architecture

    # SCRIPTS
    minikube_auto_approve_conditions = var.minikube_options["minikube_auto_approve_conditions"]
    minikube_install_scrip_file_path = lookup(var.minikube_install_scripts, var.operating_system, var.minikube_install_scripts["default"])
    minikube_uninstall_scrip_file_path = lookup(var.minikube_uninstall_scripts, var.operating_system, var.minikube_uninstall_scripts["default"])
    # minikube_install_scrip_file_path = var.minikube_scripts["minikube_install"]
    # minikube_install_scrip_file_checksum = filesha256(var.minikube_scripts["minikube_install"])
  }

  provisioner "local-exec" {
    when    = create
    # command = "bash ${self.triggers.minikube_install_scrip_file_path} ${self.triggers.system_password} ${self.triggers.operating_system} ${self.triggers.system_architecture} ${self.triggers.minikube_auto_approve_conditions}"
    command = <<EOF
              echo "minikube_install_scrip_file_path >> ${self.triggers.minikube_install_scrip_file_path}"
              echo "minikube_uninstall_scrip_file_path >> ${self.triggers.minikube_uninstall_scrip_file_path}"
              echo "system_password >> ${var.system_password}"
            EOF
  }

}
