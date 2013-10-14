#
# Cookbook Name:: apps
# Recipe:: MS Office 2013
#
# # Copyright 2013, Todd Pigram, LLC
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
# install office x64 
windows_package "Office 2013 Pro Plus x64" do
  source '\\ghhub01.mcpc.com\repo\SW_DVD5_Office_Professional_Plus_2013_64Bit_English_MLF_X18-55297\setup.exe'
  action :install
end