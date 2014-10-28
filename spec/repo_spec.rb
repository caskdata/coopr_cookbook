require 'spec_helper'

describe 'coopr::repo' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
      end.converge(described_recipe)
    end

    it 'adds cask yum_repository' do
      expect(chef_run).to add_yum_repository('cask')
    end

  end
  context 'on Ubuntu 12.0.4' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: 12.04) do |node|
        node.automatic['domain'] = 'example.com'
      end.converge(described_recipe)
    end

    it 'adds cask apt_repository' do
      expect(chef_run).to add_apt_repository('cask')
    end
  end
end
