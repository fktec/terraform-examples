
# variable "resources_enabled" {
#   description = "Recursos que serão habilitados"
#   default     = {
#     "base_install" = "true"
#     "features_install" = "true"
#   }
# }

# # variable "global" {
# #   description = "Variáveis Globais"
# #   default     = {
# #     "file-test" = "samples/files/file-test.txt"
# #   }
# # }

# # variable "script_path_1" {
# #   default     = "samples/scripts/simple/create-files.sh"
# #   description = "Caminho do script Bash a ser executado localmente - 1"
# #   type        = string
# # }

# # variable "scripts_files" {
# #   default     = {
# #     "create_files" = "samples/scripts/files/create-files.sh"
# #     "remove_files" = "samples/scripts/files/remove-files.sh"
# #   }
# # }

# variable "test_user" {
#   type = string
# }

# variable "test_password" {
#   type = string
#   sensitive   = true
#   # default = null
# #    ephemeral = true
# }

# output "test_password_out" {
#   value = var.test_password
#   sensitive   = true
# }

# variable "custom_string" {
#   type = string
#   default = "custom-dft" 
# }

# variable "custom_map" {
#   type = map(string)
#   default = {
#     app_namespace = "dft"
#     app_name = "app-dft"
#   }
# }

# variable "scripts_files" {
#   default     = {
#     "simple_1" = "samples/scripts/simple/simple-script.sh"
#   }
# }