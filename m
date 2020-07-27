Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B55C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 17:52:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EC12070B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 17:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ex96dlh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9EC12070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9990D86216;
	Mon, 27 Jul 2020 17:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxVFhZzUu0yb; Mon, 27 Jul 2020 17:52:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 34AA785DC4;
	Mon, 27 Jul 2020 17:52:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C04BC0050;
	Mon, 27 Jul 2020 17:52:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5184CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4DA828826A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nM7qI-gbie0k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:52:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DFA008821F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 17:52:44 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id o1so8501276plk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 10:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4VCScZRbl2Kssf66LOgWwySs23Ntsbywsu3NL3678ak=;
 b=Ex96dlh+wuks3liR/urNzQZJVgLenPUAIj7Ed1wrcIQh6ZwCHVQwJ2OfuuZOzFxqhL
 KUXIQYhr54D4KMp98E456whL4BBIeMawzkY0ZuXWNmIZiQ3NLGtPNSdkCbK0FkkiE/lS
 Cqk1hdHNhLsbEasQS9o+Ccx8yqeiL0KL6LyMrF8ru3Ge2C9oVQTTqVYl5qdBTzd/r4sa
 TWRmgPzr8VpRUjVKGuvzlHs6a70Fb13VJBNCvtU4Dw6rRMWHuqQ4e8isJEIsWMekxPMk
 st9PA00EQAkiYyrF/kjpRLUIK/9+4FpG8oaJvHsshZu+cNRNCmVJCofG3XqNP5Rr732u
 wKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4VCScZRbl2Kssf66LOgWwySs23Ntsbywsu3NL3678ak=;
 b=PWyHJWb51XZ2GUir59HvBKxa/pOg2fH9BRStF7awh96UV6qnRksvxi/QO3dbIV/Loe
 IluDZ7dRIdwEoTdAymNXRrOtBZWm4iYyyXR/T1Dpor7uThkP1lfA2ZGIrTgSuo3rTREW
 r6E0G6FhfM0/X+pi16L+To8/pYHQc3eG/m6jxMgwMefQTrDV0akruy7CxRnrFDbO7i0S
 mt95cSceG66VgHa4ZfxI/Arn0OAvgSPGFcGIuOfh42lc60yMQBB2lqBfZ4WI6/VO5GyM
 O4jsLc09KU2QNLYTOiE4PtYqs84egsA160cWY6b3zP9mX48ct7V/8YbsU9pgOFj3pGnL
 wCMg==
X-Gm-Message-State: AOAM531KXtwUK7zSYUA/ACUSjrdFYVNwdmnik0iZZg+IrIqKLUh68NNz
 tSiaZqRK8fNXgY4wCASjssg=
X-Google-Smtp-Source: ABdhPJzXEawmCxeONFI1GIOymjqICePldjpplnxMQ4v/+pEqGBpLiU8WhBycr0UoEGLF+1a0IrFrlA==
X-Received: by 2002:a17:902:b412:: with SMTP id
 x18mr18885570plr.116.1595872364116; 
 Mon, 27 Jul 2020 10:52:44 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id bx18sm211489pjb.49.2020.07.27.10.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:52:43 -0700 (PDT)
Date: Mon, 27 Jul 2020 23:21:19 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200727175119.GA700880@gmail.com>
References: <20200727173923.694872-1-vaibhavgupta40@gmail.com>
 <20200727174012.GA696265@gmail.com>
 <2b4738b0-5c2c-8ee2-83f9-10b961a5d0d3@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b4738b0-5c2c-8ee2-83f9-10b961a5d0d3@kernel.dk>
Cc: linux-ide@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] ata: use generic power
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

On Mon, Jul 27, 2020 at 11:42:51AM -0600, Jens Axboe wrote:
> On 7/27/20 11:40 AM, Vaibhav Gupta wrote:
> > The patch is compile-tested only.
> 
> Please test and verify actual functionality, if you're serious about
> potentially getting this into the kernel.
>
Hello Jens,

Sadly I don't have the hardware. This upgrade is part of my Linux Kernel
Mentorship Program project. Like other PCI drivers which I have updated, I could
do compile-testing only. Though this patch covers 54 drivers but the actual
change is done only in drivers/ata/libata-core. Since rest of the drivers
make use of the same ata_pci_device_suspend/resume(), it was a chain reaction. I
only had to change variable binding in "struct pci_driver" variable of dependent
drivers.

Thanks
Vaibhav Gupta
> -- 
> Jens Axboe
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
