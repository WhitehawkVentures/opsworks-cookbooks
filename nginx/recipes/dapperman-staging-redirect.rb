include_recipe "nginx::service"

execute "nxensite dapperman-staging-redirect" do
  command "/usr/sbin/nxensite dapperman-staging-redirect"
  #command "/usr/sbin/nginx -s reload"
  notifies :reload, "service[nginx]"
  not_if do File.symlink?("#{node[:nginx][:dir]}/sites-enabled/dapperman-staging-redirect") end
end 
