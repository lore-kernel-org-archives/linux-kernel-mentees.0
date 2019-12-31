Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FDBC2D0DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 10:08:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 581BE206D9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 10:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 581BE206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1730385B5D;
	Tue, 31 Dec 2019 10:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eI88wXb-3i+I; Tue, 31 Dec 2019 10:08:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0EA3C84F57;
	Tue, 31 Dec 2019 10:08:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0427CC1D81;
	Tue, 31 Dec 2019 10:08:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B517C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 10:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 371EE81A57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 10:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X87arYnUCsld
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 10:08:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8E1AC81A31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 10:08:04 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 89ED511A001; Tue, 31 Dec 2019 10:08:02 +0000 (GMT)
Date: Tue, 31 Dec 2019 10:08:02 +0000
From: Sean Young <sean@mess.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191231100802.GE24469@gofer.mess.org>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-4-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191201161542.69535-4-dwlsalmeida@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 3/6] media: dvb_dummy_fe: Fix
	ERROR: POINTER_LOCATION
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

Hi Daniel,

On Sun, Dec 01, 2019 at 01:15:39PM -0300, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Change foo* bar to foo *bar to avoid ERROR: POINTER_LOCATION in checkpatch.pl
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static int dvb_dummy_fe_init(struct dvb_frontend* fe)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +static void dvb_dummy_fe_release(struct dvb_frontend* fe)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
> 
> ERROR: "foo* bar" should be "foo *bar"
> +struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
> 
> ERROR: "foo* bar" should be "foo *bar"
> +	struct dvb_dummy_fe_state* state = NULL;
> 
> ERROR: "foo* bar" should be "foo *bar"
> +	struct dvb_dummy_fe_state* state = NULL;
> 
> ERROR: "foo* bar" should be "foo *bar"
> +	struct dvb_dummy_fe_state* state = NULL;
> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

The comments from Mauro in the previous version of this patch have not been
addressed:

https://patchwork.linuxtv.org/patch/60048/#114016

Thanks,

Sean


> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 24 +++++++++++-----------
>  drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +++---
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 987c3488fe6c..209e7ac0de33 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -31,25 +31,25 @@ static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_ber(struct dvb_frontend* fe, u32* ber)
> +static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
>  {
>  	*ber = 0;
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
> +static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe, u16 *strength)
>  {
>  	*strength = 0;
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)
> +static int dvb_dummy_fe_read_snr(struct dvb_frontend *fe, u16 *snr)
>  {
>  	*snr = 0;
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)
> +static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
>  {
>  	*ucblocks = 0;
>  	return 0;
> @@ -77,12 +77,12 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
> +static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
>  {
>  	return 0;
>  }
>  
> -static int dvb_dummy_fe_init(struct dvb_frontend* fe)
> +static int dvb_dummy_fe_init(struct dvb_frontend *fe)
>  {
>  	return 0;
>  }
> @@ -99,17 +99,17 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
>  	return 0;
>  }
>  
> -static void dvb_dummy_fe_release(struct dvb_frontend* fe)
> +static void dvb_dummy_fe_release(struct dvb_frontend *fe)
>  {
> -	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
>  	kfree(state);
>  }
>  
>  static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops;
>  
> -struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
> +struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
>  {
> -	struct dvb_dummy_fe_state* state = NULL;
> +	struct dvb_dummy_fe_state *state = NULL;
>  
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> @@ -131,7 +131,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
>  
>  struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
>  {
> -	struct dvb_dummy_fe_state* state = NULL;
> +	struct dvb_dummy_fe_state *state = NULL;
>  
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> @@ -153,7 +153,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
>  
>  struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
>  {
> -	struct dvb_dummy_fe_state* state = NULL;
> +	struct dvb_dummy_fe_state *state = NULL;
>  
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
> index 526fabd7751f..35efe2ce1a88 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
> @@ -12,9 +12,9 @@
>  #include <media/dvb_frontend.h>
>  
>  #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
> -extern struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void);
> -extern struct dvb_frontend* dvb_dummy_fe_qpsk_attach(void);
> -extern struct dvb_frontend* dvb_dummy_fe_qam_attach(void);
> +extern struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
> +extern struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
> +extern struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
>  #else
>  static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
>  {
> -- 
> 2.24.0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
