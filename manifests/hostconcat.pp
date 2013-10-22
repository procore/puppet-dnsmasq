# This define APPENDS a line entry to a hosts file
#
define dnsmasq::hostconcat (
  $ip = '',
  $names = '',
  $file = 'extra_records.hosts',
  $order = '50',
  $ensure = 'present' ) {

  include concat::setup
  include dnsmasq

  $concat_host_file = "${dnsmasq::addn_hosts_dir}/${order}-${file}"

  $real_ip = $ip ? {
    ''      => $name,
    default => $ip,
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
    content => inline_template("<%= @real_ip %> <%= @names * ' ' %>\n"),
    order   => $order,
    notify  => Service['dnsmasq'],
  }
}

