version 1.0

workflow test {
    call test_task {
    }
    output {
        Array[File] test_output = test_task.glob_output
    }
}

task test_task {
    runtime {
        cpu: 1
        memory: "10 MB"
        docker: "ubuntu:20.04"
    }
    command <<<
        for i in a b c
        do
            echo $i > "$i".txt
        done
    >>>
    output {
        Array[File] glob_output = glob("*.txt")
    }
}
