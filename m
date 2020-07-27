Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667F9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:08:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC3820714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7drz06i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DC3820714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 064C120385;
	Mon, 27 Jul 2020 07:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZd36HjX-NXZ; Mon, 27 Jul 2020 07:08:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3BD6020361;
	Mon, 27 Jul 2020 07:08:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 246AAC004F;
	Mon, 27 Jul 2020 07:08:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F785C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 62ABD87884
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5iWgwrOPJfHm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:08:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D897D8781C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:08:16 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id k71so8709274pje.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 00:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=r3ohMdUUisXXnJtg4Sj8gOXxHs0SULkmzOyNPW3p948=;
 b=J7drz06irjdSn4IEzXgudUrCCZnvkKA7cxf4NRdogNw/S2loC8qb0x8wuxjbKR2HtB
 PonGxSpWHuChJh9AYDUz65IOJtL7ALkmFRY6FQA/89hAZ2laXJu/9GNjCF8k3P/vC/67
 LNpcl46FH8W63QyGQRdYKwDzNNpiAiqUNSDEYJoKWpTOciWVQA4+cZFE71/7GlKZntpn
 2a4JTr5TWo3OP3y68Tdev/F0mICuQ1KuM2pRiyoXHocX0eGLj5/+DsTZKYsNihtrb2Tw
 L8fabAssBOKF5M1nR2ITvjqijq0pPazWFZB2hG5+paAOZhilTt5mHzCCHil3ef/Kbprz
 zPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r3ohMdUUisXXnJtg4Sj8gOXxHs0SULkmzOyNPW3p948=;
 b=A0LMj76Atk1cVP52xgAVIQmqXzCvgB3SQIJl9XSwCj+nsWu0mDqEZrG7f5e8SWybzk
 LHydmV6R16md23d/ktTJ5uqTugZb0zkyJCopXPrsbVZa3/OquoreLndABRYw724vhl5y
 Ey8Bdagx2XpKysKgWfdkwb7iSXON/ifRUtMd8M7CIGyW2dCpx2EfXCXYBYA1wHYWrTsu
 u4notlrihSe5iIJGrPkOkmaa6o09/YA2ss34KfbM5SzFoD/ReIMakWpaQ3Tcs50DxFOO
 bcW9+uw7zhD/1lrEY2hedsZAVoFVMuQxjNKhwtTiHMHdCCiU8VZRzYR6C9oi9l1kvyme
 DQQg==
X-Gm-Message-State: AOAM532gwSTOCW52snuI2P/Vk1F6U46VWOaf1nylFGP96AxjEqSC1qws
 X1ZAxK2nHG9Njj93RjXvctk=
X-Google-Smtp-Source: ABdhPJzKJySBE72OX3M6X924GWk4LabSjO0/kXJ/nn3paqyIlriQgFdkPx1NMQe+b8k/s7JD6PLQFQ==
X-Received: by 2002:a17:90a:6948:: with SMTP id
 j8mr16013497pjm.45.1595833696391; 
 Mon, 27 Jul 2020 00:08:16 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o128sm13916110pfg.127.2020.07.27.00.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 00:08:15 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:36:52 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200727070652.GA5400@gmail.com>
References: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
 <20200724223746.GA1538991@bjorn-Precision-5520>
 <CAHp75VdSr1rguc9HJVh_rA1nBh1uyCdr18eyPosWPzCH1K2=zg@mail.gmail.com>
 <CAHp75VfKeTCBOne3tDSM46q6m_FE+7hS3H9Hx5C3RRPvueqZAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VfKeTCBOne3tDSM46q6m_FE+7hS3H9Hx5C3RRPvueqZAQ@mail.gmail.com>
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

On Sat, Jul 25, 2020 at 01:44:44PM +0300, Andy Shevchenko wrote:
> On Sat, Jul 25, 2020 at 1:42 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Jul 25, 2020 at 1:37 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, Jul 24, 2020 at 11:16:55PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > If it's a bug that spi-topcliff-pch.c disables but never enables
> > > wakeup, I think this should turn into two patches:
> > >
> > >   1) Fix the bug by enabling wakeup in suspend (or whatever the right
> > >   fix is), and
> > >
> > >   2) Convert to generic PM, which may involve removing the
> > >   wakeup-related code completely.
> >
> > Works for me.
> 
> The only problem here, is that the 2nd is already in the Mark's tree
> and he doesn't do rebases.
> So, it will be the other way around.
>
Concluding from yours and Bjorn's suggestion, I will drop the
device_wakeup_disable() call form .resume() and send the fix. I will also track
the drivers who got similar upgrades and went un-noticed.

As Bjorn mentioned, the problem is that I don't have hardware to test, so I just
replicated the legacy behaviour in generic by replacing
pci_enable_wake(....,false) with device_wakeup_disable().

So, from now, while upgrading drivers with generic PM, should I completely drop
the pci_enable_wake(....,false) calls if both .suspend() and .resume() try to
wakeup-disable the device?

Thanks
Vaibhav Gupta
> 
> -- 
> With Best Regards,
> Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
