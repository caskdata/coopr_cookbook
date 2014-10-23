require 'spec_helper'

describe 'coopr::default' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command('update-alternatives --display coopr-conf | grep best | awk \'{print $5}\' | grep /etc/cdap/conf.chef').and_return(false)
      end.converge(described_recipe)
    end

  end
end
