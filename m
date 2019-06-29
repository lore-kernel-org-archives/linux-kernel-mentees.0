From: sushmaunnibhavi425@gmail.com (Sushma Unnibhavi)
Date: Sat, 29 Jun 2019 15:23:10 +0530
Subject: [Linux-kernel-mentees] [PATCH v2] Documentation: Converted .txt
	file to .rst Changed the file
In-Reply-To: <y>
References: <y>
Message-ID: <20190629095310.9693-1-sushmaunnibhavi425@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190629095310.qiRtbNIvfdPEltTqbnR-4dNCoKtkC7TBIQO3MwlfrgQ@z>

aha152x.txt into a .rst form and renamed aha152x.txt to aha152x.rst

Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
---
 Documentation/scsi/aha152x.rst | 121 +++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 51 deletions(-)

diff --git a/Documentation/scsi/aha152x.rst b/Documentation/scsi/aha152x.rst
index b3646a5948d9..207994d94b91 100644
--- a/Documentation/scsi/aha152x.rst
+++ b/Documentation/scsi/aha152x.rst
@@ -1,5 +1,7 @@
-$Id: README.aha152x,v 1.2 1999/12/25 15:32:30 fischer Exp fischer $
+
+=====================================================
 Adaptec AHA-1520/1522 SCSI driver for Linux (aha152x)
+=====================================================
 
 Copyright 1993-1999 J?rgen Fischer <fischer at norbit.de>
 TC1550 patches by Luuk van Dijk (ldz at xs4all.nl)
@@ -14,61 +16,78 @@ less polling loops), has slightly higher throughput  (at
 least on my ancient test box; a i486/33Mhz/20MB).
 
 
+########################
 CONFIGURATION ARGUMENTS:
---------------------------------------------------------------------------------
-|IOPORT     |   base io address                        | (0x340/0x140)         |
---------------------------------------------------------------------------------
-|IRQ        |  interrupt level                         | (9-12; default 11)    |
---------------------------------------------------------------------------------
-|SCSI_ID    |  scsi id of controller                   | (0-7; default 7)      |
---------------------------------------------------------------------------------
-|RECONNECT  |  allow targets to disconnect from the bus| (0/1; default 1 [on]) |
---------------------------------------------------------------------------------
-|PARITY     |  enable parity checking                  | (0/1; default 1 [on]) |
---------------------------------------------------------------------------------
-|SYNCHRONOUS|  enable synchronous transfers            | (0/1; default 1 [on]) |
---------------------------------------------------------------------------------
-|DELAY:     |  bus reset delay                         | (default 100)         |
---------------------------------------------------------------------------------
-|EXT_TRANS: |  enable extended translation             | (0/1: default 0 [off])|
-|           |  (see NOTES)                             |                       |
---------------------------------------------------------------------------------
+########################
+
+IOPORT-base io address-(0x340/0x140) 
+                               
+IRQ-interrupt level-(9-12; default 11)
+
+SCSI_ID-scsi id of controller-(0-7; default 7)
+
+RECONNECT-allow targets to disconnect from the bus-(0/1; default 1 [on])
+
+PARITY-enable parity checking-(0/1; default 1 [on])
+
+SYNCHRONOUS-enable synchronous transfers-(0/1; default 1 [on])
+
+DELAY-bus reset delay-(default 100)         
+
+EXT_TRANS-enable extended translation-(0/1: default 0 [off])(see NOTES)
+
+##########################################################################
 COMPILE TIME CONFIGURATION (go into AHA152X in drivers/scsi/Makefile):
+##########################################################################
+
+
+1. DAUTOCONF :
 
--DAUTOCONF
- use configuration the controller reports (AHA-152x only)
+   use configuration the controller reports (AHA-152x only)
 
--DSKIP_BIOSTEST
- Don't test for BIOS signature (AHA-1510 or disabled BIOS)
+2. DSKIP_BIOSTEST : 
+   
+   Don't test for BIOS signature (AHA-1510 or disabled BIOS)
 
--DSETUP0="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
- override for the first controller 
+3. DSETUP0 :
 
--DSETUP1="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
- override for the second controller
+   "{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
+   override for the first controller
 
--DAHA152X_DEBUG
- enable debugging output
+4. DSETUP1 : 
 
--DAHA152X_STAT
- enable some statistics
+   "{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
+   override for the second controller
 
+5. DAHA152X_DEBUG :
 
+   enable debugging output
+
+6. DAHA152X_STAT : 
+
+   enable some statistics
+
+###########################
 LILO COMMAND LINE OPTIONS:
