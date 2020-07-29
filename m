Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DDCC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 10:19:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 711662074B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 10:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrzqBECN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 711662074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3754E22E3F;
	Wed, 29 Jul 2020 10:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StoCu9YOK4Vm; Wed, 29 Jul 2020 10:19:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 059F922DB0;
	Wed, 29 Jul 2020 10:19:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5A97C004F;
	Wed, 29 Jul 2020 10:19:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95CEBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 10:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8332187D35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 10:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X92miM5gGJ3q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 10:18:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 77A0787D0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 10:18:58 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id lx9so1827027pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b4/21bXCudODfIY795t0rfeU7nBNchzrSSbcv04ppHA=;
 b=mrzqBECNYxJ7HgA62RBVbpwWRQUzqC6n9dMdDRaJkvrW9MtnP7bQ12a5YTj5Dpb47B
 oWVhfQ19xVeA/NijTmRyy6OrqFd7tWyEuxuwQ4rYUo8B3TuX6Ib93+/cBeSZTtB2m2b+
 mTzEQ4WH61JPeYzNB52dhyOlk1Bf/QSz+jAEUTFIsYWNHcES+pmJVcgJa5xNVF23XwL+
 jHW6A5MwIenK6b9+aBjz78pMePBdJkUlO1ReBAJE3OFfHjp0c8sDvPeGvND2on/f67Up
 lxey/ZcEFLtvoH8LPgQRYb3QorLMiFZo2b9ahI7Xav6Ofg0nKnCkxyr2AUZ2aGXRxEvK
 Gy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b4/21bXCudODfIY795t0rfeU7nBNchzrSSbcv04ppHA=;
 b=tK5WtfdtRP9Fn00z3MomqGB0OlYT23Th8hdecBIBfmcG4hkDzsF0CcWPLb6uKH1ZG6
 DAUYdOehCyB4l7K9JqlUaThBXdMeFZ7zBiQqiPGr4n+V3joS7N27dv6u9eRVXIQCtCpx
 W+T2KpR54FZfYe9L4M/VRGiyxjdWvTb1l07NX6sWcovXzxvBFJcZJLdMvrRL1xPzKz3F
 u8Ucw5mnPjApY333DPmFKcwfgQekr1KhneU3DXRbOLlWSfWv75NghEzmqON/9LfeknHL
 /v69/orBeTHQmNf17dlVtwX334bFoiVjOv+wnA+gCcd0EIzE/u/TzQOexVs7gXB8L9ph
 dNpw==
X-Gm-Message-State: AOAM532BgYbWpkuHcokx1AdIF7gEROfZjEc754q31Oa0QZakM8k1eBzP
 1Yb5rtjPNMu63DpN54yeI+8=
X-Google-Smtp-Source: ABdhPJw33dMoDVdSQ9nMnOoTWSXV4jmIgUS6olXEqFCUVr9ezYF9SmQWFQ/Qz0pl0lXb+VUZD0FMjQ==
X-Received: by 2002:a17:90b:4c51:: with SMTP id
 np17mr8719522pjb.91.1596017937931; 
 Wed, 29 Jul 2020 03:18:57 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id e124sm1713290pfe.176.2020.07.29.03.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 03:18:57 -0700 (PDT)
Date: Wed, 29 Jul 2020 15:47:30 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20200729101730.GA215923@gmail.com>
References: <20200728042809.91436-1-vaibhavgupta40@gmail.com>
 <20200728200413.GA1857901@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728200413.GA1857901@bjorn-Precision-5520>
Cc: linux-kernel@vger.kernel.org, Kevin Curtis <kevin.curtis@farsite.co.uk>,
 netdev@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] farsync: use generic power
	management
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

On Tue, Jul 28, 2020 at 03:04:13PM -0500, Bjorn Helgaas wrote:
> On Tue, Jul 28, 2020 at 09:58:10AM +0530, Vaibhav Gupta wrote:
> > The .suspend() and .resume() callbacks are not defined for this driver.
> > Still, their power management structure follows the legacy framework. To
> > bring it under the generic framework, simply remove the binding of
> > callbacks from "struct pci_driver".
> 
> FWIW, this commit log is slightly misleading because .suspend and
> .resume are NULL by default, so this patch actually is a complete
> no-op as far as code generation is concerned.
> 
> This change is worthwhile because it simplifies the code a little, but
> it doesn't convert the driver from legacy to generic power management.
> This driver doesn't supply a .pm structure, so it doesn't seem to do
> *any* power management.
> 
Agreed. Actually, as their presence only causes PCI core to call
pci_legacy_suspend/resume() for them, I thought that after removing the binding
from "struct pci_driver", this driver qualifies to be grouped under genric
framework, so used "use generic power management" for the heading.

I should have written "remove legacy bindning".

But David has applied the patch, should I send a v2 or fix to update message?

Thanks
Vaibhav Gupta
> > Change code indentation from space to tab in "struct pci_driver".
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
