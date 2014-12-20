require 'spec_helper'

describe 'coopr::config' do
  context 'on Centos 6.5 x86_64' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: 6.5) do |node|
        node.automatic['domain'] = 'example.com'
        stub_command('update-alternatives --display coopr-conf | grep best | awk \'{print $5}\' | grep /etc/coopr/conf.chef').and_return(false)
      end.converge(described_recipe)
    end

    it 'creates /etc/coopr/conf.chef directory' do
      expect(chef_run).to create_directory('/etc/coopr/conf.chef')
    end

    %w(
      coopr-site.xml
      provisioner-site.xml
    ).each do |file|
      it "creates #{file} from template" do
        expect(chef_run).to create_template("/etc/coopr/conf.chef/#{file}")
      end
    end

    it 'runs execute[update coopr-conf alternatives]' do
      expect(chef_run).to run_execute('update coopr-conf alternatives')
    end
  end
end
