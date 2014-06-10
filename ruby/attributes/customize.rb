case node["opsworks"]["ruby_version"]
when "2.1"
  default[:ruby][:major_version] = '2'
  default[:ruby][:minor_version] = '1'
  default[:ruby][:patch_version] = '2'
  default[:ruby][:pkgrelease] = '1'
end
