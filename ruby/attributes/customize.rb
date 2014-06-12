normal[:opsworks][:ruby_version] = '2.1'
normal[:ruby][:major_version] = '2'
normal[:ruby][:minor_version] = '1'
normal[:ruby][:patch_version] = '2'
normal[:ruby][:pkgrelease]    = '1'

_platform = node[:platform]
_platform_version = node[:platform_version]
arch = RUBY_PLATFORM.match(/64/) ? 'amd64' : 'i386'
rhel_arch = RUBY_PLATFORM.match(/64/) ? 'x86_64' : 'i686'
i = node[:ruby]

normal[:ruby][:version] = "#{i[:major_version]}.#{i[:minor_version]}.#{i[:patch_version]}"
normal[:ruby][:full_version] = "#{i[:major_version]}.#{i[:minor_version]}.#{i[:patch_version]}"
normal[:ruby][:deb] = "opsworks-ruby#{i[:major_version]}.#{i[:minor_version]}_#{i[:major_version]}.#{i[:minor_version]}.#{i[:patch_version]}.#{i[:pkgrelease]
}_#{arch}.deb"
normal[:ruby][:rpm] = "opsworks-ruby#{i[:major_version]}#{i[:minor_version]}-#{i[:major_version]}.#{i[:minor_version]}.#{i[:patch_version]}-#{i[:pkgrelease]}.#{rhel_arch}.rpm"
