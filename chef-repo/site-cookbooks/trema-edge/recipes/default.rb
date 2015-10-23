#
# Cookbook Name:: trema-edge
# Recipe:: default
#
# Copyright 2015, Tsubasa Takayama
#
# All rights reserved - Do Not Redistribute
#

%w(git ruby-dev libsqlite3-dev libssl-dev libpcap-dev).each do |package_name|
  package package_name do
    action :install
  end
end

file '/usr/include/ruby-2.1.0/ruby/config.h' do
  owner 'root'
  group 'root'
  mode 0755
  content File.open('/usr/include/x86_64-linux-gnu/ruby-2.1.0/ruby/config.h').read
  action :create
end

gem_package 'bundler' do
  action :install
end

git '/vagrant/trema-edge' do
  repository 'https://github.com/trema/trema-edge.git'
  revision 'master'
  action :sync
end

execute 'bundle install' do
  cwd '/vagrant/trema-edge'
  command 'bundle install'
  action :run
end
