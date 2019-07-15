From: b.zolnierkie@samsung.com (Bartlomiej Zolnierkiewicz)
Date: Mon, 15 Jul 2019 13:33:32 +0200
Subject: [Linux-kernel-mentees] [PATCH v2] video: atmel_lcdc: Fix
 Shifting signed 32 bit value by 31 bits problem
In-Reply-To: <1562437711-30079-1-git-send-email-shobhitkukreti@gmail.com>
References: <20190706174059.GA14822@t-1000>
	<CGME20190706183057epcas2p47bccf466a0eb00f7f736b5486958422d@epcas2p4.samsung.com>
	<1562437711-30079-1-git-send-email-shobhitkukreti@gmail.com>
Message-ID: <9c98fd20-5bc8-48a6-96ed-889a18d1a0c0@samsung.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190715113332.GblY3BdjH2iAEhpFmN4eefTReQuEaudvfy1lPJ5zilU@z>


Hi,

On 7/6/19 8:28 PM, shobhitkukreti at gmail.com wrote:
> From: Shobhit Kukreti <shobhitkukreti at gmail.com>
> 
> Fix ATMEL_LCDC_MEMOR and ATMEL_LCDC_MEMOR_LITTLE defines to use "U"
> cast to avoid shifting signed 32 bit values by 31 bit problem. This
> is not a problem for gcc built kernel.
> 
> However, this may be a problem since the header is part of public API
> which could be included for builds using compilers which do not handle
> this condition safely resulting in undefined behavior
> 
> Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>

While you are at it please convert atmel_lcdc.h to use BIT() macro.

> ---
> Changes in v2:
> 	Fixed spelling typo
> 
>  include/video/atmel_lcdc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/video/atmel_lcdc.h b/include/video/atmel_lcdc.h
> index 43e497c..ac96b4f 100644
> --- a/include/video/atmel_lcdc.h
> +++ b/include/video/atmel_lcdc.h
> @@ -103,9 +103,9 @@ struct atmel_lcdfb_pdata {
>  #define	ATMEL_LCDC_CLKMOD	(1 << 15)
>  #define		ATMEL_LCDC_CLKMOD_ACTIVEDISPLAY	(0 << 15)
>  #define		ATMEL_LCDC_CLKMOD_ALWAYSACTIVE	(1 << 15)
> -#define	ATMEL_LCDC_MEMOR	(1 << 31)
> +#define	ATMEL_LCDC_MEMOR	(1U << 31)
>  #define		ATMEL_LCDC_MEMOR_BIG		(0 << 31)
> -#define		ATMEL_LCDC_MEMOR_LITTLE		(1 << 31)
> +#define		ATMEL_LCDC_MEMOR_LITTLE		(1U << 31)
>  
>  #define ATMEL_LCDC_TIM1		0x0808
>  #define	ATMEL_LCDC_VFP		(0xffU <<  0)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
