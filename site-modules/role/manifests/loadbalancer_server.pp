class role::loadbalancer_server{
  include ::profile::base_linux
  include ::profile::dns::client
  include ::profile::consul::client
}
