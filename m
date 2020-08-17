Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672BBC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:57:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342E72072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 07:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eX/IqmDg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342E72072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F3F5F85D08;
	Mon, 17 Aug 2020 07:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zShfXUeE81_o; Mon, 17 Aug 2020 07:57:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F05485CAA;
	Mon, 17 Aug 2020 07:57:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 289B3C07FF;
	Mon, 17 Aug 2020 07:57:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AAEEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 76BDC88127
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTRoHV+BOiic
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:57:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 06FE187ECB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:57:40 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id h12so7728620pgm.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 00:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sgcMEmFz5a7sMCTpSzKDmtRdo2JPO50vEmzZ5iT3c5k=;
 b=eX/IqmDgBKGkWhzJxWQru9Re5WUxDkYOOsxDFIY4SDAUKS+qA86iTJZZyjGKHfpDeM
 Q1gQyQxKZXZq7ZnW/rMG2BbQ5eNZ1LmrifcBbG4wwgdbDTZWPBXO8tjhKF6YDhtR71dr
 imypRoL2U9ri9esTtELWOWVSh28wV/JYzGam1CcNZHfpI0+DqO3pxOFXTc4uHQcAb0gF
 69okLt6klykESSxmvVFW1KWlw3ON6FrLXN7xeKT4iaxLIHe5sMiX+P0+HbtrGlczRkQa
 cwmUqgcMNbHSgwk7v1qCLQebZzoIJTtsoNmtq9r78fvh9imeuwgxR1PJynrU9N1Hf0s6
 ew6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sgcMEmFz5a7sMCTpSzKDmtRdo2JPO50vEmzZ5iT3c5k=;
 b=Ide8euxAWi9aykOxPIJ7VFlvymEXHwVkzavoz7mhIhVipIBCWtFXklpudJTzRLGuMC
 Y2DglRKu+0KJjIp1x/F5+C2b9g+9A2v5tbqMEB//IS0Yz8JMJZG4ld1ydUKCSx3RMl84
 IkIHtX6XhcVM3via+AAH3x2KO4j83kujEpnwqqKCXoDwGCclEP1nQ3EZwzRI7ZS5Fm1P
 Tzedc/5ISCokzQ+yakFwr0Xa4uhTuex8hw01Gc48cBI59xrZ0CuwdY3A98kSObMrzya5
 aO7Znl4kWe6wUl10AgJ/epU0UJW6iWskyvk8xkIGIRVLN5j9LfBS9ILGAsYHjJL/STvY
 CWtA==
X-Gm-Message-State: AOAM5300SYLuf73Nk027rPxac/kivxVTkO3vqES5TM3Qa+XffOw4z1c7
 DZHNYfNogoSIm3xuSnuOmbY=
X-Google-Smtp-Source: ABdhPJxTKNYKpwRNVQy4HgazCr7RIuZmqPyOs2Iv08vRbbmKGVHfnwGU1eMmIpFh7U8yktusCBM3KQ==
X-Received: by 2002:a63:4b21:: with SMTP id y33mr9312090pga.142.1597651059515; 
 Mon, 17 Aug 2020 00:57:39 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id r186sm19781628pfr.162.2020.08.17.00.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 00:57:38 -0700 (PDT)
Date: Mon, 17 Aug 2020 13:25:56 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200817075530.GF5869@gmail.com>
References: <ea5881cdfd4d612193feed646ce89f253a36db69.camel@wdc.com>
 <20200722083335.50068-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722083335.50068-1-vaibhavgupta40@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3 0/3] block: use generic power
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

On Wed, Jul 22, 2020 at 02:03:32PM +0530, Vaibhav Gupta wrote:
> Linux Kernel Mentee: Remove Legacy Power Management.
> 
> The purpose of this patch series is to upgrade power management in block
> drivers. This has been done by upgrading .suspend() and .resume() callbacks.
> 
> The upgrade makes sure that the involvement of PCI Core does not change the
> order of operations executed in a driver. Thus, does not change its behavior.
> 
> In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
> helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
> pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
> their job.
> 
> The conversion requires the removal of those function calls, change the
> callbacks' definition accordingly and make use of dev_pm_ops structure.
> 
> All patches are compile-tested only.
> 
> Test tools:
>     - Compiler: gcc (GCC) 10.1.0
>     - allmodconfig build: make -j$(nproc) W=1 all
> 
> v3: v2 needed some changes in commit messages.
> 
> Vaibhav Gupta (3):
>   mtip32xx: use generic power management
>   rsxx: use generic power management
>   skd: use generic power management
> 
>  drivers/block/mtip32xx/mtip32xx.c | 54 +++++++------------------------
>  drivers/block/rsxx/core.c         |  9 ++++--
>  drivers/block/skd_main.c          | 30 +++++------------
>  3 files changed, 27 insertions(+), 66 deletions(-)
> 
> -- 
> 2.27.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
