task bye {
  String nameTwo  

  command {
    echo "Bye bye ${nameTwo}!"
  }
  output {
    File response = stdout()
  }
  runtime {
    docker: "ubuntu:latest"
  }
}
