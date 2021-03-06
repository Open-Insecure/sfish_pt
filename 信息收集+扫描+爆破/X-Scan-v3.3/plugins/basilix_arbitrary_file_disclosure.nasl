#
# This script was written by George A. Theall, <theall@tifaware.com>.
#
# See the Nessus Scripts License for details.
#



include("compat.inc");

if (description) {
  script_id(14305);
  script_version ("$Revision: 1.15 $"); 

  script_cve_id("CVE-2002-1710");
  script_bugtraq_id(5062);
  script_xref(name:"OSVDB", value:"21595");

  name["english"] = "Basilix Webmail Attachment Crafted POST Arbitrary File Access";
  script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP script that is prone to an
information disclosure vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host appears to be running a BasiliX version 1.1.0 or lower. 
Such versions allow retrieval of arbitrary files that are accessible to
the web server user when sending a message since they accept a list of
attachment names from the client yet do not verify that the attachments
were in fact uploaded. 

Further, since these versions do not sanitize input to the 'login.php3'
script, it's possible for an attacker to establish a session on the
target without otherwise having access there by authenticating against
an IMAP server of his or her choosing." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/vulnwatch/2002-q2/0113.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to BasiliX version 1.1.1 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );
script_end_attributes();

 
  summary["english"] = "Checks for arbitrary file disclosure vulnerability in BasiliX";
  script_summary(english:summary["english"]);
 
  script_category(ACT_GATHER_INFO);
  script_family(english:"CGI abuses");

  script_copyright(english:"This script is Copyright (C) 2004-2009 George A. Theall");

  script_dependencies("basilix_detect.nasl");
  script_require_ports("Services/www", 80);

  exit(0);
}


include("http_func.inc");


port = get_http_port(default:80);
if (!get_port_state(port)) exit(0);
if (!can_host_php(port:port)) exit(0);


# Test an install.
install = get_kb_item(string("www/", port, "/basilix"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  ver = matches[1];

  if (ver =~ "^(0\..*|1\.(0.*|1\.0))$") {
    security_warning(port);
    exit(0);
  }
}
