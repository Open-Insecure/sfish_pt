#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(25216);
  script_version("$Revision: 1.9 $");

  script_cve_id("CVE-2007-2446");
  script_bugtraq_id(23973, 24195, 24196, 24197, 24198);
  script_xref(name:"OSVDB", value:"34699");
  script_xref(name:"OSVDB", value:"34731");
  script_xref(name:"OSVDB", value:"34732");
  script_xref(name:"OSVDB", value:"34733");

  script_name(english:"Samba NDR MS-RPC Request Heap-Based Remote Buffer Overflow");
  script_summary(english:"Checks version of Samba");

 script_set_attribute(attribute:"synopsis", value:
"It is possible to execute code on the remote host through Samba." );
 script_set_attribute(attribute:"description", value:
"The version of the Samba server installed on the remote host is
affected by multiple heap overflow vulnerabilities, which can be
exploited remotely to execute code with the privileges of the Samba
daemon." );
 script_set_attribute(attribute:"see_also", value:"http://www.samba.org/samba/security/CVE-2007-2446.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Samba version 3.0.25 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C" );

script_end_attributes();


  script_category(ACT_GATHER_INFO);
  script_family(english:"Misc.");

  script_copyright(english:"This script is Copyright (C) 2007-2009 Tenable Network Security, Inc.");

  script_dependencies("smb_nativelanman.nasl");
  script_require_keys("SMB/NativeLanManager");
  script_require_ports(139, 445);

  exit(0);
}


include ("smb_func.inc");


function LsaLookupSid2 (handle, sid_array)
{
 local_var ref_id, data, sid, count, names, rep;

 ref_id = 0x20000;

 data = handle[0]  +  # Handle

        # PSID Array
        raw_dword (d:max_index (sid_array))  + # number of sid in PSID Array
        raw_dword (d:ref_id)                 + # Referent ID
        raw_dword (d:max_index (sid_array)) ;  # max_count

 ref_id++;

 # ref_id
 foreach sid (sid_array)
 {
  data += raw_dword (d:ref_id);

  ref_id++;
 }

 foreach sid (sid_array)
 {
  count = ord(sid[1]);
  
  data += raw_dword (d:count)   +
          sid ;
 }


 data += raw_dword (d:2)         + # count = 2 (1 more to test the flaw)
         raw_dword (d:0x20004)   + # (LSA_TRANSLATED_NAMES)
         raw_dword (d:1)         + # only 1 entry
        
         # name 
         raw_dword (d:1) +
	 raw_word (w:0)  +
         raw_word (w:0)  +
         raw_dword (d:0) +
         raw_dword (d:0) +

         raw_dword (d:1)        + # Level (nothing else seems to work)
         raw_dword (d:0)        ; # Num mapped ?
        
 data = dce_rpc_pipe_request (fid:handle[1], code:OPNUM_LSALOOKUPSID, data:data);
 if (!data)
   return NULL;
 
 rep = dce_rpc_parse_response (fid:handle[1], data:data);
 if (!rep || (strlen (rep) < 20))
   return NULL;
 
 return rep;
}


lanman = get_kb_item("SMB/NativeLanManager");
if ("Samba" >!< lanman)
  exit(0);


sid = raw_string (0x01,0x02,0x00,0x00,0x00,0x00,0x00,0x05,0x20,0x00,0x00,0x00,0x20,0x02,0x00,0x00);

name	= kb_smb_name();
port	= kb_smb_transport();

if ( ! get_port_state(port) ) exit(0);
soc = open_sock_tcp(port);
if ( ! soc ) exit(0);

session_init(socket:soc, hostname:name);
r = NetUseAdd(share:"IPC$");
if ( r != 1 ) exit(0);

group = NULL;

lsa = LsaOpenPolicy (desired_access:0x20801);
if (!isnull(lsa))
{
 sids = NULL;
 sids[0] = sid;
 names = LsaLookupSid2 (handle:lsa, sid_array:sids);
 if (!isnull(names))
   security_hole(port);
 
 LsaClose (handle:lsa);
}

NetUseDel();
