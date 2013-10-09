#
# Cookbook Name:: reboot
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
#

windows_reboot 60 do
  reason 'cause chef said so'
  action :request
end 