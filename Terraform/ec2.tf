
resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.nano"

  network_interface {
    network_interface_id = aws_network_interface.web.id
    device_index = 0
  }
  
    filter {
    name = “architecture”
    values = [“x86_64"]

  tags = {
    Name = "appstellar-rinor-${var.enviroment}"
  }
}

resource "aws_network_interface" "web" {
  subnet_id       = "subnet-03ddf0d4fd589ae9a"
  security_groups = ["sg-0dd3a367880737f7a"]
}