Return-Path: <SRS0=IvWF=5M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7D7C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Mar 2020 15:52:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0653620748
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Mar 2020 15:52:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nqqaLM8I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0653620748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A62E587646;
	Fri, 27 Mar 2020 15:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nW5PhmeyXvlB; Fri, 27 Mar 2020 15:52:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EBD1987638;
	Fri, 27 Mar 2020 15:52:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD6F6C1D7C;
	Fri, 27 Mar 2020 15:52:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B77A3C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 15:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A393820381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 15:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H69TGR5MRrVj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 15:52:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 42D5C20372
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=TIWJKpVu/nfshxnm/DkzHlOOeJuDAPZT7l8sSuly9AI=; b=nqqaLM8IIbKMZsR8EBsPbVP7zS
 pReXUFy953KenkVmEeZJpNplSyDA6BdQOggATTzKcYCT4pcEsIhdz5zag/j28ffSPFgDpEuhmkujU
 8nPrd7/nSzot8q8CT3pV+xfjmWTiTQ1Xx/maDaTORxeyF88NgXYUI5b3rInuXD/XffXamgtJs5KUe
 MWM7gsUCr0HPS2hqYTdLQPsjq6nSemt/jNKq4q5W40brS1Uix/ANeXKbJIUOnpaKe4dDLsno8uPei
 mqhHrSNZJ20kz20ZOC1WhSxts1N+OOTGUT2LEG5EAQODlBpYHLow69nyV7NpphoB0EvOwDNjmNzkg
 LYNErajg==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216]
 helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHrH8-00048G-Mc; Fri, 27 Mar 2020 15:52:03 +0000
Date: Fri, 27 Mar 2020 16:51:56 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200327165156.055b256f@coco.lan>
In-Reply-To: <20200323125732.281976-3-dwlsalmeida@gmail.com>
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
 <20200323125732.281976-3-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, sean@mess.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, allison@lohutok.net,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v2 2/3] media: dvb_dummy_fe.c: lose TS lock on bad snr
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

Em Mon, 23 Mar 2020 09:57:31 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Periodically check the signal quality and eventually lose the lock if
> the quality is sub-par. A fake tuner can return a bad quality signal to
> the demod if the frequency is too far off from a valid frequency.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 160 ++++++++++++++++++++-
>  1 file changed, 155 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 9ff1ebaa5e04..14446f2bdcde 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -9,24 +9,166 @@
>  #include <linux/init.h>
>  #include <linux/string.h>
>  #include <linux/slab.h>
> +#include <linux/workqueue.h>
> +#include <linux/random.h>
>  
>  #include <media/dvb_frontend.h>
>  #include "dvb_dummy_fe.h"
>  
>  
> +struct dvb_dummy_fe_cnr_to_qual_s {
> +	/* attempt to use the same values as libdvbv5 */
> +	u32 modulation;
> +	u32 fec;
> +	u32 cnr_ok, cnr_good;
> +};
> +
> +struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_c_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QAM_256, FEC_NONE,  34000, 38000},
> +	{ QAM_64,  FEC_NONE,  30000, 34000},
> +};
> +
> +struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_s_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QPSK, FEC_1_2,  7000, 10000},
> +	{ QPSK, FEC_2_3,  9000, 12000},
> +	{ QPSK, FEC_3_4, 10000, 13000},
> +	{ QPSK, FEC_5_6, 11000, 14000},
> +	{ QPSK, FEC_7_8, 12000, 15000},
> +};
> +
> +struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_s2_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db */
> +	{ QPSK,  FEC_1_2,   9000,  12000},
> +	{ QPSK,  FEC_2_3,  11000,  14000},
> +	{ QPSK,  FEC_3_4,  12000,  15000},
> +	{ QPSK,  FEC_5_6,  12000,  15000},
> +	{ QPSK,  FEC_8_9,  13000,  16000},
> +	{ QPSK,  FEC_9_10, 13500, 16500},
> +	{ PSK_8, FEC_2_3,  14500, 17500},
> +	{ PSK_8, FEC_3_4,  16000,  19000},
> +	{ PSK_8, FEC_5_6,  17500, 20500},
> +	{ PSK_8, FEC_8_9,  19000,  22000},
> +};
> +
> +static struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_t_cnr_2_qual[] = {
> +	/* from libdvbv5 source code, in milli db*/
> +	{   QPSK, FEC_1_2,  4100,  5900},
> +	{   QPSK, FEC_2_3,  6100,  9600},
> +	{   QPSK, FEC_3_4,  7200, 12400},
> +	{   QPSK, FEC_5_6,  8500, 15600},
> +	{   QPSK, FEC_7_8,  9200, 17500},
> +
> +	{ QAM_16, FEC_1_2,  9800, 11800},
> +	{ QAM_16, FEC_2_3, 12100, 15300},
> +	{ QAM_16, FEC_3_4, 13400, 18100},
> +	{ QAM_16, FEC_5_6, 14800, 21300},
> +	{ QAM_16, FEC_7_8, 15700, 23600},
> +
> +	{ QAM_64, FEC_1_2, 14000, 16000},
> +	{ QAM_64, FEC_2_3, 19900, 25400},
> +	{ QAM_64, FEC_3_4, 24900, 27900},
> +	{ QAM_64, FEC_5_6, 21300, 23300},
> +	{ QAM_64, FEC_7_8, 22000, 24000},
> +};
> +
> +struct dvb_dummy_fe_config {
> +	/* probability of losing the lock due to low snr */
> +	u8 drop_tslock_prob_on_low_snr;
> +	u8 recover_tslock_prob_on_good_snr;
> +};
> +
>  struct dvb_dummy_fe_state {
>  	struct dvb_frontend frontend;
> +	struct dvb_dummy_fe_config config;
> +	struct delayed_work poll_snr;
> +	enum fe_status status;
>  };
>  
> +static void poll_snr_handler(struct work_struct *work)
> +{
> +	/*
> +	 * periodically check the signal quality and eventually
> +	 * lose the TS lock if it dips too low
> +	 */
> +	struct dvb_dummy_fe_state *state;
> +	struct dtv_frontend_properties *c;
> +	struct dvb_dummy_fe_cnr_to_qual_s *cnr2qual = NULL;
> +	struct dvb_dummy_fe_config *config;
> +	u32 array_size = 0;
> +	u16 snr = 0;
> +	u32 i;
> +
> +	state = container_of(work, struct dvb_dummy_fe_state, poll_snr.work);
> +	c = &state->frontend.dtv_property_cache;
> +	config = &state->config;
> +
> +	if (!state->frontend.ops.tuner_ops.get_rf_strength)
> +		return;
> +
> +	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
> +
> +	switch (c->delivery_system) {
> +	case SYS_DVBT:
> +	case SYS_DVBT2:
> +		cnr2qual = dvb_dummy_fe_t_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_dummy_fe_t_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBS:
> +		cnr2qual = dvb_dummy_fe_s_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_dummy_fe_s_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBS2:
> +		cnr2qual = dvb_dummy_fe_s2_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_dummy_fe_s2_cnr_2_qual);
> +		break;
> +
> +	case SYS_DVBC_ANNEX_A:
> +		cnr2qual = dvb_dummy_fe_c_cnr_2_qual;
> +		array_size = ARRAY_SIZE(dvb_dummy_fe_c_cnr_2_qual);
> +		break;
> +
> +	default:
> +		pr_warn("%This is missing one important case:
s: unsupported delivery system: %u\n",
> +			__func__,
> +			c->delivery_system);
> +		break;
> +	}
> +

