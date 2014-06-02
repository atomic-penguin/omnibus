#
# Copyright:: Copyright (c) 2012 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['omnibus'].tap do |omnibus|
  omnibus['build_user']      = 'omnibus'
  omnibus['build_user_home'] = nil
  omnibus['install_dir']     = '/opt/omnibus'
  omnibus['cache_dir']       = '/var/cache/omnibus'
  omnibus['ruby_version']    = '2.1.2'

  if platform_family == 'windows'
    omnibus['build_user_group']  = 'Administrators'
    omnibus['install_dir']       = windows_safe_path_join(ENV['SYSTEMDRIVE'], 'omnibus')
    omnibus['cache_dir']         = windows_safe_path_join(ENV['SYSTEMDRIVE'], 'cache', 'omnibus')
    omnibus['ruby_version']      = '2.0.0-p481' # 2.1.1 does not exist for Windows yet! :(
    # Passsword must be clear-text on Windows. You should store this password in
    # an encrypted data bag item and override in your wrapper.
    omnibus['build_user_password'] = 'getonthebus'
  else
    omnibus['build_user_group']  = 'omnibus'
    omnibus['install_dir']       = '/opt/omnibus'
    omnibus['cache_dir']         = '/var/cache/omnibus'
    omnibus['ruby_version']      = '2.1.2'
    # You should store this password in an encrypted data bag item and override
    # in your wrapper. Per Chef's requirements on Unix systems, the password below is
    # hashed using the MD5-based BSD password algorithm 1. The plain text version
    # is 'getonthebus'.
    omnibus['build_user_password'] = '$1$4/uIC5oO$Q/Ggd/DztxWAew8/MKr9j0'
  end
end
