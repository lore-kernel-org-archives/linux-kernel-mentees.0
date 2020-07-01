Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EC7C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 06:05:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D7C2074D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 06:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfKiRC9t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D7C2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7127D8B2EF;
	Wed,  1 Jul 2020 06:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2N7WrJ7AjUh; Wed,  1 Jul 2020 06:05:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3D95A8975D;
	Wed,  1 Jul 2020 05:46:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BA33C1798;
	Wed,  1 Jul 2020 05:46:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EFE3C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 05:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E9AA2FFAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 05:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2KnLHzwZEHd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 05:46:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 4B6C22FFA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 05:46:52 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id o5so23627025iow.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jun 2020 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BToyqAFI5f5u68K+7r1bZ4zx3KgdmDtvzPbHmq3uErs=;
 b=KfKiRC9tQw4BCTxYEe5fbyThBOQ4OzQNMWT9nS95Dd2MUMUd4FcSRV0ZZbF7URZAPa
 IOz4B4rhquUvz50tSYGyUG9ddbU4xGCIlCZqlBwuypVK+1NnxFvIovJiyZTRa6CgUXKo
 fJoPvVBIYPf5P9TD1QpSwrt6Qt1i5rjDug6EjxjrbRCVSM2s+DGwmuTNcl4brScjdo/F
 mZ5q5gXYBjX/eF67htk0QBbhmYk8+MsIRWkkkIj2+2T/atFwbjXy7PqT2WQ2FkdIHkQ2
 xb5Z5p+3Bc7HukIhmcAQC8j0OWveM2gFaU9B1N84o58YoXE4joD+STj8nAbMadqSyQcb
 s9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BToyqAFI5f5u68K+7r1bZ4zx3KgdmDtvzPbHmq3uErs=;
 b=DugT3JQdn5cfqzHSfQngRqlFMxEur+aqZl1o9gqI9GVCZXAjg6WDNL3Jdgf4TopylH
 ixYGJDNjkqEbYooWRKexu4XZZS6IQbAE7sGyM2RBDejIajRR3LToymgxm3lot2bPLaf+
 LLpnOCw096Bb62ZpmmXR7lnj9CwtX768lNauLAbZJyjixzd5TZQYIytwba2lYFTiDqlu
 MhshuEWy96TTWLpTJmDPHyN1Gre5/jdKw2939wVV3eNO+4XG+ltTJSxgrWXBSnEzcWDu
 g1mSG+ZcOD4haaZd9x4LRfHgB2wjqzxWXMDlJul8BNTx1Z6GzyaHThSgYmNlDXduK1E/
 s3aQ==
X-Gm-Message-State: AOAM532GqzHR8S8mAKl1nd7johbTI1lsS18LWTZnHNRv1P+A07plqnq4
 bMCcUixN+4k6RhG6YkUn9Xkfa3z9YozMibIHzLc=
X-Google-Smtp-Source: ABdhPJxZHh81Bt4nofbb5kaKkT4tjWBeDMkWORXVUhNQejFAOhSFnOLyfE8HJptfnuZMxxjozz4R2n+Jm1Crv+nZgnQ=
X-Received: by 2002:a5d:9c44:: with SMTP id 4mr629061iof.15.1593582411483;
 Tue, 30 Jun 2020 22:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200624174048.64754-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200624174048.64754-1-vaibhavgupta40@gmail.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 1 Jul 2020 11:15:13 +0530
Message-ID: <CAPBsFfCGfyFkeVvUC0QCnr9J4uvfubHoHjgPR9e+muPkYRj9vg@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] orinoco: use generic power
	management
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

