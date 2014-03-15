# Define dnsmasq::hostconcat
#
# This define is deprecated and will be removed in future versions
# If you are still using it, please consider moving to dnsmasq::addhost
# The main difference between the two is that we remove $order, as
# dnsmasq files order is not important, and filenames get ugly.
# If for whatever reason you REALLY want a number before your filename
# you can it by hand anyway.
#
define dnsmasq::hostconcat (
  $ensure = undef,
  $ip = undef,
  $names = undef,
  $file = '',
  $order = '50') {

  include dnsmasq

  warning('The define dnsmasq::hostconcat is deprecated. Use dnsmasq::addhost instead')

  #if we provide no $file, we undef the variable to let dnsmasq::addhost
  # to handle the default filename

  $filename = $file ? {
    ''      => undef,
    default => "${order}-${file}",
  }

  dnsmasq::addhost { $name:
    ensure => $ensure,
    names  => $names,
    ip     => $ip,
    file   => $filename,
  }
}

