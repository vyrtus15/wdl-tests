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
    docker: "953428508787.dkr.ecr.eu-west-1.amazonaws.com/private-repo:18.10"
  }
}


workflow test {

  call hello

}
