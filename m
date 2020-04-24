Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E55C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 10:01:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD452071E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 10:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5ISmCDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD452071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BDFD0860BE;
	Fri, 24 Apr 2020 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qmirYnuSrqut; Fri, 24 Apr 2020 10:01:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F34585F08;
	Fri, 24 Apr 2020 10:01:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B41DC089E;
	Fri, 24 Apr 2020 10:01:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 420EFC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 10:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2480324AF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 10:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYW8NtX16Erc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 10:01:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by silver.osuosl.org (Postfix) with ESMTPS id E1F7E2044B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 10:01:38 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p10so9742698ioh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3sUHjh+oWocjDoUajzyBLkZvyhTZb+XzYffplQRuEbs=;
 b=V5ISmCDM4zvl6X+va0QTKiznm38sXvbda5643uX+TKa5iDjF0lFgc0cZDTsRdU7S4d
 fyl3LmgjDEuB/FEeXFxhfXroigAbalmfmLWuFskBNarmWdctJmGjF0u5anV0S5q11dUH
 IoWHUmBWR7Sf1+V3i5vaDTuLXkBpkWMuTeLu0AAJU3sQ0cb+AnHNT3w1ZGj7TX8ajWce
 31ACWe/c3w0mlapd1pTN9R+lmHkHaCUVtyivh3G5P5mgaoYqiZGQzLiFgunpSJLtnWhE
 Zv/X0tzJj6bCMCFBZgC75r94IFZr/2nrvml3mbkxuyexe8HObtISQ4rV6RoSG908IJe+
 MKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3sUHjh+oWocjDoUajzyBLkZvyhTZb+XzYffplQRuEbs=;
 b=KiUtUyLPo1vc0w9qOn59H/O7oSvlqthnh6byRPgRP91LPldU28oaLvDg0MXqetAfyu
 XeO26s5ZRY/d3i30KsvSr2qMjFidl3aA9CaSMZfFqIFwAb0PapGlkn5bTChOV3hytbVw
 z9OzJ2jEF8YA3GBrosX9cEQxlXy3K/FZMivVAOXftXGpS1jxwz4Sp6PmaSXS+ob0G4Bv
 kelvfb93h0YOGl4tRwJ/h+yA4x56paBu0ljOUKpvAqijyga7zqZrxKRF4Vi12d/OvK7b
 Oil7hdUztQ7v2JASjsAG+P28TmRNB9RTEdUbmw5y+apoXregHccTMvOiPfZF5hBYrbfD
 nkxg==
X-Gm-Message-State: AGi0PuYLKokYgfTyHza3jYJdwvHcM2v1luI/R8fLGLpn35voQ/blii9V
 S+sehmASnpHCXUqIwNQyRx86m+W9fYewgDK6dVM=
X-Google-Smtp-Source: APiQypJ0LpxZ1eOnqnhD4Kbl6k+iVPw+tVBJVlQogWZSUtsDStfex+S+XPkVp3GRSKiI52Abl9N5tSL0GntaNwpdGcA=
X-Received: by 2002:a02:bb91:: with SMTP id g17mr7278532jan.88.1587722498182; 
 Fri, 24 Apr 2020 03:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200423132759.38191-1-vaibhavgupta40@gmail.com>
 <20200424034345.GA34450@google.com>
In-Reply-To: <20200424034345.GA34450@google.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Fri, 24 Apr 2020 15:30:36 +0530
Message-ID: <CAPBsFfBU5vpVijG02XfVC=q6jZ6jwLo6p7dSXLwvT1uJTqJa7g@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 1/2] realtek/8139too: Remove
 Legacy Power Management
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

On Fri, 24 Apr 2020 at 09:13, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> If you post more that one patch in a series, it's best if you include
> a cover letter with the patches being responses to the cover letter.
> In this case, it would be:
>
>   [0/2] cover letter
>   -> [1/2] realtek/8139too: Remove ...
>   -> [2/2] realtek/8139cp: Remove ...
Okay! I will do it.

--Vaibhav Gupta
>
> On Thu, Apr 23, 2020 at 06:57:59PM +0530, Vaibhav Gupta wrote:
> > Upgrade Power Management from legacy to generic using dev_pm_ops.
> >
> > Remove struct pci_driver.suspend and struct pci_driver.resume bindings,
> > and add struct pci_driver.driver.pm .
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/net/ethernet/realtek/8139too.c | 26 +++++++-------------------
> >  1 file changed, 7 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/realtek/8139too.c b/drivers/net/ethernet/realtek/8139too.c
> > index 5caeb8368eab..b7c98b165256 100644
> > --- a/drivers/net/ethernet/realtek/8139too.c
> > +++ b/drivers/net/ethernet/realtek/8139too.c
> > @@ -2603,17 +2603,13 @@ static void rtl8139_set_rx_mode (struct net_device *dev)
> >       spin_unlock_irqrestore (&tp->lock, flags);
> >  }
> >
> > -#ifdef CONFIG_PM
> > -
> > -static int rtl8139_suspend (struct pci_dev *pdev, pm_message_t state)
> > +static int rtl8139_suspend(struct device *device)

> >       rtl8139_init_ring (dev);
> >       rtl8139_hw_start (dev);
> >       netif_device_attach (dev);
> >       return 0;
> >  }
> >
> > -#endif /* CONFIG_PM */
> > -
> > +static SIMPLE_DEV_PM_OPS(rtl8139_pm_ops, rtl8139_suspend, rtl8139_resume);
>
> The common pattern here seems to be:
>
>   #ifdef CONFIG_PM_SLEEP
>   static int *_suspend(struct device *device) { ... }
>   static int *_resume(struct device *device) { ... }
>   #endif
>   static SIMPLE_DEV_PM_OPS(*_pm_ops, *_suspend, *_resume);
>
> So your patch looks great except that I think you should keep the
> #ifdef and convert it to CONFIG_PM_SLEEP.
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
