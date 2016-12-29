require 'spec_helper'

describe 'dnsmasq' do

  let(:title) { 'dnsmasq' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { { ipaddress: '10.42.42.42',concat_basedir: '/var/lib/puppet/concat', operatingsystemrelease: '14.04' } }

  describe 'Test standard installation' do
    it { is_expected.to contain_package('dnsmasq').with_ensure('present') }
    it { is_expected.to contain_service('dnsmasq').with_ensure('running') }
    it { is_expected.to contain_service('dnsmasq').with_enable('true') }
  end

  describe 'Test installation of a specific version' do
    let(:params) { { version: '1.0.42' } }
    it { is_expected.to contain_package('dnsmasq').with_ensure('1.0.42') }
  end

  describe 'Test standard installation with monitoring and firewalling' do
    let(:params) { { monitor: true , firewall: true, port: '42', protocol: 'tcp' } }
    it { is_expected.to contain_package('dnsmasq').with_ensure('present') }
    it { is_expected.to contain_service('dnsmasq').with_ensure('running') }
    it { is_expected.to contain_service('dnsmasq').with_enable('true') }
    it { is_expected.to contain_file('dnsmasq.conf').with_ensure('present') }
    it { is_expected.to contain_monitor__process('dnsmasq_process').with_enable('true') }
    it { is_expected.to contain_firewall('dnsmasq_tcp_42').with_enable('true') }
  end

  describe 'Test decommissioning - absent' do
    let(:params) { { absent: true, monitor: true , firewall: true, port: '42', protocol: 'tcp' } }
    it 'should remove Package[dnsmasq]' do
      is_expected.to contain_package('dnsmasq').with_ensure('absent')
    end
    it 'should stop Service[dnsmasq]' do
      is_expected.to contain_service('dnsmasq').with_ensure('stopped')
    end
    it 'should not enable at boot Service[dnsmasq]' do
      is_expected.to contain_service('dnsmasq').with_enable('false')
    end
    it 'should remove dnsmasq configuration file' do
      is_expected.to contain_file('dnsmasq.conf').with_ensure('absent')
    end
    it { is_expected.to contain_monitor__process('dnsmasq_process').with_enable('false') }
    it { is_expected.to contain_firewall('dnsmasq_tcp_42').with_enable('false') }
  end

  describe 'Test decommissioning - disable' do
    let(:params) { { disable: true, monitor: true , firewall: true, port: '42', protocol: 'tcp' } }
    it { is_expected.to contain_package('dnsmasq').with_ensure('present') }
    it 'should stop Service[dnsmasq]' do
      is_expected.to contain_service('dnsmasq').with_ensure('stopped')
    end
    it 'should not enable at boot Service[dnsmasq]' do
      is_expected.to contain_service('dnsmasq').with_enable('false')
    end
    it { is_expected.to contain_file('dnsmasq.conf').with_ensure('present') }
    it { is_expected.to contain_monitor__process('dnsmasq_process').with_enable('false') }
    it { is_expected.to contain_firewall('dnsmasq_tcp_42').with_enable('false') }
  end

  describe 'Test decommissioning - disableboot' do
    let(:params) { { disableboot: true, monitor: true , firewall: true, port: '42', protocol: 'tcp' } }
    it { is_expected.to contain_package('dnsmasq').with_ensure('present') }
    it { is_expected.to_not contain_service('dnsmasq').with_ensure('present') }
    it { is_expected.to_not contain_service('dnsmasq').with_ensure('absent') }
    it 'should not enable at boot Service[dnsmasq]' do
      is_expected.to contain_service('dnsmasq').with_enable('false')
    end
    it { is_expected.to contain_file('dnsmasq.conf').with_ensure('present') }
    it { is_expected.to contain_monitor__process('dnsmasq_process').with_enable('false') }
    it { is_expected.to contain_firewall('dnsmasq_tcp_42').with_enable('true') }
  end

  describe 'Test noops mode' do
    let(:params) { { noops: true, monitor: true , firewall: true, port: '42', protocol: 'tcp' } }
    it { is_expected.to contain_package('dnsmasq').with_noop('true') }
    it { is_expected.to contain_service('dnsmasq').with_noop('true') }
    it { is_expected.to contain_file('dnsmasq.conf').with_noop('true') }
    it { is_expected.to contain_monitor__process('dnsmasq_process').with_noop('true') }
    it { is_expected.to contain_monitor__process('dnsmasq_process').with_noop('true') }
    it { is_expected.to contain_monitor__port('dnsmasq_tcp_42').with_noop('true') }
    it { is_expected.to contain_firewall('dnsmasq_tcp_42').with_noop('true') }
  end

  describe 'Test customizations - template' do
    let(:params) { { template: "dnsmasq/spec.erb" , options: { 'opt_a' => 'value_a' } } }
    it 'should generate a valid template' do
      is_expected.to contain_file('dnsmasq.conf').with_content(/fqdn: rspec.example42.com/)
    end
    it 'should generate a template that uses custom options' do
      is_expected.to contain_file('dnsmasq.conf').with_content(/value_a/)
    end
  end

  describe 'Test customizations - source' do
    let(:params) { { source: "puppet:///modules/dnsmasq/spec" } }
    it { is_expected.to contain_file('dnsmasq.conf').with_source('puppet:///modules/dnsmasq/spec') }
  end

  describe 'Test customizations - source_dir' do
    let(:params) { { source_dir: "puppet:///modules/dnsmasq/dir/spec" , source_dir_purge: true } }
    it { is_expected.to contain_file('dnsmasq.dir').with_source('puppet:///modules/dnsmasq/dir/spec') }
    it { is_expected.to contain_file('dnsmasq.dir').with_purge('true') }
    it { is_expected.to contain_file('dnsmasq.dir').with_force('true') }
  end

  describe 'Test customizations - empty source_dir' do
    let(:params) { { source_dir: "" , source_dir_purge: true } }
    it { is_expected.to_not contain_file('dnsmasq.dir').with_source('puppet:///modules/dnsmasq/dir/spec') }
    it { is_expected.to_not contain_file('dnsmasq.dir').with_purge('true') }
    it { is_expected.to_not contain_file('dnsmasq.dir').with_force('true') }
  end

  describe 'Test customizations - custom class' do
    let(:params) { { my_class: "dnsmasq::spec" } }
    it { is_expected.to contain_file('dnsmasq.conf').with_content(/rspec.example42.com/) }
  end

  describe 'Test service autorestart' do
    let(:params) { { service_autorestart: "no" } }
    it 'should not automatically restart the service, when service_autorestart => false' do
      is_expected.to contain_file('dnsmasq.conf').without_notify
    end
  end

  describe 'Test Puppi Integration' do
    let(:params) { { puppi: true, puppi_helper: "myhelper" } }
    it { is_expected.to contain_puppi__ze('dnsmasq').with_helper('myhelper') }
  end

  describe 'Test Monitoring Tools Integration' do
    let(:params) { { monitor: true, monitor_tool: "puppi" } }
    it { is_expected.to contain_monitor__process('dnsmasq_process').with_tool('puppi') }
  end

  describe 'Test Firewall Tools Integration' do
    let(:params) { { firewall: true, firewall_tool: "iptables" , protocol: "tcp" , port: "42" } }
    it { is_expected.to contain_firewall('dnsmasq_tcp_42').with_tool('iptables') }
  end

  describe 'Test OldGen Module Set Integration' do
    let(:params) { { monitor: "yes" , monitor_tool: "puppi" , firewall: "yes" , firewall_tool: "iptables" , puppi: "yes" , port: "42" , protocol: 'tcp' } }
    it { is_expected.to contain_monitor__process('dnsmasq_process').with_tool('puppi') }
    it { is_expected.to contain_firewall('dnsmasq_tcp_42').with_tool('iptables') }
    it { is_expected.to contain_puppi__ze('dnsmasq').with_ensure('present') }
  end

  describe 'Test params lookup' do
    let(:facts) { { monitor: true , ipaddress: '10.42.42.42' } }
    let(:params) { { port: '42' } }
    it 'should honour top scope global vars' do
      is_expected.to contain_monitor__process('dnsmasq_process').with_enable('true')
    end
  end

  describe 'Test params lookup' do
    let(:facts) { { dnsmasq_monitor: true , ipaddress: '10.42.42.42' } }
    let(:params) { { port: '42' } }
    it 'should honour module specific vars' do
      is_expected.to contain_monitor__process('dnsmasq_process').with_enable('true')
    end
  end

  describe 'Test params lookup' do
    let(:facts) { { monitor: false , dnsmasq_monitor: true , ipaddress: '10.42.42.42' } }
    let(:params) { { port: '42' } }
    it 'should honour top scope module specific over global vars' do
      is_expected.to contain_monitor__process('dnsmasq_process').with_enable('true')
    end
  end

  describe 'Test params lookup' do
    let(:facts) { { monitor: false , ipaddress: '10.42.42.42' } }
    let(:params) { { monitor: true , firewall: true, port: '42' } }
    it 'should honour passed params over global vars' do
      is_expected.to contain_monitor__process('dnsmasq_process').with_enable('true')
    end
  end
end
