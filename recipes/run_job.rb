#
# Cookbook Name:: jenkins_demo
# Recipe:: run_job
#
# Copyright (c) 2017 George Miranda, All Rights Reserved.

jenkins_job 'hab_build' do
  parameters(
    'PKG' => node['jenkins_demo']['job_parameter']['pkg'],
    'ORIGIN' => node['jenkins_demo']['job_parameter']['origin'],
    'REPO' => node['jenkins_demo']['job_parameter']['repo']
  )
  stream_job_output true
  wait_for_completion true
  action :build
end
