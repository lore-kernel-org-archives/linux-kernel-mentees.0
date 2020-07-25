Return-Path: <SRS0=EU8F=BE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89D0C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 10:43:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F37720674
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 10:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAacYRx5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F37720674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 32E1188A1F;
	Sat, 25 Jul 2020 10:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUevh4BDlMuW; Sat, 25 Jul 2020 10:42:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6534B889FE;
	Sat, 25 Jul 2020 10:42:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A4FCC004D;
	Sat, 25 Jul 2020 10:42:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73604C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 10:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 62E78864AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 10:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gW68Qj_EY9Y6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 10:42:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A161586490
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 10:42:56 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f7so943848pln.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 03:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8yj6Kct27RyPEmd4B9+HfnqqiPVfXDawAuk7rCVsXmM=;
 b=nAacYRx5nwuasDLixWg6vBK+3519KCsjPn5GxOvYK3AeRNBe1K1H1WmXvFGyRUz2+w
 +cfjSPAnrwhH4r4QjkjOxNDisS0Zf1PI8TkNHgzAOpZpm4/FPZDccC8IwbKgzF4m20Hr
 gCHSYm+FsnMQ8Cykp5Dlz13tt52qURJ6PF59gYWtBG83KANBc0BmKmKa7W4fvDu+R25A
 XhCTJcexuEzuJHAVb0Gv1Ja6C8UghIsk/yZmmWQUEY3VqBugd4KZnN58bCs/BbKyKdBA
 aKF+Sofw2avxkIgshsDJl1JbX+eYxw/lOszDBfXHxFVyhO2Rl4Kdr373oBv1DwU4IE3z
 2Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8yj6Kct27RyPEmd4B9+HfnqqiPVfXDawAuk7rCVsXmM=;
 b=t3ErR5Mq8eHUpE/O8su7ADyDhR5/iJK/dLZ+WN98gKkHDx0EsB+HdPHF4++O1Gm2zY
 KkEMrYia6slUePkyeloebJjGeDeEzljS6gI32pJd6OdeYPu0TQCyAcZT0t1gLLdJl1q9
 HxW9GIT1rOuGAf/D4tMNapuA+Xx6N2UYHvywIULLzcRjzPrbt1B+xOcsN9DJsTGMNCAb
 lNJW+pGvNDDNAkCxwO6fHuv1sBNadX5E81NpDxUatTFL25p+MjWgOzUP6/HykWc25Qed
 9NgxqQb8cEHujxxS3pt9xhtE0bhCaAZPCgSqzYiG35cF2VUTa3wKP3nGDIC3b27ymdzN
 V3OA==
X-Gm-Message-State: AOAM533TGIjijGPYRQxcD3bkFMkWdOMm12WxszpBT1HKvvtmMA+ZNvLi
 YnjDX7ZF0vnGP9aN6STb1CvO+KfOdTf+O+t0tn0=
X-Google-Smtp-Source: ABdhPJx5WRgviCW8IQl6IL2G3MFUcyH4KWOWkuJScaNu4y0lij/3WSXu1ghuineZ92WNvK1h/vZVo4AFJACi9u0cqsE=
X-Received: by 2002:a17:90a:a393:: with SMTP id
 x19mr7054931pjp.228.1595673776129; 
 Sat, 25 Jul 2020 03:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
 <20200724223746.GA1538991@bjorn-Precision-5520>
In-Reply-To: <20200724223746.GA1538991@bjorn-Precision-5520>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 25 Jul 2020 13:42:39 +0300
Message-ID: <CAHp75VdSr1rguc9HJVh_rA1nBh1uyCdr18eyPosWPzCH1K2=zg@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
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

