From: sheriffesseson@gmail.com (Sheriff Esseson)
Date: Wed, 26 Jun 2019 23:37:52 +0100
Subject: [Linux-kernel-mentees] [linux-kernel-mentees] [PATCH] Documentation
	: scsi : Convert scsi.txt to scsi.rst
Message-ID: <20190626223752.14730-1-sheriffesseson@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190626223752.oDhTKoird6yIZVP3Yky2X0Nki60xlHKLDQAOlpMcdDs@z>

- Convert scsi.txt to scsi.rst to make it compatible with doc tools

- Do whitespace cleanup as suggested by checkpatch.pl

Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
---
 Documentation/scsi/{scsi.txt => scsi.rst} | 37 ++++++++++++++---------
 1 file changed, 22 insertions(+), 15 deletions(-)
 rename Documentation/scsi/{scsi.txt => scsi.rst} (72%)

diff --git a/Documentation/scsi/scsi.txt b/Documentation/scsi/scsi.rst
similarity index 72%
rename from Documentation/scsi/scsi.txt
rename to Documentation/scsi/scsi.rst
index 3d99d38cb..bf6d8c5c4 100644
--- a/Documentation/scsi/scsi.txt
+++ b/Documentation/scsi/scsi.rst
@@ -1,5 +1,10 @@
-SCSI subsystem documentation
+.. SPDX-License-Identifier: GPL-2.0
+..
+
+============================
+SCSI Subsystem Documentation
 ============================
+
 The Linux Documentation Project (LDP) maintains a document describing
 the SCSI subsystem in the Linux kernel (lk) 2.4 series. See:
 http://www.tldp.org/HOWTO/SCSI-2.4-HOWTO . The LDP has single
@@ -9,36 +14,38 @@ http://web.archive.org/web/*/http://www.torque.net/scsi/SCSI-2.4-HOWTO
 
 Notes on using modules in the SCSI subsystem
 ============================================
-The scsi support in the linux kernel can be modularized in a number of 
+The scsi support in the linux kernel can be modularized in a number of
 different ways depending upon the needs of the end user.  To understand
 your options, we should first define a few terms.
 
-The scsi-core (also known as the "mid level") contains the core of scsi 
+The SCSI-CORE
+        Also known as the "mid level", contains the core of scsi
 support.  Without it you can do nothing with any of the other scsi drivers.
+
 The scsi core support can be a module (scsi_mod.o), or it can be built into
-the kernel. If the core is a module, it must be the first scsi module 
-loaded, and if you unload the modules, it will have to be the last one 
+the kernel. If the core is a module, it must be the first scsi module
+loaded, and if you unload the modules, it will have to be the last one
 unloaded.  In practice the modprobe and rmmod commands (and "autoclean")
 will enforce the correct ordering of loading and unloading modules in
 the SCSI subsystem.
 
-The individual upper and lower level drivers can be loaded in any order 
+The individual upper and lower level drivers can be loaded in any order
 once the scsi core is present in the kernel (either compiled in or loaded
-as a module).  The disk driver (sd_mod.o), cdrom driver (sr_mod.o),
-tape driver ** (st.o) and scsi generics driver (sg.o) represent the upper 
-level drivers to support the various assorted devices which can be 
-controlled.  You can for example load the tape driver to use the tape drive, 
+as a module).  The disk driver ``(sd_mod.o)``, cdrom driver ``(sr_mod.o)``,
+tape driver ``(st.o)`` and scsi generics driver ``(sg.o)`` represent the upper
+level drivers to support the various assorted devices which can be
+controlled.  You can for example load the tape driver to use the tape drive,
 and then unload it once you have no further need for the driver (and release
 the associated memory).
 
 The lower level drivers are the ones that support the individual cards that
 are supported for the hardware platform that you are running under. Those
-individual cards are often called Host Bus Adapters (HBAs). For example the
-aic7xxx.o driver is used to control all recent SCSI controller cards from 
-Adaptec. Almost all lower level drivers can be built either as modules or 
+individual cards are often called **Host Bus Adapters** (HBAs). For example the
+``aic7xxx.o`` driver is used to control all recent SCSI controller cards from
+Adaptec. Almost all lower level drivers can be built either as modules or
 built into the kernel.
 
 
-** There is a variant of the st driver for controlling OnStream tape
-   devices. Its module name is osst.o .
+**Note:** There is a variant of the st driver for controlling OnStream tape
+   devices. Its module name is ``osst.o``.
 
-- 
2.22.0
