From: greg@kroah.com (Greg KH)
Date: Mon, 13 May 2019 11:36:20 +0200
Subject: [Linux-kernel-mentees] [PATCH v2] Staging: rtl8192u: ieee80211:
	Fix coding style warning
In-Reply-To: <20190502184534.GA10842@arch>
References: <20190502184534.GA10842@arch>
Message-ID: <20190513093620.GA833@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190513093620.03XiF-IcivmQy6UxLp5cwC9MBacUaKDE1hjVXG97PH8@z>

On Fri, May 03, 2019 at 12:15:34AM +0530, Puranjay Mohan wrote:
> Remove braces around a single if statement to fix following
> checkpatch.pl warning.
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
> v2- Removed trailing whitespace.
> 
>  drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> index 0e762e559675..bd97531a254f 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
> @@ -2577,9 +2577,9 @@ static inline void ieee80211_process_probe_response(
>  	spin_unlock_irqrestore(&ieee->lock, flags);
>  	if (is_beacon(beacon->header.frame_ctl)&&is_same_network(&ieee->current_network, network, ieee)&&\
>  		(ieee->state == IEEE80211_LINKED)) {
> -		if (ieee->handle_beacon != NULL) {
> +		if (ieee->handle_beacon != NULL)
>  			ieee->handle_beacon(ieee->dev,beacon,&ieee->current_network);
> -		}
> +
>  	}
> 
>  out:
> --
> 2.21.0
> 

You sent 5 patches for the same driver, yet no way of providing me the
information as to what order to apply them in.  I tried to guess, and
got it wrong, and so they would not all apply.

Please fix this up and resend all of them, as a numbered patch series,
so that I have a chance to get it right.

thanks,

greg k-h
