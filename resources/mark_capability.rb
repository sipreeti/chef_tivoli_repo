resource_name :mark_capability
property :capability_name, String, name_property: true, required: true   #Name of the capability
property :capability_version, String, required: true  #Version of the capability
property :capability_path, String, required: true  #Path to capability
property :capability_path_executable, String # Name of the executable in the capability_path
property :add_to_path, [true, false], default: true #Adds capability_path to windows path

action :create do
 #Set the capabilty env variable on the agent for the installed software
 env "AgentCapability.System.#{new_resource.capability_name}.Version" do
   value new_resource.capability_version
 end
   
 #Set the capability Env variable on the Agent for the installed software
 env "AgentCapability.System.#{new_resource.capability_name}.Path" do
   value new_resource.capability_path + (new_resource.capability_path_executable.nil? ? '' : "\\#{new_resource.capability_path_executable}")   
 end
 
 windows_path new_resource.capability_path do
   action :add
   only_if {new_resource.add_to_path}
   end
end