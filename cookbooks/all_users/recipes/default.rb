 #
 # Cookbook Name:: all_users
 # Recipe:: default
 #
 # Copyright 2015, YOUR_COMPANY_NAME
 #
 # All rights reserved - Do Not Redistribute
 #
 # THIS COOKBOOK REQUIRES THE 'sudo' and 'users' COMMUNITY COOKBOOKS FOUND HERE:
 # USERS: https://supermarket.chef.io/cookbooks/users
 # SUDO: https://supermarket.chef.io/cookbooks/sudo

 # MANAGE USERS IN THIS GROUP AS DEFINED IN users DATA BAG
 users_manage "admin" do
   # CHANGE THE GROUP_ID FOR YOUR ENVIRONMENT
   group_id 110
   action [ :remove, :create ]
 end

 # MANAGE USERS IN THIS GROUP AS DEFINED IN users DATA BAG
 users_manage "sysadmin" do
   # CHANGE THE GROUP_ID FOR YOUR ENVIRONMENT
   group_id 1003 
   action [ :remove, :create ]
 end

 node.default['authorization']['sudo']['passwordless'] = true
 node.default['authorization']['sudo']['groups'] = ['adm','sysadmin']
 include_recipe "sudo"

# VERY IMPORTANT NOTE:
# THE ABOVE WILL OVERWRITE THE /etc/sudoers FILE.
# YOU MUST MAKE SURE THE GROUP YOUR BOOTSTRAP USER IS
# IN IS DEFINED ABOVE REGARDLESS OF WHETHER OR NOT CHEF
# WILL MANAGE THAT USER. FAILURE TO DO THIS WILL RESULT
# IN YOU NOT BEING ABLE TO SSH INTO THE SERVER AS THAT USER.

