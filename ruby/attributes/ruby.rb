Chef::Log.info("JBB: running ruby/attributes/ruby.rb")

include_attribute 'opsworks_initial_setup::default'
include_attribute 'opsworks_commons::default'

_platform = node[:platform]
_platform_version = node[:platform_version]
arch = RUBY_PLATFORM.match(/64/) ? 'amd64' : 'i386'
rhel_arch = RUBY_PLATFORM.match(/64/) ? 'x86_64' : 'i686'

# ruby_version 1.8.7 is handled by 'ruby-enterprise'
case node["opsworks"]["ruby_version"]
when "2.1"
  default[:ruby][:major_version] = '2'
  default[:ruby][:minor_version] = '1'
  set[:ruby][:patch_version] = '2'
  default[:ruby][:pkgrelease]    = '1'

  i = node[:ruby]
  default[:ruby][:version] = "#{i[:major_version]}.#{i[:minor_version]}.#{i[:patch_version]}"
  default[:ruby][:full_version] = default[:ruby][:version]
  default[:ruby][:deb] = "opsworks-ruby#{i[:major_version]}.#{i[:minor_version]}_#{i[:major_version]}.#{i[:minor_version]}.#{i[:patch_version]}.#{i[:pkgrelease]}_#{arch}.deb"
  default[:ruby][:rpm] = "opsworks-ruby#{i[:major_version]}#{i[:minor_version]}-#{i[:major_version]}.#{i[:minor_version]}.#{i[:patch_version]}-#{i[:pkgrelease]}.#{rhel_arch}.rpm"
when "2.0.0"
  default[:ruby][:major_version] = '2.0'
  default[:ruby][:full_version] = '2.0.0'
  default[:ruby][:patch] = 'p247'
  default[:ruby][:pkgrelease] = '1'
when "1.9.3"
  default[:ruby][:major_version] = '1.9'
  default[:ruby][:full_version] = '1.9.3'
  default[:ruby][:patch] = 'p448'
  default[:ruby][:pkgrelease] = '1'
else
  default[:ruby][:major_version] = ''
  default[:ruby][:full_version] = ''
  default[:ruby][:patch] = ''
  default[:ruby][:pkgrelease] = ''
end

default[:ruby][:version] = "#{node[:ruby][:full_version]}#{node[:ruby][:patch]}"

default[:ruby][:deb] = "opsworks-ruby#{node[:ruby][:major_version]}_#{node[:ruby][:full_version]}-#{node[:ruby][:patch]}.#{node[:ruby][:pkgrelease]}_#{arch}.deb"
default[:ruby][:deb_url] = "#{node[:opsworks_commons][:assets_url]}/packages/#{node[:platform]}/#{node[:platform_version]}/#{node[:ruby][:deb]}"

default[:ruby][:rpm] = "opsworks-ruby#{node[:ruby][:major_version].delete('.')}-#{node[:ruby][:full_version]}-#{node[:ruby][:patch]}-#{node[:ruby][:pkgrelease]}.#{rhel_arch}.rpm"
default[:ruby][:rpm_url] = "#{node[:opsworks_commons][:assets_url]}/packages/#{node[:platform]}/#{node[:platform_version]}/#{node[:ruby][:rpm]}"
