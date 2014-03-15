# Define: dnsmasq::addhost
#
# Adds hosts to a file using concat
#
# Supported arguments:
#
# $file   - The file where extra hosts will be added under $dnsmasq::addn_hosts_dir.
#           Defaults to "extra_records.hosts"
#           Remember to set ${dnsmasq::addn_hosts_dir} in dnsmasq::params
# $ip     - The ip for the  host to add
#           If not set, defaults to == $title
#
# $names  - The names this host will have. Can be an array of names.
#           At least a name is mandatory
#
# $ensure - present/absent

define dnsmasq::addhost (
  $names,
  $ensure = 'present',
  $ip     = '',
  $file   = '' ) {

  include dnsmasq

  $concat_host_file = $file ? {
    ''      => "${dnsmasq::addn_hosts_dir}/extra_records.hosts",
    default => "${dnsmasq::addn_hosts_dir}/${file}",
  }

  $real_ip = $ip ? {
    ''      => $name,
    default => $ip,
  }

  $array_names = is_array($names) ? {
    false     => $names ? {
      ''      => [],
      default => [$names],
    },
    default   => $names,
  }

  if ! defined(Concat[$concat_host_file]) {
    concat { $concat_host_file:
      mode    => '0644',
      warn    => true,
      owner   => $dnsmasq::config_file_owner,
      group   => $dnsmasq::config_file_group,
      require => Package['dnsmasq'],
    }
  }

  concat::fragment { "dnsmasq_addn_hosts_${name}":
    ensure  => $ensure,
    target  => $concat_host_file,
    content => inline_template("<%= @real_ip %> <%= @array_names * ' ' %>\n"),
    notify  => Service['dnsmasq'],
  }
}

