## INTRO TO NETWORKING
**SECURITY AND OPTIMIZATION AND PERFORMANCE DEVICES**
### *Security Devices: *
- Firewall: A firewall can be placed on routers(where is protects at a high level protecting all the devices connected to that 
router), on hosts(A host is any device that connects to a network and is capable of sending or receiving data. Example of hosts are
things like ; computers, servers, vms, iot devices, smartphones. Firewalls placed here protects the individual device it is placed
on) or as a stanalone device. 
It functions at multiple layers of the OSI model(2,3,4,7) and serves as the first line of defense. it block packets from entering
or leaving the network
- IDS (Intrusion Detection System): THis is a sytem designed to detect an attack or bridge on the network. THey don't do anything 
but send messages through log files, emails or other ways to administrator about the attack
- IPS (Intusion Prevention System): THis is a system designed to stop an attack or bridge on the network. THey actively block or
revert the attack and also send info via log or emails to alert the administrator.
- VPN(Virtual Private Network) Concentrator:THis will provide proper tunneling and encryption depending on the type of VPN connecton
that is allowed.

### Optimization and Performance Devices:
- Load Balancers: THey are commonly used to distribute requests making sure that no single server is overloaded. iT can also be called
a content switched or a content filter
- Proxy servers: 

### VPN: 
As said earlier, a VPN is use to create an encrypted tunnel through a public network to a private network by a remost host
Once a connection is made, the remote host is no longer seen as a remote host but as a local host to the private network.There are
several VPN  types.;
- Site to site VPN:This allows a site network to connect to another site network(main site) and can be seen as a local network.
THis can be used by different branches of a network. Here all the members of the different branches can work as if theyre on the same
local netowrk without needing to connect their individual host to the private network.
- Host to Site VPN( Remote access vpn): THis allows secure remote connection between a host and a site. It allows remote connection 
to local network.For example a remote worker accessing company private network from their home and it'll act like theyre physically
in their office
- Host to Host: THis is just two hosts connecting to each other like maybe a webserver and a database connection securely

#### VPN PROTOCOLS
These are the set of rules or technologies that dictate how files or data are securely transmitted over a vpn
- IPSEC(Internet Protocol Security): THis can be used in two modes;
  > Tunnel Mode: Encrypts the entire IP packet. Often used in site to site vpns
  > Transport Mode: Encrypts just the data within the packet(no header). Often used in host to host vpns
- OpenVPN: Used in remote access and site to site connections: They work in UDP(user datagram protocol for games and streaming) and
TCP( transmission control protocol for streaming and more stable internet browsing) 
- Wireguard: A mor modern version and very good and increasingly gaining popularity in remote access and site to site connections
- SSTP (Secure Socket Tunneling Protocol):  VPN protocol developed by Microsoft that encrypts traffic using SSL/TLS (the same
 encryption used by HTTPS websites).
- L2TP/IPsec (Layer 2 Tunneling Protocol): A combination of L2TP and IPsec that provides both encryption and tunneling.
- GRE (Generic routing encapsulation): THis is used to create a sub tunnel under IPSEC, by default ipsec only supprt unicast. That
is a one to one communication. With the help of the Gre, we can do multi. one to few or one to many(broadcast)

## DHCP (Dynamic Host Configuration Protocol)
There are ways a computer receives its ip, manually or dynamic using DHCP.
The administrator (could be a router etc) gives the host IP adddress together with a subnet mask, also DNS server and default gateway
location. 
### How DHCP work
- Upon boot up, a computer that is configured to request ip address, sends a DHCP discovery packet to the DHCP server. THe discovery packet
is sent to `255.255.255.255:67` UDP port 67
- THe DHCP receives the discovery packet and response with an offer packet. THe offer packet is sent to the mac address of the
computer using UDP port 68
- The computer receives the offer packet and sends a request packet( requesting for the proper IP configuration) from the DHCP server
- Once the DHCP server receives the request packet, it sends an acknowledgement packet which contains the proper ip config
- Upon receiving the acknowledgementpackage, the computer changes its configuration to the information received.
*Other things to know*
- Ports used: The port used are 67 to send the discovery packet and 68 to send back the offer packet. All on UDP
- Addresss scope: THisis the scope or range from which the DHCP is able to choose addresses for its devices
- Address reservation: Administrator reserves a specific address to specific mac addresses
- Lease: THis is the time limit set by the DHCP which dtermines how long the Ip configuration sent is going to be good for.