+###########################
 
 aha152x=<IOPORT>[,<IRQ>[,<SCSI-ID>[,<RECONNECT>[,<PARITY>[,<SYNCHRONOUS>[,<DELAY> [,<EXT_TRANS]]]]]]]
 
-The normal configuration can be overridden by specifying a command 
-line.When you do this, the  BIOS  test  is skipped. Entered values 
-have to be valid (known).  Don't use values that  aren't supported 
+
+
+The normal configuration can be overridden by specifying a command
+line.When you do this, the  BIOS  test  is skipped. Entered values
+have to be valid (known).  Don't use values that  aren't supported
 under normal operation.  If  you think that you need other values:
 contact me. For two controllers  use  the aha152x statement twice.
 
-
+#################################
 SYMBOLS FOR MODULE CONFIGURATION:
+#################################
 
+****************************
 Choose from 2 alternatives:
-
+****************************
 1. specify everything (old)
 
    aha152x=IOPORT,IRQ,SCSI_ID,RECONNECT,PARITY,SYNCHRONOUS,DELAY,EXT_TRANS
@@ -107,22 +126,22 @@ Choose from 2 alternatives:
 
 If you use both alternatives the first will be taken.
 
-
-NOTES ON EXT_TRANS: 
-
+####################
+NOTES ON EXT_TRANS:
+####################
 SCSI uses block numbers to address blocks/sectors on a device.
 The BIOS uses a cylinder/head/sector addressing scheme (C/H/S)
-scheme instead.  DOS expects a BIOS or driver that understands 
+scheme instead.  DOS expects a BIOS or driver that understands
 this C/H/S addressing.
 
-The number of cylinders/heads/sectors is called geometry and is 
-required as base for requests in  C/H/S  addressing.  SCSI only 
+The number of cylinders/heads/sectors is called geometry and is
+required as base for requests in  C/H/S  addressing.  SCSI only
 knows about the total capacity  of  disks  in blocks (sectors).
 
 Therefore the SCSI BIOS/DOS driver has to calculate a logical/virtual
-geometry just  to  be  able  to  support  that addressing scheme. The 
-geometry returned by the SCSI BIOS is  a  pure  calculation  and  has 
-nothing to do with the  real/physical  geometry  of  the  disk (which 
+geometry just  to  be  able  to  support  that addressing scheme. The
+geometry returned by the SCSI BIOS is  a  pure  calculation  and  has
+nothing to do with the  real/physical  geometry  of  the  disk (which
 is usually irrelevant anyway).
 
 Basically this has no impact at all on Linux, because it also  uses block
@@ -145,7 +164,7 @@ BIOSes of some  newer controllers based on the AIC-6260/6360 support
 extended  translation.  This means that the BIOS uses 255 for heads,
 63 for  sectors  and then divides the capacity of the disk by 255*63
 (about 8 MB), as soon it sees a disk greater than 1 GB. That results
-in a maximum of about 8 GB addressable  diskspace  in the  partition 
+in a maximum of about 8 GB addressable  diskspace  in the  partition
 table (but there are already bigger disks out there today).
 
 To make it even more complicated the translation mode might/might
@@ -154,12 +173,12 @@ not be configurable in certain BIOS setups.
 This driver does some more or less failsafe guessing to get the
 geometry right in most cases:
 
-- for disks<1GB: 
+- for disks<1GB:
   -use default translation (C/32/64)
 
 - for disks>1GB:
   - take current geometry from the partition table (using scsicam_bios_param
-    and accept only `valid' geometries, ie. either (C/32/64) or (C/63/255)). 
+    and accept only `valid' geometries, ie. either (C/32/64) or (C/63/255)).
 	This can be extended translation even if it's not enabled in the driver.
 
   - if that fails, take extended translation if  enabled  by override,
@@ -167,9 +186,9 @@ geometry right in most cases:
     ask the user for verification.  This might on  not yet partitioned
     disks.
 
-
+#################
 REFERENCES USED:
-
+#################
  "AIC-6260 SCSI Chip Specification", Adaptec Corporation.
 
  "SCSI COMPUTER SYSTEM INTERFACE - 2 (SCSI-2)", X3T9.2/86-109 rev. 10h
@@ -184,7 +203,7 @@ REFERENCES USED:
 
  Drew Eckhardt (drew at cs.colorado.edu)
 
- Eric Youngdale (eric at andante.org) 
+ Eric Youngdale (eric at andante.org)
 
  special thanks to Eric Youngdale for the free(!) supplying the
  documentation on the chip.
-- 
2.17.1
