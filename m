From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Tue, 17 Sep 2019 10:34:13 +0200
Subject: [Linux-kernel-mentees] [PATCH] cec-follower: create analog
	channel frequencies
In-Reply-To: <20190916183835.132777-1-c0d1n61at3@gmail.com>
References: <20190916183835.132777-1-c0d1n61at3@gmail.com>
Message-ID: <3a61d3e1-805e-f035-eef6-dcd2eb356f0c@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190917083413.gpLLVZtbQgsKzhtn2TWy9yUUzAimx7JNejmMftSeUdU@z>

On 9/16/19 8:38 PM, Jiunn Chang wrote:
> This frequency table will allow proper testing of tuner control.  There
> are three frequencies per analog broadcast type and broadcast system, so
> tuner increment and decrement can be tested.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  utils/cec-follower/cec-tuner.cpp | 77 ++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 5e794d71..e0d58e6c 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -7,6 +7,83 @@
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

No need for this empty comment line.

These frequencies are based on data from a wikipedia page, right?

It's useful to add a link to that page in this comment.

> + */
> +static unsigned int analog_freqs_khz[3][9][3] =
> +{
> +	// cable
> +	{
> +		// pal-bg
> +		{471250, 479250, 487250},

Add a space after { and before } in this table.

> +		// secam-lq
> +		{615250, 623250, 631250},
> +		// pal-m
> +		{501250, 507250, 513250},
> +		// ntsc-m
> +		{519250, 525250, 531250},
> +		// pal-i
> +		{45750, 53750, 61750},
> +		// secam-dk
> +		{759250, 767250, 775250},
> +		// secam-bg
> +		{495250, 503250, 511250},
> +		// secam-l
> +		{639250, 647250, 655250},
> +		// pal-dk
> +		{783250, 791250, 799250}
> +	},
> +	// satellite
> +	{
> +		// pal-bg
> +		{519250, 527250, 535250},
> +		// secam-lq
> +		{663250, 671250, 679250},
> +		// pal-m
> +		{537250, 543250, 549250},
> +		// ntsc-m
> +		{555250, 561250, 567250},
> +		// pal-i
> +		{175250, 183250, 191250},
> +		// secam-dk
> +		{807250, 815250, 823250},
> +		// secam-bg
> +		{543250, 551250, 559250},
> +		// secam-l
> +		{687250, 695250, 703250},
> +		// pal-dk
> +		{831250, 839250, 847250}
> +	},
> +	// terrestrial
> +	{
> +		// pal-bg
> +		{567250, 575250, 583250},
> +		// secam-lq
> +		{711250, 719250, 727250},
> +		// pal-m
> +		{573250, 579250, 585250},
> +		// ntsc-m
> +		{591250, 597250, 603250},
> +		// pal-i
> +		{199250, 207250, 215250},
> +		// secam-dk
> +		{145250, 153250, 161250},
> +		// secam-bg
> +		{591250, 599250, 607250},
> +		// secam-l
> +		{735250, 743250, 751250},
> +		// pal-dk
> +		{169250, 177250, 185250}
> +	}
> +};
> +
>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>  {
>  	switch (msg.msg[1]) {
> 

Regards,

	Hans