## DNS (Domain Name System)
DNS is way to map ip addresses to human friendly names like the *google.com* for instance.Without DNS servers, we would need to 
remember all the numbers in the ip addresses to be able to access a host
### The levels of DNS servers
- The root DNS servers
- The Top level domain(TLD) DNS servers - THis part is the part that contains the suffices like .com, .ng etc
- The Authoritative DNS servers. THis contains the actual data we are requesting to get. IT contains all the DNS records
### DNS records
- A record: Maps a domain to an IPv4 address.
- AAAA record: Maps a domain to an IPv6 address.
- CNAME record: For aliases (e.g., mapping blog.example.com to example.com).
- MX record: For mail servers
- TXT Record: Stores arbitrary text, often used for email verification (e.g., SPF, DKIM).
## What is NAT (Network Address Translation)?
Network Address Translation (NAT) is a networking process that allows multiple devices on a private network (like your home Wi-Fi)
 to share a single public IP address when accessing the internet. It is commonly used in routers to improve security and conserve
 public IP addresses.


## Topology
A topology is simply a map that can describe how network is laid out or how the network functions. A Topology can be either physical
or logical. A physical topology the path while the logical is the theory part

## IPv4 addresses
IP addresses help locate hosts on a network. THere are a total number of 2 raised to the power 32 ipv4 addresses. And because of this
there needs to be an organized way to handle them and also so they are findable. `subnet masks` was the answer here.

*Classes of IPv4 Addresses*
- *CLass A:* Here the range is from 0 -127 so the possible addresses is from `0.0.0.0 -> 127.255.255.255`
 THe subnet masks for class A is `255.0.0.0` and have a total number of addresses as `16,777,214`
- *cLASS b:* hERE THE range is from 128 - 191 so the possible addresses is from `128.0.0.0 -> 191.255.255.255`
 THe subnet masks for class B is `255.255.0.0` and total available addresses here is `65,534`
- *Class C:* Here the range is from 192 - 223 so the possible addresses is from `192.0.0.0 -> 223.255.255.255`
THe subnet masks for class C is `255.255.255.0` and the total available addresses is `254`
- *Class D:* Here the range is from 224 - 239 so the possible addresses is from `224.0.0.0 -> 239.255.255.255`
Class D networking are using for multicast communication

### APIPA Address
Sometimes DHCP may fail to configure or assign address to a host. in this case the host may self assign itself an *APIPA Address*
This address starts always with this `168.254`. So anytime you see your ip address starting with this, you just know your DHCP has
a problem

CIDR was developed to slow the growth of routing table. 
For the CIDR block 192.168.10.0/27:

Network Address: Correct! It is 192.168.10.0.

Broadcast Address: Correct! It is 192.168.10.31.

Usable IP Range: The usable IP range should be from 192.168.10.1 to 192.168.10.30. So, you start from .1 and go up to .30 (because
 .0 is reserved for the network address, and .31 is reserved for the broadcast).

Total Usable Hosts: The total number of usable hosts is 30 (which you got right), as there are 32 addresses in the /27 block
 (2^5 = 32), but two addresses are reserved (network and broadcast), leaving 30 usable IPs.

## EXAMPLE
In a small office space with network and address in 223.15.1.0/24. This is a class C network which has a total number of addresses
being 254. typically all the addresses within this network will see each other but lets say for security reaons we decide to divide
it into two slash 25 networks in 223.15.1.0/25 and 223.15.1.128/25
Each belonging to a differnt dept. the `223.15.1.0/25` will have a total of 126 usable ips (gotten from 128 - 2(for network and
broadcast address) and the range of usable ips will be from `223.15.1.1 - 223.15.1.126`. The second address being `223.15.1.128/25`
will also have a total of 126 usable ips and the range of usable ips will be from `223.15.1.129 - 223.15.1.254` and the broadcast
will be `223.15.1.255`

# IPv6
This was introduced as a solution to ipv4 being scarce due to the increase population. ipv6 has 128 bit binary number. The total number
is 2 raised to the power 128. 
Here the address is divided into a 64 bit network and a64 bit host.
LOcal ipv6 addresses always begin with `fe80` mean while global ipv6 addresses always begin with the range `2000 - 3999`
In ipv6, the DHCP has been eliminated mostly. THe devices configure their own addresses.


# Network Monitoring
It is always important to monitor your network to avoid surprises. The different ways to monitor network are;
- Log files