On Sat, Jul 25, 2020 at 1:37 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Rafael, in case you can clear up our wakeup confusion]
> original patch:
> https://lore.kernel.org/r/20200720155714.714114-1-vaibhavgupta40@gmail.com
>
> On Fri, Jul 24, 2020 at 11:16:55PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 24, 2020 at 6:17 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> > > On Fri, Jul 24, 2020 at 01:51:49PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Jul 20, 2020 at 7:31 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > ...
> > > > > +       device_wakeup_disable(dev);
>
> > > >
> > > > Here I left a result. Care to explain (and perhaps send a follow up
> > > > fix) where is the counterpart to this call?
>
> The common pattern seems to be "enable wakeup in suspend, disable
> wakeup in resume".
>
> The confusion in spi-topcliff-pch.c is that it *disables* wakeup in
> both the .suspend() and the .resume() methods and never seems to
> enable wakeup at all.
>
> Maybe there's something subtle we're missing, because all of the
> following are the same way; they disable wakeup in suspend and also
> disable wakeup in resume:
>
>   pch_i2c_suspend    pci_enable_wake(pdev, PCI_D3hot, 0);
>   pch_phub_suspend   pci_enable_wake(pdev, PCI_D3hot, 0);
>   tifm_7xx1_suspend  pci_enable_wake(dev, pci_choose_state(dev, state), 0);
>   pch_can_suspend    pci_enable_wake(pdev, PCI_D3hot, 0);
>   atl1e_suspend      pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
>   atl2_suspend       pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
>   smsc9420_suspend   pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
>   pch_suspend        pci_enable_wake(pdev, PCI_D3hot, 0);
>   pch_spi_suspend    pci_enable_wake(pdev, PCI_D3hot, 0);
>
> And the following are curious because they seem to disable wakeup in
> suspend but don't do anything with wakeup in resume:
>
>   jmb38x_ms_suspend  pci_enable_wake(dev, pci_choose_state(dev, state), 0);
>   rtsx_pci_suspend   pci_enable_wake(pcidev, pci_choose_state(pcidev, state), 0);
>   toshsd_pm_suspend  pci_enable_wake(pdev, PCI_D3hot, 0);
>   via_sd_suspend     pci_enable_wake(pcidev, pci_choose_state(pcidev, state), 0);
>   uli526x_suspend    pci_enable_wake(pdev, power_state, 0);
>
> All of the above *look* buggy, but maybe we're missing something.

Agree!

> My *guess* is that most PCI drivers using generic PM shouldn't do
> anything at all with wakeup because these paths in the PCI core do it
> for them:

That's why in the second message I proposed to drop this ambiguous
call. I think (guess) the same way you are.

>   pci_pm_suspend_noirq             # pci_dev_pm_ops.suspend_noirq
>     if (!pdev->state_saved)
>       if (pci_power_manageable(pdev)
>         pci_prepare_to_sleep(pdev)
>           wakeup = device_may_wakeup(&pdev->dev)
>           pci_enable_wake(pdev, ..., wakeup)
>
>   pci_pm_resume                    # pci_dev_pm_ops.resume
>     pci_pm_default_resume
>       pci_enable_wake(pdev, ..., false)
>
> > > Yes, it seem I forgot to put device_wakeup_disable() in .suspend()
> > > when I removed pci_enable_wake(pdev, PCI_D3hot, 0); from there. It
> > > doesn't seem that .suspend() wants to enable-wake the device as
> > > the bool value passed to pci_enable_wake() is zero.
> >
> > > Am I missing something else?
> >
> > At least above. Either you need to drop the current call, or explain
> > how it works.
>
> > Since you have no hardware to test, I would rather ask to drop an
> > extra call or revert the change.
>
> I'm not quite sure what you mean here.  Vaibhav is converting dozens
> of drivers from legacy PCI PM to generic PM, and of course doesn't
> have any of that hardware, but it's still worth doing the conversion.

See above. Here I proposed two solutions and I'm in favour of the
former (drop the call) rather than latter (do not touch this code).

> If it's a bug that spi-topcliff-pch.c disables but never enables
> wakeup, I think this should turn into two patches:
>
>   1) Fix the bug by enabling wakeup in suspend (or whatever the right
>   fix is), and
>
>   2) Convert to generic PM, which may involve removing the
>   wakeup-related code completely.

Works for me.


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
