#
# Cookbook Name:: build_cookbook
# Recipe:: deploy
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

case workflow_stage
when "union"

  delivery_push_job "deploy_#{node['delivery']['change']['project']}" do
    command 'jenkins-job'
    nodes ['jenkins_demo']
  end

end
