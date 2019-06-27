From: skhan@linuxfoundation.org (Shuah Khan)
Date: Wed, 26 Jun 2019 21:32:52 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] packet: Fix undefined
 behavior in bit shift
In-Reply-To: <20190627032532.18374-2-c0d1n61at3@gmail.com>
References: <20190627010137.5612-1-c0d1n61at3@gmail.com>
	<20190627032532.18374-2-c0d1n61at3@gmail.com>
Message-ID: <7f6f44b2-3fe4-85f6-df3c-ad59f2eadba2@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627033252.19w9T6-oF1rqLUJdLgpRS9IVW_Y2y8KQXzrKukhfWa0@z>

On 6/26/19 9:25 PM, Jiunn Chang wrote:
> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
> significant bit to unsigned.
> 
> Changes included in v2:
>    - use subsystem specific subject lines
>    - CC required mailing lists
> 

These version change lines don't belong in the change log.

> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---

Move them here.

>   include/uapi/linux/if_packet.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/if_packet.h b/include/uapi/linux/if_packet.h
> index 467b654bd4c7..3d884d68eb30 100644
> --- a/include/uapi/linux/if_packet.h
> +++ b/include/uapi/linux/if_packet.h
> @@ -123,7 +123,7 @@ struct tpacket_auxdata {
>   /* Rx and Tx ring - header status */
>   #define TP_STATUS_TS_SOFTWARE		(1 << 29)
>   #define TP_STATUS_TS_SYS_HARDWARE	(1 << 30) /* deprecated, never set */
> -#define TP_STATUS_TS_RAW_HARDWARE	(1 << 31)
> +#define TP_STATUS_TS_RAW_HARDWARE	(1U << 31)
>   
>   /* Rx ring - feature request bits */
>   #define TP_FT_REQ_FILL_RXHASH	0x1
> 

thanks,
-- Shuah
