# coopr cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/coopr.svg)](https://supermarket.getchef.com/cookbooks/coopr)
[![Build Status](http://img.shields.io/travis/caskdata/coopr_cookbook.svg)](http://travis-ci.org/caskdata/coopr_cookbook)

# Requirements

* Oracle Java JDK 6+ (provided by `java` cookbook)
* ZooKeeper (provided by `hadoop` cookbook)
* JDBC-compatible database

# Usage

# Attributes

* `['coopr']['conf_dir']` - The directory used inside `/etc/coopr` and used via the alternatives system. Default `conf.chef`
* `['coopr']['repo']['url']` - Specifies URL for fetching packages
* `['coopr']['repo']['components']` - Repository components to use for APT repositories

# Recipes

* `config` - Configures all services
* `default` - Runs `config` and `repo` recipes
* `fullstack` - Installs all packages and services on a single node
* `ngui` - Installs the `coopr-ngui` package and service
* `provisioner` - Installs the `coopr-provisioner` package and service
* `repo` - Sets up package manager repositories for coopr packages
* `ui` - Installs the `coopr-ui` package and service

# Author

Author:: Cask (<ops@cask.co>)

# Testing

This cookbook requires the `vagrant-omnibus` and `vagrant-berkshelf` Vagrant plugins to be installed.

# License

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this software except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
