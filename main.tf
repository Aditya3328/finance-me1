resource "aws_instance" "test" {
  ami           = "ami-02eb7a4783e7e9317" 
  instance_type = "t2.micro" 
  key_name = "AssignmentKey"
  vpc_security_group_ids= ["sg-04fba683f37ca92fd"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "AssignmentKey.pem"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ "echo 'wait to start instance' "]
  }
  tags = {
    Name = "test-server"
  }
  provisioner "local-exec" {
        command = " echo ${aws_instance.test-server.public_ip} > inventory "
  }
    
}
