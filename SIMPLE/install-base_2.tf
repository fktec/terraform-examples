
# provider "null" {
#   alias = "features"
# }

# resource "null_resource" "features_install" {
#   depends_on = [null_resource.base_install]

#   triggers = {
#     always_run = timestamp()
#   }

#   provisioner "local-exec" {
#     command = "echo '# Instalando FEATURES.'"
#   }

# }
