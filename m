Return-Path: <SRS0=kRYb=CI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED3FC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 08:45:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE7F020757
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 08:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORMYXf8J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE7F020757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B18F58786C;
	Sun, 30 Aug 2020 08:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WO9o1pWEDBvU; Sun, 30 Aug 2020 08:45:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FB7F877AE;
	Sun, 30 Aug 2020 08:45:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E91B1C088B;
	Sun, 30 Aug 2020 08:45:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCFA2C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 08:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C24D0850DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 08:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eC46AltQgRUz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 08:45:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B80EC850AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 08:45:41 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c15so1625591plq.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WiNxa0n81+ZmG4cSOgItga0yRmbWV7qQvdH+kZPT5Zw=;
 b=ORMYXf8J8DcCr6VrE8tPHN0P87U7mjxBxwuSSPS0uSxg5ZIBGj87x3uvD5mzCkY23K
 RuGaZvnTJSZR0K2gOEOvZ87gte8SEXVQmnrj077dvAVDe3evxO54+TetRHOwVHVgqCal
 Qt3bRmkj18czte1kxYkQhjnkMaQPdFaInMorDABRT1nPum4gm2v8d1cIowTi9+f4PHCN
 6PuIKQUa9PSmReHnB8OZ+tsxQvWw+Pdvq1pTJssvcnK3EndqoS1ygi2blKO0NHsHPkB+
 H8C9gMo1JrUTXFSluG+9WrgsrG6BTNiJDqrLGm0Y++EvRk8bx7utZ14sETASpxvLj4a1
 YKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WiNxa0n81+ZmG4cSOgItga0yRmbWV7qQvdH+kZPT5Zw=;
 b=sEuaXYEYCdYdvjPrSzG4V1l3SIdk4mrduR0XaVaiQcv5eQtFEpYTx/K4OPkiMeZOVk
 x2vYpJZMv5SRWHC5cHNtY5xgTEHvmfiDO1nx7HWl+tyC8Kkelf2x7ZiNrRKzN2lCvmSH
 Lh9Q1tVUoh4iR8eK3ZfdJCpjLkIDTuLs59eBA6yOVZBCAStSetpQ96Cs9wMl/bSGqoeT
 IzrnzoR8TuyGPcHrcedHtJGdtNp5n1SXhS6JwVyJUlwBNbrkishVGgYrj1oFc71wqYxH
 plXk39OPCBHxF7qBlch1gKU1x2KX7FQ2kyCdoy1zCFZTb0zhSfVimAzgIuFkUoA21HYR
 C4ZQ==
X-Gm-Message-State: AOAM530EFFI9VHSpBO198EOqFWSdrt1YNNhEz38xV6LtsWJuGyjn4Orz
 rqSp7SaRr8/+haSDasqb9mc=
X-Google-Smtp-Source: ABdhPJzAgEHS4pusVSjIwBTzKwOuJcgaNfkZ71b4tA+812jXiQ7jGMMAa3JLcZErzB5uKqx1ChRjNA==
X-Received: by 2002:a17:902:7582:: with SMTP id
 j2mr5042928pll.322.1598777141185; 
 Sun, 30 Aug 2020 01:45:41 -0700 (PDT)
Received: from gmail.com ([223.190.108.199])
 by smtp.gmail.com with ESMTPSA id g5sm3741903pjx.53.2020.08.30.01.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 01:45:40 -0700 (PDT)
Date: Sun, 30 Aug 2020 14:13:52 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sean Young <sean@mess.org>
Message-ID: <20200830084352.GA36870@gmail.com>
References: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
 <20200830081004.GA17376@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200830081004.GA17376@gofer.mess.org>
Cc: Abylay Ospan <aospan@netup.ru>, Sergey Kozlov <serjk@netup.ru>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] [media] netup_unidvb: use
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

On Sun, Aug 30, 2020 at 09:10:04AM +0100, Sean Young wrote:
> On Tue, Jul 28, 2020 at 02:57:17PM +0530, Vaibhav Gupta wrote:
> > The .suspend() and .resume() callbacks are not defined for this driver.
> > Still, their power management structure follows the legacy framework. To
> > bring it under the generic framework, simply remove the binding of
> > callbacks from "struct pci_driver".
> 
> Unlisted fields in a static struct initializer will get set to 0 (or NULL
> for pointers) already. Removing the NULL initializers will not change
> anything.
> 
> Possibly you want to remove the redundant initializers but your commit
> message should say so.
> 
> 
> Sean
> 
Hello Sean,

Yes, you are right. I mentioned a general commit message. I will send a v2 with
suggested changes.

Thank you
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
