From: b.zolnierkie@samsung.com (Bartlomiej Zolnierkiewicz)
Date: Mon, 15 Jul 2019 13:34:56 +0200
Subject: [Linux-kernel-mentees] [PATCH] video: radeon.h Fix Shifting
 signed 32 bit value by 31 bits problem
In-Reply-To: <20190706184111.GA13070@t-1000>
References: <CGME20190706184121epcas2p3e9f8717c9e809f7756b1dfa4665ce1c2@epcas2p3.samsung.com>
	<20190706184111.GA13070@t-1000>
Message-ID: <46c5dc00-eb00-e229-62af-6e171f9f2a40@samsung.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190715113456.98nVwn0AK1zzk4SqtNxC4jbceFWkN0yS4MWVMtwuMjg@z>


On 7/6/19 8:41 PM, Shobhit Kukreti wrote:
> Fix RB2D_DC_BUSY and HORZ_AUTO_RATIO_INC defines to use "U" cast to
> avoid shifting signed 32 bit values by 31 bit problem. This is not a
> problem for gcc built kernel.
> 
> However, the header file being a public api, other compilers may not
> handle the condition safely resulting in undefined behavior.
> 
> Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>

While you are at it please convert radeon.h to use BIT() macro.

> ---
>  include/video/radeon.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/video/radeon.h b/include/video/radeon.h
> index 005eae1..cb0a5f6 100644
> --- a/include/video/radeon.h
> +++ b/include/video/radeon.h
> @@ -531,7 +531,7 @@
>  #define RB2D_DC_FLUSH_2D			   (1 << 0)
>  #define RB2D_DC_FREE_2D				   (1 << 2)
>  #define RB2D_DC_FLUSH_ALL			   (RB2D_DC_FLUSH_2D | RB2D_DC_FREE_2D)
> -#define RB2D_DC_BUSY				   (1 << 31)
> +#define RB2D_DC_BUSY				   (1U << 31)
>  
>  /* DSTCACHE_MODE bits constants */
>  #define RB2D_DC_AUTOFLUSH_ENABLE                   (1 << 8)
> @@ -672,7 +672,7 @@
>  #define HORZ_STRETCH_ENABLE			   (1 << 25)
>  #define HORZ_AUTO_RATIO				   (1 << 27)
>  #define HORZ_FP_LOOP_STRETCH			   (0x7 << 28)
> -#define HORZ_AUTO_RATIO_INC			   (1 << 31)
> +#define HORZ_AUTO_RATIO_INC			   (1U << 31)
>  
>  
>  /* FP_VERT_STRETCH bit constants */

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
