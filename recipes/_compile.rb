#
# Cookbook Name:: omnibus
# Recipe:: _compile
#
# Copyright 2014, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef-sugar::default'
return if windows?

#
# This recipe is used to install additional packages/utilities that are not
# included by default in the build-essential cookbook. In the long term, this
# recipe should just "go away" and the build-essential cookbook should become
# more awesome.
#

include_recipe 'omnibus::_common'
include_recipe 'build-essential::default'

# Use homebrew as the default package manager on OSX. We cannot install homebrew
# until AFTER we have installed the XCode command line tools via build-essential
include_recipe 'homebrew::default' if mac_os_x?
