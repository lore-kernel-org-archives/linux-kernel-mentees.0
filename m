Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0789C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:48:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C322078A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGdOixIk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C322078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3AC8787E81;
	Mon, 27 Jul 2020 13:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCSou4zluqZC; Mon, 27 Jul 2020 13:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7AB2487AE7;
	Mon, 27 Jul 2020 13:48:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C8CEC0050;
	Mon, 27 Jul 2020 13:48:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29501C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 02AD487E7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GyEkHMQM09t2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:48:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 67E6F87AE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:48:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p1so8019047pls.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NJmzr2KQBRICuAu1pv5/YVfC3bftlzNt8R1cIWx8IbE=;
 b=HGdOixIk+LNjSWHZUK4ATkRjyLKVYX9VDXRfBVLTFUpwXDGNhSj4hugCezPW9Watsx
 DYgDZ6JCFTZY80+LajAIl6hG/xxGlUt9ZyUgDqUdpVo6rBJwHbLJeDk5vXNDNvNc5B2E
 zs0J2SZylYJf7qK0SlBtWgx5evTnK03U1hVPC5Xlyc09IDWm/VQ1utPmgy0u+xM9jmaJ
 f+rhR8xPr3nXDIjYoKPiKCn/sPnMg3KgmFHHQOyy1tIFj00YAkUPvg9klo5iDy87NOyA
 tG7CHXjSi62kGyMvl26Mtc/GCmB2hAWEpTAenN83BgOUn6hgIkZxa32MZ8DXzyZZiwMX
 lEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NJmzr2KQBRICuAu1pv5/YVfC3bftlzNt8R1cIWx8IbE=;
 b=DD7sCIkFTWdQQePRuxZrl0/cMPGmS45uHtoXLvU2makWVxL71IWfOZjNXdpBmmcbBT
 JvqWtHtsmNTlVyRiADP3+TWQo8k7bJnzn56aXoSai/47zDwtNABIi7twpUzFMATO9pcA
 EwGrY/N3snvznPWbFwCfWWMY9JyimyLfTmbDYOIohawu8XrYfQqyTId0Bx5NFJbzwU2q
 p8tiBo0syp/MX00uig4aT09Tw5wbW1s3essFL3R99F9ETaheOnfe6tEpVvopFw6RQdh8
 sZxLUjyIHzzuw/tiVOkjCCKHyFIQzfHz+KSZarFvVTCXJDIEdTPE/EHcfO0IwfUrH9qu
 iyhw==
X-Gm-Message-State: AOAM5337OdnOg/KgM6cdAitqFi2EjIqdJqNolRp39VFYn9wUcXGBWD7O
 yEgBLRI2m01s6ikcF5HKpT4=
X-Google-Smtp-Source: ABdhPJymzaESRpyXHYliILrQeceM1V9MDg1bBV/LilZuHpXMR5G3RB1SERXvj8gZzKFTg+PWAatrsg==
X-Received: by 2002:a17:90a:3fc7:: with SMTP id
 u7mr18805322pjm.231.1595857691850; 
 Mon, 27 Jul 2020 06:48:11 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f6sm2551521pfa.23.2020.07.27.06.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 06:48:11 -0700 (PDT)
Date: Mon, 27 Jul 2020 19:16:46 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200727134646.GA114726@gmail.com>
References: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
 <20200727131742.82289-1-vaibhavgupta40@gmail.com>
 <CAHp75VfmKvAy6bSk70g3c2qJcUzzo0AUhzxR6dFja+ZppGMLRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VfmKvAy6bSk70g3c2qJcUzzo0AUhzxR6dFja+ZppGMLRg@mail.gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] spi: spi-topcliff-pch: drop
	call to wakeup-disable
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

On Mon, Jul 27, 2020 at 04:38:40PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 27, 2020 at 4:21 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > Before generic upgrade, both .suspend() and .resume() were invoking
> > pci_enable_wake(pci_dev, PCI_D3hot, 0). Hence, disabling wakeup in both
> > states. (Normal trend is .suspend() enables and .resume() disables the
> > wakeup.)
> >
> > This was ambiguous and may be buggy. Instead of replicating the legacy
> > behavior, drop the wakeup-disable call.
> >
> 
> > Fix: f185bcc77980("spi: spi-topcliff-pch: use generic power management")
> 
> Fixes: and missed space.
> 
> Note:
> 
> % grep one ~/.gitconfig
>        one = show -s --pretty='format:%h (\"%s\")'
> 
> % git one f185bcc77980
> f185bcc77980 ("spi: spi-topcliff-pch: use generic power management")
> 
> > Reported by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Missed dash.
> Does checkpatch complain?
No, I got this message:
"* .patch has no obvious style problems and is ready for submission"

I will fix the commit message.

Thanks!
Vaibhav Gupta
> 
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/spi/spi-topcliff-pch.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
> > index 281a90f1b5d8..c73a03ddf5f3 100644
> > --- a/drivers/spi/spi-topcliff-pch.c
> > +++ b/drivers/spi/spi-topcliff-pch.c
> > @@ -1648,8 +1648,6 @@ static int __maybe_unused pch_spi_resume(struct device *dev)
> >
> >         dev_dbg(dev, "%s ENTRY\n", __func__);
> >
> > -       device_wakeup_disable(dev);
> > -
> >         /* set suspend status to false */
> >         pd_dev_save->board_dat->suspend_sts = false;
> >
> > --
> > 2.27.0
> >
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
