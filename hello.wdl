version 1.0

task hello {
input {
  String name
}

  command {
    set -e -o pipefail
    echo 'Hello ${name}!'
  }
  output {
    File response = stdout()
  }
  runtime {
    docker: "public.ecr.aws/ubuntu/ubuntu:18.04"
  }
}

workflow test {
  call hello
}
