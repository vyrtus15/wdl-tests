version 1.1

task hello {
  input {
    String name
  }
  command <<<
    echo Hello ~{name}
  >>>
  output {
    File response = stdout()
  }
  runtime {
    container: "942344369036.dkr.ecr.eu-west-1.amazonaws.com/lifebit-platform/nf-config-parser:master"
  }
}


workflow test {

  call hello

}
