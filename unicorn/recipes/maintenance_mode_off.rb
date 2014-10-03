execute "rm #{node[:deploy][:nginx][:absolute_document_root]}maintenance_mode" do
  command "/bin/rm #{node[:deploy][:nginx][:absolute_document_root]}maintenance_mode"
end

