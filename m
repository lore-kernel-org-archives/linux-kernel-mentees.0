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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D416FC54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 10:32:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980342071E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 10:32:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFoPx3Qu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 980342071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 65E6386F0B;
	Fri, 24 Apr 2020 10:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYngQwljS0jF; Fri, 24 Apr 2020 10:32:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E0ADA86F06;
	Fri, 24 Apr 2020 10:32:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6BD2C1AE2;
	Fri, 24 Apr 2020 10:32:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 661B6C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 10:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4BF5386F06
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 10:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4apLBW7L6fH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 10:32:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 977E886F01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 10:32:44 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w20so9821105iob.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c2jKFuzx8OERe6ZFEAT31JgReY9WqWhed5Hwns5S3Ww=;
 b=aFoPx3Qu0oupwkPovxk61isE1WaOgM2RMeA3dxEEOFPNOJJ3+6xTPmk7T/JtMMEKxx
 QT2m9pDsvyOahWq74G0sp76Sw5W72SUxpnTtNrLn9Wl5yNwcYNkHDCYu7ZMzoV1l3V3r
 CWZaoCwM8JzlE8AQ9Ct6IDJUTd1+O+O9PsFVAfk94+7Td4UJ0dABMyp8EXGCT/7f5tAO
 fZRu/x303asV867mlZXePHmbgqDM4s37bHqUfoqS/iz13/DispshM325ntjbf9D+Sh0v
 pI1sprc3PDlX1aloqwmJGyPrkhvUpZftncGyWF282gkCuNgu/5ripofM/kHfubrMt0yP
 NjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c2jKFuzx8OERe6ZFEAT31JgReY9WqWhed5Hwns5S3Ww=;
 b=hHDbhinTx+25qrf0+sWpb5MfvJgKu8hdEbEG/d/NN/80Q+Sa+dw4JW8GOOjVLcXQ0D
 AWzOcNEcsFcEugSFPIjS4FLw04b4KILJHiWAXoppKz7kcvn2PHIxqCGSMGtPrbWtFMLs
 OiZStTsEVBs3irFFjlfuyJjN7kKuJ3zyeu7EJW1sWLoF/OJG1xylynwVSitQtk2YWziL
 tCoUbZwFGRtqpTEDpC7/WhiTf1Olb1o6k3BUrQ6jsSKTkDMNtR70AISIbi0P2zyFUSkF
 6VeaTJiN6RDfhdoQ0AFgKey2j9a/KfwT3DcuY8ch8FrhDbV9TPGliir3BLncrts1GXUT
 GQag==
X-Gm-Message-State: AGi0PuaEOrQNmzgdEINKeF1WMukU4xvk6IW32pRXmDpfu0maXXlOkpu7
 STSRKfZ6pIulRbdY/5FLUNNLVNInGsbQlWIlg/w=
X-Google-Smtp-Source: APiQypJ1ENaCuodFfzcL9YFFwvMlpdA8Yufico9enlz+uMW0mZ3FkIK4weAVwwH+DyYCNV5nYwcqrRuEp+W4Bgku0ug=
X-Received: by 2002:a5d:8b89:: with SMTP id p9mr7850515iol.107.1587724363852; 
 Fri, 24 Apr 2020 03:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200423132759.38191-2-vaibhavgupta40@gmail.com>
 <20200424034733.GA36790@google.com>
In-Reply-To: <20200424034733.GA36790@google.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Fri, 24 Apr 2020 16:01:43 +0530
Message-ID: <CAPBsFfAdXZW3p_WFknvPVbvDhNw2iWt13BTHDXCUjXaSFYAo_w@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/2] realtek/8139cp: Remove
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

On Fri, 24 Apr 2020 at 09:17, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Thu, Apr 23, 2020 at 06:58:01PM +0530, Vaibhav Gupta wrote:
> > Upgrade Power Management from legacy to generic using dev_pm_ops.
> >
> > Remove pci_save_sate(), pci_set_state(), etc. No need of directive
> > '#ifdef CONFIG_PM' as, if CONFIG_PM is not defined, the binding
> > will be by deafult set to NULL.
>
> s/deafult/default/
>
> I didn't quite follow this argument.  SIMPLE_DEV_PM_OPS() is defined
> to SET_SYSTEM_SLEEP_PM_OPS(), and SET_SYSTEM_SLEEP_PM_OPS() is defined
> to nothing unless CONFIG_PM_SLEEP (not CONFIG_PM).
yes, and we can find about CONFIG_PM_SLEEP inside kernel/power/kconfig
It is defined as:
config PM_SLEEP
        def_bool y
        depends on SUSPEND || HIBERNATE_CALLBACKS
        select PM
        select SRCU

Hence it is selecting CONFIG_PM. So any of the macro check works.So i
should go with
#ifded CONFIG_PM
or
#ifdef CONFIG_PM_SLEEP ?
>
> But in any case, we don't want cp_suspend() and cp_resume() to be
> compiled at all if they're not referenced.  So I think converting the
> "#ifdef CONFIG_PM" to "#ifdef CONFIG_PM_SLEEP" is the right thing.
Actually I removed it because Andy also removed them in
226e6b866d74, thought it has to be done that way.

--Vaibhav Gupta
>
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> >  drivers/net/ethernet/realtek/8139cp.c | 25 +++++++------------------
> >  1 file changed, 7 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
> > index 60d342f82fb3..e2e79cf4e1fa 100644
> > --- a/drivers/net/ethernet/realtek/8139cp.c
> > +++ b/drivers/net/ethernet/realtek/8139cp.c
> > @@ -2054,10 +2054,9 @@ static void cp_remove_one (struct pci_dev *pdev)
> >       free_netdev(dev);
> >  }
> >
> > -#ifdef CONFIG_PM
> > -static int cp_suspend (struct pci_dev *pdev, pm_message_t state)
> > +static int cp_suspend(struct device *device)
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
> > -     pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > -
> >       return 0;
> >  }
> >
> > -static int cp_resume (struct pci_dev *pdev)
> > +static int cp_resume(struct device *device)
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
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
