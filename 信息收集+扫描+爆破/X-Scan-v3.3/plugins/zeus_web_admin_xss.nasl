#
# (C) Tenable Network Security, Inc.
#

# Ref:
#  Date: 29 May 2003 17:48:30 -0000
#  From: Hugo "V�zquez" "Caram�s" <overclocking_a_la_abuela@hotmail.com>
#  To: bugtraq@securityfocus.com
#  Subject: Another ZEUS  Server web admin XSS!



include("compat.inc");

if(description)
{
 script_id(11681);
 script_version ("$Revision: 1.14 $");

 script_bugtraq_id(7751);
 script_xref(name:"OSVDB", value:"4765");

 script_name(english:"Zeus Admin vs_diag.cgi XSS");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server is affected by a privilege escalation flaw." );
 script_set_attribute(attribute:"description", value:
"The remote host is running the Zeus WebServer.

There is a vulnerability in the CGI 'vs_diag.cgi' that may allow an
attacker to gain administrative access on that server.  To exploit this
flaw, the attacker would need to lure the administrator of this server
to click on a rogue link." );
 script_set_attribute(attribute:"see_also", value:"http://marc.info/?l=bugtraq&m=105427199423918&w=2" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to the latest version of Zeus" );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N" );

script_end_attributes();


 script_summary(english:"Checks for XSS in Zeus");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses : XSS");
 script_dependencie("http_version.nasl", "cross_site_scripting.nasl");
 script_require_ports("Services/www", 9090);
 script_require_keys("www/zeus");
 exit(0);
}

#
# The script code starts here
#
include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default: 9090);
test_cgi_xss(port: port, dirs: make_list("/apps/web"), 
   cgi: "/vs_diag.cgi", qs: "server=<script>foo</script>", 
   pass_str: "<script>foo</script>");
