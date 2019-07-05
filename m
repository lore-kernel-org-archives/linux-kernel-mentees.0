From: gregkh@linuxfoundation.org (Greg KH)
Date: Fri, 5 Jul 2019 07:30:37 +0200
Subject: [Linux-kernel-mentees] [Linux-kernel-mentee,
 PATCH] media: dvb_frontend.h: Fix shifting signed 32-bit value
 problem
In-Reply-To: <20190704170422.GA25633@luke-XPS-13>
References: <20190704170422.GA25633@luke-XPS-13>
Message-ID: <20190705053037.GC8621@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190705053037.PfFnRKy4jIfkf3iMgEqm3qjUwnH1I7mXmgyA-LFiNCc@z>

On Thu, Jul 04, 2019 at 10:04:22AM -0700, Luke Nowakowski-Krijger wrote:
> Fix DVBFE_ALGO_RECOVERY and DVBFE_ALGO_SEARCH_ERROR to use U cast which
> fixes undefined behavior error by certain compilers. 
> 
> Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> ---
>  include/media/dvb_frontend.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
> index f05cd7b94a2c..472fe5871d94 100644
> --- a/include/media/dvb_frontend.h
> +++ b/include/media/dvb_frontend.h
> @@ -144,7 +144,7 @@ enum dvbfe_algo {
>  	DVBFE_ALGO_HW			= (1 <<  0),
>  	DVBFE_ALGO_SW			= (1 <<  1),
>  	DVBFE_ALGO_CUSTOM		= (1 <<  2),
> -	DVBFE_ALGO_RECOVERY		= (1 << 31)
> +	DVBFE_ALGO_RECOVERY		= (1U << 31)

BIT() is better for stuff like this.

thanks,

greg k-h
