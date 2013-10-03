#
# Cookbook Name:: learnchef-batch
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
batch "Which platform?" do
  code <<-EOH
@ECHO OFF

ECHO The platform = %OS% >> %Systemdrive%\platform.txt
  
  EOH
end