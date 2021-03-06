
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(20039);
 script_version ("$Revision: 1.5 $");
 script_name(english: "MDKSA-2005:179: openssl");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2005:179 (openssl).");
 script_set_attribute(attribute: "description", value: "Yutaka Oiwa discovered vulnerability potentially affects applications
that use the SSL/TLS server implementation provided by OpenSSL.
Such applications are affected if they use the option
SSL_OP_MSIE_SSLV2_RSA_PADDING. This option is implied by use of
SSL_OP_ALL, which is intended to work around various bugs in third-
party software that might prevent interoperability. The
SSL_OP_MSIE_SSLV2_RSA_PADDING option disables a verification step in
the SSL 2.0 server supposed to prevent active protocol-version rollback
attacks. With this verification step disabled, an attacker acting as
a 'man in the middle' can force a client and a server to negotiate the
SSL 2.0 protocol even if these parties both support SSL 3.0 or TLS 1.0.
The SSL 2.0 protocol is known to have severe cryptographic weaknesses
and is supported as a fallback only. (CVE-2005-2969)
The current default algorithm for creating 'message digests'
(electronic signatures) for certificates created by openssl is MD5.
However, this algorithm is not deemed secure any more, and some
practical attacks have been demonstrated which could allow an attacker
to forge certificates with a valid certification authority signature
even if he does not know the secret CA signing key.
To address this issue, openssl has been changed to use SHA-1 by
default. This is a more appropriate default algorithm for the majority
of use cases. If you still want to use MD5 as default, you can revert
this change by changing the two instances of 'default_md = sha1' to
'default_md = md5' in /usr/{lib,lib64}/ssl/openssl.cnf. (CVE-2005-2946)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:N");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2005:179");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2005-2946", "CVE-2005-2969");
script_summary(english: "Check for the version of the openssl package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"libopenssl0.9.7-0.9.7d-1.3.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libopenssl0.9.7-devel-0.9.7d-1.3.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libopenssl0.9.7-static-devel-0.9.7d-1.3.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"openssl-0.9.7d-1.3.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libopenssl0.9.7-0.9.7e-5.2.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libopenssl0.9.7-devel-0.9.7e-5.2.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libopenssl0.9.7-static-devel-0.9.7e-5.2.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"openssl-0.9.7e-5.2.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libopenssl0.9.7-0.9.7g-2.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libopenssl0.9.7-devel-0.9.7g-2.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libopenssl0.9.7-static-devel-0.9.7g-2.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"openssl-0.9.7g-2.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"openssl-", release:"MDK10.1")
 || rpm_exists(rpm:"openssl-", release:"MDK10.2")
 || rpm_exists(rpm:"openssl-", release:"MDK2006.0") )
{
 set_kb_item(name:"CVE-2005-2946", value:TRUE);
 set_kb_item(name:"CVE-2005-2969", value:TRUE);
}
exit(0, "Host is not affected");
