# Run chef every 15 minutes
windows_task "Chef Client" do
  user "Administrator"
  password "MCPc2013!"
  cwd "C:\chef\bin"
  command "chef-client -L c:\tmp\ "
  run_level :highest
  frequency :minute
  frequency_modifier 15
end
