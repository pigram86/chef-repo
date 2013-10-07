#
# Cookbook Name:: RDS
# Recipe:: default
#
# Copyright 2013, Todd Pigram
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

# if feature installs, schedule a reboot at end of chef run
windows_reboot 60 do
  reason 'cause chef said so'
  action :nothing
end 

# Install RDS
powershell "RDS" do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature RDS-RD-Server
  EOH
  notifies :request, 'windows_reboot[60]'
end

# cancel the previously requested reboot
windows_reboot 60 do
  action :cancel
end