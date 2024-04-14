version 1.0

workflow hello_world {
  meta {description: "simple test workflow"}
  parameter_meta {
    name: {
      description: "the name to be echo'd"
    }
  }
  input {
    String name
  }
  call hello {
    input:
      name = "world"
  }
  output {
    File out = hello.out
  }
}

task hello {
  input {
    String name
  }
  command <<<
    echo hello ~{name} > out
  >>>
  output {
    File out = "out"
  }
}
