# This script was automatically generated from the 229-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(20772);
script_version("$Revision: 1.4 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "229-1");
script_summary(english:"zope2.8 vulnerability");
script_name(english:"USN229-1 : zope2.8 vulnerability");
script_set_attribute(attribute:'synopsis', value: 'These remote packages are missing security patches :
- zope2.8 
- zope2.8-sandbox 
');
script_set_attribute(attribute:'description', value: 'Zope did not deactivate the file inclusion feature when exposing
RestructuredText functionalities to untrusted users. A remote user
with the privilege of editing Zope webpages with RestructuredText
could exploit this to expose arbitrary files that can be read with the
privileges of the Zope server, or execute arbitrary Zope code.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- zope2.8-2.8.1-5ubuntu0.1 (Ubuntu 5.10)
- zope2.8-sandbox-2.8.1-5ubuntu0.1 (Ubuntu 5.10)
');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

script_cve_id("CVE-2005-3323");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "5.10", pkgname: "zope2.8", pkgver: "2.8.1-5ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package zope2.8-',found,' is vulnerable in Ubuntu 5.10
Upgrade it to zope2.8-2.8.1-5ubuntu0.1
');
}
found = ubuntu_check(osver: "5.10", pkgname: "zope2.8-sandbox", pkgver: "2.8.1-5ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package zope2.8-sandbox-',found,' is vulnerable in Ubuntu 5.10
Upgrade it to zope2.8-sandbox-2.8.1-5ubuntu0.1
');
}

if (w) { security_hole(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
