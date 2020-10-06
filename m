Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D36C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 09:17:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3E920866
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 09:17:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXuncFqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3E920866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C84D1858B5;
	Tue,  6 Oct 2020 09:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqoAKvT1a+N8; Tue,  6 Oct 2020 09:17:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 50A92853B9;
	Tue,  6 Oct 2020 09:17:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4352FC016F;
	Tue,  6 Oct 2020 09:17:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41813C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 31E7985735
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYMOOztu9r-s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:17:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 211BF853B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 09:17:03 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d24so10237424lfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 02:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IJLzHv0wuJacnG9Sh9U1ShbjHWOtGBELHGoUNl8bafc=;
 b=SXuncFqHvfgYJL5MPFXDjZGh2aszphyV47iMX5OPrSaNAL8OQ62EOJXuvceEzdBhLt
 btFWreu3ieO2j+Bhr6E9zbFfvt4KvwLd87RzabWZ4HqMiJcY/WAs1urPXpwlHXrJr1K3
 MgQUy/n99ixget6V1d5zTNPxFOqeTmN37X3hO9TfxVt2IX2xNqpaCPOcX+9w6fEWUrK6
 plUxx/xUeAnz1df3zALqDqvEGXhQFe9dvTmKneCyBjfEk0rJUPpe/Bwez7cQbKqXDaP5
 ds5RFMSHVH+Gp4n3lk0p49QQKiEQnrP0sY852SpdvNE/WVcc2lzH2dQISMaKWhlRiQ/D
 +b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IJLzHv0wuJacnG9Sh9U1ShbjHWOtGBELHGoUNl8bafc=;
 b=BfkeHKcTISiL3hY1q6gFEsLNcR6Mk41SqM6kyDVeTmWzMPDPDcsa7C7DfrgnE0PFoj
 zkiSRw8HExsD+XHuC8ZnWeZRjBSFtH3pYciUn6drD04/niLZPnHAGbilYbpT6QUX/qA6
 T5gvI3a1PYnILJjL+OLLnFQ2SxAQG5pbD7l/8GHUOYLYlL0LLUQMzdygSeHBGhpx7Pvp
 N1Nm2Pqmn2d9Qfxl6pgWJq1bj18iKoh9Yi265GXPhEPjcJpetoJF4kbeSpRGYISmuzW3
 CMtmUqpFM5wCv4vlJS4gbuuIX277HwvWjq4ip6LLXAuMA3bX1NVy5T1sd7Bk/eDWTkS4
 3vmw==
X-Gm-Message-State: AOAM533TndU16oYLdooHaONMy9dy9T/y6k86TyzuaiHxN8/cEWsqLbmA
 x6IXp5ULNlFZfq6STglKp3O2pSzW0kezWcNkW7EEFA==
X-Google-Smtp-Source: ABdhPJyB9PujX1YNzhC20h5uPujSf/VGlXD0DfrFxVzgse9nwilSQf+1ZsevcPteK3A5FbeBS8g7saVIshrrTtC1/Oo=
X-Received: by 2002:a19:e55:: with SMTP id 82mr148521lfo.571.1601975821003;
 Tue, 06 Oct 2020 02:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
 <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
 <20201002224502.vn3ooodrxrblwauu@Rk>
 <34cecd8e-ffa7-c2bc-8ce3-575db47ff455@redhat.com>
 <20201003230340.42mtl35n4ka4d5qw@Rk> <20201004051644.f3fg2oavbobrwhf6@Rk>
 <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
In-Reply-To: <20201006083157.3pg6zvju5buxspns@Rk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Oct 2020 11:16:50 +0200
Message-ID: <CACRpkdaK-WpQdKu-tBOyvB1HLZ10ivjEPrVFqGjPSvLJuPXG8Q@mail.gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 wang jun <availa@outlook.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
Subject: Re: [Linux-kernel-mentees] Any other ways to debug GPIO interrupt
 controller (pinctrl-amd) for broken touchpads of a new laptop model?
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

On Tue, Oct 6, 2020 at 10:32 AM Coiby Xu <coiby.xu@gmail.com> wrote:

> Disabling the glitch filter works like a charm! Other enthusiastic
> Linux users who have been troubled by this issue for months would
> also feel great to know this small tweaking could bring their
> touchpad back to life:) Thank you!

Oh you found the bug :D

> $ git diff
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 9a760f5cd7ed..e786d779d6c8 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -463,7 +463,7 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>                  pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>                  pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>                  pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
> -               pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
> +               /** pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF; */
>                  irq_set_handler_locked(d, handle_level_irq);
>                  break;
>
> I will learn more about the glitch filter and the implementation of
> pinctrl and see if I can disable glitch filter only for this touchpad.

Yes we certainly need a quirk for this of some kind, examine the ACPI
quirk infrastructure in drivers/gpio/gpiolib-acpi.c to see if you can use
that to handle this.

Yours,
Linus Walleij
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
