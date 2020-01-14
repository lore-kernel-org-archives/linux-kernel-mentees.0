Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEA1C33CB2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 19:17:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC64E24656
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 19:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="HX1p1M7M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC64E24656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A134985FBA;
	Tue, 14 Jan 2020 19:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPRo7dL3JPr9; Tue, 14 Jan 2020 19:17:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7EA2085F92;
	Tue, 14 Jan 2020 19:17:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65ED2C18DD;
	Tue, 14 Jan 2020 19:17:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8507DC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6E8A387987
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVol9KtqfWBQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:17:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C5E66878F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 19:17:35 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id kx11so6117375pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 11:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=KKog2MzKI2EmbmFRZbPQAj3SDffD3J1/gHWJI9GN8Ak=;
 b=HX1p1M7M0qxTTrjPtfNCyMe/XxOTqf3q/mYb+Bs7xX2IsBGHIdUtLmO3lbUJnekqs3
 zmZx8eaYvmH4+wfQapPvneyFUPr/+naxzGfN2z9odiTcSz9ffOPkHSr8fVCJMQIDdqjd
 8+zg9cI3eFRQ+yHpgNKile2uqExmKwhkD4jRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KKog2MzKI2EmbmFRZbPQAj3SDffD3J1/gHWJI9GN8Ak=;
 b=NRK/mStH07m+A7ayjXQrHTTmIsmQw9byvZoeOYrTM1vS05SSzdqPQJ/2N+r9n0Sq41
 MUQIhfySB45lrbRUfPyO6x4Wl8a/nxR6e1bkCoLva6aypbgC8UGi3rmKna2S5xnzdxFg
 sGH5CSfva1OIS5Cb1oF0bkKHmH7q+ux1Q8m8gPnS034HO+Js01vVOVuDVaYmPc9U0QdP
 q6605w0RyOK7wsQzcLEoM2ez3eXRbjn3TH4Ga42FgpigmzziIMji1QCHrs/tfWXfUrVi
 jf/1h24Rm60duS7cp3xtKBc3D7xWIO4KeAyEaeH9jAlu2fgCiJXUzP2yKeC9Ag5/KaqW
 n6jA==
X-Gm-Message-State: APjAAAXAdDKbWAaHpBbLaMcZIljF/BRBrG4SdLoygyJn9L/qKZ62q6MN
 5dV8dLBcruaZal72IWd6AT0teQ==
X-Google-Smtp-Source: APXvYqz/3Tp3YfGdmLiQ3GBfQqRxYY+gia7aeZJwE4eJzKME0PsjfIh1cEmo6Hcm9w+t3OeBhqLjQg==
X-Received: by 2002:a17:90a:8a98:: with SMTP id
 x24mr31844615pjn.113.1579029455327; 
 Tue, 14 Jan 2020 11:17:35 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id b21sm20338404pfp.0.2020.01.14.11.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 11:17:34 -0800 (PST)
Date: Tue, 14 Jan 2020 14:17:33 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200114191733.GC103493@google.com>
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
 <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
 <25133367-6544-d0af-ae30-5178909748b1@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25133367-6544-d0af-ae30-5178909748b1@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mike.marciniszyn@intel.com, paulmck@kernel.org, linux-rdma@vger.kernel.org,
 dennis.dalessandro@intel.com, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1:
 verbs.c: Use built-in RCU list checking
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jan 15, 2020 at 12:04:58AM +0530, madhuparnabhowmik04@gmail.com wro=
te:
> From: Dennis Dalessandro <dennis.dalessandro@intel.com>
> =

> On 1/14/2020 12:00 PM, Dennis Dalessandro wrote:
> > On 1/14/2020 11:57 AM, Jason Gunthorpe wrote:
> > > On Tue, Jan 14, 2020 at 09:53:45PM +0530,
> > > madhuparnabhowmik04@gmail.com wrote:
> > > > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > > > =

> > > > list_for_each_entry_rcu has built-in RCU and lock checking.
> > > > Pass cond argument to list_for_each_entry_rcu.
> > > > =

> > > > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > > > =A0 drivers/infiniband/hw/hfi1/verbs.c | 2 +-
> > > > =A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > =

> > > > diff --git a/drivers/infiniband/hw/hfi1/verbs.c
> > > > b/drivers/infiniband/hw/hfi1/verbs.c
> > > > index 089e201d7550..22f2d4fd2577 100644
> > > > +++ b/drivers/infiniband/hw/hfi1/verbs.c
> > > > @@ -515,7 +515,7 @@ static inline void hfi1_handle_packet(struct
> > > > hfi1_packet *packet,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 opa_get_lid(packet->dlid, 9B));
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!mcast)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto drop;
> > > > -=A0=A0=A0=A0=A0=A0=A0 list_for_each_entry_rcu(p, &mcast->qp_list, =
list) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 list_for_each_entry_rcu(p, &mcast->qp_list, =
list,
> > > > lockdep_is_held(&(ibp->rvp.lock))) {
> > > =

> > > Okay, this looks reasonable
> > > =

> > > Mike, Dennis, is this the right lock to test?
> > > =

> > =

> > I'm looking at that right now actually, I don't think this is correct.
> > Wanted to talk to Mike before I send a response though.
> > =

> > -Denny
> =

> That's definitely going to throw a ton of lock dep messages. It's not rea=
lly
> the right lock either. Instead what we probably need to do is what we do =
in
> the non-multicast part of the code and take the rcu_read_lock().
> =

> I'd say hold off on this and we'll fix it right. Same goes for the qib on=
e.
> =

> Alright, thank you for reviewing.
> =

> The rdmavt one though looks to be OK. I'll give it a test.

Madhuparna, there seems to be an issue with your mail client where it is not
quoting text correctly, either there is a '>' missing or there are too many.
Can you look into it and figure what's wrong with it?

thanks,

 - Joel

> =

> Thank you,
> Madhuparna
> =

> -Denny
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
