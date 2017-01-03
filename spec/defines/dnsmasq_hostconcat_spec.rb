require 'spec_helper'

describe 'dnsmasq::hostconcat' do
  let(:title) { 'dnsmasq::hostconcat' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) do
    {
      ipaddress: '10.42.42.42',
      concat_basedir: '/var/lib/puppet/concat'
    }
  end

  describe 'Test hostconcat define is called with a single name' do
    let(:params) { { names: 'sample1' } }

    it { is_expected.to contain_dnsmasq__addhost('dnsmasq::hostconcat').with_ensure('present') }
    it { is_expected.to contain_dnsmasq__addhost('dnsmasq::hostconcat').with_name('dnsmasq::hostconcat') }
    it { is_expected.to contain_dnsmasq__addhost('dnsmasq::hostconcat').with_names('sample1') }
    it { is_expected.to contain_dnsmasq__addhost('dnsmasq::hostconcat').with_ip('') }
  end

  describe 'Test hostconcat define is called an array of names' do
    let(:params) do
      {
        ip: '10.11.22.33',
        ensure: 'absent' ,
        file: 'bunch_of_hosts',
        order: 20,
        names: ['sample2', 'sample2.example.com']
      }
    end

    it { is_expected.to contain_dnsmasq__addhost('dnsmasq::hostconcat').with_ensure('absent') }
    it { is_expected.to contain_dnsmasq__addhost('dnsmasq::hostconcat').with_names(['sample2', 'sample2.example.com']) }
    it { is_expected.to contain_dnsmasq__addhost('dnsmasq::hostconcat').with_ip('10.11.22.33') }
    it { is_expected.to contain_dnsmasq__addhost('dnsmasq::hostconcat').with_file('20-bunch_of_hosts') }
  end
end
