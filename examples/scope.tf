provider "oneview" {
        ov_username = "<ov-username>"
        ov_password = "<ov-password>"
        ov_endpoint = "<ov-endpoint>"
        ov_sslverify = false
        ov_apiversion = <ov-apiversion>
        ov_ifmatch = "*"
}

data "oneview_scope" "scope" {
	name = "test"
}

data "oneview_fc_network" "fc_network" {
        name = "Fc1"
}

resource "oneview_scope" "scope_inst" {
	name = "TestScope"
	description = "Testing creation of scope"
	type = "ScopeV3"
	initial_scope_uris = ["${data.oneview_scope.scope.uri}"]
	added_resource_uris = ["${data.oneview_fc_network.fc_network.uri}"]
}

# Updates the resource created above 
# To update uncomment the below and ad the attributes  to be updated
/*
resource "oneview_scope" "scope_inst" {
	name = "TestScope_Renamed"
	type = "ScopeV3"
	description = "Rename the Scope"
}

#Importing Existing resource
resource "oneview_scope" "import_scope"{
}
*/