The loop below is missing one important case: tuner is at completely
wrong frequency (e. g. when signal strength is 0).

Ok, ideally, the thread shouldn't even be running on such cases,
but, from your code, you're starting the thread when the driver is
initialized. So, a test like this would be needed here.

Well, I would actually do it on a different way, but then you'll need
to add more logic:

- store the CNR returned by the tuner after calls to set_frontend;

- if the stored CNR is -1, don't run the &state->poll_snr;

- if the stored CNR is between "ok" and "good" (e. g. frequency
  shift is zero), don't run this tread. Just fill the signal
  as if the channel is tunned;

- Otherwise, run this thread.

- At suspend, stop the thread only if it was running before;
- At resume, start the thread only if it was suspended with the
  thread running. Extra care should be taken here, as some tuner
  status change might happen at resume time (for example, due to
  a ioctl syscall to set_frontend, or due to a release syscall).

> +	for (i = 0; i <= array_size; i++) {
> +		if (cnr2qual[i].modulation == c->modulation &&
> +		    cnr2qual[i].fec == c->fec_inner) {



> +			if (snr < cnr2qual[i].cnr_ok) {
> +				/* eventually lose the TS lock */
> +				if (prandom_u32_max(100) <
> +				    config->drop_tslock_prob_on_low_snr)
> +					state->status = 0;
> +			} else {
> +				/* recover if the signal improves */
> +				if (prandom_u32_max(100) <
> +				    config->recover_tslock_prob_on_good_snr)
> +					state->status = FE_HAS_SIGNAL  |
> +							FE_HAS_CARRIER |
> +							FE_HAS_VITERBI |
> +							FE_HAS_SYNC    |
> +							FE_HAS_LOCK;
> +			}

Please add a:
			break;

as, once you get the right modulation/fec, there's no need to look up
further.

> +		}
> +	}
> +
> +	schedule_delayed_work(&state->poll_snr, msecs_to_jiffies(2000));
> +}
>  
>  static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
>  				    enum fe_status *status)
>  {
> -	*status = FE_HAS_SIGNAL
> -		| FE_HAS_CARRIER
> -		| FE_HAS_VITERBI
> -		| FE_HAS_SYNC
> -		| FE_HAS_LOCK;
> +
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	*status = state->status;
>  
>  	return 0;
>  }
> @@ -80,11 +222,18 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
>  
>  static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
>  {
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	cancel_delayed_work_sync(&state->poll_snr);
>  	return 0;
>  }
>  
>  static int dvb_dummy_fe_init(struct dvb_frontend *fe)
>  {
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	INIT_DELAYED_WORK(&state->poll_snr, &poll_snr_handler);
> +	schedule_delayed_work(&state->poll_snr, msecs_to_jiffies(2000));
>  	return 0;
>  }
>  
> @@ -104,6 +253,7 @@ static void dvb_dummy_fe_release(struct dvb_frontend *fe)
>  {
>  	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
>  
> +	cancel_delayed_work_sync(&state->poll_snr);
>  	kfree(state);
>  }
>  



Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
