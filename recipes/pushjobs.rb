#
# Cookbook Name:: jenkins_demo
# Recipe:: pushjobs
#
# Copyright (c) 2017 George Miranda, All Rights Reserved.

# Config our jenkins demo options
node.default['push_jobs']['allow_unencrypted']           = true
node.default['push_jobs']['chef']['verify_api_cert']     = false
node.default['push_jobs']['chef']['ssl_verify_mode']     = :verify_none
node.default['push_jobs']['whitelist'] = {
  "chef-client" => "chef-client",
  "jenkins-job" => "chef-client -o 'jenkins_demo::run_job'"
}

# install push-jobs
include_recipe 'push-jobs'
