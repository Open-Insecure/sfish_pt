
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2006-1056
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(24035);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 5 2006-1056: qt");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2006-1056 (qt)");
 script_set_attribute(attribute: "description", value: "Qt is a GUI software toolkit which simplifies the task of writing and
maintaining GUI (Graphical User Interface) applications
for the X Window System.

Qt is written in C++ and is fully object-oriented.

This package contains the shared library needed to run qt
applications, as well as the README files for qt.

Update Information:

A security flaw was recently discovered in the way Qt 3.x
pixmap images. This issue can occur only when transforming
specially prepared images from untrusted sources. Qt 3.3.7
corrects this flaw.
");
 script_set_attribute(attribute: "risk_factor", value: "High");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

script_summary(english: "Check for the version of the qt package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"qt-MySQL-3.3.7-0.1.fc5", release:"FC5") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"qt-devel-3.3.7-0.1.fc5", release:"FC5") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"qt-config-3.3.7-0.1.fc5", release:"FC5") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"qt-3.3.7-0.1.fc5", release:"FC5") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"qt-ODBC-3.3.7-0.1.fc5", release:"FC5") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
