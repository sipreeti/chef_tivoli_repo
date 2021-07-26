resource_name :install_compressed_file
property :source_location, String, required: true   #Location where the package is sourced from
property :compressed_file_name, String, required: true  #name of downloaded source file , supported format .zip
property :installation_directory, String, default: 'C:\\' #Path of installation directory
property :timeout, Integer, default: 600 #Package installation timeout

action :create do
 #step 1: Download and extract package
 windows_zipfile new_resource.source_location do
   path new_resource.installation_directory
   source new_resource.source_location
   overwrite true
   action :unzip
   
 #step 2: delete cached zip file
 file "C:\\chef\\cache\\#{new_resource.compressed_file_name}" do
   actiona :delete
   retries 2
   retry_delay 10
   backup false
   ignore_failure true
   
 end
end