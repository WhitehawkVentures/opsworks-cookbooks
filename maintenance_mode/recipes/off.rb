execute "rm #{@application[:absolute_document_root]}maintenance_mode" do
  command "/bin/rm #{@application[:absolute_document_root]}maintenance_mode"
end

