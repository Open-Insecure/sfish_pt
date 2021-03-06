#
# (C) Tenable Network Security, Inc.
#

include( 'compat.inc' );

if(description)
{
  script_id(12005);
  script_version("$Revision: 1.9 $");

  script_name(english:"WEBHANCER detection");
  script_summary(english:"WEBHANCER detection");

  script_set_attribute(
    attribute:'synopsis',
    value:'The remote software is potentially unwanted and considered spyware.'
  );

  script_set_attribute(
    attribute:'description',
    value:"The remote host is using the WEBHANCER program.
You should ensure that :

  - the user intended to install WEBHANCER (it is sometimes silently installed)
  - the use of WEBHANCER matches your corporate mandates and security policies.

To remove this sort of software, you may wish to check out ad-aware or spybot."
  );

  script_set_attribute(
    attribute:'solution',
    value: "Uninstall this software if it is not desired."
  );

  script_set_attribute(
    attribute:'see_also',
    value:'http://www.ca.com/securityadvisor/pest/pest.aspx?id=43482'
  );

  script_set_attribute(
    attribute:'cvss_vector',
    value:'CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N'
  );

  script_end_attributes();
  script_category(ACT_GATHER_INFO);

  script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
  script_family(english:"Windows");

  script_dependencies("smb_registry_full_access.nasl");
  script_require_keys("SMB/registry_full_access");

  script_require_ports(139, 445);
  exit(0);
}

include("smb_func.inc");


# start the script
if ( ! get_kb_item("SMB/registry_full_access") ) exit(0);

path[0] = "clsid\{c900b400-cdfe-11d3-976a-00e02913a9e0}";
path[1] = "software\classes\clsid\{c900b400-cdfe-11d3-976a-00e02913a9e0}";
path[2] = "software\classes\interface\{c89435b0-cdfe-11d3-976a-00e02913a9e0}";
path[3] = "software\classes\typelib\{c8cb3870-cdfe-11d3-976a-00e02913a9e0}";
path[4] = "software\classes\whiehelperobj.whiehelperobj.1\clsid";
path[5] = "software\classes\whiehelperobj.whiehelperobj\curver";
path[6] = "software\microsoft\windows\currentversion\app management\arpcache\whsurvey";
path[7] = "software\microsoft\windows\currentversion\explorer\browser helper objects\{c900b400-cdfe-11d3-976a-00e02913a9e0}";
path[8] = "software\microsoft\windows\currentversion\run\webhancer agent";
path[9] = "software\microsoft\windows\currentversion\run\webhancer survey companion";
path[10] = "software\microsoft\windows\currentversion\uninstall\webhancer agent";
path[11] = "software\microsoft\windows\currentversion\uninstall\whsurvey";
path[12] = "software\webhancer";


name = kb_smb_name();
if(!name)exit(0);

port = kb_smb_transport();
if(!port)exit(0);

if(!get_port_state(port)) exit(0);
login = kb_smb_login();
pass  = kb_smb_password();
domain = kb_smb_domain();

soc = open_sock_tcp(port);
if(!soc) exit(0);

session_init(socket:soc, hostname:name);
r = NetUseAdd(login:login, password:pass, domain:domain, share:"IPC$");
if ( r != 1 ) exit(0);

hklm = RegConnectRegistry(hkey:HKEY_LOCAL_MACHINE);
if ( isnull(hklm) )
{
 NetUseDel();
 exit(0);
}


for (i=0; path[i]; i++)
{
 key_h = RegOpenKey(handle:hklm, key:path[i], mode:MAXIMUM_ALLOWED);
 if ( ! isnull(key_h) )
 {
  security_warning( port );
  RegCloseKey(handle:key_h);
  break;
 }
}

RegCloseKey (handle:hklm);
NetUseDel ();
