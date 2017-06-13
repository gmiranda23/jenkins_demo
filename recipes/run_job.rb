#
# Cookbook Name:: jenkins_demo
# Recipe:: run_job
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

jenkins_job 'hab_demo' do
  parameters(
    'PKG' => 'redis',
    'ORIGIN' => 'mydemo'
  )
  stream_job_output true
  wait_for_completion true
  action :build
end
