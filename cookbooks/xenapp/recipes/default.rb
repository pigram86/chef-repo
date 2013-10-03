#
# Cookbook Name:: xenapp
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

# Installs base roles and features for w2k8r2

# enable FS-Fileserver
windows_feature "FS-Fileserver" do
  action :Install
end

# enable Backup
windows_feature "Backup" do
  action :Install
end

# enable Backup-Tools
windows_feature "Backup-Tools" do
  action :Install
end

# enable Net-Framework-Core
windows_feature "Net-Framework-Core" do
  action :Install
end

# enable Powershell-ISE
windows_feature "Powershell-ISE" do
  action :Install
end

# enable WSRM
windows_feature "WSRM" do
  action :Install
end

