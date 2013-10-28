#
# Cookbook Name:: wget
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

# install linintl & libiconv
windows_package "libicon" do
  source "http://downloads.sourceforge.net/project/gnuwin32/libiconv/1.9.2-1/libiconv-1.9.2-1.exe?r=http%3A%2F%2Fgnuwin32.sourceforge.net%2Fpackages%2Flibiconv.htm&ts=1382721118&use_mirror=softlayer-dal"
  installer_type :inno
  action :install
end

# install openssl
windows_package "openssl" do
  source "http://downloads.sourceforge.net/gnuwin32/openssl-0.9.8h-1-setup.exe"
  installer_type :inno
  action :install
end

# install wget
windows_package "wget" do
  source "http://downloads.sourceforge.net/gnuwin32/wget-1.11.4-1-setup.exe"
  installer_type :inno
  action :install
end

# add to path
windows_path 'c:\Program Files (x86)\GnuWin32' do
  action :add
end

windows_path 'c:\Program Files\7-Zip' do
  action :add
end

# make dir
windows_batch "make dir" do
  code <<-EOH
  mkdir c:\\temp
  cd c:\\temp
  EOH
end

# unzip office to c:\temp
windows_zipfile "c:/temp" do
  source "http://pigramsoftware.no-ip.biz/repo/off_13_x64.zip"
  action :unzip
  not_if {::File.exists?("c:/temp/setup.exe")}
end



