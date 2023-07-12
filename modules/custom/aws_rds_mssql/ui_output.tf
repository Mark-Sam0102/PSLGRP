data "template_file" "ui_output" {
  template = file("${path.module}/ui_output.json")
  vars = {
    db_instance_address  = "${local.db_instance_address}"
    db_instance_endpoint = "${local.db_instance_endpoint}"
    db_instance_port     = "${local.db_instance_port}"
    db_instance_username = "${local.username}"
    db_instance_password = "${local.password}"
  }
}
output "ui_output" {
  value = data.template_file.ui_output.rendered
}
