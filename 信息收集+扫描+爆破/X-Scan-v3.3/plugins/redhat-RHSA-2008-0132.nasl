
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(40714);
 script_version ("$Revision: 1.2 $");
 script_name(english: "RHSA-2008-0132: java");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2008-0132");
 script_set_attribute(attribute: "description", value: '
  Updated java-1.4.2-ibm packages that fix several security issues are now
  available for Red Hat Enterprise Linux 3 and 4 Extras, and 5
  Supplementary.

  This update has been rated as having critical security impact by the Red
  Hat Security Response Team.

  IBM\'s 1.4.2 SR10 Java release includes the IBM Java 2 Runtime Environment
  and the IBM Java 2 Software Development Kit.

  The Java Secure Socket Extension (JSSE) component did not correctly process
  SSL/TLS handshake requests. A remote attacker who is able to connect to a
  JSSE-based service could trigger this flaw leading to a denial-of-service.
  (CVE-2007-3698)

  A flaw was found in the way the Java Runtime Environment processes font
  data. An untrusted applet could elevate its privileges, allowing the applet
  to perform actions with the same permissions as the logged in user. It may
  also be possible to crash a server application which processes untrusted
  font information from a third party. (CVE-2007-4381)

  The applet caching mechanism of the Java Runtime Environment (JRE) did not
  correctly process the creation of network connections. A remote attacker
  could use this flaw to create connections to services on machines other
  than the one that the applet was downloaded from. (CVE-2007-5232)

  Multiple vulnerabilities existed in Java Web Start allowing an untrusted
  application to determine the location of the Java Web Start cache.
  (CVE-2007-5238)

  Untrusted Java Web Start Applications or Java Applets were able to drag and
  drop a file to a Desktop Application. A user-assisted remote attacker could
  use this flaw to move or copy arbitrary files. (CVE-2007-5239)

  The Java Runtime Environment allowed untrusted Java Applets or applications
  to display oversized Windows. This could be used by remote attackers to
  hide security warning banners. (CVE-2007-5240)

  Unsigned Java Applets communicating via a HTTP proxy could allow a remote
  attacker to violate the Java security model. A cached malicious Applet
  could create network connections to services on other machines.
  (CVE-2007-5273)

  Unsigned Applets loaded with Mozilla Firefox or Opera browsers allowed
  remote attackers to violate the Java security model. A cached malicious
  Applet could create network connections to services on other machines.
  (CVE-2007-5274)

  All users of java-1.4.2-ibm are advised to upgrade to these updated
  packages, that contain IBM\'s 1.4.2 SR10 Java release which resolves these
  issues.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2008-0132.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2007-3698", "CVE-2007-4381", "CVE-2007-5232", "CVE-2007-5238", "CVE-2007-5239", "CVE-2007-5240", "CVE-2007-5273", "CVE-2007-5274", "CVE-2008-1189", "CVE-2008-1190", "CVE-2008-1192", "CVE-2008-1195");
script_summary(english: "Check for the version of the java packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"java-1.4.2-ibm-1.4.2.10-1jpp.2.el3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-demo-1.4.2.10-1jpp.2.el3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-devel-1.4.2.10-1jpp.2.el3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-jdbc-1.4.2.10-1jpp.2.el3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-plugin-1.4.2.10-1jpp.2.el3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-src-1.4.2.10-1jpp.2.el3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-1.4.2.10-1jpp.2.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-demo-1.4.2.10-1jpp.2.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-devel-1.4.2.10-1jpp.2.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-javacomm-1.4.2.10-1jpp.2.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-jdbc-1.4.2.10-1jpp.2.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-plugin-1.4.2.10-1jpp.2.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-src-1.4.2.10-1jpp.2.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-1.4.2.10-1jpp.2.el4", release:'RHEL4.6.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-demo-1.4.2.10-1jpp.2.el4", release:'RHEL4.6.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-devel-1.4.2.10-1jpp.2.el4", release:'RHEL4.6.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-javacomm-1.4.2.10-1jpp.2.el4", release:'RHEL4.6.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-jdbc-1.4.2.10-1jpp.2.el4", release:'RHEL4.6.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-plugin-1.4.2.10-1jpp.2.el4", release:'RHEL4.6.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"java-1.4.2-ibm-src-1.4.2.10-1jpp.2.el4", release:'RHEL4.6.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
