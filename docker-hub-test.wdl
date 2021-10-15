workflow dockerTest {
  call dockerPullRm
}

task dockerPullRm {
  command: {
    count=300
    for i in $(seq $count); do 
      docker pull hello-world && docker rmi hello-world:latest 
    done 
  }
  
  runtime {
    docker: "ubuntu:latest"
  } 
}
