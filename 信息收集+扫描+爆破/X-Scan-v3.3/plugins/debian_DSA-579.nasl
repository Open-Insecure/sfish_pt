# This script was automatically generated from the dsa-579
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15677);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "579");
 script_cve_id("CVE-2004-0645");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-579 security update');
 script_set_attribute(attribute: 'description', value:
'A buffer overflow vulnerability has been discovered in the wv library,
used for converting and previewing word documents.  On exploitation an
attacker could execute arbitrary code with the privileges of the user
running the vulnerable application.
For the stable distribution (woody) this problem has been fixed in
version 1.0.2+cvs.2002.06.05-1woody2.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2004/dsa-579');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your abiword package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA579] DSA-579-1 abiword");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-579-1 abiword");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'abiword', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody2');
deb_check(prefix: 'abiword-common', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody2');
deb_check(prefix: 'abiword-doc', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody2');
deb_check(prefix: 'abiword-gnome', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody2');
deb_check(prefix: 'abiword-gtk', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody2');
deb_check(prefix: 'abiword-plugins', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody2');
deb_check(prefix: 'xfonts-abi', release: '3.0', reference: '1.0.2+cvs.2002.06.05-1woody2');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
