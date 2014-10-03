execute "touch #{node[:nginx][:absolute_document_root]}maintenance_mode" do
  command "/usr/bin/touch #{node[:nginx][:absolute_document_root]}maintenance_mode"
end
