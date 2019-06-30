From: mchehab at kernel.org (Mauro Carvalho Chehab)
Date: Sun, 30 Jun 2019 09:27:58 -0300
Subject: [Linux-kernel-mentees] [PATCH] Documentation: scsi: Changed
	hptiop.txt to hptiop.rst
In-Reply-To: <20190630042619.1555-1-sushmaunnibhavi425@gmail.com>
References: <y>
	<20190630042619.1555-1-sushmaunnibhavi425@gmail.com>
Message-ID: <20190630092758.562ed9bd@coco.lan>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Em Sun, 30 Jun 2019 09:56:19 +0530
Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com> escreveu:

> Converted the hptiop.txt file into .rst format to get a nice output
> in html and pdf formats
> 
> Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
> ---

Please see my comments to the first patch you wrote. At the title,
instead of "Documentation:", use just "docs:".

Don't forget to run get_maintainer.pl and copy the interested
parties on this e-mail.


>  Documentation/scsi/hptiop.rst | 253 ++++++++++++++++++++++++++++++++++

You forgot to remove the old file, and to add it to the scsi/index.rst.

Ah, as you're renaming things, you need to do a:

	$ git grep Documentation/scsi/hptiop.txt

to check if this change didn't break any reference to this file and,
if so, fix the broken reference. The same applies to the previous one.

>  1 file changed, 253 insertions(+)
>  create mode 100644 Documentation/scsi/hptiop.rst
> 
> diff --git a/Documentation/scsi/hptiop.rst b/Documentation/scsi/hptiop.rst
> new file mode 100644
> index 000000000000..4ca2a0231cb5
> --- /dev/null
> +++ b/Documentation/scsi/hptiop.rst
> @@ -0,0 +1,253 @@
> +=======================================================
> +HIGHPOINT ROCKETRAID 3xxx/4xxx ADAPTER DRIVER (hptiop)
> +=======================================================
> +
> +-------------------------
> +Controller Register Map
> +-------------------------

Same as before: adjust the markup line sizes, and - except for the document
title - use just title markup, as a bottom line. E. g.:

	HIGHPOINT ROCKETRAID 3xxx/4xxx ADAPTER DRIVER (hptiop)
	======================================================

	Controller Register Map
	-----------------------


> +
> +For RR44xx Intel IOP based adapters, the controller IOP is accessed via PCI BAR0 and BAR2:

Please keep a blank line after it.

Also, except where not possible, lines should have at most 80 columns.

Did you run checkpatch.pl? 

> +    +--------------+------------------------+
> +    | BAR0 offset  |  Register              |
> +    +==============+========================+
> +    |      0x11C5Z |  Link Interface IRQ Set|
> +    +--------------+------------------------+
> +    |      0x11C60 |Link Interface IRQ Clear|
> +    +--------------+------------------------+

In the case of aha152x.txt, we opted for the above format just
because it was already using a table artwork with required minor
adjustments to be recognized by Sphinx.

This file doesn't have any table artwork, so the author prefers
to keep the file less polluted.

So, please respect the author's view on that and keep the table
with the simpler markup, e. g.:


	    ===========    ========================
	    BAR0 offset    Register
	    ===========    ========================
            0x11C5C	   Link Interface IRQ Set
            0x11C60	   Link Interface IRQ Clear
	    ===========    ========================

That is a way less polluting while reading as a text file, and 
will produce an identical result after being parsed by
Sphinx.

Same applies to the other tables.

