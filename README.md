# chef-aws-example
<p>This is a working example of Chef provisioning using the AWS driver.</p>
<p>
Chef-Provisioning was launched in early 2015 and currently leaves a lot to be desired in terms of documentation (as of mid-August, 2015).  This serves as a working example using this new methodology and is aimed at making it easier (copy/paste even) for exploration into this new deployment process that represents "Infrastructure as Code".  It is a more efficient way of standing up new environments across many different Cloud and other hosting platforms without using the former knife commands to stand up servers individually though this particular example is aimed at AWS.  <strong>It is particularly useful for very large environments where running knife commands was previously required to bring up new environments.</strong> 
</p>

<p>
<strong>Pre-requisites:</strong>
<li>Working Chef environment with ChefDK</li>
<li>Chef Server or a Managed Chef account at https://manage.chef.io/</li>
<li>AWS CLI installed and configured with your AWS USER access_key and access_secret_key configured</li>
</p>
<p>
<strong>Steps:</strong>
<li>Provided in this example is also a custom 'all_users' cookbook that gets added to each server by definition in the servers example data_bag.  To use this example cookbook, be sure to review and make appropriate changes to the cookbook.</li>
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
