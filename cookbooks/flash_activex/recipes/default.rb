#
# Cookbook Name:: flash_activex
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
#
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

# Install flash player for internet explorer
windows_package "Flash_Player_activex" do
  source "http://ghhub01.mcpc.com/repo/install_flash_player_11_active_x.msi"
  action :install
end