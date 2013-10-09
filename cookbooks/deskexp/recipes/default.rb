#
# Cookbook Name:: deskexp
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
#
#

windows_reboot 60 do
  reason 'cause chef said so'
  action :nothing
end 


windows_feature "DesktopExperience" do
  action :install
  notifies :request, 'windows_reboot[60]'
end