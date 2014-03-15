require 'spec_helper'

describe 'dnsmasq::hostconcat' do

  let(:title) { 'dnsmasq::hostconcat' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) do
    {
      :ipaddress      => '10.42.42.42',
      :concat_basedir => '/var/lib/puppet/concat'
    }
  end

  describe 'Test hostconcat define is called with a single name' do
    let(:params) { { :names => 'sample1' } }

#    it { expect { should }.to raise_warning(Puppet::Warning, /dnsmasq::hostconcat is deprecated/) }

    it { should contain_dnsmasq__addhost('dnsmasq::hostconcat').with_ensure('present') }
    it { should contain_dnsmasq__addhost('dnsmasq::hostconcat').with_name('dnsmasq::hostconcat') }
    it { should contain_dnsmasq__addhost('dnsmasq::hostconcat').with_names('sample1') }
    it { should contain_dnsmasq__addhost('dnsmasq::hostconcat').with_ip('') }
  end

  describe 'Test hostconcat define is called an array of names' do
    let(:params) do
      { 
        :ip => '10.11.22.33',
        :ensure => 'absent' ,
        :file => 'bunch_of_hosts',
        :order => 20,
        :names => [ 'sample2', 'sample2.example.com' ] 
      }
    end

    it { should contain_dnsmasq__addhost('dnsmasq::hostconcat').with_ensure('absent') }
    it { should contain_dnsmasq__addhost('dnsmasq::hostconcat').with_names(['sample2', 'sample2.example.com']) }
    it { should contain_dnsmasq__addhost('dnsmasq::hostconcat').with_ip('10.11.22.33') }
    it { should contain_dnsmasq__addhost('dnsmasq::hostconcat').with_file('20-bunch_of_hosts') }
  end
end
