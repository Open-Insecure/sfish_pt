
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2007-675
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(25941);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 6 2007-675: sysstat");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2007-675 (sysstat)");
 script_set_attribute(attribute: "description", value: "This package provides the sar and iostat commands for Linux. Sar and
iostat enable system monitoring of disk, network, and other IO
activity.



Update information :

* Mon Aug 20 2007 Ivana Varekova <varekova redhat com> - 7.0.0-5
- fix cve-2007-3852 -
sysstat insecure temporary file usage

");
 script_set_attribute(attribute: "risk_factor", value: "High");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

script_summary(english: "Check for the version of the sysstat package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"sysstat-7.0.0-5.fc6", release:"FC6") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