> +
> +    +-------------+-------------------------------------+
> +    | BAR2 offset |   Register                          |
> +    +=============+=====================================+
> +    |        0x10 |   Inbound Message Register 0        |
> +    +-------------+-------------------------------------+
> +    |        0x14 |   Inbound Message Register 1        |
> +    +-------------+-------------------------------------+
> +    |        0x18 |   Outbound Message Register 0       |
> +    +-------------+-------------------------------------+
> +    |        0x1C |   Outbound Message Register 1       |
> +    +-------------+-------------------------------------+
> +    |        0x20 |   Inbound Doorbell Register         |
> +    +-------------+-------------------------------------+
> +    |        0x24 |   Inbound Interrupt Status Register |
> +    +-------------+-------------------------------------+
> +    |        0x28 |   Inbound Interrupt Mask Register   |
> +    +-------------+-------------------------------------+
> +    |        0x30 |   Outbound Interrupt Status Register|
> +    +-------------+-------------------------------------+
> +    |        0x34 |   Outbound Interrupt Mask Register  |
> +    +-------------+-------------------------------------+
> +    |        0x40 |   Inbound Queue Port                |
> +    +-------------+-------------------------------------+
> +    |        0x44 |   Outbound Queue Port               |
> +    +-------------+-------------------------------------+
> +
> +For Intel IOP based adapters, the controller IOP is accessed via PCI BAR0:
> +
> +    +------------+--------------------------------------+
> +    | BAR0 offset|    Register                          |
> +    +============+======================================+
> +    |        0x10|    Inbound Message Register 0        |
> +    +------------+--------------------------------------+
> +    |        0x14|    Inbound Message Register 1        |
> +    +------------+--------------------------------------+
> +    |        0x18|    Outbound Message Register 0       |
> +    +------------+--------------------------------------+
> +    |        0x1C|    Outbound Message Register 1       |
> +    +------------+--------------------------------------+
> +    |        0x20|    Inbound Doorbell Register         |
> +    +------------+--------------------------------------+
> +    |        0x24|    Inbound Interrupt Status Register |
> +    +------------+--------------------------------------+
> +    |        0x28|    Inbound Interrupt Mask Register   |
> +    +------------+--------------------------------------+
> +    |        0x30|    Outbound Interrupt Status Register|
> +    +------------+--------------------------------------+
> +    |        0x34|    Outbound Interrupt Mask Register  |
> +    +------------+--------------------------------------+
> +    |        0x40|    Inbound Queue Port                |
> +    +------------+--------------------------------------+
> +    |        0x44|    Outbound Queue Port               |
> +    +------------+--------------------------------------+
> +
> +For Marvell not Frey IOP based adapters, the IOP is accessed via PCI BAR0 and BAR1:
> +
> + +----------------+-----------------------------------+
> + |    BAR0 offset |   Register                        |
> + +================+===================================+
> + |        0x20400 |   Inbound Doorbell Register       |
> + +----------------+-----------------------------------+
> + |        0x20404 |   Inbound Interrupt Mask Register |
> + +----------------+-----------------------------------+
> + |        0x20408 |   Outbound Doorbell Register      |
> + +----------------+-----------------------------------+
> + |        0x2040C |   Outbound Interrupt Mask Register|
> + +----------------+-----------------------------------+
> +     
> +  +---------------+-------------------------------+
> +  |   BAR1 offset |    Register                   |
> +  +===============+===============================+
> +  |           0x0 |   Inbound Queue Head Pointer  |
> +  +---------------+-------------------------------+
> +  |           0x4 |   Inbound Queue Tail Pointer  |
> +  +---------------+-------------------------------+
> +  |           0x8 |   Outbound Queue Head Pointer |
> +  +---------------+-------------------------------+
> +  |           0xC |   Outbound Queue Tail Pointer |
> +  +---------------+-------------------------------+
> +  |          0x10 |   Inbound Message Register    |
> +  +---------------+-------------------------------+
> +  |          0x14 |   Outbound Message Register   |
> +  +---------------+-------------------------------+
> +  |   0x40-0x1040 |   Inbound Queue               |
> +  +---------------+-------------------------------+
> +  | 0x1040-0x2040 |   Outbound Queue              |
> +  +---------------+-------------------------------+
> +
> +For Marvell Frey IOP based adapters, the IOP is accessed via PCI BAR0 and BAR1:
> +
> +    +-------------+---------------------------------+
> +    | BAR0 offset |   Register                      |
> +    +=============+=================================+
> +    |         0x0 |   IOP configuration information.|
> +    +-------------+---------------------------------+
> +
> +  +--------------+----------------------------------------------------------+
> +  |  BAR1 offset |   Register                                               |
> +  +==============+==========================================================+
> +  |        0x4000|    Inbound List Base Address Low                         |
> +  +--------------+----------------------------------------------------------+
> +  |        0x4004|    Inbound List Base Address High                        |
> +  +--------------+----------------------------------------------------------+
> +  |        0x4018|    Inbound List Write Pointer                            |
> +  +--------------+----------------------------------------------------------+
> +  |        0x402C|    Inbound List Configuration and Control                |
> +  +--------------+----------------------------------------------------------+
> +  |        0x4050|    Outbound List Base Address Low                        |
> +  +--------------+----------------------------------------------------------+
> +  |        0x4054|    Outbound List Base Address High                       |
> +  +--------------+----------------------------------------------------------+
> +  |        0x4058|    Outbound List Copy Pointer Shadow Base Address Low    |
> +  +--------------+----------------------------------------------------------+
> +  |        0x405C|    Outbound List Copy Pointer Shadow Base Address High   |
> +  +--------------+----------------------------------------------------------+
> +  |        0x4088|    Outbound List Interrupt Cause                         |
> +  +--------------+----------------------------------------------------------+
> +  |        0x408C|    Outbound List Interrupt Enable                        |
> +  +--------------+----------------------------------------------------------+
> +  |       0x1020C|    PCIe Function 0 Interrupt Enable                      |
> +  +--------------+----------------------------------------------------------+
> +  |       0x10400|    PCIe Function 0 to CPU Message A                      |
> +  +--------------+----------------------------------------------------------+
> +  |       0x10420|    CPU to PCIe Function 0 Message A                      |
> +  +--------------+----------------------------------------------------------+
> +  |       0x10480|    CPU to PCIe Function 0 Doorbell                       |
> +  +--------------+----------------------------------------------------------+
> +  |       0x10484|    CPU to PCIe Function 0 Doorbell Enable                |
> +  +--------------+----------------------------------------------------------+
> +
> +
> +I/O Request Workflow of Not Marvell Frey
> +------------------------------------------
> +
> +All queued requests are handled via inbound/outbound queue port.
> +A request packet can be allocated in either IOP or host memory.
> +
> +To send a request to the controller:
> +
> +    - Get a free request packet by reading the inbound queue port or
> +      allocate a free request in host DMA coherent memory.
> +
> +      The value returned from the inbound queue port is an offset
> +      relative to the IOP BAR0.
> +
> +      Requests allocated in host memory must be aligned on 32-bytes boundary.
> +
> +    - Fill the packet.
> +
> +    - Post the packet to IOP by writing it to inbound queue. For requests
> +      allocated in IOP memory, write the offset to inbound queue port. For
> +      requests allocated in host memory, write (0x80000000|(bus_addr>>5))
> +      to the inbound queue port.
> +
> +    - The IOP process the request. When the request is completed, it
> +      will be put into outbound queue. An outbound interrupt will be
> +      generated.
> +
> +      For requests allocated in IOP memory, the request offset is posted to
> +      outbound queue.
> +
> +      For requests allocated in host memory, (0x80000000|(bus_addr>>5))
> +      is posted to the outbound queue. If IOP_REQUEST_FLAG_OUTPUT_CONTEXT
> +      flag is set in the request, the low 32-bit context value will be
> +      posted instead.
> +
> +    - The host read the outbound queue and complete the request.
> +
> +      For requests allocated in IOP memory, the host driver free the request
> +      by writing it to the outbound queue.
> +
> +Non-queued requests (reset/flush etc) can be sent via inbound message
> +register 0. An outbound message with the same value indicates the completion
> +of an inbound message.
> +
> +
> +I/O Request Workflow of Marvell Frey
> +--------------------------------------
> +
> +All queued requests are handled via inbound/outbound list.
> +
> +To send a request to the controller:
> +
> +    - Allocate a free request in host DMA coherent memory.
> +
> +      Requests allocated in host memory must be aligned on 32-bytes boundary.
> +
> +    - Fill the request with index of the request in the flag.
> +
> +      Fill a free inbound list unit with the physical address and the size of
> +      the request.
> +
> +      Set up the inbound list write pointer with the index of previous unit,
> +      round to 0 if the index reaches the supported count of requests.
> +
> +    - Post the inbound list writer pointer to IOP.
> +
> +    - The IOP process the request. When the request is completed, the flag of
> +      the request with or-ed IOPMU_QUEUE_MASK_HOST_BITS will be put into a
> +      free outbound list unit and the index of the outbound list unit will be
> +      put into the copy pointer shadow register. An outbound interrupt will be
> +      generated.
> +
> +    - The host read the outbound list copy pointer shadow register and compare
> +      with previous saved read pointer N. If they are different, the host will
> +      read the (N+1)th outbound list unit.
> +
> +      The host get the index of the request from the (N+1)th outbound list
> +      unit and complete the request.
> +
> +Non-queued requests (reset communication/reset/flush etc) can be sent via PCIe
> +Function 0 to CPU Message A register. The CPU to PCIe Function 0 Message register
> +with the same value indicates the completion of message.
> +
> +
> +User-level Interface
> +---------------------
> +
> +The driver exposes following sysfs attributes:
> +
> +     NAME                 R/W    Description
> +     driver-version        R     driver version string
> +     firmware-version      R     firmware version string

This is another table. Please use the table markups

> +
> +
> +-----------------------------------------------------------------------------
> +Copyright (C) 2006-2012 HighPoint Technologies, Inc. All Rights Reserved.
> +-----------------------------------------------------------------------------

Seriously?

Why the copyright should be a document title???

> +
> +  This file is distributed in the hope that it will be useful,
> +  but WITHOUT ANY WARRANTY; without even the implied warranty of
> +  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +  GNU General Public License for more details.

This is GPL. You should add a SPDX markup to this file to reflect
it. See:

	Documentation/process/license-rules.rst

In this specific case, I would use a GPL-2.0 SPDX markup.


> +
> +  linux at highpoint-tech.com
> +  http://www.highpoint-tech.com

Please add a blank line between those two.

Thanks,
Mauro
