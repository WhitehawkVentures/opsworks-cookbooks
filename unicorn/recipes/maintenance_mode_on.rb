execute "touch #{node[:deploy][:nginx][:absolute_document_root]}maintenance_mode" do
  command "/usr/bin/touch #{node[:deploy][:nginx][:absolute_document_root]}maintenance_mode"
end
