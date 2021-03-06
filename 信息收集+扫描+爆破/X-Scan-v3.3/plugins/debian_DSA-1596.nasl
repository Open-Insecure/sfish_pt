# This script was automatically generated from the dsa-1596
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(33177);
 script_version("$Revision: 1.3 $");
 script_xref(name: "DSA", value: "1596");
 script_cve_id("CVE-2008-2717", "CVE-2008-2718");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1596 security update');
 script_set_attribute(attribute: 'description', value:
'Several remote vulnerabilities have been discovered in the TYPO3 content
management framework.
Because of a not sufficiently secure default value of the TYPO3
configuration variable fileDenyPattern, authenticated backend users
could upload files that allowed to execute arbitrary code as the
webserver user.
User input processed by fe_adminlib.inc is not being properly filtered
to prevent Cross Site Scripting (XSS) attacks, which is exposed when
specific plugins are in use.
For the stable distribution (etch), these problems have been fixed in version
4.0.2+debian-5.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1596');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your typo3 package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:S/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1596] DSA-1596-1 typo3");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1596-1 typo3");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'typo3', release: '4.0', reference: '4.0.2+debian-5');
deb_check(prefix: 'typo3-src-4.0', release: '4.0', reference: '4.0.2+debian-5');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
