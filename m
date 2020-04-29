Return-Path: <SRS0=k+ap=6N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D61EC83004
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Apr 2020 14:33:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279E421D82
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Apr 2020 14:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfhqtV5r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279E421D82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DA54F88480;
	Wed, 29 Apr 2020 14:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFaIK52GL10T; Wed, 29 Apr 2020 14:33:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CAB6688457;
	Wed, 29 Apr 2020 14:33:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFE48C0865;
	Wed, 29 Apr 2020 14:33:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D489C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA5ED86AAA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMZJ2uBRTW9q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:33:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 132B586A79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:33:17 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z2so2385141iol.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+HxWllnBn+1zJz8WVHl3XZ5HneD7xfI7ue7Ll9hMj1k=;
 b=KfhqtV5rBOv6WOPFrGrYP/W1ymZ0aF9SZWOUKTF1n0i7rFrDefDx/4PskiRm2TV6jK
 1iMmW8zXk2FY0kRY/5LaMSFcy7yqJaueSxuZGlHeL3qWbUUQ/uUphVhRSJwTip6ls/UK
 WGzM4iEBp3oyEiYpjZPL3N2n8hr8QG+ytFiICfkyWAek8zLxBYIo4ZmjTiswe36UBI3E
 OArdRdcXNuCX3fJ3UZTi0/4tQxp7qIWFtmF4xDbTnsRh33WkGy10dUVghO7QWUcFZBYi
 Appo2aATelJJExpbw83M6RGbDQH0dKMNK/vOxpzG44na5nUeSMeA8qa7v24wKzcja9Td
 TXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+HxWllnBn+1zJz8WVHl3XZ5HneD7xfI7ue7Ll9hMj1k=;
 b=YJqsTlerfJHRSk94mQiiCE4l/BEIY8rAbTsUgTtFNpSK1rFAByhvhODmXtEd7jGnVQ
 JxOdf89BoJddxGsLuohm1ymt9Y5Njh4gOoEHS9z6Yk33QGY4MItOPh5NCua3IHupyavd
 J1xigkB45RbsyWeaDThm/1B4uYlCXzSGn8jsCxV9x4BFlQEe1RtEal/mCuFN7ULopMgH
 /SjdVWIJQrppBuj5Ong0yFbAKlR/4R0wRXpgYTts7mJo+S5C11wDN6feDNRIkRSOxkwR
 d3JFZOW+t8Us2ytWI1K1qHnJbtKeYZR8svErp8DHHG01BMZgHisthw+Amp8h8pDgmTVn
 Sa6w==
X-Gm-Message-State: AGi0PubnwVjgEqCp3KId1mVCVzNg4QiDFzlaO0UyB/MZkyTRI56SFCnV
 vEWHbpnOXXjam54+eQyv5DkWRTX3USQP2AXD4hY=
X-Google-Smtp-Source: APiQypL9ZMEuyRwR1ix42kKXhDIen1mp+JUktqgLX56B4R1/wXlWDuBNoGzXc4uMoKsa1XQiVoCkhLIVE8RD84ArNA8=
X-Received: by 2002:a02:bb91:: with SMTP id g17mr29560141jan.88.1588170794879; 
 Wed, 29 Apr 2020 07:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200428144314.24533-3-vaibhavgupta40@gmail.com>
 <20200428172917.GA177492@google.com>
In-Reply-To: <20200428172917.GA177492@google.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 29 Apr 2020 20:02:11 +0530
Message-ID: <CAPBsFfDv0UWvo9KAs4zowmE=No_sk5DOq1ROLjFBDAK4STdKEA@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 Martin Habets <mhabets@solarflare.com>, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pci@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Shannon Nelson <snelson@pensando.io>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] realtek/8139cp: Remove
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

