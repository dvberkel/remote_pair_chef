#
# Cookbook Name:: remote_pair_chef
# Recipe:: users
#

include_recipe "user"

users = data_bag("users")

users.each do |user_id|
  user = data_bag_item("users", user_id)

  user_account user["username"] do
    comment   user["comment"]
    password  user["password"]
    ssh_keys  user["ssh_keys"]
  end
end
