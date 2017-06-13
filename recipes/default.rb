#
# Cookbook Name:: jenkins_demo
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Setup Jenkins
include_recipe 'jenkins::master'

# Create the demo Jenkins job
hab_demo = File.join(Chef::Config[:file_cache_path], 'hab_demo.xml')

template hab_demo do
  source 'hab_demo.xml.erb'
end

jenkins_job 'hab_demo' do
  config hab_demo
end

# Give jenkins sudo permissions (required by hab)
node.default['authorization']['sudo']['include_sudoers_d'] = true

sudo 'jenkins' do
  user 'jenkins'
  nopasswd true
end

# Install Habitat
hab_install 'install habitat'

# Clone core package repo for Jenkins
package 'git'

git '/var/lib/jenkins/core-plans' do
  repository 'git://github.com/habitat-sh/core-plans.git'
  revision 'master'
  user 'jenkins'
  group 'jenkins'
end

# Kick off the hab_demo Jenkins job
include_recipe 'jenkins_demo::run_job'
