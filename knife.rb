# based on http://docs.opscode.com/essentials_repository.html
current_dir = File.dirname __FILE__
user = ENV['OPSCODE_USER'] || ENV['USER']
node_name user

client_key "#{ENV['HOME']}/.chef/#{user}.pem"
validation_client_name "#{ENV['ORGNAME']}-validator"
validation_key "#{ENV['HOME']}/.chef/#{ENV['ORGNAME']}-validator.pem"

chef_server_url "https://api.opscode.com/organizations/#{ENV['ORGNAME']}"

cookbook_path ["#{current_dir}/cookbooks"]
cookbook_copyright "EITA"
cookbook_license "apachev2"
cookbook_email "coletivo@eita.org.br"

#
#log_level :info
#log_location STDOUT

syntax_check_cache_path "#{ENV['HOME']}/.chef/syntax_check_cache"

