# Puppet class for CentOS 6.2
# This is for development of zfsonlinux on CentOS 6.2

require 'stdlib'

# Make sure that we have hiera available, otherwise the staging module
# will error out
if is_function_available('hiera') {
  notice('We think we have hiera')

  if safe_hiera('hiera_enabled', false) {
    notice 'Hiera looks like it\'s configured correctly'
  } else {
    notice 'Hiera function available but not configured'
    ###
    # This will put in $confdir/hiera.yaml.
    # The default backend provide is puppet, so it looks for a class
    # called data::common
    # Variable will be set in $data::common::hiera_enabled
    class { 'hiera' : install_method => 'none' }
  }

} else {
  notice 'no hiera yet'
  # This handles the case where hiera isn't available at all
  # The hiera class puts in place hiera.yaml
  class { 'hiera' : }
}

###
# With the hiera config out of the way, we can try to do what we came
# here to do
if is_function_available('hiera') and safe_hiera('hiera_enabled', false) {
  # Fire up zfsonlinux
  class { 'zfsonlinux::install' : }
}
