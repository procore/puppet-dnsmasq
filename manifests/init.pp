# = Class: dnsmasq
#
# This is the main dnsmasq class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, dnsmasq class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $dnsmasq_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, dnsmasq main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $dnsmasq_source
#
# [*source_dir*]
#   If defined, the whole dnsmasq configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $dnsmasq_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $dnsmasq_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, dnsmasq main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $dnsmasq_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $dnsmasq_options
#
# [*service_autorestart*]
#   Automatically restarts the dnsmasq service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $dnsmasq_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $dnsmasq_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $dnsmasq_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $dnsmasq_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for dnsmasq checks
#   Can be defined also by the (top scope) variables $dnsmasq_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $dnsmasq_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $dnsmasq_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $dnsmasq_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $dnsmasq_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (as defined in Example42 firewall module)
#   you want to use to open firewall for dnsmasq port(s)
#   Can be defined also by the (top scope) variables $dnsmasq_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling dnsmasq. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $dnsmasq_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $dnsmasq_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $dnsmasq_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $dnsmasq_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: undef
#
# Default class params - As defined in dnsmasq::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of dnsmasq package
#
# [*service*]
#   The name of dnsmasq service
#
# [*service_status*]
#   If the dnsmasq service init script supports status argument
#
# [*process*]
#   The name of dnsmasq process
#
# [*process_args*]
#   The name of dnsmasq arguments. Used by puppi and monitor.
#   Used only in case the dnsmasq process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user dnsmasq runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $dnsmasq_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $dnsmasq_protocol
#
# [*domain_needed*]
#   Never forward plain names (without a dot or domain part)
#   This option make you a better netizen, since it tell dnsmasq to filter
#   out queries which the public DNS cannot answer, and which load the servers
#   (especially the root servers) unnecessarily.
#   If you have a dial-on-demand link they also stop these requests from
#   bringing up the link unnecessarily.
#   Default: true
#
# [*bogus_priv*]
#   Never forward addresses in the non-routed address spaces.
#   This option make you a better netizen, since it tell dnsmasq to filter
#   out queries which the public DNS cannot answer, and which load the servers
#   (especially the root servers) unnecessarily.
#   If you have a dial-on-demand link they also stop these requests from
#   bringing up the link unnecessarily.
#   Default: true
#
# [*filterwin2k*]
#   Uncomment this to filter useless windows-originated DNS requests
#   which can trigger dial-on-demand links needlessly.
#   Note that (amongst other things) this blocks all SRV requests,
#   so don't use it if you use eg Kerberos, SIP, XMMP or Google-talk.
#   This option only affects forwarding, SRV records originating for
#   dnsmasq (via srv-host= lines) are not suppressed by it.
#   Default: false
#
# [*resolv_file*]
#   File from which you want to get upstream servers from
#   If empty, defaults to /etc/resolv.conf
#   Default: empty
#
# [*strict_order*]
#   By default, dnsmasq will send queries to any of the upstream
#   servers it knows about and tries to favour servers that are known
#   to be up.
#   Enabling this forces dnsmasq to try each query with each server
#   strictly in the order they appear in /etc/resolv.conf
#   Default: false
#
# [*no_resolv*]
#   If you don't want dnsmasq to read /etc/resolv.conf or any other
#   file, getting its servers from this file instead (see below), then
#   set this to true
#   Default: false
#
# [*no_poll*]
#   If you don't want dnsmasq to poll /etc/resolv.conf or other resolv
#   files for changes and re-read them then set this to true.
#   Default: false
#
# [*bind_interfaces*]
#   On systems which support it, dnsmasq binds the wildcard address,
#   even when it is listening on only some interfaces. It then discards
#   requests that it shouldn't reply to. This has the advantage of
#   working even when interfaces come and go and change address. If you
#   want dnsmasq to really bind only the interfaces it is listening on,
#   uncomment this option. About the only time you may need this is when
#   running another nameserver on the same machine.
#   Default: false
#
# [*no_hosts*]
#   If you don't want dnsmasq to read /etc/hosts, set this to true.
#   Default: false
#
# [*addn_hosts*]
#   If you want dnsmasq to read another file/s, as well as /etc/hosts, use this.
#   It can be an array of files to read. See next option to manage these files with
#   dnsmasq module
#   Default = empty
#
# [*addn_hosts_dir*]
#   A directory where you can add extra files holding host entries, using hostconcat define.
#   Take a look at this define to see its usage. If set, it will be added to [*addn_hosts*]
#   Default = empty
#
# [*expand_hosts*]
#   Set this (and domain: see below) if you want to have a domain
#   automatically added to simple names in a hosts-file.
#   Default: false
#
# [*enable_ra*]
#   Do router advertisements for all subnets where we're doing DHCPv6
#   Unless overriden by ra-stateless, ra-names, et al, the router
#   advertisements will have the M and O bits set, so that the clients
#   get addresses and configuration from DHCPv6, and the A bit reset, so the
#   clients don't use SLAAC addresses.
#   Default: false
#
# [*read_ethers*]
#   If this variable is set to true, dnsmasq will read /etc/ethers and act
#   on the ethernet-address/IP pairs found there just as if they had
#   been given as --dhcp-host options. Useful if you keep
#   MAC-address/host mappings there for other purposes.
#   Default: false
#
# [*dhcp_authoritative*]
#   Set the DHCP server to authoritative mode. In this mode it will barge in
#   and take over the lease for any client which broadcasts on the network,
#   whether it has a record of the lease or not. This avoids long timeouts
#   when a machine wakes up on a new network. DO NOT enable this if there's
#   the slightest chance that you might end up accidentally configuring a DHCP
#   server for your campus/company accidentally. The ISC server uses
#   the same option, and this URL provides more information:
#   http://www.isc.org/files/auth.html
#   Default: false
#
# [*no_negcache*]
#   If you want to DISABLE negative caching, ENABLE this.
#   Default: false
#
# [*pxe_prompt*]
#   Do real PXE, rather than just booting a single file (this is an
#   alternative to dhcp-boot). This is the prompt that will be presented to the user.
#   Default = empty
#
# [*pxe_prompt_timeout*]
#   Timeout in seconds before first available action is taken when doing real PXE.
#   Default: 60
#
# [*pxe_service*]
#   Available boot services. for PXE.
#   Default: empty
#
# [*enable_tftp*]
#   Enable dnsmasq's built-in TFTP server
#   Default: false
#
# [*tftp_secure*]
#   Make the TFTP server more secure: with this set, only files owned by
#   the user dnsmasq is running as will be send over the net.
#   Default: false
#
# [*tftp_root*]
#   Set the root directory for files available via FTP.
#
# [*dhcp_lease_max*]
#   Set the limit on DHCP leases, the default is 150
#
# [*dhcp_leasefile*]
#   The DHCP server needs somewhere on disk to keep its lease database.
#   This defaults to a sane location, but if you want to change it, use
#   the line below.
#
# [*dhcp_script*]
#   Run an executable when a DHCP lease is created or destroyed.
#   The arguments sent to the script are "add" or "del",
#   then the MAC address, the IP address and finally the hostname
#   if there is one.
#
# [*cache_size*]
#
# [*local_ttl*]
#   Normally responses which come from /etc/hosts and the DHCP lease
#   file have Time-To-Live set as zero, which conventionally means
#   do not cache further. If you are happy to trade lower load on the
#   server for potentially stale date, you can set a time-to-live (in
#   seconds) here.
#
# [*log_queries*]
#   For debugging purposes, log each DNS query as it passes through
#   dnsmasq.
#   Default: false
#
# [*log_dhcp*]
#   Log lots of extra information about DHCP transactions.
#   Default: false
#
# [*data_dir*]
#   Include another lot of configuration options.
#   Files in this directory,
#   Path of application data directory. Used by puppi
#
# [*mx_target*]
#   Set the default target for MX records created using the localmx option.
#
# [*localmx*]
#   Return an MX record pointing to the mx-target for all local
#   machines.
#
# [*selfmx*]
#   Return an MX record pointing to itself for all local machines.
#
# [*server*]
# [*local*]
# [*address*]
# [*interface*]
# [*except_interface*]
# [*listen_address*]
# [*no_dhcp_interface*]
# [*domain*]
# [*dhcp_range*]
# [*dhcp_host*]
# [*dhcp_ignore*]
# [*dhcp_vendorclass*]
# [*dhcp_userclass*]
# [*dhcp_mac*]
# [*dhcp_option*]
# [*dhcp_boot*]
# [*dhcp_match*]
# [*bogus_nxdomain*]
# [*host_alias*]
# [*mx_host*]
# [*srv_host*]
# [*ptr_record*]
# [*txt_record*]
# [*cname*]
# See README for usage patterns.
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#   Javier Bertoli <javier@netmanagers.com.ar/>
#
class dnsmasq (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' ),
  $domain_needed       = params_lookup( 'domain_needed' ),
  $bogus_priv          = params_lookup( 'bogus_priv' ),
  $filterwin2k         = params_lookup( 'filterwin2k' ),
  $resolv_file         = params_lookup( 'resolv_file' ),
  $strict_order        = params_lookup( 'strict_order' ),
  $no_resolv           = params_lookup( 'no_resolv' ),
  $no_poll             = params_lookup( 'no_poll' ),
  $bind_interfaces     = params_lookup( 'bind_interfaces' ),
  $no_hosts            = params_lookup( 'no_hosts' ),
  $addn_hosts          = params_lookup( 'addn_hosts' ),
  $addn_hosts_dir      = params_lookup( 'addn_hosts_dir' ),
  $expand_hosts        = params_lookup( 'expand_hosts' ),
  $enable_ra           = params_lookup( 'enable_ra' ),
  $read_ethers         = params_lookup( 'read_ethers' ),
  $dhcp_authoritative  = params_lookup( 'dhcp_authoritative' ),
  $no_negcache         = params_lookup( 'no_negcache' ),
  $pxe_prompt          = params_lookup( 'pxe_prompt' ),
  $pxe_prompt_timeout  = params_lookup( 'pxe_prompt_timeout' ),
  $pxe_service         = params_lookup( 'pxe_service' ),
  $enable_tftp         = params_lookup( 'enable_tftp' ),
  $tftp_secure         = params_lookup( 'tftp_secure' ),
  $tftp_root           = params_lookup( 'tftp_root' ),
  $dhcp_lease_max      = params_lookup( 'dhcp_lease_max' ),
  $dhcp_leasefile      = params_lookup( 'dhcp_leasefile' ),
  $dhcp_script         = params_lookup( 'dhcp_script' ),
  $cache_size          = params_lookup( 'cache_size' ),
  $mx_target           = params_lookup( 'mx_target' ),
  $localmx             = params_lookup( 'localmx' ),
  $selfmx              = params_lookup( 'selfmx' ),
  $server              = params_lookup( 'server' ),
  $local               = params_lookup( 'local' ),
  $address             = params_lookup( 'address' ),
  $interface           = params_lookup( 'interface' ),
  $except_interface    = params_lookup( 'except_interface' ),
  $listen_address      = params_lookup( 'listen_address' ),
  $no_dhcp_interface   = params_lookup( 'no_dhcp_interface' ),
  $domain              = params_lookup( 'domain' ),
  $dhcp_range          = params_lookup( 'dhcp_range' ),
  $dhcp_host           = params_lookup( 'dhcp_host' ),
  $dhcp_ignore         = params_lookup( 'dhcp_ignore' ),
  $dhcp_vendorclass    = params_lookup( 'dhcp_vendorclass' ),
  $dhcp_userclass      = params_lookup( 'dhcp_userclass' ),
  $dhcp_mac            = params_lookup( 'dhcp_mac' ),
  $dhcp_option         = params_lookup( 'dhcp_option' ),
  $dhcp_boot           = params_lookup( 'dhcp_boot' ),
  $dhcp_match          = params_lookup( 'dhcp_match' ),
  $bogus_nxdomain      = params_lookup( 'bogus_nxdomain' ),
  $host_alias          = params_lookup( 'host_alias' ),
  $mx_host             = params_lookup( 'mx_host' ),
  $srv_host            = params_lookup( 'srv_host' ),
  $ptr_record          = params_lookup( 'ptr_record' ),
  $txt_record          = params_lookup( 'txt_record' ),
  $cname               = params_lookup( 'cname' ),
  $log_queries         = params_lookup( 'log_queries' ),
  $log_dhcp            = params_lookup( 'log_dhcp' ),
  $local_ttl           = params_lookup( 'local_ttl' )
  ) inherits dnsmasq::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  $bool_domain_needed=any2bool($domain_needed)
  $bool_bogus_priv=any2bool($bogus_priv)
  $bool_filterwin2k=any2bool($filterwin2k)
  $bool_strict_order=any2bool($strict_order)
  $bool_no_resolv=any2bool($no_resolv)
  $bool_no_poll=any2bool($no_poll)
  $bool_bind_interfaces=any2bool($bind_interfaces)
  $bool_no_hosts=any2bool($no_hosts)
  $bool_expand_hosts=any2bool($expand_hosts)
  $bool_enable_ra=any2bool($enable_ra)
  $bool_read_ethers=any2bool($read_ethers)
  $bool_dhcp_authoritative=any2bool($dhcp_authoritative)
  $bool_no_negcache=any2bool($no_negcache)
  $bool_enable_tftp=any2bool($enable_tftp)
  $bool_tftp_secure=any2bool($tftp_secure)
  $bool_log_queries=any2bool($log_queries)
  $bool_log_dhcp=any2bool($log_dhcp)
  $bool_localmx=any2bool($localmx)
  $bool_selfmx=any2bool($selfmx)

  ### Definition of some variables used in the module

  $array_server = is_array($server) ? {
    false     => $server ? {
      ''      => [],
      default => [$server],
    },
    default   => $server,
  }

  $array_local = is_array($local) ? {
    false     => $local ? {
      ''      => [],
      default => [$local],
    },
    default   => $local,
  }

  $array_address = is_array($address) ? {
    false     => $address ? {
      ''      => [],
      default => [$address],
    },
    default   => $address,
  }

  $array_interface = is_array($interface) ? {
    false     => $interface ? {
      ''      => [],
      default => [$interface],
    },
    default   => $interface,
  }

  $array_except_interface = is_array($except_interface) ? {
    false     => $except_interface ? {
      ''      => [],
      default => [$except_interface],
    },
    default   => $except_interface,
  }

  $array_listen_address = is_array($listen_address) ? {
    false     => $listen_address ? {
      ''      => [],
      default => [$listen_address],
    },
    default   => $listen_address,
  }

  $array_no_dhcp_interface = is_array($no_dhcp_interface) ? {
    false     => $no_dhcp_interface ? {
      ''      => [],
      default => [$no_dhcp_interface],
    },
    default   => $no_dhcp_interface,
  }

  $temp_addn_hosts = is_array($addn_hosts) ? {
    false     => $addn_hosts ? {
      ''      => [],
      default => [$addn_hosts],
    },
    default   => $addn_hosts,
  }

  if $dnsmasq::addn_hosts_dir != '' {
    $array_addn_hosts = unique(flatten([$dnsmasq::temp_addn_hosts,[$dnsmasq::addn_hosts_dir]]))
  } else {
    $array_addn_hosts = $dnsmasq::temp_addn_hosts
  }

  $array_domain = is_array($domain) ? {
    false     => $domain ? {
      ''      => [],
      default => [$domain],
    },
    default   => $domain,
  }

  $array_dhcp_range = is_array($dhcp_range) ? {
    false     => $dhcp_range ? {
      ''      => [],
      default => [$dhcp_range],
    },
    default   => $dhcp_range,
  }

  $array_dhcp_host = is_array($dhcp_host) ? {
    false     => $dhcp_host ? {
      ''      => [],
      default => [$dhcp_host],
    },
    default   => $dhcp_host,
  }

  $array_dhcp_ignore = is_array($dhcp_ignore) ? {
    false     => $dhcp_ignore ? {
      ''      => [],
      default => [$dhcp_ignore],
    },
    default   => $dhcp_ignore,
  }

  $array_dhcp_vendorclass = is_array($dhcp_vendorclass) ? {
    false     => $dhcp_vendorclass ? {
      ''      => [],
      default => [$dhcp_vendorclass],
    },
    default   => $dhcp_vendorclass,
  }

  $array_dhcp_userclass = is_array($dhcp_userclass) ? {
    false     => $dhcp_userclass ? {
      ''      => [],
      default => [$dhcp_userclass],
    },
    default   => $dhcp_userclass,
  }

  $array_dhcp_mac = is_array($dhcp_mac) ? {
    false     => $dhcp_mac ? {
      ''      => [],
      default => [$dhcp_mac],
    },
    default   => $dhcp_mac,
  }

  $array_dhcp_option = is_array($dhcp_option) ? {
    false     => $dhcp_option ? {
      ''      => [],
      default => [$dhcp_option],
    },
    default   => $dhcp_option,
  }

  $array_dhcp_boot = is_array($dhcp_boot) ? {
    false     => $dhcp_boot ? {
      ''      => [],
      default => [$dhcp_boot],
    },
    default   => $dhcp_boot,
  }

  $array_dhcp_match = is_array($dhcp_match) ? {
    false     => $dhcp_match ? {
      ''      => [],
      default => [$dhcp_match],
    },
    default   => $dhcp_match,
  }

  $array_bogus_nxdomain = is_array($bogus_nxdomain) ? {
    false     => $bogus_nxdomain ? {
      ''      => [],
      default => [$bogus_nxdomain],
    },
    default   => $bogus_nxdomain,
  }

  $array_host_alias = is_array($host_alias) ? {
    false     => $host_alias ? {
      ''      => [],
      default => [$host_alias],
    },
    default   => $host_alias,
  }

  $array_mx_host = is_array($mx_host) ? {
    false     => $mx_host ? {
      ''      => [],
      default => [$mx_host],
    },
    default   => $mx_host,
  }

  $array_srv_host = is_array($srv_host) ? {
    false     => $srv_host ? {
      ''      => [],
      default => [$srv_host],
    },
    default   => $srv_host,
  }

  $array_ptr_record = is_array($ptr_record) ? {
    false     => $ptr_record ? {
      ''      => [],
      default => [$ptr_record],
    },
    default   => $ptr_record,
  }

  $array_txt_record = is_array($txt_record) ? {
    false     => $txt_record ? {
      ''      => [],
      default => [$txt_record],
    },
    default   => $txt_record,
  }

  $array_cname = is_array($cname) ? {
    false     => $cname ? {
      ''      => [],
      default => [$cname],
    },
    default   => $cname,
  }

  $manage_package = $dnsmasq::bool_absent ? {
    true  => 'absent',
    false => $dnsmasq::version,
  }

  $manage_service_enable = $dnsmasq::bool_disableboot ? {
    true    => false,
    default => $dnsmasq::bool_disable ? {
      true    => false,
      default => $dnsmasq::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $dnsmasq::bool_disable ? {
    true    => 'stopped',
    default =>  $dnsmasq::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $dnsmasq::bool_service_autorestart ? {
    true    => Service[dnsmasq],
    false   => undef,
  }

  $manage_file = $dnsmasq::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $dnsmasq::bool_absent == true
  or $dnsmasq::bool_disable == true
  or $dnsmasq::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $dnsmasq::bool_absent == true
  or $dnsmasq::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $dnsmasq::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $dnsmasq::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $dnsmasq::source ? {
    ''        => undef,
    default   => $dnsmasq::source,
  }

  $manage_file_content = $dnsmasq::template ? {
    ''        => undef,
    default   => template($dnsmasq::template),
  }

  ### Managed resources
  package { $dnsmasq::package:
    ensure  => $dnsmasq::manage_package,
    noop    => $dnsmasq::noops,
  }

  service { 'dnsmasq':
    ensure     => $dnsmasq::manage_service_ensure,
    name       => $dnsmasq::service,
    enable     => $dnsmasq::manage_service_enable,
    hasstatus  => $dnsmasq::service_status,
    pattern    => $dnsmasq::process,
    require    => Package[$dnsmasq::package],
    noop       => $dnsmasq::noops,
  }

  if $dnsmasq::addn_hosts_dir != '' {
    file { 'addnhosts.dir':
      ensure  => directory,
      path    => $dnsmasq::addn_hosts_dir ,
      require => Package[$dnsmasq::package],
      notify  => $dnsmasq::manage_service_autorestart,
      recurse => true,
      purge   => $dnsmasq::bool_source_dir_purge,
      force   => $dnsmasq::bool_source_dir_purge,
      replace => $dnsmasq::manage_file_replace,
      audit   => $dnsmasq::manage_audit,
      noop    => $dnsmasq::noops,
    }
  }

  file { 'dnsmasq.conf':
    ensure  => $dnsmasq::manage_file,
    path    => $dnsmasq::config_file,
    mode    => $dnsmasq::config_file_mode,
    owner   => $dnsmasq::config_file_owner,
    group   => $dnsmasq::config_file_group,
    require => Package[$dnsmasq::package],
    notify  => $dnsmasq::manage_service_autorestart,
    source  => $dnsmasq::manage_file_source,
    content => $dnsmasq::manage_file_content,
    replace => $dnsmasq::manage_file_replace,
    audit   => $dnsmasq::manage_audit,
    noop    => $dnsmasq::noops,
  }

  # The whole dnsmasq configuration directory can be recursively overriden
  if $dnsmasq::source_dir {
    file { 'dnsmasq.dir':
      ensure  => directory,
      path    => $dnsmasq::config_dir,
      require => Package[$dnsmasq::package],
      notify  => $dnsmasq::manage_service_autorestart,
      source  => $dnsmasq::source_dir,
      recurse => true,
      purge   => $dnsmasq::bool_source_dir_purge,
      force   => $dnsmasq::bool_source_dir_purge,
      replace => $dnsmasq::manage_file_replace,
      audit   => $dnsmasq::manage_audit,
      noop    => $dnsmasq::noops,
    }
  }


  ### Include custom class if $my_class is set
  if $dnsmasq::my_class {
    include $dnsmasq::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $dnsmasq::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'dnsmasq':
      ensure    => $dnsmasq::manage_file,
      variables => $classvars,
      helper    => $dnsmasq::puppi_helper,
      noop      => $dnsmasq::noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $dnsmasq::bool_monitor == true {
    if $dnsmasq::port != '' {
      monitor::port { "dnsmasq_${dnsmasq::protocol}_${dnsmasq::port}":
        protocol => $dnsmasq::protocol,
        port     => $dnsmasq::port,
        target   => $dnsmasq::monitor_target,
        tool     => $dnsmasq::monitor_tool,
        enable   => $dnsmasq::manage_monitor,
        noop     => $dnsmasq::noops,
      }
    }
    if $dnsmasq::service != '' {
      monitor::process { 'dnsmasq_process':
        process  => $dnsmasq::process,
        service  => $dnsmasq::service,
        pidfile  => $dnsmasq::pid_file,
        user     => $dnsmasq::process_user,
        argument => $dnsmasq::process_args,
        tool     => $dnsmasq::monitor_tool,
        enable   => $dnsmasq::manage_monitor,
        noop     => $dnsmasq::noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $dnsmasq::bool_firewall == true and $dnsmasq::port != '' {
    firewall { "dnsmasq_${dnsmasq::protocol}_${dnsmasq::port}":
      source      => $dnsmasq::firewall_src,
      destination => $dnsmasq::firewall_dst,
      protocol    => $dnsmasq::protocol,
      port        => $dnsmasq::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $dnsmasq::firewall_tool,
      enable      => $dnsmasq::manage_firewall,
      noop        => $dnsmasq::noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $dnsmasq::bool_debug == true {
    file { 'debug_dnsmasq':
      ensure  => $dnsmasq::manage_file,
      path    => "${settings::vardir}/debug-dnsmasq",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $dnsmasq::noops,
    }
  }

}
