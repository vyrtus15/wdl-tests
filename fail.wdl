task fail {
  command {
    trololo
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow ReadFile {
  call fail
}
