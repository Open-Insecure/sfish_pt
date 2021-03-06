# This script was automatically generated from the 75-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(20697);
script_version("$Revision: 1.5 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "75-1");
script_summary(english:"cpio vulnerability");
script_name(english:"USN75-1 : cpio vulnerability");
script_set_attribute(attribute:'synopsis', value: 'The remote package "cpio" is missing a security patch.');
script_set_attribute(attribute:'description', value: 'Recently it was discovered that cpio created world-writeable files
when used in -o/--create mode with giving an output file (with -O).
This allowed any user to modify the created cpio archives. Now cpio
respects the current umask setting of the user.

Note: This vulnerability has already been fixed in a very old version
of cpio, but the fix was never ported to the current version.
Therefore the CAN number was assigned to the year 1999.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- cpio-2.5-1.1ubuntu0.1 (Ubuntu 4.10)
');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:P/I:N/A:N');
script_end_attributes();

script_cve_id("CVE-1999-1572");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "4.10", pkgname: "cpio", pkgver: "2.5-1.1ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package cpio-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to cpio-2.5-1.1ubuntu0.1
');
}

if (w) { security_note(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
