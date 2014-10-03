execute "rm #{node[:nginx][:absolute_document_root]}maintenance_mode" do
  command "/bin/rm #{node[:nginx][:absolute_document_root]}maintenance_mode"
end

