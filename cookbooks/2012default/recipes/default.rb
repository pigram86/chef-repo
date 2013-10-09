#
# Cookbook Name:: 2012default
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
#

# install default roles w/dism
windows_feature "CoreFileServer" do
  action :install
end 

windows_feature "WindowsServerBackup" do
  action :install
end

windows_feature "WindowsServerBackupCommandlet" do
  action :install
end

windows_feature "WSRM" do
  action :install
end

windows_feature "NetFx3" do
  action :install
end

