### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("./inventory.tmpl",
 {
  master-ip = aws_instance.master-instance.public_ip,
  data-ip = aws_instance.data-instance.public_ip,
  public-ip = aws_instance.public-instance.public_ip
 
 }
 )
 filename = "inventory1"
}
