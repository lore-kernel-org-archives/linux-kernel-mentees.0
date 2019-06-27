From: skhan at linuxfoundation.org (Shuah Khan)
Date: Wed, 26 Jun 2019 21:34:24 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] nl80211: Fix undefined
 behavior in bit shift
In-Reply-To: <20190627032532.18374-4-c0d1n61at3@gmail.com>
References: <20190627010137.5612-4-c0d1n61at3@gmail.com>
	<20190627032532.18374-4-c0d1n61at3@gmail.com>
Message-ID: <c20a0a94-ab50-bb85-7c78-e02a465c5a40@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 6/26/19 9:25 PM, Jiunn Chang wrote:
> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
> significant bit to unsigned.
> 
> Changes included in v2:
>    - use subsystem specific subject lines
>    - CC required mailing lists
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---

Move version change lines here. They don't belong in the commit log.

>   include/uapi/linux/nl80211.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
> index 6f09d1500960..fa7ebbc6ff27 100644
> --- a/include/uapi/linux/nl80211.h
> +++ b/include/uapi/linux/nl80211.h
> @@ -5314,7 +5314,7 @@ enum nl80211_feature_flags {
>   	NL80211_FEATURE_TDLS_CHANNEL_SWITCH		= 1 << 28,
>   	NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR		= 1 << 29,
>   	NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR	= 1 << 30,
> -	NL80211_FEATURE_ND_RANDOM_MAC_ADDR		= 1 << 31,
> +	NL80211_FEATURE_ND_RANDOM_MAC_ADDR		= 1U << 31,
>   };
>   
>   /**
> 

thanks,
-- Shuah
