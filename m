Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3EFC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 15:50:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4380E22255
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 15:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Amo6QXY5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4380E22255
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5EE53204FB;
	Thu, 15 Oct 2020 15:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esT7dc1OCacx; Thu, 15 Oct 2020 15:50:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 54372204BC;
	Thu, 15 Oct 2020 15:50:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43E51C0052;
	Thu, 15 Oct 2020 15:50:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5B39C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 15:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B4EFD880F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 15:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fdmbe7pYBpmY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 15:50:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 95D84880F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 15:50:19 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7102C22254;
 Thu, 15 Oct 2020 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602777018;
 bh=Nbeh2o2J1dywpTUez/hZlzk3LDJQpKjMNnmMx7aK6l0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Amo6QXY5T5qCo7ziLFz224ScCkVpzyK15Ee9X170kSqUpVe89THSC8mVUywyi6k48
 jKfo7BSfCdEyux5Uux3nU0soWase4UBKU3TBduCo2h1yPrn+HaX4ZLeh167VsqO0oi
 2ft147Aa5V5yUIMStKZbruC5jVmj6plrubcWSzPU=
Date: Thu, 15 Oct 2020 17:50:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20201015155051.GB66528@kroah.com>
References: <20201015001712.72976-1-anmol.karan123@gmail.com>
 <20201015051225.GA404970@kroah.com>
 <20201015141012.GB77038@Thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015141012.GB77038@Thinkpad>
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: rose: Fix Null pointer
 dereference in rose_send_frame()
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

On Thu, Oct 15, 2020 at 07:40:12PM +0530, Anmol Karn wrote:
> On Thu, Oct 15, 2020 at 07:12:25AM +0200, Greg KH wrote:
> > On Thu, Oct 15, 2020 at 05:47:12AM +0530, Anmol Karn wrote:
> > > In rose_send_frame(), when comparing two ax.25 addresses, it assigns rose_call to 
> > > either global ROSE callsign or default port, but when the former block triggers and 
> > > rose_call is assigned by (ax25_address *)neigh->dev->dev_addr, a NULL pointer is 
> > > dereferenced by 'neigh' when dereferencing 'dev'.
> > > 
> > > - net/rose/rose_link.c
> > > This bug seems to get triggered in this line:
> > > 
> > > rose_call = (ax25_address *)neigh->dev->dev_addr;
> > > 
> > > Prevent it by checking NULL condition for neigh->dev before comparing addressed for 
> > > rose_call initialization.
> > > 
> > > Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> > > Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
> > > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > > ---
> > > I am bit sceptical about the error return code, please suggest if anything else is 
> > > appropriate in place of '-ENODEV'.
> > > 
> > >  net/rose/rose_link.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > > index f6102e6f5161..92ea6a31d575 100644
> > > --- a/net/rose/rose_link.c
> > > +++ b/net/rose/rose_link.c
> > > @@ -97,6 +97,9 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
> > >  	ax25_address *rose_call;
> > >  	ax25_cb *ax25s;
> > >  
> > > +	if (!neigh->dev)
> > > +		return -ENODEV;
> > 
> > How can ->dev not be set at this point in time?  Shouldn't that be
> > fixed, because it could change right after you check this, right?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hello Sir,
> 
> Thanks for the review,
> After following the call trace i thought, if neigh->dev is NULL it should
> be checked, but I will figure out what is going on with the crash reproducer,
> and I think rose_loopback_timer() is the place where problem started. 
> 
> Also, I have created a diff for checking neigh->dev before assigning ROSE callsign
> , please give your suggestions on this.
> 
> 
> diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> index f6102e6f5161..2ddd5e559442 100644
> --- a/net/rose/rose_link.c
> +++ b/net/rose/rose_link.c
> @@ -97,10 +97,14 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
>         ax25_address *rose_call;
>         ax25_cb *ax25s;
>  
> -       if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
> -               rose_call = (ax25_address *)neigh->dev->dev_addr;
> -       else
> -               rose_call = &rose_callsign;
> +       if (neigh->dev) {
> +               if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
> +                       rose_call = (ax25_address *)neigh->dev->dev_addr;
> +               else
> +                       rose_call = &rose_callsign;
> +       } else {
> +               return -ENODEV;
> +       }

The point I am trying to make is that if someone else is setting ->dev
to NULL in some other thread/context/whatever, while this is running,
checking for it like this will not work.

What is the lifetime rules of that pointer?  Who initializes it, and who
sets it to NULL.  Figure that out first please to determine how to check
for this properly.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
