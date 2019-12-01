Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C5FC432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 07:51:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3692020833
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 07:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T2Y9zX+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3692020833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0AF102000F;
	Sun,  1 Dec 2019 07:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9nhJ7zVhh4St; Sun,  1 Dec 2019 07:51:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E1C301FE32;
	Sun,  1 Dec 2019 07:51:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB909C1DD9;
	Sun,  1 Dec 2019 07:51:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7ACC6C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7782687B22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ryXNztn5r6x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:51:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4AC0987B21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ar5lBj/XBoTQRzWdBhddrRjlU7aJCUOJe5hxl/9WVw=; b=T2Y9zX+0DUU6kEa2tFC8aEi4b
 TujXFgtQuOz9MWTFpWPDKXAXHaT+Cb3gRvVGhVFsYf+KaKlqN3B+DwIQuRGbpqg7wGOVH0H4GLx1U
 O+TfyyM5mQUIQfwUq85sbrEXirAlZIzLNVFZog3T4+gc2oKJYI7SZpyzKJKPg3IA0Jr7Kw3LtyA2y
 ZAX7zfIt+vMtR2fqIihodLbhgb0ktTof6R0KySKOVkcI5ctFGWuRxEfXkrvtK1OqpsfshloztnqX3
 9aXvp5ISUSRsujDqI9q90oBMHke3BpiwFSPrRQYSRs/C8lR9mQmTn45TfpxVREERCNO5IWXnhTMjD
 VB9+4fjLA==;
Received: from [80.156.29.194] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibK17-0003SB-S7; Sun, 01 Dec 2019 07:51:42 +0000
Date: Sun, 1 Dec 2019 08:51:38 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191201085138.339a850e@kernel.org>
In-Reply-To: <20191112142436.1406-1-dwlsalmeida@gmail.com>
References: <20191112142436.1406-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: dvb_dummy_fe: Fix long
	lines
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Em Tue, 12 Nov 2019 11:24:36 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Break long lines into smaller ones to improve readability.
> 
> WARNING: line over 80 characters
> +	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
> 
> WARNING: line over 80 characters
> +	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
> WARNING: line over 80 characters
> +	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
> 
> WARNING: line over 80 characters
> +				FE_CAN_FEC_4_5 | FE_CAN_FEC_5_6 | FE_CAN_FEC_6_7 |
> 
> WARNING: line over 80 characters
> +				FE_CAN_FEC_7_8 | FE_CAN_FEC_8_9 | FE_CAN_FEC_AUTO |
> 
> WARNING: line over 80 characters
> +				FE_CAN_QAM_16 | FE_CAN_QAM_64 | FE_CAN_QAM_AUTO |
> 
> WARNING: line over 80 characters
> +		.symbol_rate_min	= (57840000 / 2) / 6
> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 62 ++++++++++++++++------
>  1 file changed, 45 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 4db679cb70ad..f41c1e0dc8eb 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -37,7 +37,8 @@ static int dvb_dummy_fe_read_ber(struct dvb_frontend* fe, u32* ber)
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
> +static int
> +dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)

The pointer references should be, instead:
	struct dvb_frontend *fe

Btw, I think that this patch conflicts with the one you posted previously.
Please don't do that, as it makes harder to apply.

If you have multiple patches touching a file, you should place them into
a patch series, in order to ensure that they can be applied at the right
order.

