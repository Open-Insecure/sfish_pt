
#
# (C) Tenable Network Security
#

if ( ! defined_func("bn_random") ) exit(0);

include("compat.inc");

if(description)
{
 script_id(16486);
 script_version ("$Revision: 1.5 $");
 script_name(english: "HP-UX Security patch : PHSS_23066");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing HP-UX PHSS_23066 security update");
 script_set_attribute(attribute: "description", value:
"OnlineDiag/Support Tool Manager Patch");
 script_set_attribute(attribute: "solution", value: "ftp://ftp.itrc.hp.com//superseded_patches/hp-ux_patches/s700_800/11.X/PHSS_23066");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_end_attributes();

 script_summary(english: "Checks for patch PHSS_23066");
 script_category(ACT_GATHER_INFO);
 script_copyright(english: "This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "HP-UX Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/HP-UX/swlist");
 exit(0);
}

include("hpux.inc");
if ( ! hpux_check_ctx ( ctx:"11.00 " ) )
{
 exit(0);
}

if ( hpux_patch_installed (patches:"PHSS_23066 PHSS_23332 PHSS_23655 PHSS_25843 ") )
{
 exit(0);
}

if ( hpux_check_patch( app:"Sup-Tool-Mgr.STM-UUT-RUN", version:"B.11.00.15.08") )
{
 security_hole(0);
 exit(0);
}
if ( hpux_check_patch( app:"Sup-Tool-Mgr.STM-UI-RUN", version:"B.11.00.15.08") )
{
 security_hole(0);
 exit(0);
}
if ( hpux_check_patch( app:"Sup-Tool-Mgr.STM-CATALOGS", version:"B.11.00.15.08") )
{
 security_hole(0);
 exit(0);
}
if ( hpux_check_patch( app:"Sup-Tool-Mgr.STM-SHLIBS", version:"B.11.00.15.08") )
{
 security_hole(0);
 exit(0);
}
exit(0, "Host is not affected");
