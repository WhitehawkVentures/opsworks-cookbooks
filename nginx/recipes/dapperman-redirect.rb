execute "nxensite dapperman-redirect" do
  command "/usr/sbin/nxensite dapperman-redirect"
  notifies :reload, "service[nginx]"
  not_if do File.symlink?("#{node[:nginx][:dir]}/sites-enabled/dapperman-redirect") end
end