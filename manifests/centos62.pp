# Puppet class for CentOS 6.2
# This is for development of zfsonlinux on CentOS 6.2

require 'stdlib'
#class { 'hiera' : }

if function_available('hiera') and safe_hiera('hiera_enabled', false) {
    # Fire up zfsonlinux
    #    class { 'zfsonlinux::install' : }
    notice 'We think we have hiera'
} else {
  notice 'no hiera yet'
}
