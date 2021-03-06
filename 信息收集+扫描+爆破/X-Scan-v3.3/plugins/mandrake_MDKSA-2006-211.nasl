
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(24596);
 script_version ("$Revision: 1.3 $");
 script_name(english: "MDKSA-2006:211: pxelinux");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2006:211 (pxelinux).");
 script_set_attribute(attribute: "description", value: "PXELINUX is a PXE bootloader. It is built with a private copy of
libpng, and as such could be susceptible to some of the same
vulnerabilities:
Buffer overflow in the png_decompress_chunk function in pngrutil.c in
libpng before 1.2.12 allows context-dependent attackers to cause a
denial of service and possibly execute arbitrary code via unspecified
vectors related to 'chunk error processing,' possibly involving the
'chunk_name'. (CVE-2006-3334)
It is questionable whether this issue is actually exploitable, but the
patch to correct the issue has been included in versions < 1.2.12.
Tavis Ormandy, of the Gentoo Linux Security Auditing Team, discovered a
typo in png_set_sPLT() that may cause an application using libpng to
read out of bounds, resulting in a crash. (CVE-2006-5793)
Packages have been patched to correct these issues.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2006:211");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2006-3334", "CVE-2006-5793");
script_summary(english: "Check for the version of the pxelinux package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"pxelinux-3.11-1.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"pxelinux-devel-3.11-1.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"pxelinux-3.11-1.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"pxelinux-devel-3.11-1.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"pxelinux-", release:"MDK2006.0") )
{
 set_kb_item(name:"CVE-2006-3334", value:TRUE);
 set_kb_item(name:"CVE-2006-5793", value:TRUE);
}
exit(0, "Host is not affected");
