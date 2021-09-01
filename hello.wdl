version 1.0


task docker_pull {
input {
  String docker_image
}

command {
  docker pull ~{docker_image}
}
output {
  File response = stdout()
  }
}

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
    docker: "121296702210.dkr.ecr.eu-west-2.amazonaws.com/eva/bwa:latest"
  }
}

workflow test {
  call docker_pull
  call hello
}
