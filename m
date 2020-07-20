Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08543C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 10:49:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C618920773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 10:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrNm2gxi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C618920773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9BDDC860A2;
	Mon, 20 Jul 2020 10:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qnWwUDt6ayx3; Mon, 20 Jul 2020 10:49:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1168B85C3B;
	Mon, 20 Jul 2020 10:49:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECD50C0894;
	Mon, 20 Jul 2020 10:49:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F0FAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6C9FE8608B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sf6DcXPmAdP8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:49:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B471085C3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 10:49:30 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id q15so8236233vso.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 03:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wY0dHi09vd294neiN4XqhltRnFObgHpOmPvIePnDyJM=;
 b=RrNm2gxit1WQD7b8BvDuwQffEaYmpn/vOp/taHp46yvimJgrOfz3utD5aYhN8uC4rS
 vauBkp0fwEf6gu5qAafT/vKfwzhmyO5A1y/1jsKTGP5YRpnuHom+2N78zHpetio6xwID
 Go2lex9NktC9gL78KhMmvM7rzdStaXMnL18Q6xiAI8nwkAwlFHGvFg1a7KUoHNE9gOCp
 7r8HWjaFftONV/lclo4aGwmp5jd6k7dYeBzRTsXzVjd7Lc4DkG03Cr2Pg35v7ibf9E4q
 Uc84PeelRGufa/hIMHsQ1Mp6Dn3Zw+piIbCU+aUBqgYBkmHbzqh7bUTebMNhBI0VtTds
 XPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wY0dHi09vd294neiN4XqhltRnFObgHpOmPvIePnDyJM=;
 b=dVlMyL8GzvRzY9u/1Dbn9F5Dw5vmUy+bD646GfujnXVJ09Jdn7hiow4a5ZrzOH2IdI
 9OgM7kOGNb+2nlk0LwLZyoksX9tcXBMwkqyYfZtAH7XkAc/nJGIqf1PNc1gDpqpKGvNz
 5jsHwTXLmzXg/6J1mH0nTZTJA3keDtNt6EvmovdAFK4sDnrSKUJY8Wb0wy6zaYr8INWD
 x2XD1siVF0mC7PQMyBC20cQcs0MagAGeXevG0PcsogfjZgk2oY5foYF9FH0Sc1kmWQrS
 TH/BJmwPJ31CBBH6tzmZxl6DD5a6YYOecYfiVot6Ceq286sEDbIjbWOpiS0VxYJWIJpd
 t6Fw==
X-Gm-Message-State: AOAM530luT3S6SkkhVQPHD9A87PyT5GHsyHDTAscJU0MMPnylSr82tnS
 JyP+RV9oZgbF963L607qDTkLGgclKTvIMoBKYAM=
X-Google-Smtp-Source: ABdhPJzy6/qnz/BhMCoMM7wOU6HD05HnbnXTb2JWl5+U3NV9DvoVnpkNcjUAX5xaOI2d8kWV7iuWh2hlJ2KL3XCSKCI=
X-Received: by 2002:a67:ef1e:: with SMTP id j30mr14619614vsr.127.1595242169547; 
 Mon, 20 Jul 2020 03:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200622120229.89610-1-vaibhavgupta40@gmail.com>
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Mon, 20 Jul 2020 16:17:39 +0530
Message-ID: <CAP+cEOMZsLhneqnvDwmWZ6ps8boANX_wvZXVaptDonOEoULqXA@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] [media] saa7134: use generic
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

On Mon, Jun 22, 2020 at 5:36 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> With the support of generic PM callbacks, drivers no longer need to use
> legacy .suspend() and .resume() in which they had to maintain PCI states
> changes and device's power state themselves. The required operations are
> done by PCI core.
>
> Compile-tested only.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/media/pci/saa7134/saa7134-core.c | 25 ++++++++----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
> index e4623ed2f831..eb01109d4f98 100644
> --- a/drivers/media/pci/saa7134/saa7134-core.c
> +++ b/drivers/media/pci/saa7134/saa7134-core.c
> @@ -1370,10 +1370,8 @@ static void saa7134_finidev(struct pci_dev *pci_dev)
>         kfree(dev);
>  }
>
> -#ifdef CONFIG_PM
> -
>  /* resends a current buffer in queue after resume */
> -static int saa7134_buffer_requeue(struct saa7134_dev *dev,
> +static int __maybe_unused saa7134_buffer_requeue(struct saa7134_dev *dev,
>                                   struct saa7134_dmaqueue *q)
>  {
>         struct saa7134_buf *buf, *next;
> @@ -1397,8 +1395,9 @@ static int saa7134_buffer_requeue(struct saa7134_dev *dev,
>         return 0;
>  }
>
> -static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
> +static int __maybe_unused saa7134_suspend(struct device *dev_d)
>  {
> +       struct pci_dev *pci_dev = to_pci_dev(dev_d);
>         struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
>         struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
>
> @@ -1428,21 +1427,15 @@ static int saa7134_suspend(struct pci_dev *pci_dev , pm_message_t state)
>         if (dev->remote && dev->remote->dev->users)
>                 saa7134_ir_close(dev->remote->dev);
>
> -       pci_save_state(pci_dev);
> -       pci_set_power_state(pci_dev, pci_choose_state(pci_dev, state));
> -
>         return 0;
>  }
>
> -static int saa7134_resume(struct pci_dev *pci_dev)
> +static int __maybe_unused saa7134_resume(struct device *dev_d)
>  {
> -       struct v4l2_device *v4l2_dev = pci_get_drvdata(pci_dev);
> +       struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
>         struct saa7134_dev *dev = container_of(v4l2_dev, struct saa7134_dev, v4l2_dev);
>         unsigned long flags;
>
> -       pci_set_power_state(pci_dev, PCI_D0);
> -       pci_restore_state(pci_dev);
> -
>         /* Do things that are done in saa7134_initdev ,
>                 except of initializing memory structures.*/
>
> @@ -1490,7 +1483,6 @@ static int saa7134_resume(struct pci_dev *pci_dev)
>
>         return 0;
>  }
> -#endif
>
>  /* ----------------------------------------------------------- */
>
> @@ -1522,15 +1514,14 @@ EXPORT_SYMBOL(saa7134_ts_unregister);
>
>  /* ----------------------------------------------------------- */
>
> +static SIMPLE_DEV_PM_OPS(saa7134_pm_ops, saa7134_suspend, saa7134_resume);
> +
>  static struct pci_driver saa7134_pci_driver = {
>         .name     = "saa7134",
>         .id_table = saa7134_pci_tbl,
>         .probe    = saa7134_initdev,
>         .remove   = saa7134_finidev,
> -#ifdef CONFIG_PM
> -       .suspend  = saa7134_suspend,
> -       .resume   = saa7134_resume
> -#endif
> +       .driver.pm = &saa7134_pm_ops,
>  };
>
>  static int __init saa7134_init(void)
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
