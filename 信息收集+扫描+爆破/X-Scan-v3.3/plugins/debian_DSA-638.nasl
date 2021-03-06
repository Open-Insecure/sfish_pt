# This script was automatically generated from the dsa-638
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(16156);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "638");
 script_cve_id("CVE-2004-0560", "CVE-2004-0561");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-638 security update');
 script_set_attribute(attribute: 'description', value:
'"jaguar" has discovered two security relevant problems in gopherd, the
Gopher server in Debian which is part of the gopher package.  The
Common Vulnerabilities and Exposures project identifies the following
vulnerabilities:
    An integer overflow can happen when posting content of a specially
    calculated size.
    A format string vulnerability has been found in the log routine.
For the stable distribution (woody) these problems have been fixed in
version 3.0.3woody2.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2005/dsa-638');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your gopherd package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA638] DSA-638-1 gopher");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-638-1 gopher");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'gopher', release: '3.0', reference: '3.0.3woody2');
deb_check(prefix: 'gopherd', release: '3.0', reference: '3.0.3woody2');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
