module "instance" {

  count = var.instance_count

  source = "../../instance/base"

  context = var.context

  name           = "instance-${count.index}"
  cluster_id     = aws_docdb_cluster.main.id
  instance_class = var.instance_class

}
