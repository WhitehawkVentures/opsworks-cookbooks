execute "nxensite mintyspice" do
  command "/usr/sbin/nxensite default"
  notifies :reload, "service[nginx]"
  not_if do File.symlink?("#{node[:nginx][:dir]}/sites-enabled/default") end
end