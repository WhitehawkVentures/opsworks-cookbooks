execute "rm #{deploy[:absolute_document_root]}maintenance_mode" do
  command "/bin/rm #{deploy[:absolute_document_root]}maintenance_mode"
end

