Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDADDC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 15:17:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9668B206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 15:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdQ0zl1w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9668B206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6226F88528;
	Fri, 24 Jul 2020 15:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qe6EPZc3Z4Nu; Fri, 24 Jul 2020 15:17:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDD1E8851A;
	Fri, 24 Jul 2020 15:17:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9C96C004D;
	Fri, 24 Jul 2020 15:17:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB2F7C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 15:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D728785683
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 15:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAi8NI1nzsif
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 15:17:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 56BF285109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 15:17:24 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d1so4591052plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HUROjGo9h0QzPmA8W6RC42jkLEEb02wgdrCu4KyC3eQ=;
 b=QdQ0zl1wnw3H/JKPangxnKC11AjASvBxZZMsKId7lwLQ0A8nihM3y0ieEVvXrT8kY8
 nd+1fFqNjs1ENzcCdxqkka04SkG+Eyr1L3yXxoQKDkdx3u9r0WHNbW8uELDk7QEgxLrB
 2dhVCq2Jp16khl1lQ+ehugu0megd6Fx0YlL7ddeke/HIzjE6pWP2eG9Q1AN7s1KgV/Gg
 DY7Xs1PYyfOnqmQ9H8U1P2RgrB6rAH193ZrqfioIKMFZ7a1g7AyuHspvrCxT02aDwSzz
 pcYMBfLF2OMfWVFHtIQ0LOy5nC3RXgG8/3Ff7uftIsU6+cMoxREIPxU9HQawqZFyUEPJ
 7WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HUROjGo9h0QzPmA8W6RC42jkLEEb02wgdrCu4KyC3eQ=;
 b=dYzPijxISdUt1o4Ffb+zmLnqVV8YSvh+Mseo4VwRYTOpn9I3BNYgKmgpTozvhqrsAD
 uESdwvVcKlR0y52pyaRELCm4sdd5/mASruKPyw8m5PiSVaoW+FKyctRhFmW5eSGnh7vM
 ro8wP9JwxLSVch/W8+sn7tHRv987Gq8/PRljvj0cZBvZEWPeWqlHUA9BmQldnywofVoC
 MWF+XZ7uBRF+NRdZp2axDKH1HYX/AsvvZ49466bgcC/WjQvLZZgkXT2cj7pprok0k8ly
 aMqrMhaFAGsyCcqJoquHrVxDqLSXuOfon8dcEUbk+tWqvbGJ7DWWhbugonAacDG61avM
 g6MQ==
X-Gm-Message-State: AOAM532mgDl8umgZVvzi7FMMm/aT65NK1OCNE9+9pD/vrHN0u/8cbdwL
 ZG+d/ldbbFJN9XP597Jht64=
X-Google-Smtp-Source: ABdhPJwLwZPCwLH/Vq4Ur1Dg/VbJQuvtBuiU2evxy0VSK8+5L4tI0fouUwBZG0eWsbnKGuDz8zgB6Q==
X-Received: by 2002:a17:90b:19d4:: with SMTP id
 nm20mr6352197pjb.206.1595603843811; 
 Fri, 24 Jul 2020 08:17:23 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id m6sm6728647pjb.34.2020.07.24.08.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 08:17:23 -0700 (PDT)
Date: Fri, 24 Jul 2020 20:46:01 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200724151601.GA3642@gmail.com>
References: <20200720155714.714114-1-vaibhavgupta40@gmail.com>
 <CAHp75Vdh-ssrmGgTc=gE9dWLhWDAw7_QHJKFeWKHpO-JqBdsEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vdh-ssrmGgTc=gE9dWLhWDAw7_QHJKFeWKHpO-JqBdsEA@mail.gmail.com>
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

On Fri, Jul 24, 2020 at 01:51:49PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 20, 2020 at 7:31 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > Drivers using legacy PM have to manage PCI states and device's PM states
> > themselves. They also need to take care of configuration registers.
> >
> > With improved and powerful support of generic PM, PCI Core takes care of
> > above mentioned, device-independent, jobs.
> >
> > This driver makes use of PCI helper functions like
> > pci_save/restore_state(), pci_enable/disable_device(), pci_enable_wake()
> > and pci_set_power_state() to do required operations. In generic mode, they
> > are no longer needed.
> >
> > Change function parameter in both .suspend() and .resume() to
> > "struct device*" type. Use dev_get_drvdata() to get drv data.
> 
> > Compile-tested only.
> 
> Yeah...
> 
> ...
> 
> > +static int __maybe_unused pch_spi_suspend(struct device *dev)
> >  {
> > +       struct pch_pd_dev_save *pd_dev_save = dev_get_drvdata(dev);
> >
> > +       dev_dbg(dev, "%s ENTRY\n", __func__);
> >
> >         pd_dev_save->board_dat->suspend_sts = true;
> >
> > +       return 0;
> >  }
> >
> > +static int __maybe_unused pch_spi_resume(struct device *dev)
> >  {
> > +       struct pch_pd_dev_save *pd_dev_save = dev_get_drvdata(dev);
> >
> > +       dev_dbg(dev, "%s ENTRY\n", __func__);
> >
> 
> > +       device_wakeup_disable(dev);
> 
> Here I left a result. Care to explain (and perhaps send a follow up
> fix) where is the counterpart to this call?
> 
Hello Andy,
I didn't quite understand what you are trying to point at. And the result part.

Yes, it seem I forgot to put device_wakeup_disable() in .suspend() when I
removed pci_enable_wake(pdev, PCI_D3hot, 0); from there. It doesn't seem that
.suspend() wants to enable-wake the device as the bool value passed to
pci_enable_wake() is zero.

Am I missing something else?

Thanks
Vaibhav Gupta
> > +       /* set suspend status to false */
> > +       pd_dev_save->board_dat->suspend_sts = false;
> 
> > +       return 0;
> >  }
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
