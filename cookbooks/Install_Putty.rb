windows_package "PuTTY version 0.06" do |
  source "http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe"
  installer_type :inno
  action :install
end
