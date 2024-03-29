Adauth.configure do |c|
	# The Domain name of your Domain
	#
	# This is usually my_company.com or my_company.local
	#
	# If you don't know your domain contact your IT support,
	# it will be the DNS suffix applied to your machines
	c.domain = "intra.itera.no"
	
	# The IP address or Hostname of a DC (Domain Controller) on your network
	#
	# This could be anything and probably wont be 127.0.0.1
	#
	# Again contact your IT Support if you can't work this out
	c.server = "ITE-DC-02-001.intra.itera.no"
	
	# The LDAP base of your domain/intended users
	#
	# For all users in your domain the base would be:
	# dc=example, dc=com
	# OUs can be prepeneded to restrict access to your app
	c.base = "OU=Users,OU=Objectware,DC=intra,DC=itera,DC=no"
	
	# The port isn't always needed as Adauth defaults to 389 the LDAP Port
	#
	# If your DC is on the other side of a firewall you may need to change the port
	#c.port = 389
	
	# Windows Security groups to allow
	#
	# Only allow members of set windows security groups to login
	# 
	# Takes an array for group names
	#c.allowed_groups = ["Group1", "Group2"]
	
	# Windows Security groups to deny
	#
	# Only allow users who aren't in these groups to login
	#
	# Takes an array for group names
	#c.denied_groups = ["Group1", "Group2"]
	
	# Additional single attributes to fetch
	#
	# Single Values to fetch from Active Directory for example phone number
	#
	# Takes a hash in the form { :method_on_Adauth::User => :field_in_ad }
	#c.ad_sv_attrs = { :phone => :telephonenumber }
	
	# Additional multi attributes to fetch
	#
	# Multiple Values to fetch from Active Directory
	#
	# Takes a hash in the form { :method_on_Adauth::User => [ :field_in_ad, Proc.new { |g| operations_to_turn_field_into_array } ] }
	# Example os for groups (already provided)
	#c.ad_mv_attrs(:groups => [ :memberof, Proc.new {|g| g.sub(/.*?CN=(.*?),.*/, '\1')} ])
end