>  {
>  	*strength = 0;
>  	return 0;
> @@ -102,6 +103,7 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
>  static void dvb_dummy_fe_release(struct dvb_frontend* fe)
>  {
>  	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
> +
>  	kfree(state);
>  }
>  
> @@ -117,7 +119,10 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
>  		return NULL;
>  
>  	/* create dvb_frontend */
> -	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
> +	memcpy(&state->frontend.ops,
> +	       &dvb_dummy_fe_ofdm_ops,
> +	       sizeof(struct dvb_frontend_ops));
> +
>  	state->frontend.demodulator_priv = state;
>  	return &state->frontend;
>  }
> @@ -134,7 +139,10 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
>  		return NULL;
>  
>  	/* create dvb_frontend */
> -	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
> +	memcpy(&state->frontend.ops,
> +	       &dvb_dummy_fe_qpsk_ops,
> +	       sizeof(struct dvb_frontend_ops));
> +
>  	state->frontend.demodulator_priv = state;
>  	return &state->frontend;
>  }
> @@ -151,7 +159,10 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
>  		return NULL;
>  
>  	/* create dvb_frontend */
> -	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
> +	memcpy(&state->frontend.ops,
> +	       &dvb_dummy_fe_qam_ops,
> +	       sizeof(struct dvb_frontend_ops));
> +
>  	state->frontend.demodulator_priv = state;
>  	return &state->frontend;
>  }
> @@ -163,13 +174,21 @@ static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
>  		.frequency_min_hz	= 0,
>  		.frequency_max_hz	= 863250 * kHz,
>  		.frequency_stepsize_hz	= 62500,
> -		.caps = FE_CAN_FEC_1_2 | FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 |
> -				FE_CAN_FEC_4_5 | FE_CAN_FEC_5_6 | FE_CAN_FEC_6_7 |
> -				FE_CAN_FEC_7_8 | FE_CAN_FEC_8_9 | FE_CAN_FEC_AUTO |
> -				FE_CAN_QAM_16 | FE_CAN_QAM_64 | FE_CAN_QAM_AUTO |
> -				FE_CAN_TRANSMISSION_MODE_AUTO |
> -				FE_CAN_GUARD_INTERVAL_AUTO |
> -				FE_CAN_HIERARCHY_AUTO,
> +		.caps = FE_CAN_FEC_1_2 |
> +			FE_CAN_FEC_2_3 |
> +			FE_CAN_FEC_3_4 |
> +			FE_CAN_FEC_4_5 |
> +			FE_CAN_FEC_5_6 |
> +			FE_CAN_FEC_6_7 |
> +			FE_CAN_FEC_7_8 |
> +			FE_CAN_FEC_8_9 |
> +			FE_CAN_FEC_AUTO |
> +			FE_CAN_QAM_16 |
> +			FE_CAN_QAM_64 |
> +			FE_CAN_QAM_AUTO |
> +			FE_CAN_TRANSMISSION_MODE_AUTO |
> +			FE_CAN_GUARD_INTERVAL_AUTO |
> +			FE_CAN_HIERARCHY_AUTO,
>  	},
>  
>  	.release = dvb_dummy_fe_release,
> @@ -194,11 +213,16 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
>  		.frequency_min_hz	=  51 * MHz,
>  		.frequency_max_hz	= 858 * MHz,
>  		.frequency_stepsize_hz	= 62500,
> -		.symbol_rate_min	= (57840000 / 2) / 64,  /* SACLK/64 == (XIN/2)/64 */
> +		/* symbol_rate_min: SACLK/64 == (XIN/2)/64 */
> +		.symbol_rate_min	= (57840000 / 2) / 64,
>  		.symbol_rate_max	= (57840000 / 2) / 4,   /* SACLK/4 */
> -		.caps = FE_CAN_QAM_16 | FE_CAN_QAM_32 | FE_CAN_QAM_64 |
> -			FE_CAN_QAM_128 | FE_CAN_QAM_256 |
> -			FE_CAN_FEC_AUTO | FE_CAN_INVERSION_AUTO
> +		.caps = FE_CAN_QAM_16 |
> +			FE_CAN_QAM_32 |
> +			FE_CAN_QAM_64 |
> +			FE_CAN_QAM_128 |
> +			FE_CAN_QAM_256 |
> +			FE_CAN_FEC_AUTO |
> +			FE_CAN_INVERSION_AUTO
>  	},
>  
>  	.release = dvb_dummy_fe_release,
> @@ -227,8 +251,12 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
>  		.symbol_rate_min	= 1000000,
>  		.symbol_rate_max	= 45000000,
>  		.caps = FE_CAN_INVERSION_AUTO |
> -			FE_CAN_FEC_1_2 | FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 |
> -			FE_CAN_FEC_5_6 | FE_CAN_FEC_7_8 | FE_CAN_FEC_AUTO |
> +			FE_CAN_FEC_1_2 |
> +			FE_CAN_FEC_2_3 |
> +			FE_CAN_FEC_3_4 |
> +			FE_CAN_FEC_5_6 |
> +			FE_CAN_FEC_7_8 |
> +			FE_CAN_FEC_AUTO |
>  			FE_CAN_QPSK
>  	},
>  



Cheers,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
