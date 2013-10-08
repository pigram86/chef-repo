#
# Cookbook Name:: RDS
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

# disable ipv6
windows_registry 'HKLM\SYSTEM\CurrentContolSet\Services\Tcpip6\Parameters' do
  values 'DisableComponents' => ffffffff  
  type :dword
end

# disable dfss
windows_registry 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Quota System' do
  value 'EnableCpuQuota' => 00000000
  type :dword
end

# delete run 1
windows_registry 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' do
  valuetodelete => ''
end

# delete runonce
windows_registry 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce' do
  valuetodelete => ''
end

# delete x64 run 
windows_registry 'HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run' do
  valuetodelete => ''
end

# delete x64 runonce
windows_registry 'HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\RunOnce' do
  valuetodelete => ''
end

# set errormode
windows_registry 'HKLM\System\CurrentControlSet\Control\Windows' do
  value 'ErrorMode' => 00000002
  type :dword
end

# eventlog
windows_registry 'HKLM\System\CurrentControlSet\Control\Print\Providers' do
   value 'EventLog' => 00000001
   type :dword
end

# disable page executive
windows_registry 'HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management' do
  value 'DisablePagingExecutive' => 00000001
  type :dword
end

# Screen saveer
windows_registry 'HKEY_USERS\.DEFAULT\Control Panel\Desktop' do
  value 'ScreenSaveActive' => 0
end

# set additional threads
windows_registry 'HKLM\System\CurrentControlSet\Control\Session Manager\Executive' do
  value 'AdditionalCriticalWorkerThreads' => 00000040
  type :dword
end

# disable 8.3
windows_registry 'HKLM\System\CurrentControlSet\Control\FileSystem' do
  value 'NTFSDisable8dot3NameCreation' => 00000001
  type :dword
end

# enable multiuser
windows_registry 'HKLM\SYSTEM\CurrentControlSet\Services\MRxSmb\Parameters' do
  value 'MultiUserEnabled' => 00000001
  type :dword
end

# set Max Parameters
windows_registry 'HKLM\SYSTEM\CurrentControlSet\Services\Lanmanserver\Parameters' do
  value 'MaxWorkItems' => 00002000
  type :dword
  value 'MaxMpxCt' => 00000800
  type :dword
  value 'MaxRawWorkItems' => 00000200
  type :dword
  value 'MaxFreeConnections' => 00000064
  type :dword
  value 'MinFreeConnections' => 00000020
  type :dword
  value 'MaxCmds' => 00000800
  type :dword
end

# Set Parameters
windows_registry 'HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' do
  value 'DisableBandwidthThrottling' => 00000001
  type :dword
  value 'DisableLargeMtu' => 00000000
  type :dword
end

# set NoRemote Recursive Events
windows_registry 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
  value 'NoRemoteRecursiveEvents' => 00000001
  type :dword
end

# set registry lazy flush interval
windows_registry 'HKLM\SYSTEM\CurrentControlSet\Control\SessionManager\Configuration Manager' do
  value 'RegistryLazyFlushInterval' => 00000060
  type :dword
end

# set clearpagefileat shutdown
windows_registry 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management' do
  value 'ClearPageFileAtShutdown' => 00000000
  type :dword
end

# disable netcache
windows_registry 'HKLM\SOFTWARE\Microsoft\Windows\Currentversion\NetCache' do
  value 'Enabled' => 00000000
  type :dword
end

# set Enable boot optimization
windows_registry 'HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction' do
  valube 'Enable' => 'N'
end
# set EnableAutoLayout
windows_registry 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout' do
  value 'EnableAutoLayout' => 00000000
  type :dword
end

# Set EnableOffload
windows_registry 'HKLM\SYSTEM\CurrentControlSet\Services\BNNS\Parameters' do
  value 'EnableOffload' => 00000000
  type :dword
end

# set DisableTaskOffload
windows_registry 'HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters' do
  value 'DisableTaskOffload' => 00000001
  type :dword
end

# set ServicesPipeTimout
windows_registry 'HKLM\SYSTEM\CurrentControlSet\Control' do
  value 'ServicesPipeTimeout' => 00060000
  type :dword
end

