Return-Path: <SRS0=TUsn=ZY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E825C432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 05:50:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328192070B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 05:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="apK1WG3W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328192070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED46686044;
	Mon,  2 Dec 2019 05:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZAj2rjIdq_-G; Mon,  2 Dec 2019 05:50:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D815E85E1A;
	Mon,  2 Dec 2019 05:50:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF7EFC1DD9;
	Mon,  2 Dec 2019 05:50:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7207AC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 05:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5B07186429
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 05:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjhovOmxUUB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 05:50:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8311086420
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 05:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JxzbjAicqr2k4SAVBtPRNgbKswEiyX6uTFNgc/Dtp6k=; b=apK1WG3WMQC866rC6TIEGAe8J
 RgKee35qVnLc0VPcoQ8ae9sLiEhbUArE9MNDF18YZo910y0a/X2Ra1I4WjtaGnJKGKL7Hy8YNvwN8
 bAc+5ZmqYQZ9IvI+SJ7KWbH/SCevLyH9O3aos4UzUcfZWcF08ii1jmTEOp5Cvwp/2bw+7sd8k+ycY
 3Pt+RVyAqnB2sQ8WnQCmN61MnF6raHaDcD/fvVFBdByIg4wiBuUsY3afsLeS5KesFn0b1A0YpqD/t
 SiEaZHcjOFfgZU0Ihw4nsZWl+z2Rf219EJh8YfTstBt6/NQ+gdoA+9C5gCZS/AQDhTpgYXdPGbPFI
 nshkGjLYg==;
Received: from [80.156.29.194] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibebi-0004Qx-To; Mon, 02 Dec 2019 05:50:51 +0000
Date: Mon, 2 Dec 2019 06:50:47 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191202065047.3cffda7a@kernel.org>
In-Reply-To: <13629649-f363-4787-e88b-784f8309bfcd@gmail.com>
References: <20191130045420.111288-1-dwlsalmeida@gmail.com>
 <20191201090733.2bd8c2c4@kernel.org>
 <13629649-f363-4787-e88b-784f8309bfcd@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: dvb_dummy_fe.c: add
 members to dvb_dummy_fe_state
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

Em Mon, 2 Dec 2019 01:49:38 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro, thanks for checking out my work!
> 
> > please don't add fields at the
> > struct while they're not used, as this makes harder for reviewers to be
> > sure that we're not adding bloatware at the code.  
> 
> OK.
> 
> > Please remember that
> > we want one logical change per patch.
> >
> > It means that, if you add a state->frontend_status at the driver, the
> > patch should implement the entire logic for it.  
> I will keep this in mind.
> 
> >   static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
> >   {
> > +
> > +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> > +
> > +	state->sleeping = true;
> > +  
> 
> > Hmm...what's the sense of adding it? Where are you setting it to false?
> > Where are you using the sleeping state?  
> 
> I noted some drivers seem to instruct the hardware into a low power state. Take helene, for instance:
> 
> static int helene_sleep(struct dvb_frontend *fe)
> {
> 	struct helene_priv *priv = fe->tuner_priv;
> 
> 	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
> 	helene_enter_power_save(priv);
> 	return 0;
> }
> 
> static int helene_enter_power_save(struct helene_priv *priv)
> {
> 	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
> 	if (priv->state == STATE_SLEEP)
> 		return 0;
> 
> 	/* Standby setting for CPU */
> 	helene_write_reg(priv, 0x88, 0x0);
> 
> 	/* Standby setting for internal logic block */
> 	helene_write_reg(priv, 0x87, 0xC0);
> 
> 	priv->state = STATE_SLEEP;
> 	return 0;
> }
> 
> As we are emulating some piece of hardware I thought it would be enough to add a simple bool to indicate that the device was sleeping.

Yeah, that could have some value. Yet, if you're doing that, I suggest
to add a function to change the device power state, as this is what a
real driver would do. Something similar to:

static inline void change_power_state(struct state *st, bool on) 
{
	/* A real driver would have commands here to wake/sleep the dev */

	st->power = on;
}

In any case, a real device on sleeping mode will not be tuning any
channels, so all stats will reflect that, e. g:

	- frontend status will return 0;
	- stats that depends on having a lock will be set with:
		FE_SCALE_NOT_AVAILABLE
	  tip: most stats are like that
	- stats like signal strength should probably return 0.

Not so sure what SNR will return, but probably it should return
FE_SCALE_NOT_AVAILABLE too, as this is usually calculated indirectly
once the device is locked.

On other words, only signal strength and stats should return a value
with would be 0 on both cases. All other stats should return
FE_SCALE_NOT_AVAILABLE.

Btw, as this depends on having the stats implemented, I would suggest you to
first finish the tuning and stats part of the driver. Only after having those
patches, apply the power mode patch.

> 
> This patch was a bit convoluted on my part. Let's iron out the issues you pointed out in v2.
> 
> - Daniel.

Cheers,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