On Tue, 28 Apr 2020 at 22:59, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, Apr 28, 2020 at 08:13:14PM +0530, Vaibhav Gupta wrote:
> > Upgrade power management from legacy to generic using dev_pm_ops.
> >
> > Add "__maybe_unused" attribute to resume() and susend() callbacks
> > definition to suppress compiler warnings.
> >
> > Generic callback requires an argument of type "struct device*". Hence,
> > convert it to "struct net_device*" using "dev_get_drv_data()" to use
> > it in the callback.
> >
> > Most of the cleaning part is to remove pci_save_state(),
> > pci_set_power_state(), etc power management function calls.
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/net/ethernet/realtek/8139cp.c | 25 +++++++------------------
> >  1 file changed, 7 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
> > index 60d342f82fb3..4f2fb1393966 100644
> > --- a/drivers/net/ethernet/realtek/8139cp.c
> > +++ b/drivers/net/ethernet/realtek/8139cp.c
> > @@ -2054,10 +2054,9 @@ static void cp_remove_one (struct pci_dev *pdev)
> >       free_netdev(dev);
> >  }
> >
> > -#ifdef CONFIG_PM
> > -static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
> > +static int __maybe_unused cp_suspend(struct device *device)
> >  {
> > -     struct net_device *dev = pci_get_drvdata(pdev);
> > +     struct net_device *dev = dev_get_drvdata(device);
> >       struct cp_private *cp = netdev_priv(dev);
> >       unsigned long flags;
> >
> > @@ -2075,16 +2074,12 @@ static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
> >
> >       spin_unlock_irqrestore (&cp->lock, flags);
> >
> > -     pci_save_state(pdev);
> > -     pci_enable_wake(pdev, pci_choose_state(pdev, state), cp->wol_enabled);
>
> This one is a little more interesting because it relies on the driver
> state (cp->wol_enabled).  IIUC, the corresponding pci_enable_wake() in
> the generic path is in pci_prepare_to_sleep() (called from
> pci_pm_suspend_noirq()).
>
> But of course the generic path doesn't look at cp->wol_enabled.  It
> looks at device_may_wakeup(), but I don't know whether there's a
> connection between that and cp->wol_enabled.
I have tested it by just compiling it. I will try to dig a bit more deep into
this and check if it is affecting something (on the basis of code).
The final test has to done with hardware.

-- Vaibhav Gupta
>
> > -     pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > -
> >       return 0;
> >  }
> >
> > -static int cp_resume (struct pci_dev *pdev)
> > +static int __maybe_unused cp_resume(struct device *device)
> >  {
> > -     struct net_device *dev = pci_get_drvdata (pdev);
> > +     struct net_device *dev = dev_get_drvdata(device);
> >       struct cp_private *cp = netdev_priv(dev);
> >       unsigned long flags;
> >
> > @@ -2093,10 +2088,6 @@ static int cp_resume (struct pci_dev *pdev)
> >
> >       netif_device_attach (dev);
> >
> > -     pci_set_power_state(pdev, PCI_D0);
> > -     pci_restore_state(pdev);
> > -     pci_enable_wake(pdev, PCI_D0, 0);
> > -
> >       /* FIXME: sh*t may happen if the Rx ring buffer is depleted */
> >       cp_init_rings_index (cp);
> >       cp_init_hw (cp);
> > @@ -2111,7 +2102,6 @@ static int cp_resume (struct pci_dev *pdev)
> >
> >       return 0;
> >  }
> > -#endif /* CONFIG_PM */
> >
> >  static const struct pci_device_id cp_pci_tbl[] = {
> >          { PCI_DEVICE(PCI_VENDOR_ID_REALTEK,     PCI_DEVICE_ID_REALTEK_8139), },
> > @@ -2120,15 +2110,14 @@ static const struct pci_device_id cp_pci_tbl[] = {
> >  };
> >  MODULE_DEVICE_TABLE(pci, cp_pci_tbl);
> >
> > +static SIMPLE_DEV_PM_OPS(cp_pm_ops, cp_suspend, cp_resume);
> > +
> >  static struct pci_driver cp_driver = {
> >       .name         = DRV_NAME,
> >       .id_table     = cp_pci_tbl,
> >       .probe        = cp_init_one,
> >       .remove       = cp_remove_one,
> > -#ifdef CONFIG_PM
> > -     .resume       = cp_resume,
> > -     .suspend      = cp_suspend,
> > -#endif
> > +     .driver.pm    = &cp_pm_ops,
> >  };
> >
> >  module_pci_driver(cp_driver);
> > --
> > 2.26.2
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
