#
# Cookbook Name:: xd_vda_hosted
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
windows_zipfile "c:/" do
  source "http://pigramsoftware.no-ip.biz/repo/XD71.zip"
  action :unzip
  not_if {::File.exists?("c:/XenDesktop7_1")}
  not_if {reboot_pending?}
end


windows_batch "XD7 CRTL" do
  code <<-EOH
  cd c:\\XenDesktop7_1
  c:\\XenDesktop7_1\\x64\\XenDesktopSetup\\XenDesktopVdaSetup.exe /quiet /controllers "xdctrl01.daas.local" /enable_hdx_ports /optimize /enable_remote_assistance
  EOH
  not_if {reboot_pending?}
end


# if feature installs, schedule a reboot at end of chef run
windows_reboot 60 do
  reason 'cause chef said so'
  only_if {reboot_pending?}
end   