require 'spec_helper'

describe 'coopr::cli' do
  context 'on Centos 6.9 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.9) do |node|
        node.automatic['domain'] = 'example.com'
      end.converge(described_recipe)
    end

    it 'installs coopr-cli package' do
      expect(chef_run).to install_package('coopr-cli')
    end
  end
end
