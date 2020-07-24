Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B39C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 10:52:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DF1E2073E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 10:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="II5Iwnr4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DF1E2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3E6C82283C;
	Fri, 24 Jul 2020 10:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lGstMa6ASZR; Fri, 24 Jul 2020 10:52:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A1112037E;
	Fri, 24 Jul 2020 10:52:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51FDFC004E;
	Fri, 24 Jul 2020 10:52:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BD15C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 10:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3E2C32037E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CoCtqPeO-qvr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 10:52:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 7543C2036C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 10:52:06 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id o22so5032925pjw.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7f5a4rInq/BtPtGpwaCTr+PuPIYpCg1fDihs8uppVIo=;
 b=II5Iwnr42FE3kJ4/53jooEX/7C2SypD7NhJwWPQOTQ94teQ3uJfjfo4A0wijzqrwGJ
 f6KIgaAIMJLTuyibmpxUlz+SOKINfzcWLugzuXQWSkbVPVIcHp7oz1f2Hao0jen547kj
 w6XStvT2KWFSwmhMVSh2Ks1Agkb4QF0WyMFNsORoHiPgRUVEBGIceqHjCpYYadjnWN0/
 vgSd15vOxAJusmRG9oLBONO6GHIvU5Yc2dsHPdaIWOgSsfrJO4lUNbUqPTbuZbzj9b1b
 NWEMHerEOhn2AJtRUvLg3HI60Citf4bahsPQgfaXhHsm/7BqZSrNyD0pS0td4o9L0Y2A
 T2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7f5a4rInq/BtPtGpwaCTr+PuPIYpCg1fDihs8uppVIo=;
 b=EfIYwiOpNT1De0RH7TCMGh4T5l9UdzcDXYAmFZTogcEVRsA7ldC4UkfGOR593ySQk8
 5tV1BMwd+fwsM+9WLT5Zryf6aD6XFYElbELzDruauvfz5zcCtECulNB/H08jbrsAhdHj
 kEVvqLUFyZo0/GlpFv3+Q0t2Te3rdfwQQkGtDUj+y894Q/qMMsqfW91wm1UjxT1KNhf4
 pfkhf1OcT5tY5njoBC+oloA3/Vkhw329AWO8HFlYTNPIuNc8h14FGbYSarLdIGe4W7w3
 K/aI7B3ohnXli/I6Nq6z8IeQYLG2dW0IVo1u/bAyd/y1ViAJgjYdJtyQQrkkLNuOp1pE
 gxFg==
X-Gm-Message-State: AOAM530EVaOLPhuLMwTiOLfpkHMotp+u7R+VTovmqV/1gvPFoxmI+Cj6
 IVrNYlyGEdS0Wb/KwIXEOIqNEZaYZsZypkgvHSc=
X-Google-Smtp-Source: ABdhPJz8LrBxYW2OqSs/hx2X9HhDzRwSse6TRUnaNtTwquxh6eX4lrWDsN0j3dbu6m2pOgOcdMEJ/ghZRx3+aNuXMeM=
X-Received: by 2002:a17:902:b098:: with SMTP id
 p24mr7899509plr.18.1595587925982; 
 Fri, 24 Jul 2020 03:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200720155714.714114-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200720155714.714114-1-vaibhavgupta40@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 24 Jul 2020 13:51:49 +0300
Message-ID: <CAHp75Vdh-ssrmGgTc=gE9dWLhWDAw7_QHJKFeWKHpO-JqBdsEA@mail.gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] spi: spi-topcliff-pch: use
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

On Mon, Jul 20, 2020 at 7:31 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
>
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
>
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
>
> This driver makes use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(), pci_enable_wake()
> and pci_set_power_state() to do required operations. In generic mode, they
> are no longer needed.
>
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use dev_get_drvdata() to get drv data.

> Compile-tested only.

Yeah...

...

> +static int __maybe_unused pch_spi_suspend(struct device *dev)
>  {
> +       struct pch_pd_dev_save *pd_dev_save = dev_get_drvdata(dev);
>
> +       dev_dbg(dev, "%s ENTRY\n", __func__);
>
>         pd_dev_save->board_dat->suspend_sts = true;
>
> +       return 0;
>  }
>
> +static int __maybe_unused pch_spi_resume(struct device *dev)
>  {
> +       struct pch_pd_dev_save *pd_dev_save = dev_get_drvdata(dev);
>
> +       dev_dbg(dev, "%s ENTRY\n", __func__);
>

> +       device_wakeup_disable(dev);

Here I left a result. Care to explain (and perhaps send a follow up
fix) where is the counterpart to this call?

> +       /* set suspend status to false */
> +       pd_dev_save->board_dat->suspend_sts = false;

> +       return 0;
>  }


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
