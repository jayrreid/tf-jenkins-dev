provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "jenkins-demo" {
  count         = "${var.server_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name  = "${var.name}-${count.index}"
    owner = "${var.owner}"
    TTL   = "${var.ttl}"
  }

  user_data = "${var.user_data}"
  key_name  = "${var.key_name}"
  subnet_id = "${var.subnet_id}"

}
