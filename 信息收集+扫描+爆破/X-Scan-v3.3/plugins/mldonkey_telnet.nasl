#
# (C) Tenable Network Security, Inc.
#

# Note: this script is not very useful because mldonkey only allows
# connections from localhost by default

include("compat.inc");

if(description)
{
  script_id(11124);
  script_version ("$Revision: 1.11 $");
 
  script_name(english:"mldonkey Detection (telnet check)");
  script_summary(english:"Detect mldonkey telnet interface");
 
  script_set_attribute(
    attribute:"synopsis",
    value:"A peer-to-peer application is running on the remote host."
  );
  script_set_attribute(
    attribute:"description", 
    value:string(
      "mldonkey telnet appears to be running on the remote host.  mldonkey\n",
      "is a peer-to-peer filesharing application.  This application could\n",
      "be used to share copyright infringing material.  It could also\n",
      "result in the inadvertent disclosure of confidential information."
    )
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://mldonkey.sourceforge.net/"
  );
  script_set_attribute(
    attribute:"solution", 
    value:string(
      "Make sure the use of this program is in accordance with your\n",
      "corporate security policy."
    )
  );
  script_set_attribute(
    attribute:"risk_factor", 
    value:"None"
  );
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"Peer-To-Peer File Sharing");

  script_copyright(english:"This script is Copyright (C) 2002-2009 Tenable Network Security, Inc.");

  script_dependencie("find_service2.nasl");
  exit(0);
}

include("misc_func.inc");

port = get_kb_item("Services/mldonkey-telnet");
if (! port) port = 4000;
if ( ! get_port_state(port) ) exit(0);

r = get_unknown_banner(port: port, dontfetch:0);

if(!r)exit(0);
if ("Welcome on mldonkey command-line" >< r)
{
 security_note(port);
}
