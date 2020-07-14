Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F27C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 07:55:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D123F217A0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 07:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gge+R7Cg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D123F217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A730489551;
	Tue, 14 Jul 2020 07:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JP9H-RCGT6gd; Tue, 14 Jul 2020 07:55:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2747E8954B;
	Tue, 14 Jul 2020 07:55:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FD2CC0891;
	Tue, 14 Jul 2020 07:55:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E05B5C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CF6FE8954E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqwB2a6S2lFc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:55:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 37DF88954B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:55:27 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p1so6694551pls.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fr0V53mp8gct+D0reFrcGwuhnT+2GL17XE1iCQ4XpVI=;
 b=Gge+R7Cg1yjg9iL0BE17WXm/g57Pn9HkIqT9YWBxp3KwEuFAuIKRHcUTDBv+cfSrw/
 TCX4qy6GgGFW2X9szsU0k0gIVmtwIttwLGTU6F41pDjCbQ+iHoVmKCvafswEIUVV8XBf
 hSQ7d8lx6G6vhNG77N2nhuI5T8zrVnxRUK3z5buqAlloqXOX++ivVBoemEt5Mdx36fwP
 ZnWJKqbOBv5Ixlv5VVRMpYoNoA/OnZEStGi+wSU1eKMGCFWhp1IvmXseHBMiVq9Xnab9
 yKUeYIUckh1drup9zfAUbZw4/tW+VBxl3B3N2Am7QgSV1XZvaW+1tN+ZnK7NKCzowEkL
 dR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fr0V53mp8gct+D0reFrcGwuhnT+2GL17XE1iCQ4XpVI=;
 b=PnR4kFRjCpbMBgdUCIzCyScEjjTEFd61YK8W9xb6Y5o/tjP0dyj707Vw75BVMHh3/D
 PrqixpAUIlzw+uob17Xqn8zHbue2WCbpPRwvfg5W2RYJwcwhue6ObcjR/QSniz3nbPou
 8Tk+/DN9GH4wMO3/Zq+bfUGvnUU/ast0Tfz+fWr+fZ5k8SnTO7AeYx9AmI2ILT4n29nn
 qBG6pWG7rgMyAYgciGyRIhCCtce6/3+yTlj5DSh/YVomjVPDEspJH+dAVsatwDyIA9HS
 xiSYV9KY4RMSxZbi8DkK8SPgtUnFqJfS2Kaidv528mgHrroDh297eISpoP8fE4tkZ5H0
 /mSQ==
X-Gm-Message-State: AOAM533TY1Od0mNu9W+r5hNfyy61FvYnBTsg/swaF4R21XmTT5folAFp
 U+4KYzQ1swCPE1AYUHeX20o=
X-Google-Smtp-Source: ABdhPJzYDyYtVsFITfsqj3tmWGRYr2P9068LqybFQZ8fMOdrTVGKRYAQj1kQKJCIXWH+Eqx1bL7jEQ==
X-Received: by 2002:a17:90a:c794:: with SMTP id
 gn20mr3174778pjb.114.1594713326762; 
 Tue, 14 Jul 2020 00:55:26 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id p19sm15100868pgj.74.2020.07.14.00.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 00:55:26 -0700 (PDT)
Date: Tue, 14 Jul 2020 13:22:47 +0530
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <20200714075247.GA4859@gmail.com>
References: <20200713173613.2095-1-vaibhavgupta40@gmail.com>
 <CGME20200714073256eucas1p13ebe9585c29b766e48506400ba91a8ed@eucas1p1.samsung.com>
 <3b26bfff-7a42-7bbe-2050-51fe1ce96d4e@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b26bfff-7a42-7bbe-2050-51fe1ce96d4e@samsung.com>
Cc: linux-ide@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 0/3] drivers: ide: use generic
	power management
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

