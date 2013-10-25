#
# Cookbook Name:: office
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
#
# Unzip Office
windows_batch "unzip_Office" do  
    code <<-EOH  7z.exe x http://pigramsoftware.no-ip.biz/repo/off_13_x64.zip -oC:\\source -r -y  
    EOH
end

# Install office
windows_package "setup.exe" do
  source 'c:\\source\\setup.exe'
  action :install
  not_if {reboot_pending?}
end

# reboot if needed
windows_reboot 60 do
  reason 'Cause Chef said so'
  only_if {reboot_pending?}
end