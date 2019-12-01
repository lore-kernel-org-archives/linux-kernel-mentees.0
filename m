Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15415C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 07:47:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA3C2215F1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 07:47:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jr7ralNE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA3C2215F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8C87588BB1;
	Sun,  1 Dec 2019 07:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxyCZ7Sp2-8D; Sun,  1 Dec 2019 07:47:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BF7488B9A;
	Sun,  1 Dec 2019 07:47:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D4B1C1DD9;
	Sun,  1 Dec 2019 07:47:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB2DFC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9300488B9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3bgfHuMyYkJ0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:47:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 823C188B6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=31ZIn5LuPfDCCSlP/VMSXAo5Pn3mOLQbdfQ8bPQa9Sg=; b=jr7ralNE8IVefG9LG2R/0zGWP
 xv6rzjRM7IVgQoFkQ5shDctC6DSMqRKYKb+OwxvnEzSoz/4PhCN2t+hcT6BcCkcAeXezWpMmiFHg3
 7Qj4OELKoBTSZQm9BtbuvtQj7fog6Nak+61ZUWc1PqC+w8RXmbpqwCtI7hYidbYF2WQuLNJh86L33
 AVj2X4mO/Q0tXzJNSPAhyxWo8BsZKviL8UBxtp7q5SXyUo63hc2L2qa3kN2TndO6BoBr9RL1ZsuAk
 h4joyVg99Hbv/lnS0ARKZ6xMoTakr0HlyJ0YXAyvgNbhWXUL/wvO4D1uh4l8n/c6uckzIo0gBzzFk
 SkHmSQ6CQ==;
Received: from [80.156.29.194] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibJx7-00025Q-B9; Sun, 01 Dec 2019 07:47:33 +0000
Date: Sun, 1 Dec 2019 08:47:28 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191201084728.17387715@kernel.org>
In-Reply-To: <20191112125014.5604-1-dwlsalmeida@gmail.com>
References: <20191112125014.5604-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] media: dvb_dummy_fe: Fix
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

Em Tue, 12 Nov 2019 09:50:14 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

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
> 
> ------------------------------------------------------------
> Changes in v2:
> 
> -Added checkpatch.pl previous output so it's more clear what
> is being fixed by this patch.
> 
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 24 +++++++++++-----------
>  drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +++---
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 4db679cb70ad..8413038aa30b 100644
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

Line too long. As you're touching on it, please also fix the long line
warning.

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
> @@ -126,7 +126,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
>  
>  struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
>  {
> -	struct dvb_dummy_fe_state* state = NULL;
> +	struct dvb_dummy_fe_state *state = NULL;
>  
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> @@ -143,7 +143,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
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

Don't keep the "extern" here:

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#185: FILE: drivers/media/dvb-frontends/dvb_dummy_fe.h:15:
+extern struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#186: FILE: drivers/media/dvb-frontends/dvb_dummy_fe.h:16:
+extern struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);

CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#187: FILE: drivers/media/dvb-frontends/dvb_dummy_fe.h:17:
+extern struct dvb_frontend *dvb_dummy_fe_qam_attach(void);


>  #else
>  static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
>  {



Cheers,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
