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
    docker: "461720209515.dkr.ecr.eu-west-1.amazonaws.com/private-repo-rp:18.10"
  }
}


workflow test {

  call hello

}
