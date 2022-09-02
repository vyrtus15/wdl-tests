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
    docker: "ubuntu:18.10"
  }
}


workflow test {

  call hello

}
