
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(32182);
 script_version ("$Revision: 1.2 $");
 script_name(english: "SuSE Security Update:  squid security update (squid-5155)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch squid-5155");
 script_set_attribute(attribute: "description", value: "A flaw in a previous previous security update could cause
squid to crash under certain circumstances (CVE-2008-1612).
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:P");
script_set_attribute(attribute: "solution", value: "Install the security patch squid-5155");
script_end_attributes();

script_cve_id("CVE-2008-1612");
script_summary(english: "Check for the squid-5155 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"squid-2.6.STABLE14-23.4", release:"SUSE10.3") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
