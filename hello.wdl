version 1.0

task hello {
  input {
    String name
  }
  command {
    echo "Hello ~{name}"
  }
  output {
    File response = stdout()
  }
  runtime {
    docker: "654431389393.dkr.ecr.eu-west-1.amazonaws.com/private-repo:ubuntu"
  }
}


workflow test {

  call hello

}
