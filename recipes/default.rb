#
# Cookbook Name:: jenkins_demo
# Recipe:: default
#
# Copyright (c) 2017 George Miranda, All Rights Reserved.

# Setup Jenkins
include_recipe 'jenkins::master'
jenkins_plugin 'parameterized-trigger'
jenkins_plugin 'build-pipeline-plugin'

template '/var/lib/jenkins/config.xml' do
  source 'config.xml.erb'
  user 'jenkins'
  group 'jenkins'
   notifies :restart, 'service[jenkins]', :immediately
end

# Create the demo Jenkins job
hab_build = File.join(Chef::Config[:file_cache_path], 'hab_build.xml')
hab_dockerize = File.join(Chef::Config[:file_cache_path], 'hab_dockerize.xml')

template hab_build do
  source 'hab_build.xml.erb'
end

jenkins_job 'hab_build' do
  config hab_build
end

template hab_dockerize do
  source 'hab_dockerize.xml.erb'
end

jenkins_job 'hab_dockerize' do
  config hab_dockerize
end

# Give jenkins sudo permissions (required by hab)
node.default['authorization']['sudo']['include_sudoers_d'] = true

sudo 'jenkins' do
  user 'jenkins'
  nopasswd true
end

# Install Habitat
hab_install 'install habitat'

# We'll need git to clone hab repos
package 'git'

# We need Docker to dockerize hab artifacts
docker_installation 'default' do
  action :create
end

docker_service 'default' do
  action [:create, :start]
end

# Kick off the hab_demo Jenkins job
#include_recipe 'jenkins_demo::run_job'
