require 'spec_helper'

describe 'coopr::ui' do
  context 'on Centos 6.6 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.6) do |node|
        node.automatic['domain'] = 'example.com'
      end.converge(described_recipe)
    end

    it 'installs coopr-ui package' do
      expect(chef_run).to install_package('coopr-ui')
    end

    it 'creates coopr-ui service, but does not run it' do
      expect(chef_run).not_to start_service('coopr-ui')
    end
  end
end
