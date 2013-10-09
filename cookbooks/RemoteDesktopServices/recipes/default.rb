#
# Cookbook Name:: RemoteDesktopServices
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
#

windows_reboot 60 do
  reason 'cause chef said so'
  action :nothing
end 


windows_feature "Remote-Desktop-Services" do
  action :install
end
  
windows_feature "AppServer" do
  action :install
  notifies :request, 'windows_reboot[60]'
end