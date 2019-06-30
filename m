From: mchehab@kernel.org (Mauro Carvalho Chehab)
Date: Sun, 30 Jun 2019 09:01:58 -0300
Subject: [Linux-kernel-mentees] [PATCH v3] Documentation: Changed .txt
	file to .rst
In-Reply-To: <20190629115147.18358-1-sushmaunnibhavi425@gmail.com>
References: <20190629115147.18358-1-sushmaunnibhavi425@gmail.com>
Message-ID: <20190630090158.494febd4@coco.lan>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190630120158.2pky0zYwtDI8HZk5dU2RqpfI6w3ywWzV46hdp7Q93PU@z>

You forgot to run ./get_maintainer.pl:

	./scripts/get_maintainer.pl Documentation/scsi/aha152x.txt 
	Jonathan Corbet <corbet at lwn.net> (maintainer:DOCUMENTATION)
	linux-doc at vger.kernel.org (open list:DOCUMENTATION)
	linux-kernel at vger.kernel.org (open list)


The patch should be copied to the pointed mailing lists.

Em Sat, 29 Jun 2019 17:21:47 +0530
Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com> escreveu:

> Changed the Documentation/scsi/aha15x.txt file to Documentation/scsi/aha15x.rst since .rst files
> produces a nice output in html and pdf formats.

Please do descriptions with less than 72 columns.

> 
> Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
> ---
>  Documentation/scsi/aha152x.rst | 203 +++++++++++++++++++++++++++++++++
>  Documentation/scsi/aha152x.txt | 183 -----------------------------

You forgot to run it with -M1.


>  2 files changed, 203 insertions(+), 183 deletions(-)
>  create mode 100644 Documentation/scsi/aha152x.rst
>  delete mode 100644 Documentation/scsi/aha152x.txt
> 
> diff --git a/Documentation/scsi/aha152x.rst b/Documentation/scsi/aha152x.rst
> new file mode 100644
> index 000000000000..3c4d558b9daf
> --- /dev/null
> +++ b/Documentation/scsi/aha152x.rst
> @@ -0,0 +1,203 @@
> +
> +=====================================================
> +Adaptec AHA-1520/1522 SCSI driver for Linux (aha152x)
> +=====================================================
> +
> +Copyright 1993-1999 J?rgen Fischer <fischer at norbit.de>
> +TC1550 patches by Luuk van Dijk (ldz at xs4all.nl)
> +
> +
> +In Revision 2 the driver was modified a lot (especially the
> +bottom-half handler complete()).
> +
> +The driver is much cleaner now, has support for the  new
> +error handling code in 2.3, produced less cpu load (much
> +less polling loops), has slightly higher throughput  (at
> +least on my ancient test box; a i486/33Mhz/20MB).
> +
> +
> +========================
> +Configuration Arguments
> +========================

No! As I said before, add just the bottom line, with has to have
exactly the same size of the first line, e. g. this should look
like this:

	The driver is much cleaner now, has support for the  new
	error handling code in 2.3, produced less cpu load (much
	less polling loops), has slightly higher throughput  (at
	least on my ancient test box; a i486/33Mhz/20MB).


	Configuration Arguments
	=======================

Did you try to build with Sphinx? when the bottom line has more
characters than the previous line, it should have emitted a warning.

You should fix all warnings that affects the file you're touching.

Ah, and you should remove any trailing whitespaces.

