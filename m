Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB0CC433F1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:38:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 134192083B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 13:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRkfP9q3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 134192083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD6448818B;
	Mon, 27 Jul 2020 13:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7vPxvUeaFAk; Mon, 27 Jul 2020 13:38:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7414788189;
	Mon, 27 Jul 2020 13:38:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68469C0050;
	Mon, 27 Jul 2020 13:38:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 090E4C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E8295203DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:38:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTmJH-aoFpUz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:38:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id A72B5203D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:38:55 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id i92so1539438pje.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 06:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ocZOH/qAxVzRpNDtMIHAj3P48sK/ccO+2zMNnR18J60=;
 b=sRkfP9q3WiUQNGxVKytVTA1DxMULQ/VpKMX43DZfHIchAb8n8WZeFwIcz7WFSx0GFt
 I5pi6jULLnS1k1rcTUtnuCjfKn8GD6VSztgUjZn9iTnNr7DF8cjShczCSXPemWLuhBnD
 VhJSQPrl6F00RB7O1eum8MXUk4H/LrqTYmyFSz/nF9V50sABvZvWSLb2UQVS6g0itTzs
 AY2rx0Dt51Q8dTGMOt3kjZ55kmGjxOCkBJo+67SJbdRoWXvmWiAkpXqBYirPmMq+6pGy
 H/b0GRm473V71yIkzP5jGOgWdLFNP2gAtrlyNVxmhTwKs7lQKXF+ULCG3jdkDviFE2Kr
 UPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ocZOH/qAxVzRpNDtMIHAj3P48sK/ccO+2zMNnR18J60=;
 b=INYTg69kHdMO55WShdXvyaNDodNOsVr99Qtw/UOZsgG2Rbu7ElbysK+CRQHD88noyt
 zQ21kiE0eMlYUv4Gz6oVXsPc7bOY2b+OY0E2hmBs+/M9Uhm4cg8jysUaHmRplDCE33On
 5CGB56ikafUkmxcBQWwB9FEfz2yiJz4xrmy0kqCyWe1wKVNcRH+4cmzNIO0k65yrftoM
 04dW7Rsl6Whp6+SrbxQzHb8XVxuo7BSAqE2gVUCuz5fW9RLyAXpqabGhazehr8ODri+t
 iX5ltr/AOSQHzbNvLx1RKSH/VtwI3ZUBD8KF8Hn1KGj/8I9fcWd2avLsQmONJs6BLPwI
 ycWA==
X-Gm-Message-State: AOAM530WqAjT8gNb7W9zwDXDP6o2gLpAGifWBM+VVn+JxTPKejkqrTOz
 Z6u/6hsmoZJEH3LAHpshJ2B2q4x3N0H7MXRvVxk=
X-Google-Smtp-Source: ABdhPJwaumQ02E9kw/pSB9Ks/8s/ndn264SasBMVkqJLVdv2Odq4jIRDRFnIFEdRIJwqqZ6RH6bxyj0fK/UPvLukTjo=
X-Received: by 2002:a17:90a:a393:: with SMTP id
 x19mr16574129pjp.228.1595857135248; 
 Mon, 27 Jul 2020 06:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
 <20200727131742.82289-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200727131742.82289-1-vaibhavgupta40@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Jul 2020 16:38:40 +0300
Message-ID: <CAHp75VfmKvAy6bSk70g3c2qJcUzzo0AUhzxR6dFja+ZppGMLRg@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] spi: spi-topcliff-pch: drop
	call to wakeup-disable
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

On Mon, Jul 27, 2020 at 4:21 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> Before generic upgrade, both .suspend() and .resume() were invoking
> pci_enable_wake(pci_dev, PCI_D3hot, 0). Hence, disabling wakeup in both
> states. (Normal trend is .suspend() enables and .resume() disables the
> wakeup.)
>
> This was ambiguous and may be buggy. Instead of replicating the legacy
> behavior, drop the wakeup-disable call.
>

> Fix: f185bcc77980("spi: spi-topcliff-pch: use generic power management")

Fixes: and missed space.

Note:

% grep one ~/.gitconfig
       one = show -s --pretty='format:%h (\"%s\")'

% git one f185bcc77980
f185bcc77980 ("spi: spi-topcliff-pch: use generic power management")

> Reported by: Andy Shevchenko <andy.shevchenko@gmail.com>

Missed dash. Does checkpatch complain?

> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/spi/spi-topcliff-pch.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
> index 281a90f1b5d8..c73a03ddf5f3 100644
> --- a/drivers/spi/spi-topcliff-pch.c
> +++ b/drivers/spi/spi-topcliff-pch.c
> @@ -1648,8 +1648,6 @@ static int __maybe_unused pch_spi_resume(struct device *dev)
>
>         dev_dbg(dev, "%s ENTRY\n", __func__);
>
> -       device_wakeup_disable(dev);
> -
>         /* set suspend status to false */
>         pd_dev_save->board_dat->suspend_sts = false;
>
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
