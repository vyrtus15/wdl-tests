import "imports/imported-task.wdl" as importedTasks
import "imports/imported-workflow.wdl" as importedWorkflow

task hello {
  String name

  command {
    echo 'Hello ${name}!'
  }
  output {
    File response = stdout()
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

task number {
  Int x
	
  command{
    echo ${x}
  }

  output {
    File response = stdout()
  }

  runtime {
    docker: "ubuntu:latest"
  }
}

task greeter {
  Boolean morning
  String greeting = "good " + if morning then "morning" else "afternoon"

  command {
    echo ${greeting}
  }

  output {
    File response = stdout()
  }

  runtime {
    docker: "ubuntu:latest"
  }
}

workflow test {
  String wf_hello_in

  call hello
  call importedTasks.bye
  call number
  call greeter
  call importedWorkflow.wf_hello { input: wf_hello_input = wf_hello_in }

}
