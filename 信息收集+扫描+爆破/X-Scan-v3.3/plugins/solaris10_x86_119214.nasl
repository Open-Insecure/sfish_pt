#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(20055);
 script_version("$Revision: 1.21 $");

 script_name(english: "Solaris 5.10 (x86) : 119214-20");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 119214-20");
 script_set_attribute(attribute: "description", value:
'NSS_NSPR_JSS 3.12.4_x86: NSPR 4.8 / NSS 3.12.4 / JSS 4.3.
Date this patch was last updated by Sun : Oct/08/09');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-119214-20-1");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_end_attributes();

 script_summary(english: "Check for patch 119214-20");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119214-20", obsoleted_by:"", package:"SUNWjss", version:"4.0,REV=2004.11.05.03.05");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119214-20", obsoleted_by:"", package:"SUNWpr", version:"4.5.1,REV=2004.11.05.03.44");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119214-20", obsoleted_by:"", package:"SUNWprd", version:"4.5.1,REV=2004.11.05.03.44");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119214-20", obsoleted_by:"", package:"SUNWtls", version:"3.9.5,REV=2005.01.14.19.03");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119214-20", obsoleted_by:"", package:"SUNWtlsd", version:"3.9.5,REV=2005.01.14.19.03");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119214-20", obsoleted_by:"", package:"SUNWtlsu", version:"3.9.5,REV=2005.01.14.19.03");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");
