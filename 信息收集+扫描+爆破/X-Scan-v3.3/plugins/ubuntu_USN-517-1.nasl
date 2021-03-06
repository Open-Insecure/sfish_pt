# This script was automatically generated from the 517-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(28122);
script_version("$Revision: 1.3 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "517-1");
script_summary(english:"kdm vulnerability");
script_name(english:"USN517-1 : kdm vulnerability");
script_set_attribute(attribute:'synopsis', value: 'These remote packages are missing security patches :
- kappfinder 
- kate 
- kcontrol 
- kdebase 
- kdebase-bin 
- kdebase-data 
- kdebase-dbg 
- kdebase-dev 
- kdebase-doc 
- kdebase-doc-html 
- kdebase-kio-plugins 
- kdepasswd 
- kdeprint 
- kdesktop 
- kdm 
- kfind 
- khelpcenter 
- kicker 
- klipper 
- kmenuedit 
- konqueror 
- konqueror-nsplugins 
- konsole 
- kpager 
- kpersonalizer 
- ksmserver 
- ksplash 
- ksysguard 
- ksysguardd 
- ktip 
- kwin 
- libkonq4 
- libkonq4-dev 
');
script_set_attribute(attribute:'description', value: 'It was discovered that KDM would allow logins without password checks
under certain circumstances.  If autologin was configured, and "shutdown
with password" enabled, a local user could exploit the problem and gain
root privileges.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- kappfinder-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kate-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kcontrol-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kdebase-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kdebase-bin-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kdebase-data-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kdebase-dbg-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kdebase-dev-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kdebase-doc-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kdebase-doc-html-3.5.6-0ubuntu20.3 (Ubuntu 7.04)
- kdebase-kio-plugins-3.5.6-0ubuntu20.3 (Ubunt
[...]');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:S/C:C/I:C/A:C');
script_end_attributes();

script_cve_id("CVE-2007-4569");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "7.04", pkgname: "kappfinder", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kappfinder-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kappfinder-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kate", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kate-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kate-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kcontrol", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kcontrol-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kcontrol-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdebase", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdebase-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdebase-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdebase-bin", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdebase-bin-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdebase-bin-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdebase-data", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdebase-data-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdebase-data-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdebase-dbg", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdebase-dbg-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdebase-dbg-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdebase-dev", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdebase-dev-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdebase-dev-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdebase-doc", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdebase-doc-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdebase-doc-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdebase-doc-html", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdebase-doc-html-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdebase-doc-html-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdebase-kio-plugins", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdebase-kio-plugins-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdebase-kio-plugins-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdepasswd", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdepasswd-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdepasswd-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdeprint", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdeprint-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdeprint-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdesktop", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdesktop-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdesktop-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kdm", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kdm-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kdm-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kfind", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kfind-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kfind-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "khelpcenter", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package khelpcenter-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to khelpcenter-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kicker", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kicker-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kicker-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "klipper", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package klipper-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to klipper-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kmenuedit", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kmenuedit-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kmenuedit-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "konqueror", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package konqueror-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to konqueror-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "konqueror-nsplugins", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package konqueror-nsplugins-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to konqueror-nsplugins-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "konsole", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package konsole-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to konsole-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kpager", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kpager-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kpager-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kpersonalizer", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kpersonalizer-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kpersonalizer-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "ksmserver", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package ksmserver-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to ksmserver-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "ksplash", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package ksplash-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to ksplash-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "ksysguard", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package ksysguard-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to ksysguard-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "ksysguardd", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package ksysguardd-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to ksysguardd-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "ktip", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package ktip-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to ktip-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "kwin", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package kwin-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to kwin-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "libkonq4", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libkonq4-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to libkonq4-3.5.6-0ubuntu20.3
');
}
found = ubuntu_check(osver: "7.04", pkgname: "libkonq4-dev", pkgver: "3.5.6-0ubuntu20.3");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libkonq4-dev-',found,' is vulnerable in Ubuntu 7.04
Upgrade it to libkonq4-dev-3.5.6-0ubuntu20.3
');
}

if (w) { security_warning(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
