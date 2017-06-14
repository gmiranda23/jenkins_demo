#
# Cookbook Name:: jenkins_demo
# Recipe:: default
#
# Copyright (c) 2017 George Miranda, All Rights Reserved.

default['jenkins_demo']['job_parameter']['origin'] = 'mydemo'
default['jenkins_demo']['job_parameter']['pkg'] = 'redis'
# in use this fetches from "git://github.com/#{hab_repo}.git"
default['jenkins_demo']['job_parameter']['repo'] = 'habitat-sh/core-plans'
