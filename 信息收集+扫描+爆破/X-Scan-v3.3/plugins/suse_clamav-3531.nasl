
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(27181);
 script_version ("$Revision: 1.6 $");
 script_name(english: "SuSE Security Update:  This update fixes various security bugs in ClamAV. (clamav-3531)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch clamav-3531");
 script_set_attribute(attribute: "description", value: "This update of ClamAV fixes several security bugs.
- wrong calculation of buffer-end
- use strict permissions for temporary files
- heap corruption causing denial-of-service with corrupted
  rar archive
- detect block list loop
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Install the security patch clamav-3531");
script_end_attributes();

script_summary(english: "Check for the clamav-3531 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"clamav-0.90.3-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"clamav-db-0.90.3-2.1", release:"SUSE10.2") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
