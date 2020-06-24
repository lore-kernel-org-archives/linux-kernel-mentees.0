Return-Path: <SRS0=qUvW=AF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ABBC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 16:35:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177222082F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Jun 2020 16:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqqTFVJx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 177222082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13359862CA;
	Wed, 24 Jun 2020 16:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdUIJQlxTMSM; Wed, 24 Jun 2020 16:35:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B382685F92;
	Wed, 24 Jun 2020 16:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D4B6C0888;
	Wed, 24 Jun 2020 16:35:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 712E2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5E4EF85F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 16:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTNUqVPN6mM0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 16:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DEA9685F84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 16:35:04 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id b13so2624476ilq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Jun 2020 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+I6y3pNtuMWnbkqUpxbZvfr8752FW4gM6Qr1fXSaUd0=;
 b=NqqTFVJxUER0fAvaPENWhsQbrhd+xhCRvVEPR29e58YecyfMxJEOioJioJJLa7UswL
 ttuFSXvuIRR2BdbqtXI3BT1kOGF6cnyFO9VX5yZBJzqllS9+g7pI5YAvn273rL8IdVa9
 nqsa9/XCaMmS4s+hrAXa+QkOjmLKV2gsq9i3Z3WFctGZ+KLGpKNxoRQW3zpplmSo2l2K
 WnqLW/FyaVBTmqGofjKkj8OMTwQJsMuLuo6Mfn1sqT/pGfQtI57dipiDIyIJ6f9yrnB8
 bW1YjDY1VBL881IjAWqTlhRsz36C4qU2XW7yDzDCmqKoLZoL0aFVXpO/BI20DfPlwIeK
 gHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+I6y3pNtuMWnbkqUpxbZvfr8752FW4gM6Qr1fXSaUd0=;
 b=aCJeVsUKwnMeKhcagzpzFG4dhMEao3djiQJyM1Bjhn7gmrXyKoBHOpdxGJ60Fb+yRD
 g+kprT6UkOwvRhDFZWBCD4NQg9bbe4CYfjf6oMhTjIOe4Tbw9Gn44nlFVn4mgX/7p+1M
 2KXWG9vRXbMnEwIDqRpmEPu7tGnuDWLIczJZgUdSPSpNNSfXa8fH71l/2XV5Qy5ONlb+
 ytirrEpqGK7eNFvfByN2EUkF3KbAbo5+NRj0GrEUF9xDNXNYikhnIPiRamAqDYEaTsD3
 aKrA0xdNYhTVxENm8YsK684+I0CsAR14PEqp9RJb559GY5zzYV+sK6+wBA1xQIH23fl5
 Kp5Q==
X-Gm-Message-State: AOAM531kdECbez2SxH177Bn0nUfbtVK4epIvSSoFEZ0RP1Xo7l5FQnAe
 nSzFV9+Uwt3T8clJWsFtkZ8YCZ6XmWCgw14ICiA=
X-Google-Smtp-Source: ABdhPJzLDUekT+GvWZk7aV7tM9rY3U1EqQBwUoHTgmVZz36JFNQs3+g2dME/8Tm7Ik21rOrCpUjvuaHZecG9XEwnmcY=
X-Received: by 2002:a92:4a04:: with SMTP id m4mr31018680ilf.228.1593016504266; 
 Wed, 24 Jun 2020 09:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200622111400.55956-1-vaibhavgupta40@gmail.com>
 <20200623.203131.1093463627031337018.davem@davemloft.net>
In-Reply-To: <20200623.203131.1093463627031337018.davem@davemloft.net>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 24 Jun 2020 22:03:30 +0530
Message-ID: <CAPBsFfBCd9+JWji1DeHHtOrpTMTeN5Zk4iQXWM6MRrRJ40ns9w@mail.gmail.com>
To: David Miller <davem@davemloft.net>
Cc: thomas.lendacky@amd.com, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, pcnet32@frontier.com,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 0/3] ethernet: amd: Convert to
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

On Wed, 24 Jun 2020 at 09:01, David Miller <davem@davemloft.net> wrote:
>
> From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Date: Mon, 22 Jun 2020 16:43:57 +0530
>
> > Linux Kernel Mentee: Remove Legacy Power Management.
> >
> > The purpose of this patch series is to remove legacy power management callbacks
> > from amd ethernet drivers.
> >
> > The callbacks performing suspend() and resume() operations are still calling
> > pci_save_state(), pci_set_power_state(), etc. and handling the power management
> > themselves, which is not recommended.
> >
> > The conversion requires the removal of the those function calls and change the
> > callback definition accordingly and make use of dev_pm_ops structure.
> >
> > All patches are compile-tested only.
>
> Series applied
Thank You !
-- Vaibhav Gupta
> , thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
