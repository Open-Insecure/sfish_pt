# This script was automatically generated from the dsa-1528
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(31662);
 script_version("$Revision: 1.5 $");
 script_xref(name: "DSA", value: "1528");
 script_cve_id("CVE-2007-6205", "CVE-2008-0124", "CVE-2008-1476");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1528 security update');
 script_set_attribute(attribute: 'description', value:
'Peter H&uuml;we and Hanno B&ouml;ck discovered that Serendipity, a weblog manager,
did not properly sanitise input to several scripts which allowed
cross site scripting.
The old stable distribution (sarge) does not contain a serendipity package.
For the stable distribution (etch), this problem has been fixed in version
1.0.4-1+etch1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1528');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your serendipity package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1528] DSA-1528-1 serendipity");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1528-1 serendipity");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'serendipity', release: '4.0', reference: '1.0.4-1+etch1');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
