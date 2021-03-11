task read_file {
  File file
  command {
    ls ${file} > test_output_file.txt
  }
  output {
    Array[File] contents = glob("*.txt")
  }
  runtime {
    docker: "ubuntu:latest"
  }
}

workflow ReadFile {
  call read_file
  output {
    read_file.contents
  }
}
