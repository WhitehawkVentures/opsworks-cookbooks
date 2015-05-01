include_recipe "nginx::service"

execute "nxensite touchofmodern-redirect" do
  command "/usr/sbin/nxensite touchofmodern-redirect"
  #command "/usr/sbin/nginx -s reload"
  notifies :reload, "service[nginx]"
  not_if do File.symlink?("#{node[:nginx][:dir]}/sites-enabled/touchofmodern-redirect") end
end