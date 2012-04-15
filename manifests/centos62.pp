# Puppet class for CentOS 6.2
# This is for development of zfsonlinux on CentOS 6.2

#class { 'hiera' : }
##Class['hiera'] -> Class['staging']

# Fire up zfsonlinux
class { 'zfsonlinux::install' : }
