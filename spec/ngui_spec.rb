require 'spec_helper'

describe 'coopr::ngui' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
      end.converge(described_recipe)
    end

    it 'installs coopr-ngui package' do
      expect(chef_run).to install_package('coopr-ngui')
    end

    it 'creates coopr-ngui service, but does not run it' do
      expect(chef_run).not_to start_service('coopr-ngui')
    end

  end
end
