#
# Cookbook Name:: apps
# Recipe:: firefox
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
# install firefox
windows_package "Firefox" do 
  source "http://archive.mozilla.org/pub/mozilla.org/mozilla.org/firefox/releases/5.0/win32/en-US/Firefox%20Setup%205.0.exe"
  action :install
end