> ++-----------+------------------------------------------+---------------------------+
> +|IOPORT|    |   base io address                        |     (0x340/0x140)         |
> ++-----------+------------------------------------------+---------------------------+
> +|IRQ        |      interrupt level                     |     (9-12; default 11)|   |
> ++-----------+------------------------------------------+---------------------------+
> +|SCSI_ID    |   scsi id of controller                  |   (0-7; default 7)        |
> ++-----------+------------------------------------------+---------------------------+
> +|RECONNECT  |  allow targets to disconnect from the bus|  (0/1; default 1 [on])    |
> ++-----------+------------------------------------------+---------------------------+
> +|PARITY     |   enable parity checking                 |   (0/1; default 1 [on])   |
> ++-----------+------------------------------------------+---------------------------+
> +|SYNCHRONOUS|   enable synchronous transfers           |   (0/1; default 1 [on])   |
> ++-----------+------------------------------------------+---------------------------+
> +|DELAY:     |   bus reset delay                        |  (default 100)            |
> ++-----------+------------------------------------------+---------------------------+
> +|EXT_TRANS: |  enable extended translation (see NOTES) |  (0/1: default 0 [off])   |
> ++-----------+------------------------------------------+---------------------------+
> +
> +========================================================================
> +Compile Time Configuration (go into AHA152X in drivers/scsi/Makefile)
> +========================================================================
> +
> +-DAUTOCONF
> + use configuration the controller reports (AHA-152x only)

No. As I said you, do it like:

	Compile Time Configuration (go into AHA152X in drivers/scsi/Makefile)
	=====================================================================

	DAUTOCONF
	  use configuration the controller reports (AHA-152x only)

> +
> +-DSKIP_BIOSTEST
> + Don't test for BIOS signature (AHA-1510 or disabled BIOS)
> +
> +-DSETUP0="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
> + override for the first controller 
> +
> +-DSETUP1="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
> + override for the second controller
> +
> +-DAHA152X_DEBUG
> + enable debugging output
> +
> +-DAHA152X_STAT
> + enable some statistics

(same here)
> +
> +
> +==========================
> +Lilo Command Line Options
> +==========================
> +
> +aha152x=<IOPORT>[,<IRQ>[,<SCSI-ID>[,<RECONNECT>[,<PARITY>[,<SYNCHRONOUS>[,<DELAY> [,<EXT_TRANS]]]]]]]
> +
> +The normal configuration can be overridden by specifying a command
> +line.When you do this, the  BIOS  test  is skipped. Entered values
> +have to be valid (known).  Don't use values that  aren't supported
> +under normal operation.  If  you think that you need other values:
> +contact me. For two controllers  use  the aha152x statement twice.
> +
> +
> +=================================
> +Symbols For Module Configuration
> +=================================
> +---------------------------
> +Choose From 2 Alternatives
> +---------------------------
> +1. specify everything (old)
> +
> +   aha152x=IOPORT,IRQ,SCSI_ID,RECONNECT,PARITY,SYNCHRONOUS,DELAY,EXT_TRANS
> +   configuration override for first controller

As before commented, this should be:


	Choose From 2 Alternatives
	--------------------------

	1. specify everything (old)

	aha152x=IOPORT,IRQ,SCSI_ID,RECONNECT,PARITY,SYNCHRONOUS,DELAY,EXT_TRANS
	  configuration override for first controller

the two whitespaces before "configuration" is a markup: it tells
Sphinx that the first line is a sort of title and should have a different
format - On older Sphinx versions, it becomes bold - on Sphinx 2.0, it
becomes even nicer.

> +
> +
> +   aha152x1=IOPORT,IRQ,SCSI_ID,RECONNECT,PARITY,SYNCHRONOUS,DELAY,EXT_TRANS
> +   configuration override for second controller
> +
> +2. specify only what you need to (irq or io is required; new)
> +
> +   io=IOPORT0[,IOPORT1]
> +   IOPORT for first and second controller
> +
> +   irq=IRQ0[,IRQ1]
> +   IRQ for first and second controller
> +
> +   scsiid=SCSIID0[,SCSIID1]
> +   SCSIID for first and second controller
> +
> +   reconnect=RECONNECT0[,RECONNECT1]
> +   allow targets to disconnect for first and second controller
> +
> +   parity=PAR0[PAR1]
> +   use parity for first and second controller
> +
> +   sync=SYNCHRONOUS0[,SYNCHRONOUS1]
> +   enable synchronous transfers for first and second controller
> +
> +   delay=DELAY0[,DELAY1]
> +   reset DELAY for first and second controller
> +
> +   exttrans=EXTTRANS0[,EXTTRANS1]
> +   enable extended translation for first and second controller

