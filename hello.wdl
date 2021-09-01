version 1.0

task hello {
input {
  String? preCommand
  String name
}

  command {
    set -e -o pipefail
    ~{preCommand}
    echo 'Hello ${name}!'
  }
  output {
    File response = stdout()
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow test {
  call hello
}
