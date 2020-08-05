Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D06C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 06:34:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 687BA204EA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 06:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckLt2Hja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 687BA204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3753687C10;
	Wed,  5 Aug 2020 06:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s67vJwk7iZhS; Wed,  5 Aug 2020 06:34:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2214F87635;
	Wed,  5 Aug 2020 06:34:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07F93C0050;
	Wed,  5 Aug 2020 06:34:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40757C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 06:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2CD3D876E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 06:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXiB1m-wm1UE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 06:34:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 383B4876CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 06:34:35 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id i20so1159310vkk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 23:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Izm9CrPLohryxU3MDcr4vOdCg89l4cBAjIrruJENdp0=;
 b=ckLt2HjalR4fWHRxNoET0unnn2lxQb7Gdmn+8jgKHcHj6KUBZNW5cYd1C0og9dqMkm
 rTunozbRodwFbCT5D9790M813rgEb3Ich+lQg9nezzX+bifywuafpGRryopnFhr4bvnf
 siuDdd+tAlWXfwnqGTk620BIEuk84JAyps9JgLbJRFboTH6lKk2HCcVOFLT//ZjxpvzH
 KlagF+zSZFnCTOMZRCWhaOQXynxfx8ZCAfhtw6Rb35f0cfZR3g0YMQuGP3LlFUBS/RDo
 ZRGOq+yPKId5vZfkp0vwwnSyQ5/NCDoI2r2G+w0+gMAgAKuT+GYqiLBpdfiWZ9Fw0L/9
 wsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Izm9CrPLohryxU3MDcr4vOdCg89l4cBAjIrruJENdp0=;
 b=BvN/b/a5HvUpedUeGKnGIxNM04/29xAK16QntvW3arqi+R1zHlZ9pn3nB36fJshOZR
 EA1FSZtCe0u+Pb8sNDgQxlh8BA+SJHPKAnj3bq64K9Z2oSOYfkRicUlwwHon/NQd9duW
 joISCnr6ZWxHRtcshuTDF7ATz7gcQO4pwOFGLlyzPj7vMbyTKcbA1zh//Kp8TWaH4Ry8
 F2JYkdolsn8FeVWm8bIPIxBUXVXX9f135sKT/DMUObUibp8F3/j5KxBYT2cUx+2o/uB4
 QBuUjyVZaX0gfcHj6dsDZniERja56Sv9xH5S5tahXenSNU4LaVCOLAvIYn9wNurFv0Tv
 laAw==
X-Gm-Message-State: AOAM531FxdRm3jyskTJdVY0vy40iw91Uz2Wxhg5d8WvQRiW+h06gpGUX
 Wd7fpTAytfw7NqYCRoK/nbHDnKfIez602WtHOtxFWg==
X-Google-Smtp-Source: ABdhPJwjmHEG+n503eEdN9m4EYLCPgDwJUUK64dQ97cRm46R32hGYZGULEUvMG3ioxWlxIk1R/m3RFa0ZCeKhSZoMBo=
X-Received: by 2002:a1f:7c45:: with SMTP id x66mr1304488vkc.53.1596609273140; 
 Tue, 04 Aug 2020 23:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200720111625.306681-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200720111625.306681-1-vaibhavgupta40@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 5 Aug 2020 08:33:55 +0200
Message-ID: <CAPDyKFo_skSjZ0gfLNNgx2rdDDu3gTJ4Lc+40t=Jb1KPoBBaiA@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] memstick: jmb38x_ms: use
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

On Mon, 20 Jul 2020 at 13:19, Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
>
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
>
> This driver makes use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(),
> pci_set_power_state() and pci_set_master() to do required operations. In
> generic mode, they are no longer needed.
>
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use to_pci_dev() and dev_get_drvdata() to get
> "struct pci_dev*" variable and drv data.
>
> Compile-tested only.
>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied for next (a while ago), thanks!
Kind regards
Uffe


> ---
>  drivers/memstick/host/jmb38x_ms.c | 38 +++++++++----------------------
>  1 file changed, 11 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
> index 0a9c5ddf2f59..2aa9592917d9 100644
> --- a/drivers/memstick/host/jmb38x_ms.c
> +++ b/drivers/memstick/host/jmb38x_ms.c
> @@ -793,11 +793,10 @@ static int jmb38x_ms_pmos(struct pci_dev *pdev, int flag)
>          return 0;
>  }
>
> -#ifdef CONFIG_PM
> -
> -static int jmb38x_ms_suspend(struct pci_dev *dev, pm_message_t state)
> +static int __maybe_unused jmb38x_ms_suspend(struct device *dev)
>  {
> -       struct jmb38x_ms *jm = pci_get_drvdata(dev);
> +       struct jmb38x_ms *jm = dev_get_drvdata(dev);
> +
>         int cnt;
>
>         for (cnt = 0; cnt < jm->host_cnt; ++cnt) {
> @@ -806,26 +805,17 @@ static int jmb38x_ms_suspend(struct pci_dev *dev, pm_message_t state)
>                 memstick_suspend_host(jm->hosts[cnt]);
>         }
>
> -       pci_save_state(dev);
> -       pci_enable_wake(dev, pci_choose_state(dev, state), 0);
> -       pci_disable_device(dev);
> -       pci_set_power_state(dev, pci_choose_state(dev, state));
> +       device_wakeup_disable(dev);
> +
>         return 0;
>  }
>
> -static int jmb38x_ms_resume(struct pci_dev *dev)
> +static int __maybe_unused jmb38x_ms_resume(struct device *dev)
>  {
> -       struct jmb38x_ms *jm = pci_get_drvdata(dev);
> +       struct jmb38x_ms *jm = dev_get_drvdata(dev);
>         int rc;
>
> -       pci_set_power_state(dev, PCI_D0);
> -       pci_restore_state(dev);
> -       rc = pci_enable_device(dev);
> -       if (rc)
> -               return rc;
> -       pci_set_master(dev);
> -
> -       jmb38x_ms_pmos(dev, 1);
> +       jmb38x_ms_pmos(to_pci_dev(dev), 1);
>
>         for (rc = 0; rc < jm->host_cnt; ++rc) {
>                 if (!jm->hosts[rc])
> @@ -837,13 +827,6 @@ static int jmb38x_ms_resume(struct pci_dev *dev)
>         return 0;
>  }
>
> -#else
> -
> -#define jmb38x_ms_suspend NULL
> -#define jmb38x_ms_resume NULL
> -
> -#endif /* CONFIG_PM */
> -
>  static int jmb38x_ms_count_slots(struct pci_dev *pdev)
>  {
>         int cnt, rc = 0;
> @@ -1030,13 +1013,14 @@ static struct pci_device_id jmb38x_ms_id_tbl [] = {
>         { }
>  };
>
> +static SIMPLE_DEV_PM_OPS(jmb38x_ms_pm_ops, jmb38x_ms_suspend, jmb38x_ms_resume);
> +
>  static struct pci_driver jmb38x_ms_driver = {
>         .name = DRIVER_NAME,
>         .id_table = jmb38x_ms_id_tbl,
>         .probe = jmb38x_ms_probe,
>         .remove = jmb38x_ms_remove,
> -       .suspend = jmb38x_ms_suspend,
> -       .resume = jmb38x_ms_resume
> +       .driver.pm = &jmb38x_ms_pm_ops,
>  };
>
>  module_pci_driver(jmb38x_ms_driver);
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
