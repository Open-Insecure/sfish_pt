# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200604-06.xml
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
 script_id(21199);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200604-06");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200604-06 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200604-06
(ClamAV: Multiple vulnerabilities)


    ClamAV contains format string vulnerabilities in the logging code
    (CVE-2006-1615). Furthermore Damian Put discovered an integer overflow
    in ClamAV\'s PE header parser (CVE-2006-1614) and David Luyer discovered
    that ClamAV can be tricked into performing an invalid memory access
    (CVE-2006-1630).
  
Impact

    By sending a malicious attachment to a mail server running ClamAV,
    a remote attacker could cause a Denial of Service or the execution of
    arbitrary code. Note that the overflow in the PE header parser is only
    exploitable when the ArchiveMaxFileSize option is disabled.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All ClamAV users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=app-antivirus/clamav-0.88.1"
  ');
script_set_attribute(attribute: 'risk_factor', value: 'High');
script_set_attribute(attribute: 'see_also', value: 'http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-1614');
script_set_attribute(attribute: 'see_also', value: 'http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-1615');
script_set_attribute(attribute: 'see_also', value: 'http://www.cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-1630');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200604-06.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200604-06] ClamAV: Multiple vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'ClamAV: Multiple vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "app-antivirus/clamav", unaffected: make_list("ge 0.88.1"), vulnerable: make_list("lt 0.88.1")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
