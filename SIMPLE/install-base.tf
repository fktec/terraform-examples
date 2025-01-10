# provider "null" {}

# resource "null_resource" "create-file" {

#   triggers = {
#     test_file                     = var.global["file-test"]

#     script_create_files_path      = var.scripts_files["create_files"]
#     script_create_files_checksum  = filesha256(var.scripts_files["create_files"])

#     script_remove_files_path      = var.scripts_files["remove_files"]
#     script_remove_files_checksum  = filesha256(var.scripts_files["remove_files"])
#   }

#   provisioner "local-exec" {
#     when    = create
#     command = "bash ${self.triggers.script_create_files_path} ${self.triggers.test_file}"
#   }

#   provisioner "local-exec" {
#     when    = destroy
#     command = "bash ${self.triggers.script_remove_files_path} ${self.triggers.test_file}"
#   }
# }

# provider "null" {}

# resource "null_resource" "create-file" {

#   triggers = {
#     test_file                     = var.global["file-test"]

#     script_create_files_path      = var.scripts_files["create_files"]
#     script_create_files_checksum  = filesha256(var.scripts_files["create_files"])
#   }

#   provisioner "local-exec" {
#     when    = create
#     command = "bash ${self.triggers.script_create_files_path} ${self.triggers.test_file}"
#   }

# }



# resource "null_resource" "test-simple" {

#   triggers = {
#     script_simple_1 = var.scripts_files["simple_1"]
#   }

#   provisioner "local-exec" {
#     when    = create
#     command = "echo 'USER - ${var.test_user}'"
#     # command = <<EOF
#     #   echo "USER - ${var.test_user}"
#     # EOF
#   }

#   provisioner "local-exec" {
#     when    = create
#     command = "echo 'PASSW - ${var.test_password}'"
#     # command = <<EOF
#     #   echo "USER - ${var.test_user}"
#     # EOF
#   }

  # provisioner "local-exec" {
  #   when    = create
  #   # command = "bash ${self.triggers.script_simple_1} ${self.triggers.test} $(echo '${self.triggers.test_2}')"
  #   command = <<EOF
  #     bash ${self.triggers.script_simple_1} ${self.triggers.test} ${self.triggers.test_2}
  #   EOF
  # }
# }


variable "local_password" {
  type = string
  sensitive = true
}

provider "null" {}

resource "null_resource" "test-simple" {

  provisioner "local-exec" {
    # command = "echo 'PASSW - ${var.local_password}'"
    command = "bash samples/scripts/simple/simple-script.sh ${var.local_password}"
  }

}