#
# Cookbook Name:: trema
# Recipe:: default
#
# Copyright 2015, Tsubasa Takayama
#
# All rights reserved - Do Not Redistribute
#

%w(git ruby ruby-dev libsqlite3-dev libssl-dev libpcap-dev).each do |pkg|
  package pkg do
    action :install
  end
end

gem_package 'bundler' do
  action :install
end

gem_package 'trema' do
  action :install
end
