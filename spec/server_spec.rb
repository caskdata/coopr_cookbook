require 'spec_helper'

describe 'coopr::server' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command('update-alternatives --display coopr-conf | grep best | awk \'{print $5}\' | grep /etc/coopr/conf.chef').and_return(false)
      end.converge(described_recipe)
    end

    it 'installs coopr-server package' do
      expect(chef_run).to install_package('coopr-server')
    end

    it 'creates coopr-server service, but does not run it' do
      expect(chef_run).not_to start_service('coopr-server')
    end

  end
end
