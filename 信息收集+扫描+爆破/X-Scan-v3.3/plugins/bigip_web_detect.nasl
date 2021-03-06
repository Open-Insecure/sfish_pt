# bigip_web_detect.nasl
#
# History:
#
# 1.00, 12/13/07
# - Initial release

# Changes by Tenable:
# - Revised plugin title (9/1/09)


include("compat.inc");

if (description)
    {
    script_id(30215);
    script_version("$Revision: 1.4 $");

    script_name(english:"F5 BIG-IP Web Management Interface Detection");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server is a web management interface." );
 script_set_attribute(attribute:"description", value:
"An F5 BIG-IP web management interface is running on this port." );
 script_set_attribute(attribute:"see_also", value:"http://www.f5.com/products/big-ip/" );
 script_set_attribute(attribute:"solution", value:
"Filter incoming traffic to this port, possibly using bigpipe command
'httpd allow ....  For regular, non-management network ports, the
traffic can be also restricted with BIG-IP stateful packet filters." );
 script_set_attribute(attribute:"risk_factor", value:"None" );
    script_summary(english:"Detects F5 BIG-IP web management interface");
    script_family(english:"Web Servers");
script_end_attributes();

    script_category(ACT_GATHER_INFO);
    script_copyright(english:"This script is Copyright (c) 2007-2009 nnposter");
    script_dependencies("find_service1.nasl","httpver.nasl");
    script_require_ports("Services/www",443);
    exit(0);
    }


include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");


port = get_http_port(default:443);
if (!get_tcp_port_state(port)) exit(0);
resp = http_keepalive_send_recv(port:port, data:http_get(item:"/",port:port), embedded:TRUE);
if (!resp) exit(0);

if ( egrep(pattern:"<title>BIG-IP[^<]*</title>",string:resp,icase:TRUE) &&
     "tmui/tmui/system/settings/redirect.jsp" >< resp )
{
 replace_or_set_kb_item(name:"www/bigip",value:TRUE);
 replace_or_set_kb_item(name:"www/"+port+"/bigip",value:TRUE);
 replace_or_set_kb_item(name:"Services/www/"+port+"/embedded",value:TRUE);
 security_note(port);
}
