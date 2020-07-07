Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF48C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 21:15:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1490120674
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 21:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IchCb4hb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1490120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CEC6729CAB;
	Tue,  7 Jul 2020 21:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Keb-xclI4E1a; Tue,  7 Jul 2020 21:15:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EDE962041B;
	Tue,  7 Jul 2020 21:15:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D54CEC07FF;
	Tue,  7 Jul 2020 21:15:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFADCC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 21:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CEA5B2041B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 21:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUEBNkxgYAkJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 21:15:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id B684A1FE49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 21:15:18 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D5CB2075B;
 Tue,  7 Jul 2020 21:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594156518;
 bh=1s/robryCgQa82sfCBKNWG/m6UpXwTxp0ZAypBuWLWk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=IchCb4hb83xx8DKThJRMTwMstsiVfgZEEeFqqBFOG3C+1Aq2rpPYsuBLaobwTaGPD
 bUInFODWCspThMhVQdtN1Z3lDOA6mY5VhF9TYuSKt3+kj4zksrutjtbZRUBzalqVBC
 oObl6DpyIhX9E+DIYsSFxTQ9kHSrJ8iooI3ls+6k=
Date: Tue, 7 Jul 2020 16:15:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Message-ID: <20200707211516.GA385934@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPBsFfCdJkXO-V16yO2eTeAwnQnKJZ49yaJepbsF2dNZjLZFhw@mail.gmail.com>
Cc: linux-ide@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/4] ide: triflex: use generic
	power management
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

On Wed, Jul 08, 2020 at 02:23:22AM +0530, Vaibhav Gupta wrote:
> On Wed, Jul 8, 2020, 2:12 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Jul 03, 2020 at 01:44:26PM +0530, Vaibhav Gupta wrote:

> > > -static int triflex_ide_pci_resume(struct pci_dev *dev)
> > > +/*
> > > + * We must not disable or powerdown the device.
> > > + * APM bios refuses to suspend if IDE is not accessible.
> > > + */
> > > +static void triflex_pci_pm_cap_fixup(struct pci_dev *pdev)
> > >  {
> > > -     struct ide_host *host = pci_get_drvdata(dev);
> > > -     int rc;
> > > -
> > > -     pci_set_power_state(dev, PCI_D0);
> > > -
> > > -     rc = pci_enable_device(dev);
> > > -     if (rc)
> > > -             return rc;
> > > -
> > > -     pci_restore_state(dev);
> > > -     pci_set_master(dev);
> > > -
> > > -     if (host->init_chipset)
> > > -             host->init_chipset(dev);
> > > -
> > > -     return 0;
> > > +     dev_info(&pdev->dev, "Disable triflex to be turned off by PCI
> > CORE\n");
> >
> > I would change this message to "Disabling PCI power management" to be
> > more like existing messages:
> >
> >   "PM disabled\n"
> >   "Disabling PCI power management to avoid bug\n"
> >   "Disabling PCI power management on camera ISP\n"
> >
> > > +     pdev->pm_cap = 0;
> > >  }
> > > -#else
> > > -#define triflex_ide_pci_suspend NULL
> > > -#define triflex_ide_pci_resume NULL
> > > -#endif
> > > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_COMPAQ,
> > > +                     PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE,
> > > +                     triflex_pci_pm_cap_fixup);
> >
> > I don't think this needs to be a fixup.  This could be done in the
> > probe routine (triflex_init_one()).
> >
> > Doing it as a fixup means the PCI core will check every PCI device
> > to see if it matches PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE, which is a
> > little extra useless overhead and quirks are a little bit magic
> > because it's not as obvious how they're called.
> >
> > But since triflex_init_one() is called only for the devices we care
> > about, you can just do:
> >
> >   static int triflex_init_one(struct pci_dev *dev, const struct
> > pci_device_id *id)
> >   {
> >         dev->pm_cap = 0;
> >         dev_info(...);
> >         return ide_pci_init_one(dev, &triflex_device, NULL);
> >   }
> >
> Seems a better approach. And in that case I won't need this extra patch
> just for triflex. I can put dev->pm_cap=0 change
> in [Patch 1/1] along with other ide drivers.

Hmm, I just noticed that there are actually *two* drivers (triflex.c
and pata_triflex.c) for this same device, and they both have this
comment about "APM BIOS refusing to suspend if IDE is not accessible"
and therefore preventing suspend of IDE.

At least, the comment seems to imply that calling pci_save_state() is
a way to prevent suspend of the device.  That seems like a strange way
to do it, but ...

Anyway, I wonder if a single quirk in drivers/pci/quirks.c would be
better.  A preliminary patch could add a quirk (keeping the comment)
and remove the pci_save_state() from both triflex_ide_pci_suspend()
and triflex_ata_pci_device_suspend().

Then you could proceed with these generic PM changes on top of that.

Maybe make the dev_info() mention that you're disabling PM to avoid an
APM BIOS suspend defect so users have a clue about why.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
