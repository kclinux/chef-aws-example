require "chef/provisioning/aws_driver"
require "chef/provisioning"
with_driver "aws"

with_chef_server "https://api.opscode.com/organizations/YOURORGNAME",
  client_name: 'CLIENT',
  signing_key_filename: '/PATH/TO/CLIENT.pem'

machine_batch "allthethings" do
  data_bag("servers").each do |server|
    opts = data_bag_item("servers", server)

    options = {
      bootstrap_options: {
      image_id: opts["image_id"], #IMAGE-ID
      instance_type: opts["instance_type"], # INSTANCE TYPE
      subnet_id: opts["subnet_id"], #SUBNET-ID
      security_group_ids: opts["security_group_ids"], #SG-ID
      key_name: opts["key_name"] # SSH KEY
      },
    # LOOP THROUGH AS MANY TAGS AS YOU HAVE
    aws_tags: opts["aws_tags"].each { |tag_key, tag_value| puts "#{tag_key} => #{tag_value}," },
    associate_public_ip_address: opts["associate_public_ip_address"], # ASSOCIATE A PUBLIC IP
    is_windows: opts["is_windows"] # IS THIS A WINDOWS INSTANCE - THIS EXTRACTS THE ADMINISTRATOR PASSWORD FROM THE PEM
    }

    machine opts["id"] do 
      machine_options options
    end

    machine opts["id"] do
      run_list opts["run_list"] { ["run_list_name"] } # LOAD RUN LIST
    end
  end
end

