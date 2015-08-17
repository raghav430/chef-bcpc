#
# Cookbook Name:: bcpc-health-check
# Recipe:: worknode
#
# Copyright 2015, Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'bcpc-health-check'

%w{ float_ips }.each do |cc|
  template  "/usr/local/etc/checks/#{cc}.yml" do
    source "#{cc}.yml.erb"
    owner "root"
    group "root"
    mode 00640
  end

  cookbook_file "/usr/local/bin/checks/#{cc}" do
    source "#{cc}"
    owner "root"
    mode "00755"
  end
end
