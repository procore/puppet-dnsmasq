# Class: dnsmasq::params
#
# This class defines default parameters used by the main module class dnsmasq
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to dnsmasq class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class dnsmasq::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'dnsmasq',
  }

  $service = $::operatingsystem ? {
    default => 'dnsmasq',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'dnsmasq',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'dnsmasq',
    default                   => 'nobody',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/dnsmasq.d',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/dnsmasq.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/dnsmasq',
    default                   => '/etc/sysconfig/dnsmasq',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/dnsmasq.pid',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/dnsmasq',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/dnsmasq/dnsmasq.log',
  }

  $port = '53'
  $protocol = 'udp'

  $domain_needed = true
  $bogus_priv = true
  $filterwin2k = false
  $resolv_file = ''
  $strict_order = false
  $no_resolv = false
  $no_poll = false
  $bind_interfaces = false
  $no_hosts = false
  $addn_hosts = ''
  $addn_hosts_dir = ''
  $expand_hosts = false
  $enable_ra = false
  $read_ethers = false
  $dhcp_authoritative = false
  $no_negcache = false
  $pxe_prompt = ''
  $pxe_prompt_timeout = '60'
  $pxe_service = ''
  $enable_tftp = false
  $tftp_secure = false
  $tftp_root = ''
  $dhcp_lease_max = ''
  $dhcp_leasefile = ''
  $dhcp_script = ''
  $cache_size = ''
  $local_ttl = ''
  $log_queries = false
  $log_dhcp = false
  $data_dir = $::operatingsystem ? {
    default => '/etc/dnsmasq.d',
  }
  $mx_target = ''
  $localmx = false
  $server = ''
  $local = ''
  $address = ''
  $interface = ''
  $except_interface = ''
  $listen_address = ''
  $no_dhcp_interface = ''
  $domain = ''
  $dhcp_range = ''
  $dhcp_host = ''
  $dhcp_ignore = ''
  $dhcp_vendorclass = ''
  $dhcp_userclass = ''
  $dhcp_mac = ''
  $dhcp_option = ''
  $dhcp_boot = ''
  $dhcp_match = ''
  $bogus_nxdomain = ''
  $host_alias = ''
  $mx_host = ''
  $srv_host = ''
  $ptr_record = ''
  $txt_record = ''
  $cname = ''

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'dnsmasq/dnsmasq.conf.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
