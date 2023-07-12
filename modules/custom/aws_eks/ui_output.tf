data "template_file" "ui_output" {
  template = file("${path.module}/ui_output.json")
  vars = {
    endpoint = "${local.endpoint}"
    cluster_name = "${local.cluster_name}"
    platform_version = "${local.platform_version}"
    identity-oidc-issuer = "${local.identity-oidc-issuer}"
    vpc_config-subnet_ids =join(",", local.vpc_config-subnet_ids)
    vpc_config-vpc_id = "${local.vpc_config-vpc_id}"
  }
}


output "ui_output" {
  value = data.template_file.ui_output.rendered
}
