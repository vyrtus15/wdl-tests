version 1.0
task bye {
  input{
    String nameTwo
  }  

  command {
    echo "Bye bye ~{nameTwo}!"
  }
  output {
    File response = stdout()
  }
  runtime {
    docker: "ubuntu:latest"
  }
}
