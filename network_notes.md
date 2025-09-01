Home Network Notes
==================

## Basic Netwok Configuration ##
The network consists of a TP Link router connected to 

            NBN
             |
     ____________________                         ___________________
     |                  |_________________________|                 |
     |  TPLink Router   |                         |  RE205 Extender |
     |__________________|                         |_________________|
           | | | |                                     | | |
     ______| | | |___________________                  |
     |       | |__________          |                  |
     |       |           |          |                  | 
grumpy.local rpi4.local  TV    Macbook Air          Sungrow

## MAC Addresses ##
Table of MAC addresses

Device Name (SSID)           Type                        IP                MAC                Band
(TP-Link_F2F8)               Archer VR300                192.168.1.1       74-FE-CE-73-F2-F8  2.4 GHz
(TP-Link_F2F8_5G)            Archer VR300                192.168.1.1       74-FE-CE-73-F2-F7  5 GHz
RE205 (TP-Link_F2F8_EXT)     TPLink range extender       dynamic           5C-E9-31-86-78-94  2.4 GHz
RE205 (TP-Link_F2F8_5G_EXT)  TPLink range extender       dynamic           5C-E9-31-86-78-95  5 GHz
                             TPLink RE205 Ethernet port  dynamic           5C-E9-31-86-78-94  wired
                             
grumpy.local                 Intel NUC                   dynamic           80-38-FB-0D-10-38  5 GHz
rpi4.local                   Raspberry Pi4               192.168.1.109     E4-5F-01-67-FA-B3  2.4 GHz
LGWebOSTV                    LG TV                       dynamic           7C-27-BC-44-72-66  5 GHz
espressif                    Sungrow Inverter            192.168.1.102     F0-9E-9E-06-B8-BC  2.4 GHz
DESKTOP-R8KMORP              Roshan PC                   dynamic           10-27-F5-55-D6-57  5 GHz
airpods                      Roshan airpods              dynamic           DC-53-92-6E-A9-9A  2.4 GHz
unknown                      phone?                      dynamic           9E-53-3B-56-B9-6B
unknown                      phone?                      dynamic           A2-85-05-77-AF-42

Note that some of these MAC addresses are dynamically generated (typically by a phone) so may change.

## Router Control and Status ##

For the main TPLink router access via tplinkmodem.net  
For the RE205 access via the IP address of the device. Look this up on the tplinkmodem.net admin page. The passwd is the same as the router.

For the TPLink router the most useful pages are: 
  Basic - Network Map (click on Wireless Clients icon)
  Advanced - Network - LAN Settings  (allows IP address reservation)
  Advanced - Wireless - Statistics  (shows what band devices are using)