On Wed, 24 Jun 2020 at 23:14, Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> With the support of generic PM callbacks, drivers no longer need to use
> legacy .suspend() and .resume() in which they had to maintain PCI states
> changes and device's power state themselves. The required operations are
> done by PCI core.
>
> PCI drivers are not expected to invoke PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(),
> pci_set_power_state(), etc. Their tasks are completed by PCI core itself.
>
> Compile-tested only.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  .../intersil/orinoco/orinoco_nortel.c         |  3 +-
>  .../wireless/intersil/orinoco/orinoco_pci.c   |  3 +-
>  .../wireless/intersil/orinoco/orinoco_pci.h   | 32 ++++++-------------
>  .../wireless/intersil/orinoco/orinoco_plx.c   |  3 +-
>  .../wireless/intersil/orinoco/orinoco_tmd.c   |  3 +-
>  5 files changed, 13 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_nortel.c b/drivers/net/wireless/intersil/orinoco/orinoco_nortel.c
> index 048693b6c6c2..96a03d10a080 100644
> --- a/drivers/net/wireless/intersil/orinoco/orinoco_nortel.c
> +++ b/drivers/net/wireless/intersil/orinoco/orinoco_nortel.c
> @@ -290,8 +290,7 @@ static struct pci_driver orinoco_nortel_driver = {
>         .id_table       = orinoco_nortel_id_table,
>         .probe          = orinoco_nortel_init_one,
>         .remove         = orinoco_nortel_remove_one,
> -       .suspend        = orinoco_pci_suspend,
> -       .resume         = orinoco_pci_resume,
> +       .driver.pm      = &orinoco_pci_pm_ops,
>  };
>
>  static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
> diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_pci.c b/drivers/net/wireless/intersil/orinoco/orinoco_pci.c
> index 4938a2208a37..f3c86b07b1b9 100644
> --- a/drivers/net/wireless/intersil/orinoco/orinoco_pci.c
> +++ b/drivers/net/wireless/intersil/orinoco/orinoco_pci.c
> @@ -230,8 +230,7 @@ static struct pci_driver orinoco_pci_driver = {
>         .id_table       = orinoco_pci_id_table,
>         .probe          = orinoco_pci_init_one,
>         .remove         = orinoco_pci_remove_one,
> -       .suspend        = orinoco_pci_suspend,
> -       .resume         = orinoco_pci_resume,
> +       .driver.pm      = &orinoco_pci_pm_ops,
>  };
>
>  static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
> diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_pci.h b/drivers/net/wireless/intersil/orinoco/orinoco_pci.h
> index 43f5b9f5a0b0..d49d940864b4 100644
> --- a/drivers/net/wireless/intersil/orinoco/orinoco_pci.h
> +++ b/drivers/net/wireless/intersil/orinoco/orinoco_pci.h
> @@ -18,51 +18,37 @@ struct orinoco_pci_card {
>         void __iomem *attr_io;
>  };
>
> -#ifdef CONFIG_PM
> -static int orinoco_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused orinoco_pci_suspend(struct device *dev_d)
>  {
> +       struct pci_dev *pdev = to_pci_dev(dev_d);
>         struct orinoco_private *priv = pci_get_drvdata(pdev);
>
>         orinoco_down(priv);
>         free_irq(pdev->irq, priv);
> -       pci_save_state(pdev);
> -       pci_disable_device(pdev);
> -       pci_set_power_state(pdev, PCI_D3hot);
>
>         return 0;
>  }
>
> -static int orinoco_pci_resume(struct pci_dev *pdev)
> +static int __maybe_unused orinoco_pci_resume(struct device *dev_d)
>  {
> +       struct pci_dev *pdev = to_pci_dev(dev_d);
>         struct orinoco_private *priv = pci_get_drvdata(pdev);
>         struct net_device *dev = priv->ndev;
>         int err;
>
> -       pci_set_power_state(pdev, PCI_D0);
> -       err = pci_enable_device(pdev);
> -       if (err) {
> -               printk(KERN_ERR "%s: pci_enable_device failed on resume\n",
> -                      dev->name);
> -               return err;
> -       }
> -       pci_restore_state(pdev);
> -
>         err = request_irq(pdev->irq, orinoco_interrupt, IRQF_SHARED,
>                           dev->name, priv);
>         if (err) {
>                 printk(KERN_ERR "%s: cannot re-allocate IRQ on resume\n",
>                        dev->name);
> -               pci_disable_device(pdev);
>                 return -EBUSY;
>         }
>
> -       err = orinoco_up(priv);
> -
> -       return err;
> +       return orinoco_up(priv);
>  }
> -#else
> -#define orinoco_pci_suspend NULL
> -#define orinoco_pci_resume NULL
> -#endif
> +
> +static SIMPLE_DEV_PM_OPS(orinoco_pci_pm_ops,
> +                        orinoco_pci_suspend,
> +                        orinoco_pci_resume);
>
>  #endif /* _ORINOCO_PCI_H */
> diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_plx.c b/drivers/net/wireless/intersil/orinoco/orinoco_plx.c
> index 221352027779..16dada94c774 100644
> --- a/drivers/net/wireless/intersil/orinoco/orinoco_plx.c
> +++ b/drivers/net/wireless/intersil/orinoco/orinoco_plx.c
> @@ -336,8 +336,7 @@ static struct pci_driver orinoco_plx_driver = {
>         .id_table       = orinoco_plx_id_table,
>         .probe          = orinoco_plx_init_one,
>         .remove         = orinoco_plx_remove_one,
> -       .suspend        = orinoco_pci_suspend,
> -       .resume         = orinoco_pci_resume,
> +       .driver.pm      = &orinoco_pci_pm_ops,
>  };
>
>  static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
> diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_tmd.c b/drivers/net/wireless/intersil/orinoco/orinoco_tmd.c
> index 20ce569b8a43..9a9d335611ac 100644
> --- a/drivers/net/wireless/intersil/orinoco/orinoco_tmd.c
> +++ b/drivers/net/wireless/intersil/orinoco/orinoco_tmd.c
> @@ -213,8 +213,7 @@ static struct pci_driver orinoco_tmd_driver = {
>         .id_table       = orinoco_tmd_id_table,
>         .probe          = orinoco_tmd_init_one,
>         .remove         = orinoco_tmd_remove_one,
> -       .suspend        = orinoco_pci_suspend,
> -       .resume         = orinoco_pci_resume,
> +       .driver.pm      = &orinoco_pci_pm_ops,
>  };
>
>  static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
