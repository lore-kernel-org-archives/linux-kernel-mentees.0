Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26548C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 11:58:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6AF921D7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 11:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6AF921D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4554E204B0;
	Tue, 15 Sep 2020 11:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24GYF65Qdw+K; Tue, 15 Sep 2020 11:58:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F359220373;
	Tue, 15 Sep 2020 11:58:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5DB2C0859;
	Tue, 15 Sep 2020 11:58:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D61FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3A99A87029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqqciz5y3rYi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:58:34 +0000 (UTC)
X-Greylist: delayed 00:05:02 by SQLgrey-1.7.6
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8CF318701D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:58:34 +0000 (UTC)
Received: from ramsan ([84.195.186.194]) by michel.telenet-ops.be with bizsmtp
 id UBtV2302Q4C55Sk06BtVmK; Tue, 15 Sep 2020 13:53:29 +0200
Received: from geert (helo=localhost) by ramsan with local-esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1kI9Wb-0008H5-Gl; Tue, 15 Sep 2020 13:53:29 +0200
Date: Tue, 15 Sep 2020 13:53:29 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
In-Reply-To: <20200821125848.1092958-4-dwlsalmeida@gmail.com>
Message-ID: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
References: <20200821125848.1092958-1-dwlsalmeida@gmail.com>
 <20200821125848.1092958-4-dwlsalmeida@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: mchehab+huawei@kernel.org, r.verdejo@samsung.com,
 linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [v10 3/4] media: vidtv: add a bridge
	driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

 	Hi Daniel,

On Fri, 21 Aug 2020, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
>
> Digital TV devices consist of several independent hardware components
> which are controlled by different drivers.
> Each media device is controlled by a group of cooperating drivers with the
> bridge driver as the main driver.
>
> This patch adds a bridge driver for the Virtual Digital TV driver [vidtv].

This is now commit f90cf6079bf67988 ("media: vidtv: add a bridge
driver") in the media tree.

noreply@ellerman.id.au reported the following error for an m68k
allmodconfig build:

     ERROR: modpost: "__udivdi3" [drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!

Presumably this fails on other 32-bit platforms, too.

> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
> +static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
> +{
> +	/*
> +	 * attempt to maintain a constant mux rate, padding with null packets
> +	 * if needed
> +	 */
> +
> +	u32 nbytes = 0;  /* the number of bytes written by this function */
> +
> +	u64 nbytes_expected; /* the number of bytes we should have written */
> +	u64 nbytes_streamed; /* the number of bytes we actually wrote */
> +	u32 num_null_pkts; /* number of null packets to bridge the gap */
> +
> +	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
> +						  m->timing.past_jiffies);
> +
> +	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
> +	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);

Seriously?!?

You multiply by 1000 first, followed by a division by 1000 using an
expensive 64-by-64 division?

> +	nbytes_expected *= elapsed_time_msecs;
> +
> +	nbytes_streamed = m->mux_buf_offset;
> +
> +	if (nbytes_streamed < nbytes_expected) {
> +		/* can't write half a packet: roundup to a 188 multiple */
> +		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);

drivers/media/test-drivers/vidtv/vidtv_mux.o: In function `vidtv_mux_tick':
vidtv_mux.c:(.text+0x788): undefined reference to `__udivdi3'

This is a 64-by-32 division, hence it should use a helper from
<linux/math64.h>.

However, I'm wondering if "nbytes_expected - nbytes_streamed" is
guaranteed to be a "small" number, hence a 32-by-32 division would be
sufficient?

> +		num_null_pkts    = nbytes_expected / TS_PACKET_LEN;

Likewise.

> +		nbytes          += vidtv_mux_pad_with_nulls(m, num_null_pkts);
> +	}
> +
> +	return nbytes;
> +}

> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> +static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
> +{
> +	u64 count = e->sample_count;
> +	struct vidtv_access_unit *au = e->access_units;
> +
> +	while (au) {
> +		count += au->num_samples;
> +
> +		au->pts = count *
> +			  CLOCK_UNIT_90KHZ / e->sampling_rate_hz;

drivers/media/test-drivers/vidtv/vidtv_s302m.o: In function `vidtv_s302m_encode':
vidtv_s302m.c:(.text+0x2ac): undefined reference to `__udivdi3'

Likewise.

> +
> +		au = au->next;
> +	}
> +}

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
