# This script was automatically generated from the 74-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(20695);
script_version("$Revision: 1.5 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "74-1");
script_summary(english:"postfix vulnerability");
script_name(english:"USN74-1 : postfix vulnerability");
script_set_attribute(attribute:'synopsis', value: 'These remote packages are missing security patches :
- postfix 
- postfix-dev 
- postfix-doc 
- postfix-ldap 
- postfix-mysql 
- postfix-pcre 
- postfix-pgsql 
- postfix-tls 
');
script_set_attribute(attribute:'description', value: 'Jean-Samuel Reynaud noticed a programming error in the IPv6 handling
code of Postfix when /proc/net/if_inet6 is not available (which is the
case in Ubuntu since Postfix runs in a chroot). If "permit_mx_backup"
was enabled in the "smtpd_recipient_restrictions", Postfix turned into
an open relay, i. e. erroneously permitted the delivery of arbitrary
mail to any MX host which has an IPv6 address.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- postfix-2.1.3-1ubuntu17.1 (Ubuntu 4.10)
- postfix-dev-2.1.3-1ubuntu17.1 (Ubuntu 4.10)
- postfix-doc-2.1.3-1ubuntu17.1 (Ubuntu 4.10)
- postfix-ldap-2.1.3-1ubuntu17.1 (Ubuntu 4.10)
- postfix-mysql-2.1.3-1ubuntu17.1 (Ubuntu 4.10)
- postfix-pcre-2.1.3-1ubuntu17.1 (Ubuntu 4.10)
- postfix-pgsql-2.1.3-1ubuntu17.1 (Ubuntu 4.10)
- postfix-tls-2.1.3-1ubuntu17.1 (Ubuntu 4.10)
');
script_set_attribute(attribute: 'risk_factor', value: 'High');
script_end_attributes();

exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "4.10", pkgname: "postfix", pkgver: "2.1.3-1ubuntu17.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postfix-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postfix-2.1.3-1ubuntu17.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postfix-dev", pkgver: "2.1.3-1ubuntu17.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postfix-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postfix-dev-2.1.3-1ubuntu17.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postfix-doc", pkgver: "2.1.3-1ubuntu17.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postfix-doc-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postfix-doc-2.1.3-1ubuntu17.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postfix-ldap", pkgver: "2.1.3-1ubuntu17.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postfix-ldap-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postfix-ldap-2.1.3-1ubuntu17.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postfix-mysql", pkgver: "2.1.3-1ubuntu17.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postfix-mysql-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postfix-mysql-2.1.3-1ubuntu17.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postfix-pcre", pkgver: "2.1.3-1ubuntu17.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postfix-pcre-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postfix-pcre-2.1.3-1ubuntu17.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postfix-pgsql", pkgver: "2.1.3-1ubuntu17.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postfix-pgsql-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postfix-pgsql-2.1.3-1ubuntu17.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postfix-tls", pkgver: "2.1.3-1ubuntu17.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postfix-tls-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postfix-tls-2.1.3-1ubuntu17.1
');
}

if (w) { security_hole(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
