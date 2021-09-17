version 1.0
import "imports/imported-task.wdl" as importedTasks
import "imports/imported-workflow.wdl" as importedWorkflow

task hello {
  input {
    String name
  }
  command {
    echo 'Hello ~{name}!'
  }
  output {
    File response = stdout()
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

task number {
  input{
    Int x
  }
	
  command{
    echo ~{x}
  }

  output {
    File response = stdout()
  }

  runtime {
    docker: "ubuntu:latest"
  }
}

task greeter {
  input{
    Boolean morning
    String greeting = "good " + if morning then "morning" else "afternoon"
  }

  command {
    echo ~{greeting}
  }

  output {
    File response = stdout()
  }

  runtime {
    docker: "ubuntu:latest"
  }
}

workflow test {
  input{
    String wf_hello_in
    Array[String] arrayTest
    Map[String, String] mapTest
  }

  call hello
  call importedTasks.bye
  call number
  call greeter
  call importedWorkflow.wf_hello { input: wf_hello_input = wf_hello_in }

}
