execute "touch #{deploy[:absolute_document_root]}maintenance_mode" do
  command "/usr/bin/touch #{deploy[:absolute_document_root]}maintenance_mode"
end