(same applies here)

> +
> +
> +If you use both alternatives the first will be taken.
> +
> +
> +====================
> +NOTES ON EXT_TRANS:
> +====================
> +
> +SCSI uses block numbers to address blocks/sectors on a device.
> +The BIOS uses a cylinder/head/sector addressing scheme (C/H/S)
> +scheme instead.  DOS expects a BIOS or driver that understands
> +this C/H/S addressing.
> +
> +The number of cylinders/heads/sectors is called geometry and is
> +required as base for requests in  C/H/S  addressing.  SCSI only
> +knows about the total capacity  of  disks  in blocks (sectors).
> +
> +Therefore the SCSI BIOS/DOS driver has to calculate a logical/virtual
> +geometry just  to  be  able  to  support  that addressing scheme. The
> +geometry returned by the SCSI BIOS is  a  pure  calculation  and  has
> +nothing to do with the  real/physical  geometry  of  the  disk (which
> +is usually irrelevant anyway).
> +
> +Basically this has no impact at all on Linux, because it also  uses block
> +instead of C/H/S addressing.  Unfortunately C/H/S addressing is also used
> +in the partition table and therefore every operating  system  has to know
> +the right geometry to be able to interpret it.
> +
> +Moreover there are certain limitations to the  C/H/S  addressing scheme,
> +namely the address space is limited to up to 255 heads, up to 63 sectors
> +and a maximum of 1023 cylinders.
> +
> +The AHA-1522 BIOS calculates the geometry by fixing the number of heads
> +to 64, the number of sectors to  32  and  by  calculating the number of
> +cylinders by dividing the capacity reported by the disk by 64*32 (1 MB).
> +This is considered to be the default translation.
> +
> +With respect to the limit of 1023 cylinders using C/H/S you can only
> +address the first GB of your disk in the partition table.  Therefore
> +BIOSes of some  newer controllers based on the AIC-6260/6360 support
> +extended  translation.  This means that the BIOS uses 255 for heads,
> +63 for  sectors  and then divides the capacity of the disk by 255*63
> +(about 8 MB), as soon it sees a disk greater than 1 GB. That results
> +in a maximum of about 8 GB addressable  diskspace  in the  partition
> +table (but there are already bigger disks out there today).
> +
> +To make it even more complicated the translation mode might/might
> +not be configurable in certain BIOS setups.
> +
> +This driver does some more or less failsafe guessing to get the
> +geometry right in most cases:
> +
> +- for disks<1GB:
> +  -use default translation (C/32/64)
> +
> +- for disks>1GB:
> +  - take current geometry from the partition table (using scsicam_bios_param
> +    and accept only `valid` geometries, ie. either (C/32/64) or (C/63/255)).
> +    This can be extended translation even if it's not enabled in the driver.
> +
> +  - if that fails, take extended translation if  enabled  by override,
> +    kernel or module parameter, otherwise take default translation and
> +    ask the user for verification.  This might on  not yet partitioned
> +    disks.
> +
> +
> +==================
> +REFERENCES USED:
> +==================
> + "AIC-6260 SCSI Chip Specification", Adaptec Corporation.
> +
> + "SCSI COMPUTER SYSTEM INTERFACE - 2 (SCSI-2)", X3T9.2/86-109 rev. 10h
> +
> + "Writing a SCSI device driver for Linux", Rik Faith (faith at cs.unc.edu)
> +
> + "Kernel Hacker's Guide", Michael K. Johnson (johnsonm at sunsite.unc.edu)
> +
> + "Adaptec 1520/1522 User's Guide", Adaptec Corporation.
> +
> + Michael K. Johnson (johnsonm at sunsite.unc.edu)
> +
> + Drew Eckhardt (drew at cs.colorado.edu)
> +
> + Eric Youngdale (eric at andante.org)
> +
> + special thanks to Eric Youngdale for the free(!) supplying the
> + documentation on the chip.
> diff --git a/Documentation/scsi/aha152x.txt b/Documentation/scsi/aha152x.txt
> deleted file mode 100644
> index 94848734ac66..000000000000
> --- a/Documentation/scsi/aha152x.txt
> +++ /dev/null
> @@ -1,183 +0,0 @@
> -$Id: README.aha152x,v 1.2 1999/12/25 15:32:30 fischer Exp fischer $
> -Adaptec AHA-1520/1522 SCSI driver for Linux (aha152x)
> -
> -Copyright 1993-1999 J?rgen Fischer <fischer at norbit.de>
> -TC1550 patches by Luuk van Dijk (ldz at xs4all.nl)
> -
> -
> -In Revision 2 the driver was modified a lot (especially the
> -bottom-half handler complete()).
> -
> -The driver is much cleaner now, has support for the new
> -error handling code in 2.3, produced less cpu load (much
> -less polling loops), has slightly higher throughput (at
> -least on my ancient test box; a i486/33Mhz/20MB).
> -
> -
> -CONFIGURATION ARGUMENTS:
> -
> -IOPORT        base io address                           (0x340/0x140)
> -IRQ           interrupt level                           (9-12; default 11)
> -SCSI_ID       scsi id of controller                     (0-7; default 7)
> -RECONNECT     allow targets to disconnect from the bus  (0/1; default 1 [on])
> -PARITY        enable parity checking                    (0/1; default 1 [on])
> -SYNCHRONOUS   enable synchronous transfers              (0/1; default 1 [on])
> -DELAY:        bus reset delay                           (default 100)
> -EXT_TRANS:    enable extended translation               (0/1: default 0 [off])
> -              (see NOTES)
> -
> -COMPILE TIME CONFIGURATION (go into AHA152X in drivers/scsi/Makefile):
> -
> --DAUTOCONF
> - use configuration the controller reports (AHA-152x only)
> -
> --DSKIP_BIOSTEST
> - Don't test for BIOS signature (AHA-1510 or disabled BIOS)
> -
> --DSETUP0="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
> - override for the first controller 
> -
> --DSETUP1="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
> - override for the second controller
> -
> --DAHA152X_DEBUG
> - enable debugging output
> -
> --DAHA152X_STAT
> - enable some statistics
> -
> -
> -LILO COMMAND LINE OPTIONS:
> -
> -aha152x=<IOPORT>[,<IRQ>[,<SCSI-ID>[,<RECONNECT>[,<PARITY>[,<SYNCHRONOUS>[,<DELAY> [,<EXT_TRANS]]]]]]]
> -
> - The normal configuration can be overridden by specifying a command line.
> - When you do this, the BIOS test is skipped. Entered values have to be
> - valid (known).  Don't use values that aren't supported under normal
> - operation.  If you think that you need other values: contact me.
> - For two controllers use the aha152x statement twice.
> -
> -
> -SYMBOLS FOR MODULE CONFIGURATION:
> -
> -Choose from 2 alternatives:
> -
> -1. specify everything (old)
> -
> -aha152x=IOPORT,IRQ,SCSI_ID,RECONNECT,PARITY,SYNCHRONOUS,DELAY,EXT_TRANS
> -  configuration override for first controller
> -
> -
> -aha152x1=IOPORT,IRQ,SCSI_ID,RECONNECT,PARITY,SYNCHRONOUS,DELAY,EXT_TRANS
> -  configuration override for second controller
> -
> -2. specify only what you need to (irq or io is required; new)
> -
> -io=IOPORT0[,IOPORT1]
> -  IOPORT for first and second controller
> -
> -irq=IRQ0[,IRQ1]
> -  IRQ for first and second controller
> -
> -scsiid=SCSIID0[,SCSIID1]
> -  SCSIID for first and second controller
> -
> -reconnect=RECONNECT0[,RECONNECT1]
> -  allow targets to disconnect for first and second controller
> -
> -parity=PAR0[PAR1]
> -  use parity for first and second controller
> -
> -sync=SYNCHRONOUS0[,SYNCHRONOUS1]
> -  enable synchronous transfers for first and second controller
> -
> -delay=DELAY0[,DELAY1]
> -  reset DELAY for first and second controller
> -
> -exttrans=EXTTRANS0[,EXTTRANS1]
> -  enable extended translation for first and second controller
> -
> -
> -If you use both alternatives the first will be taken.
> -
> -
> -NOTES ON EXT_TRANS: 
> -
> -SCSI uses block numbers to address blocks/sectors on a device.
> -The BIOS uses a cylinder/head/sector addressing scheme (C/H/S)
> -scheme instead.  DOS expects a BIOS or driver that understands this
> -C/H/S addressing.
> -
> -The number of cylinders/heads/sectors is called geometry and is required
> -as base for requests in C/H/S addressing.  SCSI only knows about the
> -total capacity of disks in blocks (sectors).
> -
> -Therefore the SCSI BIOS/DOS driver has to calculate a logical/virtual
> -geometry just to be able to support that addressing scheme.  The geometry
> -returned by the SCSI BIOS is a pure calculation and has nothing to
> -do with the real/physical geometry of the disk (which is usually
> -irrelevant anyway).
> -
> -Basically this has no impact at all on Linux, because it also uses block
> -instead of C/H/S addressing.  Unfortunately C/H/S addressing is also used
> -in the partition table and therefore every operating system has to know
> -the right geometry to be able to interpret it.
> -
> -Moreover there are certain limitations to the C/H/S addressing scheme,
> -namely the address space is limited to up to 255 heads, up to 63 sectors
> -and a maximum of 1023 cylinders.
> -
> -The AHA-1522 BIOS calculates the geometry by fixing the number of heads
> -to 64, the number of sectors to 32 and by calculating the number of
> -cylinders by dividing the capacity reported by the disk by 64*32 (1 MB).
> -This is considered to be the default translation.
> -
> -With respect to the limit of 1023 cylinders using C/H/S you can only
> -address the first GB of your disk in the partition table.  Therefore
> -BIOSes of some newer controllers based on the AIC-6260/6360 support
> -extended translation.  This means that the BIOS uses 255 for heads,
> -63 for sectors and then divides the capacity of the disk by 255*63
> -(about 8 MB), as soon it sees a disk greater than 1 GB.  That results
> -in a maximum of about 8 GB addressable diskspace in the partition table
> -(but there are already bigger disks out there today).
> -
> -To make it even more complicated the translation mode might/might
> -not be configurable in certain BIOS setups.
> -
> -This driver does some more or less failsafe guessing to get the
> -geometry right in most cases:
> -
> -- for disks<1GB: use default translation (C/32/64)
> -
> -- for disks>1GB:
> -  - take current geometry from the partition table
> -    (using scsicam_bios_param and accept only `valid' geometries,
> -    ie. either (C/32/64) or (C/63/255)).  This can be extended translation
> -    even if it's not enabled in the driver.
> -
> -  - if that fails, take extended translation if enabled by override,
> -    kernel or module parameter, otherwise take default translation and
> -    ask the user for verification.  This might on not yet partitioned
> -    disks.
> -
> -
> -REFERENCES USED:
> -
> - "AIC-6260 SCSI Chip Specification", Adaptec Corporation.
> -
> - "SCSI COMPUTER SYSTEM INTERFACE - 2 (SCSI-2)", X3T9.2/86-109 rev. 10h
> -
> - "Writing a SCSI device driver for Linux", Rik Faith (faith at cs.unc.edu)
> -
> - "Kernel Hacker's Guide", Michael K. Johnson (johnsonm at sunsite.unc.edu)
> -
> - "Adaptec 1520/1522 User's Guide", Adaptec Corporation.
> -
> - Michael K. Johnson (johnsonm at sunsite.unc.edu)
> -
> - Drew Eckhardt (drew at cs.colorado.edu)
> -
> - Eric Youngdale (eric at andante.org) 
> -
> - special thanks to Eric Youngdale for the free(!) supplying the
> - documentation on the chip.



Thanks,
Mauro
