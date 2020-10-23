class profile::consul::server {

  package { 'unzip':
    ensure => latest,
  }

  class { '::consul':
    version     => '1.6.2',
    config_hash => {
      'bootstrap_expect' => 3,
      'data_dir'         => '/opt/consul',
      'datacenter'       => 'NTNU',
      'log_level'        => 'INFO',
      'node_name'        => $facts['hostname'],
      'server'           => true,
      'retry_join'       => [ $::serverip ],
	  'ui'				 => true,
	  'bind_addr'        => '127.0.0.1:8300',
    },
    require     => Package['unzip'],
  }

}

