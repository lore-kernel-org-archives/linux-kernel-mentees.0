Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FD2C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:40:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 936D220770
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ks4Ey8cf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 936D220770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 40A1A8735E;
	Wed, 16 Sep 2020 06:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g+FWmYBQKIsi; Wed, 16 Sep 2020 06:40:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 85B888735A;
	Wed, 16 Sep 2020 06:40:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74146C0859;
	Wed, 16 Sep 2020 06:40:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 450C8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 410C286599
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJtSo4MbHAAo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:40:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 32A6C85621
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:40:49 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c9.dynamic.kabel-deutschland.de
 [95.90.213.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA69A20708;
 Wed, 16 Sep 2020 06:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600238448;
 bh=K5Kj9HgJm7gM+MKCU/+K5/S5g3OT6iP7z0/H3hNi3Do=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ks4Ey8cfFsbf5k8pWgHTca7IKjs+0r0g/7Dd3nMX7aN6UEEoHkKo09czyivdr+M21
 EhWyAshF4CqSE46ZQ+U3+BgmFpzHGcoT8Ht3B8zNHR52WD0LsOgVf/VCvlA+XMUDd6
 JqA1HcTz6ZYUOMHve7AyKilMjxzTvcb169l7Bi0M=
Date: Wed, 16 Sep 2020 08:40:36 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200916084036.09e8f3c8@coco.lan>
In-Reply-To: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
References: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: rdunlap@infradead.org, r.verdejo@samsung.com, linux-kernel@vger.kernel.org,
 nicolas@ndufresne.ca, geert@linux-m68k.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: vidtv: fix build on 32bit
	architectures
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

Em Tue, 15 Sep 2020 15:05:09 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Fix the following error for builds on 32bit architectures:
> 
> ERROR: modpost: "__udivdi3"
> [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!
> 
> Which is due to 64bit divisions that did not go through the helpers
> in linux/math64.h
> 
> As vidtv_mux_check_mux_rate was not operational in its current form,
> drop the entire function  while it is not fixed properly.
> 
> For now, call vidtv_mux_pad_with_nulls with a constant number of packets
> to avoid warnings due to unused functions when building this driver.
> 
> Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_mux.c  | 34 +------------------
>  .../media/test-drivers/vidtv/vidtv_s302m.c    |  4 +--
>  2 files changed, 3 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> index 5d1a275d504b..6e402a880fdc 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> @@ -336,38 +336,6 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
>  	return nbytes;
>  }
>  
> -static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
> -{
> -	/*
> -	 * attempt to maintain a constant mux rate, padding with null packets
> -	 * if needed
> -	 */
> -
> -	u32 nbytes = 0;  /* the number of bytes written by this function */
> -
> -	u64 nbytes_expected; /* the number of bytes we should have written */
> -	u64 nbytes_streamed; /* the number of bytes we actually wrote */
> -	u32 num_null_pkts; /* number of null packets to bridge the gap */
> -
> -	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
> -						  m->timing.past_jiffies);
> -
> -	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
> -	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
> -	nbytes_expected *= elapsed_time_msecs;
> -
> -	nbytes_streamed = m->mux_buf_offset;
> -
> -	if (nbytes_streamed < nbytes_expected) {
> -		/* can't write half a packet: roundup to a 188 multiple */
> -		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
> -		num_null_pkts    = nbytes_expected / TS_PACKET_LEN;
> -		nbytes          += vidtv_mux_pad_with_nulls(m, num_null_pkts);
> -	}
> -
> -	return nbytes;
> -}
> -
>  static void vidtv_mux_clear(struct vidtv_mux *m)
>  {
>  	/* clear the packets currently in the mux */
> @@ -397,7 +365,7 @@ static void vidtv_mux_tick(struct work_struct *work)
>  			nbytes += vidtv_mux_push_si(m);
>  
>  		nbytes += vidtv_mux_poll_encoders(m);
> -		nbytes += vidtv_mux_check_mux_rate(m);
> +		nbytes += vidtv_mux_pad_with_nulls(m, 256);
>  
>  		npkts = nbytes / TS_PACKET_LEN;
>  
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> index f8049cdf564a..e3290facf57b 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> @@ -285,12 +285,12 @@ static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
>  {
>  	u64 count = e->sample_count;
>  	struct vidtv_access_unit *au = e->access_units;
> +	u32 duration = CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
>  
>  	while (au) {
>  		count += au->num_samples;
>  
> -		au->pts = count *
> -			  CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
> +		au->pts = count * duration;

That doesn't seem to be the right thing to do here. 

Assuming that sampling rate is 48 kHz, you'll
have duration = 1.875, which would be rounded to 1.

In other words, the above is identical to:

	au->pts = count

Now, I don't know from where that CLOCK_UNIT_90KHZ came from.

If such constant is not needed anymore, just drop it. 
	
If, on the other hand, this is required by the specs, then
you may need to do a 64 bits division, e. g. using
div64_u64() or do_div().

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
