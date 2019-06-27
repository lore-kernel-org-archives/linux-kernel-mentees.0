From: skhan@linuxfoundation.org (Shuah Khan)
Date: Wed, 26 Jun 2019 19:12:12 -0600
Subject: [Linux-kernel-mentees] [PATCH] uapi: linux: Fix undefined
 behavior in bit shift
In-Reply-To: <20190627010137.5612-1-c0d1n61at3@gmail.com>
References: <20190627010137.5612-1-c0d1n61at3@gmail.com>
Message-ID: <289197af-7084-42b5-6568-244b8c228a54@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627011212.GBRTj4WKGJvDwOiTe1U3Bgw0AmMYhTGO2bPpHgXSPVg@z>

On 6/26/19 7:01 PM, Jiunn Chang wrote:
> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
> significant bit to unsigned.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
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


Hi Jiunn,

You will have to cc mailing lists. You sent two patches for two changes
in this file. Combining them in one patch might be a good idea.

btw. I just sent email with some tips and guidelines. Please refer to
them before sending patches.

thanks,
-- Shuah