On Tue, Jul 14, 2020 at 09:32:56AM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On 7/13/20 7:36 PM, Vaibhav Gupta wrote:
> > Linux Kernel Mentee: Remove Legacy Power Management.
> > 
> > The purpose of this patch series is to remove legacy power management callbacks
> > from ide drivers.
> > 
> > The suspend() and resume() callbacks operations are still invoking
> > pci_save/restore_state(), pci_set_power_state(), pci_enable/disable_state(),
> > etc. and handling the power management themselves, which is not recommended.
> > 
> > The conversion requires the removal of the those function calls and change the
> > callback definition accordingly and make use of dev_pm_ops structure.
> 
> IDE subsystem (drivers/ide/) is deprecated and has been superseded by libata
> subsystem (drivers/ata/).
> 
> libata drivers have the same issue so please concentrate on fixing them
> first. Later (if desirable) changes can be back-ported to drivers/ide/.
>
Hello, (drivers/ide) and (drivers/ata) are the two major families, I am working
on, for generic PM upgradation. I was bit unaware about priority, and also in
the last, both ide and ata drivers have to be upgraded.
> > All patches are compile-tested only.
> 
> This patchset needs (at least) some basic testing. It should be easier with
> libata subsystem as it also support SATA controllers and devices.
To upgrade PM in (drivers/ide) I have made .suspend() and .resume() static. Then
bind them in "struct dev_pm_ops" variable (ide_pci_pm_ops) and expose it using
EXPORT_SYMBOL_GPL(). This has affected 30 drivers. I was hoping if ide changes
can be tested/verified, specially [PATCH 1/3]. As then, I will be sure about
similar change in ata, as it also requires similar alteration.

Thanks
Vaibhav Gupta

> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> > v3:
> >     - Modpost error for undefined reference by Kbuild in v1.
> >     - Another approach to disable PM in drivers/ide/triflex.c suggested by
> >       Bjorn Helgaas in v2.
> > 
> > Test tools:
> >     - Compiler: gcc (GCC) 10.1.0
> >     - allmodconfig build: make -j$(nproc) W=1 all
> > 
> > Vaibhav Gupta (3):
> >   ide: use generic power management
> >   ide: sc1200: use generic power management
> >   ide: delkin_cb: use generic power management
> > 
> >  drivers/ide/aec62xx.c         |  3 +--
> >  drivers/ide/alim15x3.c        |  3 +--
> >  drivers/ide/amd74xx.c         |  3 +--
> >  drivers/ide/atiixp.c          |  3 +--
> >  drivers/ide/cmd64x.c          |  3 +--
> >  drivers/ide/cs5520.c          |  3 +--
> >  drivers/ide/cs5530.c          |  3 +--
> >  drivers/ide/cs5535.c          |  3 +--
> >  drivers/ide/cs5536.c          |  3 +--
> >  drivers/ide/cy82c693.c        |  3 +--
> >  drivers/ide/delkin_cb.c       | 32 +++++---------------------
> >  drivers/ide/hpt366.c          |  3 +--
> >  drivers/ide/ide-pci-generic.c |  3 +--
> >  drivers/ide/it8172.c          |  3 +--
> >  drivers/ide/it8213.c          |  3 +--
> >  drivers/ide/it821x.c          |  3 +--
> >  drivers/ide/jmicron.c         |  3 +--
> >  drivers/ide/ns87415.c         |  3 +--
> >  drivers/ide/opti621.c         |  3 +--
> >  drivers/ide/pdc202xx_new.c    |  3 +--
> >  drivers/ide/pdc202xx_old.c    |  3 +--
> >  drivers/ide/piix.c            |  3 +--
> >  drivers/ide/sc1200.c          | 43 ++++++++++++-----------------------
> >  drivers/ide/serverworks.c     |  3 +--
> >  drivers/ide/setup-pci.c       | 29 +++++------------------
> >  drivers/ide/siimage.c         |  3 +--
> >  drivers/ide/sis5513.c         |  3 +--
> >  drivers/ide/sl82c105.c        |  3 +--
> >  drivers/ide/slc90e66.c        |  3 +--
> >  drivers/ide/triflex.c         | 24 +++++++------------
> >  drivers/ide/via82cxxx.c       |  3 +--
> >  include/linux/ide.h           |  8 +------
> >  32 files changed, 62 insertions(+), 155 deletions(-)
> > 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
