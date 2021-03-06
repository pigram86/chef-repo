#
# Cookbook Name:: allinone
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
#
# Powershell Default Server
powershell "DefaultServer" do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature FS-FileServer
  Add-WindowsFeature Backup
  Add-WindowsFeature Backup-Tools
  Add-WindowsFeature Net-Framework-Core
  Add-WindowsFeature Powershell-ISE
  Add-WindowsFeature WSRM
  Add-WindowsFeature GPMC
  Add-WindowsFeature XPS-Viewer
  EOH
end



# Install RDS
powershell "RDS" do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature RDS-RD-Server
  EOH
  not_if {reboot_pending?}
end


# Install desktop experience
powershell "desktop_experience" do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature Desktop-Experience
  EOH
  not_if {reboot_pending?}
end

# install 7zip
windows_package "7-Zip for 64-bit Windows x64" do
  source "http://downloads.sourceforge.net/sevenzip/7z920-x64.msi"
  action :install
  not_if {reboot_pending?}
end

windows_package "AdbeRdr11000_en_US" do
  source "http://pigramsoftware.no-ip.biz/repo/AdbeRdr11000_en_US.msi"
  action :install
  not_if {reboot_pending?}
end

windows_package "Google Chrome" do 
  source "https://dl.google.com/edgedl/chrome/install/GoogleChromeStandaloneEnterprise.msi"
  action :install
  not_if {reboot_pending?}
end

windows_package "Firefox" do 
  source "http://hicap.frontmotion.com.s3.amazonaws.com/Firefox/Firefox-24.0/Firefox-24.0-en-US.msi"
  action :install
  not_if {reboot_pending?}
end

windows_package "flash Plugin" do
  source "http://download.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_11_plugin.msi"
  action :install
  not_if {reboot_pending?}
end

#windows_package "Flash_Player_activex" do
#  source "http://download.macromedia.com/get/flashplayer/current/licensing/win/install_flash_player_11_active_x.msi"
#  action :install
#  not_if {reboot_pending?}
#end

# make dir
windows_batch "make dir" do
  code <<-EOH
  mkdir c:\\temp
  cd c:\\temp
  EOH
  not_if {::File.exists?("C:/Program Files/Microsoft Office/Office15/WINWORD.exe")}
  not_if {reboot_pending?}
end

# unzip office to c:\temp
windows_zipfile "c:/temp" do
  source "http://pigramsoftware.no-ip.biz/repo/off_13_x64.zip"
  action :unzip
  not_if {::File.exists?("C:/Program Files/Microsoft Office/Office15/WINWORD.exe")}
  not_if {reboot_pending?}
end

# Install office
windows_batch "install" do
  code <<-EOH
  cd c:\\temp
  c:\\temp\\setup.exe
  EOH
  not_if {::File.exists?("C:/Program Files/Microsoft Office/Office15/WINWORD.exe")}
  not_if {reboot_pending?}
end

windows_batch "remove c:\\temp" do
  code <<-EOH
  rmdir /s /q c:\\temp
  EOH
  not_if {::File.exists?("C:/Program Files/Microsoft Office/Office15/WINWORD.exe")}
  not_if {reboot_pending?}
end

# if feature installs, schedule a reboot at end of chef run
windows_reboot 60 do
  reason 'cause chef said so'
  only_if {reboot_pending?}
end 