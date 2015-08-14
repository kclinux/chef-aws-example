# chef-aws-example
This is a working example of a Chef provisioning using the AWS driver<br>

<p>
<strong>Pre-requisites:</strong>
<li>Working Chef environment with ChefDK</li>
<li>Chef Server or a Managed Chef account at https://manage.chef.io/</li>
<li>AWS CLI installed and configured with your AWS USER access_key and access_secret_key configured</li>
</p>
<p>
<strong>Steps:</strong>
<li>Create a data bag:<br>
<block>knife data bag create servers</block></li>
<li>Put your server definition json files in the data bag and add as many as you need.  See data_bags/servers for example</li>
<li>Run the provision script with chef-client to build the environment<br>
<block>chef-client -z scripts/provision.rb</block></li>

</p>

<p>
<strong>Outstanding pieces:</strong>
<li>Define network topology in data bag and adjust provision script to use those variables (currently requires that Security Groups, VPCs, Subnets, etc. already exists.</li>
<li>Adjust provision script to account for empty run_list.  Currently it must be populated with at least a role or recipe</li>

</p>
