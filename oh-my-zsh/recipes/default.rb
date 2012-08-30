#
# Cookbook Name:: oh-my-zsh
# Recipe:: default
#
#             DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                     Version 2, December 2004
#
#  Copyright (C) 2012 Daniel Spangenberg <danielsp@amazon.com>
#
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#
#             DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#   0. You just DO WHAT THE FUCK YOU WANT TO.

include_recipe "git"
include_recipe "zsh"

if ENV.key?('SUDO_USER') && ENV['SUDO_USER'] != ENV['USER']
  user_id = ENV['SUDO_USER']
else
  user_id = ENV['USER']
end

if node[:platform] == "mac_os_x"
  user_home = "/Users/#{user_id}"
else
  user_home = "/home/#{user_id}"
end

git "#{user_home}/.oh-my-zsh" do
  repository "git://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  user user_id
  group user_id
  action :checkout
  not_if "test -d #{user_home}/.oh-my-zsh"
end
