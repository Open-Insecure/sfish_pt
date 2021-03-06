# This script was automatically generated from the 390-2 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(27974);
script_version("$Revision: 1.3 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "390-2");
script_summary(english:"evince vulnerability");
script_name(english:"USN390-2 : evince vulnerability");
script_set_attribute(attribute:'synopsis', value: 'The remote package "evince" is missing a security patch.');
script_set_attribute(attribute:'description', value: 'USN-390-1 fixed a vulnerability in evince.  The original fix did not 
fully solve the problem, allowing for a denial of service in certain 
situations.

Original advisory details:

  A buffer overflow was discovered in the PostScript processor included 
  in evince.  By tricking a user into opening a specially crafted PS 
  file, an attacker could crash evince or execute arbitrary code with 
  the user\'s privileges.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- evince-0.6.1-0ubuntu1.2 (Ubuntu 6.10)
');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:H/Au:N/C:P/I:P/A:P');
script_end_attributes();

script_cve_id("CVE-2006-5864");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "6.10", pkgname: "evince", pkgver: "0.6.1-0ubuntu1.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package evince-',found,' is vulnerable in Ubuntu 6.10
Upgrade it to evince-0.6.1-0ubuntu1.2
');
}

if (w) { security_warning(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
