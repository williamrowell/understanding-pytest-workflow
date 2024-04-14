version 1.0

workflow test {
  input {
    String name = "World"
    Int count = 10
  }

  scatter (i in range(count)) {
    call hello {
      input:
        name = name + i
    }
  }

  output {
    Array[File] responses = hello.response
  }
}

task hello {
  input {
    String name
    String docker_image = "ubuntu:22.04"
  }

  command <<<
    echo "hello ~{name}" > ~{name}.txt
  >>>

  output {
    File response = "~{name}.txt"
  }

  runtime {
    docker: docker_image
    cpu: 1
    memory: "1 GB"
  }
}

