#
# Cookbook Name:: Citrix_ServerTuning
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

# Citrix_ServerTuning
windows_batch "Citrix_ServerTuning" do
  code <<-EOH
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce

REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run

REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\RunOnce

REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Windows
"ErrorMode"=dword:00000002

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers]
"EventLog"=dword:00000001

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management]
"DisablePagingExecutive"=dword:00000001

[HKEY_USERS\.DEFAULT\Control Panel\Desktop]
"ScreenSaveActive"="0"

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Executive]
"AdditionalCriticalWorkerThreads"=dword:00000040

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\FileSystem]
"NTFSDisable8dot3NameCreation"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Lanmanworkstation\Parameters]
"MaxCmds"=dword:00000800

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MRxSmb\Parameters]
"MultiUserEnabled"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoRemoteRecursiveEvents"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Lanmanserver\Parameters]
"MaxWorkItems"=dword:00002000
"MaxMpxCt"=dword:00000800
"MaxRawWorkItems"=dword:00000200
"MaxFreeConnections"=dword:00000064
"MinFreeConnections"=dword:00000020

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters]
"DisableBandwidthThrottling"=dword:00000001
"DisableLargeMtu"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer]
"NoRemoteRecursiveEvents"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SessionManager\Configuration Manager]
"RegistryLazyFlushInterval"=dword:00000060

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters]
"DisabledComponents"=dword:ffffffff

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Quota System]
"EnableCpuQuota"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"ClearPageFileAtShutdown"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Currentversion\NetCache]
"Enabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction]
"Enable"="N"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout]
"EnableAutoLayout"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BNNS\Parameters]
"EnableOffload"=dword:00000000


[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters]
"DisableTaskOffload"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control]
"ServicesPipeTimeout"=dword:00060000
end