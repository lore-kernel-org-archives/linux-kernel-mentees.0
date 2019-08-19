From: b.zolnierkie at samsung.com (Bartlomiej Zolnierkiewicz)
Date: Mon, 19 Aug 2019 16:29:12 +0200
Subject: [Linux-kernel-mentees] [PATCH v3] video: atmel_lcdc: Fix
 Shifting signed 32 bit value by 31 bits problem
In-Reply-To: <1563756160-29702-1-git-send-email-shobhitkukreti@gmail.com>
References: <9c98fd20-5bc8-48a6-96ed-889a18d1a0c0@samsung.com>
	<CGME20190722004305epcas3p27386ec7448678b91edde0c80e7b63d64@epcas3p2.samsung.com>
	<1563756160-29702-1-git-send-email-shobhitkukreti@gmail.com>
Message-ID: <75a65eae-2fb3-6326-abe6-03dcfa04bd37@samsung.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>


Hi,

On 7/22/19 2:42 AM, Shobhit Kukreti wrote:
> Fix ATMEL_LCDC_MEMOR and ATMEL_LCDC_MEMOR_LITTLE defines to use "U"
> cast to avoid shifting signed 32 bit values by 31 bit problem. This
> problem. This is not a problem for gcc built kernel.
> 
> However, this may be a problem since the header is part of pbulic API
> which could be included for builds using compilers which do not handle
> this condition safely resulting in undefined behavior
> 
> Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>
> ---
> Changes in v3:
> 	Replace Bit Shift Operations with BIT() macros

1. Please update the patch summary & description to reflect that,
please see commit 13990cf8a180 for the reference:

commit 13990cf8a180cc070f0b1266140e799db8754289
Author: Amol Surati <suratiamol at gmail.com>
Date:   Sun Jul 7 14:27:29 2019 +0530

    ide: use BIT() macro for defining bit-flags
    
    The BIT() macro is available for defining the required bit-flags.
    
    Since it operates on an unsigned value and expands to an unsigned result,
    using it, instead of an expression like (1 << x), also fixes the problem
    of shifting a signed 32-bit value by 31 bits (e.g. 1 << 31).
    
    Signed-off-by: Amol Surati <suratiamol at gmail.com>
    Signed-off-by: David S. Miller <davem at davemloft.net>

2. Please update Cc: list of your mail by all mailing lists returned by
./scripts/get_maintainer.pl:

$ ./scripts/get_maintainer.pl -f include/video/atmel_lcdc.h
Nicolas Ferre <nicolas.ferre at microchip.com> (maintainer:MICROCHIP LCDFB DRIVER)
Bartlomiej Zolnierkiewicz <b.zolnierkie at samsung.com> (maintainer:FRAMEBUFFER LAYER)
Alexandre Belloni <alexandre.belloni at bootlin.com> (supporter:ARM/Microchip (AT91) SoC support)
Ludovic Desroches <ludovic.desroches at microchip.com> (supporter:ARM/Microchip (AT91) SoC support)
linux-fbdev at vger.kernel.org (open list:MICROCHIP LCDFB DRIVER)
dri-devel at lists.freedesktop.org (open list:FRAMEBUFFER LAYER)
linux-arm-kernel at lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support)
linux-kernel at vger.kernel.org (open list)

> Changes in v2:
>        Fixed spelling typo
> 
>  include/video/atmel_lcdc.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
