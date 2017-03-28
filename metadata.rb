name             'coopr'
maintainer       'Cask'
maintainer_email 'ops@cask.co'
license          'Apache 2.0'
description      'Installs/Configures Coopr'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

%w(apt java yum).each do |cb|
  depends cb
end

%w(amazon centos redhat scientific ubuntu).each do |os|
  supports os
end

source_url 'https://github.com/caskdata/coopr_cookbook' if respond_to?(:source_url)
issues_url 'https://issues.cask.co/browse/COOK/component/10604' if respond_to?(:issues_url)
