Return-Path: <SRS0=9k96=B4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64DCC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 20:08:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1C520786
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 20:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mY9/qM2M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1C520786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBA5E86AA1;
	Tue, 18 Aug 2020 20:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prYXrHTJBFlf; Tue, 18 Aug 2020 20:08:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA88786A26;
	Tue, 18 Aug 2020 20:08:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4E0DC07FF;
	Tue, 18 Aug 2020 20:08:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 122FCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 20:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0101C2002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 20:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id maB-YeIKYoco
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 20:08:17 +0000 (UTC)
X-Greylist: delayed 00:08:15 by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 5FEB21FF98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 20:08:17 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id b79so19487264qkg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZDCPDwW9euB1yf1r32n/nOxApA5CLlHLcrrfHIoPe0=;
 b=mY9/qM2MC8h80QmH/L2o3ebU+oUQNUCW63wm7YBmbeK4YBE5Xe3Rjqtwof4g90Gl5j
 Nashil2BSJxW/GC+DcTms+MTs3zm8+LkClOf/U2jUP/YJlxAmvLXG+Y1SxzjQuQdOmRe
 FaeRrNHm7nBp0Ire6IgS6r1s0gdLxjr1afa0E+smJ3xN4nEInrIvlWBT7CW0TEmor1mO
 FIgviwqTSYceSMveg047w1orQVPvufjnGz94qi/TKhCr8AbTj6GPs3BxF/aFHmnO4n+M
 XlWMZtYVdzdVxOkWy4H/ual/TZMNFFmE2xwQGOV4ybgkF4mcBltQ5wgUueSnWH61nlUt
 zm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZDCPDwW9euB1yf1r32n/nOxApA5CLlHLcrrfHIoPe0=;
 b=clAVC+zdWGi6ojXG0snZvinZTYzMWoNYwG5WbcbjB9L3HQ/OrrdzYP3E7Ob7SnUtjS
 dMe9jXzpl2KpK/ubkrZoDqrWdJwTCGZYWUrJeY61FVzPa++o2PwYg+9p+Rfalcg28j2l
 lDVlf8HqeSyIoo8Es6OwiH0+XunxjkkUhzBYQamm67VNYLus7eDGQ/8Kx63uapBmcwy0
 p9R+CXz2AP7oAwe72nZv2htPAUtUAwJ1T8jmMPPaIJm0IzxyepPkXppAxi2Sr+75bVnq
 3Jym2aGDcyqVzQdg/hM5DTb5MR8ODkGZPXUIbtE18uKGaLBQz0vi2FmS8ZqvEbUXikBC
 2C6Q==
X-Gm-Message-State: AOAM533HGvDSMksxOOcG9xAW9EScJgx0XFTHYLNu1fZNieaSzEdF+EA0
 DCLj6rJxVOPBDlKdPj2mgnBNhxxqmvDMrLzMxw8lfo/gHCM=
X-Google-Smtp-Source: ABdhPJzURAYX1VluYbg81khU/4BFMEQ5XggeNrYg7amfOd007KJmuQPkzQNHuZnA3kRR7pjm2ZwfV6zrZkG75TYorqc=
X-Received: by 2002:a37:a495:: with SMTP id
 n143mr19146148qke.330.1597780801253; 
 Tue, 18 Aug 2020 13:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200801112446.149549-1-refactormyself@gmail.com>
 <20200801112446.149549-9-refactormyself@gmail.com>
In-Reply-To: <20200801112446.149549-9-refactormyself@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 18 Aug 2020 21:59:50 +0200
Message-ID: <CAMpxmJX8SV6RTgy4vKNRPzKvnVaJZpZKQmOf1pX1wGd+H2zaeA@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 08/17] gpio: Drop uses of
	pci_read_config_*() return value
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

