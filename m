From: greg at kroah.com (Greg KH)
Date: Thu, 2 May 2019 19:41:54 +0200
Subject: [Linux-kernel-mentees] [PATCH] Staging: rtl8192u: ieee80211:
 Fix comment formating errors
In-Reply-To: <20190502052608.GA15578@arch>
References: <20190502052608.GA15578@arch>
Message-ID: <20190502174154.GB14304@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Thu, May 02, 2019 at 10:56:08AM +0530, Puranjay Mohan wrote:
> Fix comment formating warnings found by checkpatch.pl
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  .../rtl8192u/ieee80211/ieee80211_softmac.c    | 66 ++++++++++---------
>  1 file changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> index 944c8894f9ff..be02f73f5618 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> @@ -196,13 +196,13 @@ static u8 MgntQuery_MgntFrameTxRate(struct ieee80211_device *ieee)
>  	}
>  
>  	/*
> -	// Data rate of ProbeReq is already decided. Annie, 2005-03-31
> -	if( pMgntInfo->bScanInProgress || (pMgntInfo->bDualModeScanStep!=0) ) {
> -	if(pMgntInfo->dot11CurrentWirelessMode==WIRELESS_MODE_A)
> -	rate = 0x0c;
> -	else
> -	rate = 0x02;
> -	}
> +	 * // Data rate of ProbeReq is already decided. Annie, 2005-03-31
> +	 * if( pMgntInfo->bScanInProgress || (pMgntInfo->bDualModeScanStep!=0) ) {
> +	 * if(pMgntInfo->dot11CurrentWirelessMode==WIRELESS_MODE_A)
> +	 * rate = 0x0c;
> +	 * else
> +	 * rate = 0x02;
> +	 * }
>  	 */
>  	return rate;

Ick, no, just delete this chunk, that indentation makes no sense.

>  }
> @@ -265,7 +265,7 @@ inline void softmac_mgmt_xmit(struct sk_buff *skb, struct ieee80211_device *ieee
>  			/* insert the skb packet to the management queue */
>  			/* as for the completion function, it does not need
>  			 * to check it any more.
> -			 * */
> +			 */
>  			printk("%s():insert to waitqueue!\n", __func__);
>  			skb_queue_tail(&ieee->skb_waitQ[tcb_desc->queue_index], skb);
>  		} else {
> @@ -1643,11 +1643,11 @@ static short ieee80211_sta_ps_sleep(struct ieee80211_device *ieee, u32 *time_h,
>  	int timeout;
>  	u8 dtim;
>  	/*if(ieee->ps == IEEE80211_PS_DISABLED ||
> -		ieee->iw_mode != IW_MODE_INFRA ||
> -		ieee->state != IEEE80211_LINKED)
> -
> -		return 0;
> -	*/
> +	 *	ieee->iw_mode != IW_MODE_INFRA ||
> +	 *	ieee->state != IEEE80211_LINKED)
> +	 *	
> +	 *	return 0;
> +	 */

Same here.

You also added trailing whitespace :(

>  	dtim = ieee->current_network.dtim_data;
>  	if (!(dtim & IEEE80211_DTIM_VALID))
>  		return 0;
> @@ -1979,8 +1979,8 @@ ieee80211_rx_frame_softmac(struct ieee80211_device *ieee, struct sk_buff *skb,
>  	case IEEE80211_STYPE_DISASSOC:
>  	case IEEE80211_STYPE_DEAUTH:
>  		/* FIXME for now repeat all the association procedure
> -		* both for disassociation and deauthentication
> -		*/
> +		 * both for disassociation and deauthentication
> +		 */
>  		if ((ieee->softmac_features & IEEE_SOFTMAC_ASSOCIATE) &&
>  		    ieee->state == IEEE80211_LINKED &&
>  		    ieee->iw_mode == IW_MODE_INFRA) {
> @@ -2050,10 +2050,10 @@ void ieee80211_softmac_xmit(struct ieee80211_txb *txb, struct ieee80211_device *
>  #endif
>  		    (!ieee->check_nic_enough_desc(ieee->dev, queue_index)) || \
>  		    (ieee->queue_stop)) {
> -			/* insert the skb packet to the wait queue */
> -			/* as for the completion function, it does not need
> +			/* insert the skb packet to the wait queue 


You added trailing whitespace :(

I recommend fixing your editor to highlight in red when this happens.

I stopped reviewing here...

thanks,

greg k-h
