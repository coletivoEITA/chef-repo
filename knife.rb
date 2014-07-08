base_path = "#{File.dirname __FILE__}"
node_name 'brauliobo'
#
#log_level :info
#log_location STDOUT
#
client_key "#{base_path}/brauliobo.pem"
#validation_client_name 'chef-validator'
#validation_key '/etc/chef-server/chef-validator.pem'
#
#chef_server_url 'https://localhost:443'

cookbook_path [
  "#{base_path}/cookbooks",
]

syntax_check_cache_path "#{base_path}/syntax_check_cache"
