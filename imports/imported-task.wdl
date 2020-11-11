task bye {
  command {
    echo "Bye bye!"
  }
  output {
    File response = stdout()
  }
  runtime {
    docker: "ubuntu:latest"
  }
}