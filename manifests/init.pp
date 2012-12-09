class puppet-java {

  $ppa_repository = 'ppa:webupd8team/javtxa'

  $needed_packages = ['aptitude', 'python-software-properties']

  Package[$needed_packages] -> Exec['add-repo'] -> Exec['aptitude-update'] -> Package['java']

  package {$needed_packages:
    ensure => 'latest',
  }

  exec {'aptitude-update':
    command => '/usr/bin/aptitude update',
  }

  exec { 'add-repo':
    command => "/usr/bin/add-apt-repository $ppa_repository"
  }

  # install the package
  package {['sun-java6-jdk' 'sun-java6-source' 'sun-java6-plugin']:
    ensure   => 'latest',
    provider => 'aptitude',
  }
}
