Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B6CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 19:21:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE19520729
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 19:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPX8niCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE19520729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7432787823;
	Mon, 27 Jul 2020 19:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3C0iEgqfvmz; Mon, 27 Jul 2020 19:21:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 20FF9877E6;
	Mon, 27 Jul 2020 19:21:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CCADC0050;
	Mon, 27 Jul 2020 19:21:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94647C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6EB39221AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGd9E8upIMi2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:21:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 966DC204E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 19:21:25 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id m22so10430410pgv.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gv1At7xomxbSkiHEMMp/MdVQGHl3xOeUcLOgVXl9jaM=;
 b=QPX8niCszCEYxpgHRA5feQ/5WYif4D6kceFBFbLizenbe1uHxoE95G8CQl0uVw6dVx
 iWI628gC8Auh8f2Sn2cYTiODS3rtto/PqyyXjC4aqXyPIQh2GRwnPvB78GrTYsdaW5Qk
 kCIR6b/geTpTRscY3wkdoVzf3PMZa135FxFeKrN8PYWdYPhwd2hOznrO0iMhyDSRmjc3
 O8aU3acP5lYmqS8KuElcP4uMhYjfaYoOxP6h1RFFlRlhvKj2XnPubCw1XDHHAHFSHoDa
 yUCtjmJXR+54EuDPRAeKkjeamRrM9si89qDs3TP3fkvV3+yS7Xnt+00eZ1EHkLgmP+7Y
 hAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gv1At7xomxbSkiHEMMp/MdVQGHl3xOeUcLOgVXl9jaM=;
 b=C8l4cR4V6kE3wXRwBi4bTjpkYw6OD7hYKJLreId9IOQpBRhL9TJu2uYbTRwXYCFJfq
 IUGwYpweO7+tOM/wEW9vUpWoX0iTBQHD664UYLTaw6RRFqHFXqdBm/BSAVNMaNTzwSnH
 ikm63oh9GPPN/HKkQ6U8sxc3Fk/NFeu8rsKnaTLb/+KQFMhugKl89iCOF8w0YdnVtNH4
 kJ7pT1ly2i7VyM86fXea2aAajW5BofVFtWry/uQus+U1iBllhf54JIz8lfny6LByARnb
 eg8OrgcBijPkcgjMgpUEdDvB7cdC7CW/uyif2IvYz3IXPNq5UkdYFskJiIRSZRVqA3R6
 MZYQ==
X-Gm-Message-State: AOAM532zDto/Bt02MDFVAmufn1Km5CB/3w/aSNgJtsHD6keJ6zLVSpUH
 IoWFXDNQALItH2zEtRYNvWjsMsP9S6RKQU+sSJo=
X-Google-Smtp-Source: ABdhPJyfSvzZi2vRzSnEZEjBLSS9LyzO6gG6U0zP8zFBEhZmoVNYvIwmuUBctF5HQlx29j1LFbs3SnGVTiMNfMgihp0=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr20695620pgn.4.1595877685130; 
 Mon, 27 Jul 2020 12:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VfmKvAy6bSk70g3c2qJcUzzo0AUhzxR6dFja+ZppGMLRg@mail.gmail.com>
 <20200727172936.661567-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200727172936.661567-1-vaibhavgupta40@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Jul 2020 22:21:08 +0300
Message-ID: <CAHp75VfdNJqviZgbsG5mQdFKVa_0Cu8nhT5L_hgKsgPB6gutoA@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] spi: spi-topcliff-pch: drop
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

On Mon, Jul 27, 2020 at 8:32 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> Before generic upgrade, both .suspend() and .resume() were invoking
> pci_enable_wake(pci_dev, PCI_D3hot, 0). Hence, disabling wakeup in both
> states. (Normal trend is .suspend() enables and .resume() disables the
> wakeup.)
>
> This was ambiguous and may be buggy. Instead of replicating the legacy
> behavior, drop the wakeup-disable call.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Thanks!

> Fixes: f185bcc77980 ("spi: spi-topcliff-pch: use generic power management")
> Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
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
