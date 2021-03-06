# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200503-05.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(17261);
 script_version("$Revision: 1.7 $");
 script_xref(name: "GLSA", value: "200503-05");
 script_cve_id("CVE-2001-0775", "CVE-2005-0638", "CVE-2005-0639");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200503-05 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200503-05
(xli, xloadimage: Multiple vulnerabilities)


    Tavis Ormandy of the Gentoo Linux Security Audit Team has reported that
    xli and xloadimage contain a flaw in the handling of compressed images,
    where shell meta-characters are not adequately escaped. Rob Holland of
    the Gentoo Linux Security Audit Team has reported that an xloadimage
    vulnerability in the handling of Faces Project images discovered by
    zen-parse in 2001 remained unpatched in xli. Additionally, it has been
    reported that insufficient validation of image properties in xli could
    potentially result in buffer management errors.
  
Impact

    Successful exploitation would permit a remote attacker to execute
    arbitrary shell commands, or arbitrary code with the privileges of the
    xloadimage or xli user.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All xli users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=media-gfx/xli-1.17.0-r1"
    All xloadimage users should also upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=media-gfx/xloadimage-4.1-r2"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2001-0775');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-0638');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-0639');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200503-05.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200503-05] xli, xloadimage: Multiple vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'xli, xloadimage: Multiple vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "media-gfx/xloadimage", unaffected: make_list("ge 4.1-r2"), vulnerable: make_list("lt 4.1-r2")
)) { security_hole(0); exit(0); }
if (qpkg_check(package: "media-gfx/xli", unaffected: make_list("ge 1.17.0-r1"), vulnerable: make_list("lt 1.17.0-r1")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
