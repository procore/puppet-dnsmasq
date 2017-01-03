require 'spec_helper'

describe 'dnsmasq::addhost' do

  let(:title) { 'dnsmasq::addhost' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) do
    {
      ipaddress: '10.42.42.42',
      dnsmasq_addn_hosts_dir: '/some/dir',
      concat_basedir: '/var/lib/puppet/concat'
    }
  end

  describe 'Test addhost define is called with a single name' do
    let(:params) { { names: 'sample1' } }

    it { is_expected.to contain_concat__fragment('dnsmasq_addn_hosts_dnsmasq::addhost').with_ensure('present') }
    it { is_expected.to contain_concat__fragment('dnsmasq_addn_hosts_dnsmasq::addhost').with_target('/some/dir/extra_records.hosts') }
    it { is_expected.to contain_concat__fragment('dnsmasq_addn_hosts_dnsmasq::addhost').with_content("dnsmasq::addhost sample1\n") }
    it { is_expected.to contain_concat__fragment('dnsmasq_addn_hosts_dnsmasq::addhost').with_order('10') }
  end

  describe 'Test addhost define is called an array of names' do
    let(:params) do
      {
        ip: '10.11.22.33',
        file: 'my/shiny/bunch_of_hosts',
        names: ['sample2', 'sample2.example.com']
      }
    end

    it { is_expected.to contain_concat__fragment('dnsmasq_addn_hosts_dnsmasq::addhost').with_ensure('present') }
    it { is_expected.to contain_concat__fragment('dnsmasq_addn_hosts_dnsmasq::addhost').with_target('/some/dir/my/shiny/bunch_of_hosts') }
    it { is_expected.to contain_concat__fragment('dnsmasq_addn_hosts_dnsmasq::addhost').with_content("10.11.22.33 sample2 sample2.example.com\n") }
    it { is_expected.to contain_concat__fragment('dnsmasq_addn_hosts_dnsmasq::addhost').with_order('10') }
  end
end
