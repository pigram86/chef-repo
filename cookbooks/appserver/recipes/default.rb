#
# Cookbook Name:: appserver
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
#
#

windows_feature "AppServer" do
  action :install
end

