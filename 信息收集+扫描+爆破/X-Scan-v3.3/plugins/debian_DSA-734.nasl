# This script was automatically generated from the dsa-734
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(18623);
 script_version("$Revision: 1.7 $");
 script_xref(name: "DSA", value: "734");
 script_cve_id("CVE-2005-1269", "CVE-2005-1934");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-734 security update');
 script_set_attribute(attribute: 'description', value:
'Two denial of service problems have been discovered in Gaim, a
multi-protocol instant messaging client.  The Common Vulnerabilities
and Exposures project identifies the following problems:
    A malformed Yahoo filename can result in a crash of the application.
    A malformed MSN message can lead to incorrect memory allocation
    resulting in a crash of the application.
The old stable distribution (woody) does not seem to be affected.
For the stable distribution (sarge) these problems have been fixed in
version 1.2.1-1.3.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2005/dsa-734');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your gaim package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA734] DSA-734-1 gaim");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-734-1 gaim");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'gaim', release: '3.1', reference: '1.2.1-1.3');
deb_check(prefix: 'gaim-data', release: '3.1', reference: '1.2.1-1.3');
deb_check(prefix: 'gaim-dev', release: '3.1', reference: '1.2.1-1.3');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