On Sat, Aug 1, 2020 at 2:24 PM Saheed O. Bolarinwa
<refactormyself@gmail.com> wrote:
>
> The return value of pci_read_config_*() may not indicate a device error.
> However, the value read by these functions is more likely to indicate
> this kind of error. This presents two overlapping ways of reporting
> errors and complicates error checking.
>
> It is possible to move to one single way of checking for error if the
> dependency on the return value of these functions is removed, then it
> can later be made to return void.
>
> Remove all uses of the return value of pci_read_config_*().
> Check the actual value read for ~0. In this case, ~0 is an invalid
> value thus it indicates some kind of error.
>
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
> ---
>  drivers/gpio/gpio-amd8111.c |  7 +++++--
>  drivers/gpio/gpio-rdc321x.c | 21 ++++++++++++---------
>  2 files changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
> index fdcebe59510d..7b9882380cbc 100644
> --- a/drivers/gpio/gpio-amd8111.c
> +++ b/drivers/gpio/gpio-amd8111.c
> @@ -198,9 +198,12 @@ static int __init amd_gpio_init(void)
>         goto out;
>
>  found:
> -       err = pci_read_config_dword(pdev, 0x58, &gp.pmbase);
> -       if (err)
> +       pci_read_config_dword(pdev, 0x58, &gp.pmbase);
> +       if (gp.pmbase == (u32)~0) {
> +               err = -ENODEV;
>                 goto out;
> +       }
> +
>         err = -EIO;
>         gp.pmbase &= 0x0000FF00;
>         if (gp.pmbase == 0)
> diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
> index 01ed2517e9fd..03f1ff07b844 100644
> --- a/drivers/gpio/gpio-rdc321x.c
> +++ b/drivers/gpio/gpio-rdc321x.c
> @@ -85,10 +85,13 @@ static int rdc_gpio_config(struct gpio_chip *chip,
>         gpch = gpiochip_get_data(chip);
>
>         spin_lock(&gpch->lock);
> -       err = pci_read_config_dword(gpch->sb_pdev, gpio < 32 ?
> -                       gpch->reg1_ctrl_base : gpch->reg2_ctrl_base, &reg);
> -       if (err)
> +       pci_read_config_dword(gpch->sb_pdev,
> +                               (gpio < 32) ? gpch->reg1_ctrl_base
> +                                       : gpch->reg2_ctrl_base, &reg);
> +       if (reg == (u32)~0) {
> +               err = -ENODEV;
>                 goto unlock;
> +       }
>
>         reg |= 1 << (gpio & 0x1f);
>
> @@ -166,17 +169,17 @@ static int rdc321x_gpio_probe(struct platform_device *pdev)
>         /* This might not be, what others (BIOS, bootloader, etc.)
>            wrote to these registers before, but it's a good guess. Still
>            better than just using 0xffffffff. */
> -       err = pci_read_config_dword(rdc321x_gpio_dev->sb_pdev,
> +       pci_read_config_dword(rdc321x_gpio_dev->sb_pdev,
>                                         rdc321x_gpio_dev->reg1_data_base,
>                                         &rdc321x_gpio_dev->data_reg[0]);
> -       if (err)
> -               return err;
> +       if (rdc321x_gpio_dev->data_reg[0] == (u32)~0)
> +               return -ENODEV;
>
> -       err = pci_read_config_dword(rdc321x_gpio_dev->sb_pdev,
> +       pci_read_config_dword(rdc321x_gpio_dev->sb_pdev,
>                                         rdc321x_gpio_dev->reg2_data_base,
>                                         &rdc321x_gpio_dev->data_reg[1]);
> -       if (err)
> -               return err;
> +       if (rdc321x_gpio_dev->data_reg[1] == (u32)~0)
> +               return -ENODEV;
>
>         dev_info(&pdev->dev, "registering %d GPIOs\n",
>                                         rdc321x_gpio_dev->chip.ngpio);
> --
> 2.18.4
>

Bjorn,

I don't know the pci sub-system at all. Does this look good to you?

Bartosz
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
