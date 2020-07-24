Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE4C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 20:17:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D39D206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 20:17:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1tD4DN5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D39D206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35BAD88AD3;
	Fri, 24 Jul 2020 20:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cHKghdWXZ2AA; Fri, 24 Jul 2020 20:17:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6F4188AC5;
	Fri, 24 Jul 2020 20:17:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99DD7C004E;
	Fri, 24 Jul 2020 20:17:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E57BC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 20:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 346F7228D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 20:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMC+6rj4RASU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 20:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 3BC2820336
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 20:17:13 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x8so5154400plm.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 13:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7mKCbM5fDDFwgjqPiF3ijFcse991Sj2a3LfByPXLuII=;
 b=Y1tD4DN5yNl68XSvLYmxs49j7aiN49qTyojf5OPc4Kw+MRCZfCt6UtBSWOlB678W1M
 BKqnYzdnHUIxaCvMtOy4wR0cwDOduZusruODItl/nbNcNhlVrWx/swEzgEXHePVXVbWe
 rUEdjZT4vuYtB1vjXCmV5i6xWPlDyoR7/VP3PTRQYVYl8pQtc7GhXQ4BU6lNGJn+wZ5P
 AVY2CuUl+Z+Om8n6hSqVgIkZjcqXk1FMzIJylM4ZOQryxgLHByB+gyU2P97Z0Qc72zjJ
 5xI94kpV5S9p8LyDSBhr0c1oWvsNjx299v8mCyyIHFvghoV86nL3xhxPvfI13BVBDcQ6
 kwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7mKCbM5fDDFwgjqPiF3ijFcse991Sj2a3LfByPXLuII=;
 b=Mo4aj1lQbArWpbSMUqVLM1T9qXM5nGDOXi7T7+ffkxYU/PF9gbZGZbLBelULVuyrxx
 0I78GnN59Rz/uuDdM8VN6N25QxmfnVeSe0z/kyy5UW5x5v7TkFn4xZg62+8YMXrXpQvp
 Gsu2vSbgWbqc+WVOqvwMKBBZ/DfYTYQJUFlENBssycOsDeDfB6smmYgXzd1JnQ3xp/k9
 Gy57QE9pH2qErY6z35YcRsHFiTYbCN140HIvXQV+2p424YV/7gGOrKOWJBJxACqgClGq
 qOV7gvkgnkm3uXgQEwn8ZM5ZS6qcK6j/GxwRcfMfElS6cq7OQE0q4Nz1No17fkKoniMQ
 AXiA==
X-Gm-Message-State: AOAM530X0OKOXs3Un+DSKIveCLj9sYndlP2WiJlRH1sYe3m8zfJlnUA1
 lFI7h5VREfgHbh9iWJzFh2/QqvG++wHBGvRKwg8=
X-Google-Smtp-Source: ABdhPJyzOcJVavQbz8ez8GRBp/8SZ6nGygrW2abBhG+FnsSghwmrIRwfvQv84dmxy4goBWr4MTJQYcRXQ0DCXsjAqE8=
X-Received: by 2002:a17:90a:498b:: with SMTP id
 d11mr7409909pjh.129.1595621832763; 
 Fri, 24 Jul 2020 13:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200720155714.714114-1-vaibhavgupta40@gmail.com>
 <CAHp75Vdh-ssrmGgTc=gE9dWLhWDAw7_QHJKFeWKHpO-JqBdsEA@mail.gmail.com>
 <20200724151601.GA3642@gmail.com>
In-Reply-To: <20200724151601.GA3642@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 24 Jul 2020 23:16:55 +0300
Message-ID: <CAHp75Vdo22ofbCktupFYbfYy6PQ609fsk5B6u2b3FpfKxs8OQg@mail.gmail.com>
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

On Fri, Jul 24, 2020 at 6:17 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> On Fri, Jul 24, 2020 at 01:51:49PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 20, 2020 at 7:31 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:

...

> > > +       device_wakeup_disable(dev);
> >
> > Here I left a result. Care to explain (and perhaps send a follow up
> > fix) where is the counterpart to this call?
> >
> Hello Andy,
> I didn't quite understand what you are trying to point at. And the result part.

I emphasized the line by surrounding it with two blank lines followed
by my comment.

> Yes, it seem I forgot to put device_wakeup_disable() in .suspend() when I
> removed pci_enable_wake(pdev, PCI_D3hot, 0); from there. It doesn't seem that
> .suspend() wants to enable-wake the device as the bool value passed to
> pci_enable_wake() is zero.

> Am I missing something else?

At least above. Either you need to drop the current call, or explain
how it works.
Since you have no hardware to test, I would rather ask to drop an
extra call or revert the change.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
