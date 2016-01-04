require 'spec_helper'

describe 'coopr::default' do
  context 'on Centos 6.6 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command('update-alternatives --display coopr-conf | grep best | awk \'{print $5}\' | grep /etc/coopr/conf.chef').and_return(false)
      end.converge(described_recipe)
    end

    it 'creates coopr user' do
      expect(chef_run).to create_user('coopr')
    end

    it 'create coopr group' do
      expect(chef_run).to create_group('coopr')
    end
  end
end
