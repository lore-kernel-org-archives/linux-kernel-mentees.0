Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A21C2D0C2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 09:55:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41F5206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 09:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41F5206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A380A2049A;
	Tue, 31 Dec 2019 09:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YvtTs1jFeW05; Tue, 31 Dec 2019 09:55:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C6E320478;
	Tue, 31 Dec 2019 09:55:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88BF9C18DC;
	Tue, 31 Dec 2019 09:55:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 867F2C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 09:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 80B7D85C67
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 09:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98NlogVEI2GZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 09:55:05 +0000 (UTC)
X-Greylist: delayed 00:07:55 by SQLgrey-1.7.6
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1C9A585755
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 09:55:05 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id EDD6D11A001; Tue, 31 Dec 2019 09:47:06 +0000 (GMT)
Date: Tue, 31 Dec 2019 09:47:06 +0000
From: Sean Young <sean@mess.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <20191231094706.GD24469@gofer.mess.org>
References: <20191107013745.22147-1-dwlsalmeida@gmail.com>
 <20191130075415.5d7ac0b1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191130075415.5d7ac0b1@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media: dvb_dummy_fe: Add error
 messages in case of attach failure
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

Hi Daniel, Mauro,

On Sat, Nov 30, 2019 at 07:54:15AM +0100, Mauro Carvalho Chehab wrote:
> Em Wed,  6 Nov 2019 22:37:45 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
> 
> > From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> > 
> > Complain if the attach functions fail, for any reason. This is helpful
> > when debugging.
> > 
> > Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> > Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Looks OK to me.
> 
> > ---
> >  drivers/media/dvb-frontends/dvb_dummy_fe.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> > index 4db679cb70ad..ca86857c3667 100644
> > --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> > +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> > @@ -114,12 +114,16 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
> >  	/* allocate memory for the internal state */
> >  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> >  	if (!state)
> > -		return NULL;
> > +		goto err;
> >  
> >  	/* create dvb_frontend */
> >  	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
> >  	state->frontend.demodulator_priv = state;
> >  	return &state->frontend;
> > +
> > +err:
> > +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> > +	return NULL;
> >  }

If kzalloc() fails, it will already complain before returning. Lately we've
been removing error logs after kmalloc() failures. I'm sure someone will send
in patches reverting this if it gets merged.

Is this a good idea?

Sean

> >  
> >  static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
> > @@ -131,12 +135,16 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
> >  	/* allocate memory for the internal state */
> >  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> >  	if (!state)
> > -		return NULL;
> > +		goto err;
> >  
> >  	/* create dvb_frontend */
> >  	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
> >  	state->frontend.demodulator_priv = state;
> >  	return &state->frontend;
> > +
> > +err:
> > +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> > +	return NULL;
> >  }
> >  
> >  static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
> > @@ -148,12 +156,16 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
> >  	/* allocate memory for the internal state */
> >  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> >  	if (!state)
> > -		return NULL;
> > +		goto err;
> >  
> >  	/* create dvb_frontend */
> >  	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
> >  	state->frontend.demodulator_priv = state;
> >  	return &state->frontend;
> > +
> > +err:
> > +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> > +	return NULL;
> >  }
> >  
> >  static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
> 
> 
> 
> Cheers,
> Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
