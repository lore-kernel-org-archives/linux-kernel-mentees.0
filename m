From: hverkuil at xs4all.nl (Hans Verkuil)
Date: Mon, 9 Sep 2019 10:05:42 +0200
Subject: [Linux-kernel-mentees] [PATCH] cec-compliance: system
	information give features
In-Reply-To: <20190906164443.1748-1-c0d1n61at3@gmail.com>
References: <20190906164443.1748-1-c0d1n61at3@gmail.com>
Message-ID: <e0c092da-407c-40f5-d6dd-a639508c19ef@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 9/6/19 6:44 PM, Jiunn Chang wrote:
> For devices on a HDMI ARC link, sinks can only support transmitter
> devices and sources can only support receiver devices.
> 
> Add two checks:
>  - Playback devices can only have has_arc_rx
>  - TVs can only have has_arc_tx
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index bbd13989..839c0fb9 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -172,6 +172,10 @@ int system_info_give_features(struct node *node, unsigned me, unsigned la, bool
>  		return fail("Only Playback and Recording devices shall set the Supports Deck Control bit\n");
>  	if (!cec_has_tv(1 << la) && node->remote[la].has_rec_tv)
>  		return fail("Only TVs shall set the Record TV Screen bit\n");
> +	if (!cec_has_playback(1 << la) && node->remote[la].has_arc_rx)
> +		return fail("Only Playback devices shall set the Source Supports ARC Rx bit\n");

Actually, this test should be inverted: the test is that has_arc_tx can't be used
by Playback devices.

> +	if (!cec_has_tv(1 << la) && node->remote[la].has_arc_tx)
> +		return fail("Only TVs shall set the Sink Supports ARC Tx bit\n");

Same here.

Right now this would fail for e.g. Audio Systems since in theory those can have
ARC for both rx and tx.

I also think that the has_arc_tx/rx fields should be renamed in a preceding patch
to 'source_has_arc_rx' and 'sink_has_arc_tx'. That makes these fields easier to
understand, and they match better with the CEC_OP_FEAT_DEV_ defines.

Regards,

	Hans

>  
>  	fail_on_test(node->remote[la].rc_profile != *rc_profile);
>  	fail_on_test(node->remote[la].dev_features != *dev_features);
> 
