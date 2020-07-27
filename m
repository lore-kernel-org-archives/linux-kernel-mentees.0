Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B46C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 11:12:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1EE6205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 11:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7Sf/3co"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1EE6205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 90C2087FE9;
	Mon, 27 Jul 2020 11:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6b8LR0saM74n; Mon, 27 Jul 2020 11:12:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2EB1E87CDA;
	Mon, 27 Jul 2020 11:12:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 236A6C0050;
	Mon, 27 Jul 2020 11:12:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B05DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6486E87CDA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVnYImbFlByb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:12:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DD73187C16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:12:31 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z188so1048517pfc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 04:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JpiOzoaiyx99ynR2WykS5OLOkmTVVgbbrLc0IXpWnR8=;
 b=A7Sf/3coa+fxUWtaNpz7yyIgCasw1IqgduuJzPXaOtbss/krO+INI3+vdjSItItDls
 oHfR/G8SMHJY6U/3nsURjcNTR+Sy6VixxEXkSGgQ9kJ08Hbg1rGyo+DxOIgwy8llD9dA
 qZwNFk8MnRTfvYELpLeyxhGTAIU2Ipdzik0QYGH4+Qj9+dhFlPKtk9xbCLkyQhfLtxcU
 eLxCX2jsCSwqDj4AkMc0S27aaBarvBSKGkNeAIUdXttVJyiz7DeBFMDfy5RzKtgc1n7y
 6cTaL2DtTX4QM7tekW/6ie7ZUVOCkgUIWUSsrr/bfl4UfNMqe0AMTM6ecFGiH67sBPQD
 tM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JpiOzoaiyx99ynR2WykS5OLOkmTVVgbbrLc0IXpWnR8=;
 b=PEwTiEhGgvFVSU8k7X1zngVsqUpvbLDEoNy5P/Dv5zkPVplXooyjx+z5MUBYUZUT8j
 RWIcFBgGGf25dv8Yoihz0LBQhhoGpgrJ4p8upNYe93Jvtg3FKvOm8t58yGtbNHsGdaCk
 qdpjo6UQsQtvCvT8rkIcRYuWkvjHul7bnWjNqtAyTZ4p2x5jWMDZicnrnm3zmJOAwdaV
 kOkuoh0nti7fgfiQneX1Er6cH58bLL3/RmrN78w4GSHb9/UJ6Gjqzp6tL7tMsw0MDNDE
 mp6TM1EiyXM0dODAZig5MeqhpwuoDYRBEGX4GMzzL2OQwFxiJB3hL/nOzlnr5No26B2O
 hmqg==
X-Gm-Message-State: AOAM533KXf8qgouCrw6CoBJnIJeu5UUhRI2LqrDQlWVIl2IcleJ50GVW
 m/nLGwga9rjpigxhXs9DYGaMpl2yl03J59B3v/s=
X-Google-Smtp-Source: ABdhPJyvf3lIpJpA/1EcG6vZkAsQqoAQLwhd16BxxYu2pcosuttYaTohVJdM6B1u4sl6qyovpGHqAgrkyoqCPCO1NOc=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr19797993pgi.203.1595848351479; 
 Mon, 27 Jul 2020 04:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
 <20200724223746.GA1538991@bjorn-Precision-5520>
 <CAHp75VdSr1rguc9HJVh_rA1nBh1uyCdr18eyPosWPzCH1K2=zg@mail.gmail.com>
 <CAHp75VfKeTCBOne3tDSM46q6m_FE+7hS3H9Hx5C3RRPvueqZAQ@mail.gmail.com>
 <20200727070652.GA5400@gmail.com>
In-Reply-To: <20200727070652.GA5400@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Jul 2020 14:12:16 +0300
Message-ID: <CAHp75VdzAk6U_mKn32+dmw1aNyREtaXMB6sHubE8G9imtv5=3g@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] spi: spi-topcliff-pch: use
	generic power management
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

On Mon, Jul 27, 2020 at 10:08 AM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> On Sat, Jul 25, 2020 at 01:44:44PM +0300, Andy Shevchenko wrote:
> > On Sat, Jul 25, 2020 at 1:42 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

...

> > The only problem here, is that the 2nd is already in the Mark's tree
> > and he doesn't do rebases.
> > So, it will be the other way around.
> >
> Concluding from yours and Bjorn's suggestion, I will drop the
> device_wakeup_disable() call form .resume() and send the fix. I will also track
> the drivers who got similar upgrades and went un-noticed.

Thanks for doing this!

> As Bjorn mentioned, the problem is that I don't have hardware to test, so I just
> replicated the legacy behaviour in generic by replacing
> pci_enable_wake(....,false) with device_wakeup_disable().
>
> So, from now, while upgrading drivers with generic PM, should I completely drop
> the pci_enable_wake(....,false) calls if both .suspend() and .resume() try to
> wakeup-disable the device?

I guess the best approach is to rely on the PCI core to do the right thing.
But mention this change in the commit message that we will have a
track of the changes properly.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
