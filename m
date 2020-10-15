Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CEBC43457
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 18:28:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A58920760
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 18:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suM0shAo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A58920760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C843687573;
	Thu, 15 Oct 2020 18:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzeYsSRq6SVL; Thu, 15 Oct 2020 18:28:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 45E2D87560;
	Thu, 15 Oct 2020 18:28:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B9DCC07FF;
	Thu, 15 Oct 2020 18:28:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 161EBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 18:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F089720031
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 18:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOd2Aga3OjGX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 18:28:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id B854C1FE0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 18:28:37 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id e10so2555350pfj.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QWq4RR483RrQf9qvcEwbqi4k6qhvE4kHX8NyfjGVvXA=;
 b=suM0shAoEviw0J4mahfECH0DeTWgf4dZTp6LGEsWQzK/KSgZ+NC+40mf1I2SqIihzQ
 r2xIiorWXvWrfrEpNp4gafT+LzAe9eFox9X9UPnP4GmZNw/7qQFtJYvBn+8fcs9BVKmn
 7txz0gzyIWSDMZyhUwb9BAJQIRN4wZU1NVPoam1TMVygI/i5yc1uJsnFqcD7h2LNqUoc
 IWqyf1YBx27sZmbwkCkX9ObUCK3Fx0OO5S+vfuUUP5CJuQbME3p+YQVlKJM3NYlUKW2b
 W+vTovoe16ySBTvDkFdnu+oQnIsQOrAhYsiwQww9z+N5bBo+h7VNTWoBlvT57GsRVqpg
 3Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QWq4RR483RrQf9qvcEwbqi4k6qhvE4kHX8NyfjGVvXA=;
 b=Z7tMxYRHXpdCBYKu8KPcayzwrW0GjnyW5Fk6LRng6s/BrVxX6VMvqysjVndeGBcJED
 ROi9CbdU1j1378dintg5JC979KzljG0+42zY74UUWHuDJkvSZ0WOyknDbLilQ/Cjbryy
 pzrNfZc/lv7Osm1zWSLvkEuiqcPCwYl0S/TOIh25MOnH/KO6b3m9EvPaf2ybcUwC0nUo
 6MEbGSKFtjsoDTJuultk3ZYX3mBsQapZD/IQJ1xSFmVwz1KfkpsG4a1KLnIlXZoxJD5I
 sUbjrch7PYiX3BwVCzwoiXBDEQC/UPU/VmyRT4eFnYklSW6n40m7Vc6wuE8T0w6KoUnY
 HG2g==
X-Gm-Message-State: AOAM531z5swTrIuENdw99xpMPwkKdW0OKkJBZvMYhHV1BAILgbzO8jA4
 iQm/7sJR44vnvSnayXsUZkc=
X-Google-Smtp-Source: ABdhPJwFgpj4yIvxdmNTRiStaRKsdkNCWiJ/L9B0sorGluXbb637Lm/bVOysyCqSimWb8YSk1QziHg==
X-Received: by 2002:a63:f80c:: with SMTP id n12mr140183pgh.94.1602786516974;
 Thu, 15 Oct 2020 11:28:36 -0700 (PDT)
Received: from Thinkpad ([45.118.167.207])
 by smtp.gmail.com with ESMTPSA id s66sm4070973pfb.25.2020.10.15.11.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 11:28:36 -0700 (PDT)
Date: Thu, 15 Oct 2020 23:58:27 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20201015182827.GA84192@Thinkpad>
References: <20201015001712.72976-1-anmol.karan123@gmail.com>
 <20201015051225.GA404970@kroah.com>
 <20201015141012.GB77038@Thinkpad>
 <20201015155051.GB66528@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015155051.GB66528@kroah.com>
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

On Thu, Oct 15, 2020 at 05:50:51PM +0200, Greg KH wrote:
> On Thu, Oct 15, 2020 at 07:40:12PM +0530, Anmol Karn wrote:
> > On Thu, Oct 15, 2020 at 07:12:25AM +0200, Greg KH wrote:
> > > On Thu, Oct 15, 2020 at 05:47:12AM +0530, Anmol Karn wrote:
> > > > In rose_send_frame(), when comparing two ax.25 addresses, it assigns rose_call to 
> > > > either global ROSE callsign or default port, but when the former block triggers and 
> > > > rose_call is assigned by (ax25_address *)neigh->dev->dev_addr, a NULL pointer is 
> > > > dereferenced by 'neigh' when dereferencing 'dev'.
> > > > 
> > > > - net/rose/rose_link.c
> > > > This bug seems to get triggered in this line:
> > > > 
> > > > rose_call = (ax25_address *)neigh->dev->dev_addr;
> > > > 
> > > > Prevent it by checking NULL condition for neigh->dev before comparing addressed for 
> > > > rose_call initialization.
> > > > 
> > > > Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
> > > > Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
> > > > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > > > ---
> > > > I am bit sceptical about the error return code, please suggest if anything else is 
> > > > appropriate in place of '-ENODEV'.
> > > > 
> > > >  net/rose/rose_link.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > > > index f6102e6f5161..92ea6a31d575 100644
> > > > --- a/net/rose/rose_link.c
> > > > +++ b/net/rose/rose_link.c
> > > > @@ -97,6 +97,9 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
> > > >  	ax25_address *rose_call;
> > > >  	ax25_cb *ax25s;
> > > >  
> > > > +	if (!neigh->dev)
> > > > +		return -ENODEV;
> > > 
> > > How can ->dev not be set at this point in time?  Shouldn't that be
> > > fixed, because it could change right after you check this, right?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Hello Sir,
> > 
> > Thanks for the review,
> > After following the call trace i thought, if neigh->dev is NULL it should
> > be checked, but I will figure out what is going on with the crash reproducer,
> > and I think rose_loopback_timer() is the place where problem started. 
> > 
> > Also, I have created a diff for checking neigh->dev before assigning ROSE callsign
> > , please give your suggestions on this.
> > 
> > 
> > diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
> > index f6102e6f5161..2ddd5e559442 100644
> > --- a/net/rose/rose_link.c
> > +++ b/net/rose/rose_link.c
> > @@ -97,10 +97,14 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
> >         ax25_address *rose_call;
> >         ax25_cb *ax25s;
> >  
> > -       if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
> > -               rose_call = (ax25_address *)neigh->dev->dev_addr;
> > -       else
> > -               rose_call = &rose_callsign;
> > +       if (neigh->dev) {
> > +               if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
> > +                       rose_call = (ax25_address *)neigh->dev->dev_addr;
> > +               else
> > +                       rose_call = &rose_callsign;
> > +       } else {
> > +               return -ENODEV;
> > +       }
> 
> The point I am trying to make is that if someone else is setting ->dev
> to NULL in some other thread/context/whatever, while this is running,
> checking for it like this will not work.
> 
> What is the lifetime rules of that pointer?  Who initializes it, and who
> sets it to NULL.  Figure that out first please to determine how to check
> for this properly.
> 
> thanks,
> 
> greg k-h

Sure sir, understood.


Thanks,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
