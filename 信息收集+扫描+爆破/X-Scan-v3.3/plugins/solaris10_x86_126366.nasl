#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(41054);
 script_version("$Revision: 1.1 $");

 script_name(english: "Solaris 10 (x86) : 126366-15");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 126366-15");
 script_set_attribute(attribute: "description", value:
'SunOS 5.10_x86: CDE Desktop changes - Solaris Trusted Extensions.
Date this patch was last updated by Sun : Sep/22/09');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-126366-15-1");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_end_attributes();

 script_summary(english: "Check for patch 126366-15");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"126366-15", obsoleted_by:"", package:"SUNWdttshelp", version:"1.0,REV=10.2006.07.18");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"126366-15", obsoleted_by:"", package:"SUNWdttsu", version:"1.0,REV=10.2006.10.13");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
