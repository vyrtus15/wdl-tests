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
    docker: "public.ecr.aws/ubuntu/ubuntu:18.04_stable"
  }
}


workflow test {

  call hello

}
