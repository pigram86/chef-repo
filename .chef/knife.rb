current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "toddpigram"
client_key               "#{current_dir}/toddpigram.pem"
validation_client_name   "anyplacecloud-validator"
validation_key           "#{current_dir}/anyplacecloud-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/anyplacecloud"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright       "Todd Pigram"
cookbook_license         "apachev2"
cookbook_email           "todd@toddpigram.com"