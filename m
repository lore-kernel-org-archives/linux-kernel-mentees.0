Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089A3C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 22:37:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02F1206EB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 22:37:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="knGAAh2u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02F1206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 87420873C4;
	Fri, 24 Jul 2020 22:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZHol9AgQm7Q; Fri, 24 Jul 2020 22:37:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0990887397;
	Fri, 24 Jul 2020 22:37:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1B9DC004E;
	Fri, 24 Jul 2020 22:37:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E016C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 22:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 794B0873BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 22:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kJTOjziDsP9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 22:37:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8ABD287397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 22:37:48 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF439206EB;
 Fri, 24 Jul 2020 22:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595630268;
 bh=zxwr+36uT8ubeqQoSb23nE4JB8UimJF+iQqfxvEF9FY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=knGAAh2upW0BFnDQwYIiXAZ3Ff7raBKnQ4IlptMZBVuCFXlSHptY+MTfJ35tkaIFH
 Jq88j1WDBy1Z4RgGvaLeGRmLMLk584oX7SdMB/0yCmfMDNaImOjmsl0l05PVzNHSx9
 w5lvfgVYFUL9qj4V1/sbAkxlvZseRM5fmTudm+tI=
Date: Fri, 24 Jul 2020 17:37:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200724223746.GA1538991@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
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

[+cc Rafael, in case you can clear up our wakeup confusion]
original patch:
https://lore.kernel.org/r/20200720155714.714114-1-vaibhavgupta40@gmail.com

On Fri, Jul 24, 2020 at 11:16:55PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 24, 2020 at 6:17 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> > On Fri, Jul 24, 2020 at 01:51:49PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jul 20, 2020 at 7:31 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> 
> ...
> > > > +       device_wakeup_disable(dev);

> > >
> > > Here I left a result. Care to explain (and perhaps send a follow up
> > > fix) where is the counterpart to this call?

The common pattern seems to be "enable wakeup in suspend, disable
wakeup in resume".

The confusion in spi-topcliff-pch.c is that it *disables* wakeup in
both the .suspend() and the .resume() methods and never seems to
enable wakeup at all.

Maybe there's something subtle we're missing, because all of the
following are the same way; they disable wakeup in suspend and also
disable wakeup in resume:

  pch_i2c_suspend    pci_enable_wake(pdev, PCI_D3hot, 0);
  pch_phub_suspend   pci_enable_wake(pdev, PCI_D3hot, 0);
  tifm_7xx1_suspend  pci_enable_wake(dev, pci_choose_state(dev, state), 0);
  pch_can_suspend    pci_enable_wake(pdev, PCI_D3hot, 0);
  atl1e_suspend      pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
  atl2_suspend       pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
  smsc9420_suspend   pci_enable_wake(pdev, pci_choose_state(pdev, state), 0);
  pch_suspend        pci_enable_wake(pdev, PCI_D3hot, 0);
  pch_spi_suspend    pci_enable_wake(pdev, PCI_D3hot, 0);

And the following are curious because they seem to disable wakeup in
suspend but don't do anything with wakeup in resume:

  jmb38x_ms_suspend  pci_enable_wake(dev, pci_choose_state(dev, state), 0);
  rtsx_pci_suspend   pci_enable_wake(pcidev, pci_choose_state(pcidev, state), 0);
  toshsd_pm_suspend  pci_enable_wake(pdev, PCI_D3hot, 0);
  via_sd_suspend     pci_enable_wake(pcidev, pci_choose_state(pcidev, state), 0);
  uli526x_suspend    pci_enable_wake(pdev, power_state, 0);

All of the above *look* buggy, but maybe we're missing something.

My *guess* is that most PCI drivers using generic PM shouldn't do
anything at all with wakeup because these paths in the PCI core do it
for them:

  pci_pm_suspend_noirq             # pci_dev_pm_ops.suspend_noirq
    if (!pdev->state_saved)
      if (pci_power_manageable(pdev)
        pci_prepare_to_sleep(pdev)
	  wakeup = device_may_wakeup(&pdev->dev)
	  pci_enable_wake(pdev, ..., wakeup)

  pci_pm_resume                    # pci_dev_pm_ops.resume
    pci_pm_default_resume
      pci_enable_wake(pdev, ..., false)

> > Yes, it seem I forgot to put device_wakeup_disable() in .suspend()
> > when I removed pci_enable_wake(pdev, PCI_D3hot, 0); from there. It
> > doesn't seem that .suspend() wants to enable-wake the device as
> > the bool value passed to pci_enable_wake() is zero.
> 
> > Am I missing something else?
> 
> At least above. Either you need to drop the current call, or explain
> how it works.

> Since you have no hardware to test, I would rather ask to drop an
> extra call or revert the change.

I'm not quite sure what you mean here.  Vaibhav is converting dozens
of drivers from legacy PCI PM to generic PM, and of course doesn't
have any of that hardware, but it's still worth doing the conversion.

If it's a bug that spi-topcliff-pch.c disables but never enables
wakeup, I think this should turn into two patches:

  1) Fix the bug by enabling wakeup in suspend (or whatever the right
  fix is), and

  2) Convert to generic PM, which may involve removing the
  wakeup-related code completely.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
