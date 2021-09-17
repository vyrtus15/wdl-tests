version 1.0
task hello {
  input{
    String addressee
  }

  command {
    echo "Hello ~{addressee}!"
  }
  runtime {
      docker: "ubuntu:latest"
  }
  output {
    File response = stdout()
  }
}

workflow wf_hello {
  input{
    String wf_hello_input
  }
  
  call hello {input: addressee = wf_hello_input }

  output {
    File result = hello.response
  }
}
