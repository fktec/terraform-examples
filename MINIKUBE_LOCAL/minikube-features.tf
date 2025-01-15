provider "null" {
  alias = "provider-features"
}

resource "null_resource" "features_install" {
  depends_on = [null_resource.minikube_install]

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    when    = create
    command = "echo '# Instalando Features...'"
  }

}


