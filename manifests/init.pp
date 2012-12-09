class puppet-java {

  $java_packages = ['openjdk-6-jdk', 'openjdk-6-source', 'openjdk-7-jdk', 'openjdk-7-source']

  # exec { 'update-alternatives':
  #   command => 'update-java-alternatives -s sun-java6-jdk'
  # }

  # install the package
  package {$java_packages:
    ensure   => 'latest',
    provider => 'aptitude',
  }

}
