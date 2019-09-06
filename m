From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Fri, 6 Sep 2019 08:59:22 +0200
Subject: [Linux-kernel-mentees] [PATCH] cec-compliance: audio return
	channel tests
In-Reply-To: <20190906035129.18447-1-c0d1n61at3@gmail.com>
References: <20190906035129.18447-1-c0d1n61at3@gmail.com>
Message-ID: <f2dcb4db-e8d3-132a-e6b4-5e789337e02f@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190906065922.Lmmfqm_I8_XzAOJJOUbohnBtOdU2Eec6VOx7Ap2tLSU@z>

On 9/6/19 5:51 AM, Jiunn Chang wrote:
> For devices on a HDMI ARC link, sinks can only support transmitter
> devices and sources and only support receiver devices.
> 
> This patch checks to see if the DUT is an transmitter or receiver and
> has the ARC flag set properly from the device.
> 
> This should apply to devices that support the HDMI CEC 1.4 spec going
> forward when ARC was introduced.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  utils/cec-compliance/cec-test-audio.cpp | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 872bb9ad..da2ed1d1 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -297,11 +297,35 @@ static int arc_terminate_rx(struct node *node, unsigned me, unsigned la, bool in
>  	return 0;
>  }
>  
> +static int arc_sink_tx(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	/* Check if we are upstream from the device. If we are, then the device is
> +	   an HDMI source, which means that it is an ARC receiver, not a transmitter. */
> +	if (pa_is_upstream_from(node->phys_addr, node->remote[la].phys_addr))
> +		return NOTAPPLICABLE;
> +	fail_on_test(!node->remote[la].has_arc_tx);
> +
> +	return 0;
> +}
> +
> +static int arc_source_rx(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	/* Check if the DUT is upstream from us. If it is, then it is an
> +	   HDMI sink, which means that it is an ARC transmitter, not receiver. */
> +	if (pa_is_upstream_from(node->remote[la].phys_addr, node->phys_addr))
> +		return NOTAPPLICABLE;
> +	fail_on_test(!node->remote[la].has_arc_rx);
> +
> +	return 0;
> +}
> +
>  struct remote_subtest arc_subtests[] = {
>  	{ "Initiate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_rx },
>  	{ "Terminate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_rx },
>  	{ "Initiate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_tx },
>  	{ "Terminate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_tx },
> +	{ "Sink ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_sink_tx },
> +	{ "Source ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_source_rx },
>  };
>  
>  const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
> 

This isn't right. First of all, the remote device may not have ARC support
at all, so failing if has_arc_rx/tx is false is wrong. And in addition, CEC
versions < 2 do not signal ARC support since they don't have the
Give Device Features message.

The second is to test against pa_is_upstream_from: a remote device such as
and AV receiver may have ARC support on both sink and source.

Just add the checks to system_info_give_features(): there are already checks
for has_rec_tv, and the new checks are similar to that: a TV can't have
has_arc_rx, and a Playback device can't have has_arc_tx.

Regards,

	Hans
