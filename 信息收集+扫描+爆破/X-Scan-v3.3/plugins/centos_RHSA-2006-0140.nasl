#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if ( description )
{
 script_id(21881);
 script_version("$Revision: 1.7 $");
 script_name(english:"CentOS : RHSA-2006-0140");
 script_set_attribute(attribute: "synopsis", value: "The remote host is missing a security update.");
 script_set_attribute(attribute: "description", value: 
"The remote CentOS system is missing a security update which has been 
documented in Red Hat advisory RHSA-2006-0140.");
 script_set_attribute(attribute: "see_also", value:
"https://rhn.redhat.com/errata/RHSA-2006-0140.html");
 script_set_attribute(attribute: "solution", value:
"Upgrade to the newest packages by doing :

  yum update");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C");
script_end_attributes();

script_cve_id("CVE-2002-2185","CVE-2004-1057","CVE-2005-2708","CVE-2005-2709","CVE-2005-2973","CVE-2005-3044","CVE-2005-3180","CVE-2005-3275","CVE-2005-3806","CVE-2005-3848","CVE-2005-3857","CVE-2005-3858");

 script_summary(english:"Checks for missing updates on the remote CentOS system");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is (C) 2009 Tenable Network Security, Inc.");
 script_family(english:"CentOS Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/CentOS/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/CentOS/rpm-list") ) exit(1, "Could not obtain the list of packages");

if ( rpm_check(reference:"kernel-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i586") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i686") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-BOOT-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-doc-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-hugemem-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i686") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-hugemem-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i686") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-smp-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i686") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-smp-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i686") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-source-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i386") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i586") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"i686") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"athlon") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-smp-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"athlon") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-smp-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"athlon") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"athlon") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-doc-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-smp-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-smp-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-source-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"x86_64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-doc-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-source-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"kernel-unsupported-2.4.21-37.0.1.EL", release:"CentOS-3", cpu:"ia64") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
