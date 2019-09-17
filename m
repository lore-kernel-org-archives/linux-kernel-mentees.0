From: hverkuil at xs4all.nl (Hans Verkuil)
Date: Tue, 17 Sep 2019 11:20:34 +0200
Subject: [Linux-kernel-mentees] [PATCH v2] cec-follower: create analog
	channel frequencies
In-Reply-To: <20190917091323.48665-1-c0d1n61at3@gmail.com>
References: <20190916183835.132777-1-c0d1n61at3@gmail.com>
	<20190917091323.48665-1-c0d1n61at3@gmail.com>
Message-ID: <bb049332-3dfd-a3af-c364-543cafc7beec@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 9/17/19 11:13 AM, Jiunn Chang wrote:
> This frequency table will allow proper testing of tuner control.  There
> are three frequencies per analog broadcast type and broadcast system, so
> tuner increment and decrement can be tested.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
> 
> Changes since v1:
>  - Add Wikipedia link for analog channel frequencies
>  - Add spaces between { and }
> 
>> 8---------------------------------------------------------------------------8<

For future reference: just use --- instead of this line.

The patch looks good, I'll wait for the next patch that will use this before
merging this patch (otherwise I'd be merging dead code!).

Regards,

	Hans

> 
>  utils/cec-follower/cec-tuner.cpp | 80 ++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 5e794d71..912adcb9 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -7,6 +7,86 @@
>  
>  #include "cec-follower.h"
>  
> +/*
> + * This table contains analog television channel frequencies in KHz.  There are
> + * a total of three frequencies per analog broadcast type and broadcast system.
> + *
> + * CEC 17 and CEC Table 31 of the 1.4 specification lists the available analog
> + * broadcast types and broadcast systems.
> + *
> + * The table is indexed by [ana_bcast_type][bcast_system][i].
> + *
> + * Analog channel frequencies are from Wikipedia:
> + *
> + * https://en.wikipedia.org/wiki/Television_channel_frequencies
> + */
> +static unsigned int analog_freqs_khz[3][9][3] =
> +{
> +	// cable
> +	{
> +		// pal-bg
> +		{ 471250, 479250, 487250 },
> +		// secam-lq
> +		{ 615250, 623250, 631250 },
> +		// pal-m
> +		{ 501250, 507250, 513250 },
> +		// ntsc-m
> +		{ 519250, 525250, 531250 },
> +		// pal-i
> +		{ 45750, 53750, 61750 },
> +		// secam-dk
> +		{ 759250, 767250, 775250 },
> +		// secam-bg
> +		{ 495250, 503250, 511250 },
> +		// secam-l
> +		{ 639250, 647250, 655250 },
> +		// pal-dk
> +		{ 783250, 791250, 799250 }
> +	},
> +	// satellite
> +	{
> +		// pal-bg
> +		{ 519250, 527250, 535250 },
> +		// secam-lq
> +		{ 663250, 671250, 679250 },
> +		// pal-m
> +		{ 537250, 543250, 549250 },
> +		// ntsc-m
> +		{ 555250, 561250, 567250 },
> +		// pal-i
> +		{ 175250, 183250, 191250 },
> +		// secam-dk
> +		{ 807250, 815250, 823250 },
> +		// secam-bg
> +		{ 543250, 551250, 559250 },
> +		// secam-l
> +		{ 687250, 695250, 703250 },
> +		// pal-dk
> +		{ 831250, 839250, 847250 }
> +	},
> +	// terrestrial
> +	{
> +		// pal-bg
> +		{ 567250, 575250, 583250 },
> +		// secam-lq
> +		{ 711250, 719250, 727250 },
> +		// pal-m
> +		{ 573250, 579250, 585250 },
> +		// ntsc-m
> +		{ 591250, 597250, 603250 },
> +		// pal-i
> +		{ 199250, 207250, 215250 },
> +		// secam-dk
> +		{ 145250, 153250, 161250 },
> +		// secam-bg
> +		{ 591250, 599250, 607250 },
> +		// secam-l
> +		{ 735250, 743250, 751250 },
> +		// pal-dk
> +		{ 169250, 177250, 185250 }
> +	}
> +};
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	switch (msg.msg[1]) {
> 
