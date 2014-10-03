execute "touch #{@application[:absolute_document_root]}maintenance_mode" do
  command "/usr/bin/touch #{@application[:absolute_document_root]}maintenance_mode"
end
