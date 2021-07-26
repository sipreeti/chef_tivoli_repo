# Cookbook:: tivoli_cookbook
# Recipe:: r_tivoli
#
# Copyright:: 2021, The Authors, All Rights Reserved.
log "Log: #(recipe_name} - start"

CAPABILITY_NAME = 'Git.zip'
CAPABILITY_VERSION = '8.6.0.04'
TWS_BASE_DIR = 'C:\Users\reliable\Desktop'
TWSCLI_EXTRACTED_DIR_NAME = 'twscli'
TWSCLI_HOME_DIR = "#{TWS_BASE_DIR}\\#{TWSCLI_EXTRACTED_DIR_NAME}"

installed_compressed_file CAPABILITY_NAME do
  action :create
  source_location 'C:\Users\reliable\Downloads'
  compressed_file_name 'Git.zip'
  installation_directory TWS_BASE_DIR 
  capability_version CAPABILITY_VERSION
end

mark_capability  CAPABILITY_NAME do
  capability_version CAPABILITY_VERSION
  capability_path TWSCLI_HOME_DIR
  capability_path_executable 'Git.exe'
  add_to_path false
end

log "Log: #(recipe_name} - end"


