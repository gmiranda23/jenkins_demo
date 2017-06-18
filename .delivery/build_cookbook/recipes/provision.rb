#
# Cookbook Name:: build_cookbook
# Recipe:: provision
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

case workflow_stage
when 'union'
	include_recipe 'delivery-truck::provision'

	# execute push job here
else
	include_recipe 'delivery-truck::provision'
end
