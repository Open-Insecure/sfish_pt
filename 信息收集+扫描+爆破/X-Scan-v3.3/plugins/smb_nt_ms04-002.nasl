#
# (C) Tenable Network Security
#

include("compat.inc");

if(description)
{
 script_id(11989);
 script_version("$Revision: 1.17 $");

 script_cve_id("CVE-2003-0904");
 script_bugtraq_id(9118, 9409);
 script_xref(name:"OSVDB", value:"3490");

 name["english"] = "MS04-002: Exchange Privilege Escalation (832759)";
 
 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"It is possible to access other users mailboxes." );
 script_set_attribute(attribute:"description", value:
"The remote host is running an unpatched version of Microsoft Exchange which
may allow an attacker with a valid Exchange account to access another user's
mailbox using Outlook for Web Access" );
 script_set_attribute(attribute:"solution", value:
"Microsoft has released a set of patches for Exchange 2003 :

http://www.microsoft.com/technet/security/bulletin/ms04-002.mspx" );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:H/Au:S/C:P/I:P/A:N" );

script_end_attributes();

 
 summary["english"] = "Checks for MS Hotfix Q832759";

 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
 family["english"] = "Windows : Microsoft Bulletins";
 script_family(english:family["english"]);
 
 script_dependencies("smb_hotfixes.nasl");
 script_require_keys("SMB/Registry/Enumerated");
 script_require_ports(139, 445);
 exit(0);
}

include("smb_func.inc");
include("smb_hotfixes.inc");
include("smb_hotfixes_fcheck.inc");


if ( hotfix_check_nt_server() <= 0 ) exit(0);

version = get_kb_item ("SMB/Exchange/Version");
if (!version || (version != 65)) exit(0);

sp = get_kb_item ("SMB/Exchange/SP");
if ( sp && (sp >= 1)) exit (0);

if (is_accessible_share())
{
 path = get_kb_item ("SMB/Exchange/Path") + "\bin";
 if ( hotfix_is_vulnerable (os:"5.2", file:"exprox.dll", version:"6.5.6980.57", dir:path) )
 {
 set_kb_item(name:"SMB/Missing/MS04-002", value:TRUE);
 security_note(get_kb_item("SMB/transport"));
 }
 hotfix_check_fversion_end(); 
}
else if ( hotfix_missing(name:"Q832759") > 0 )
 {
 set_kb_item(name:"SMB/Missing/MS04-002", value:TRUE);
 hotfix_security_note();
 }
