Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C00CC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:27:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECD32072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:27:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0jcnI9S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECD32072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AE42E87CB2;
	Mon, 17 Aug 2020 09:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7lreQcq42Pr; Mon, 17 Aug 2020 09:27:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 501F887A8D;
	Mon, 17 Aug 2020 09:27:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 387E0C088E;
	Mon, 17 Aug 2020 09:27:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1D5FC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DD03885C19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcWIlV4cdcV2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:27:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B57EF85D2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:27:00 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f5so7197468plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Rj6QAfp7fK0l7e7qFTK0S101pCtERJaPK3wMNiuezuY=;
 b=U0jcnI9S/jFzGDnvfm0t7CpqXvnyBzY4klINeV9Qgxl6g7KRhDVeAgua2xpHY3b8Lw
 XZXsUdrM5cQhpLB75CHifTZ9IHODvopA22F4njsuxi/eVy78Cv0TPbyLfJVAZGomuxGo
 eLqCJlNMwP7zjCwLGNJ15rwNg8uo05wxki0/A6ySGyeX+jwzOYZi/Klh9oarQu95UW3J
 QcOizn8dPSbPaGrvX5Ip+z2dO9mZg2ernZBrwfbj+o8kPeePADEUJ4Ys63aQltpk3eCS
 lUlCgurWWMAc3rXbwLrohpq4cqzxyrASROHsbjnAOJHVWMCkSYB5atU7zN0EbC5uPGGG
 AzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rj6QAfp7fK0l7e7qFTK0S101pCtERJaPK3wMNiuezuY=;
 b=tyHMZi/jCRYnHJHzdh2P6gJqu77kZx7E5emMRZjHjN7m2lB4WTH5FKHWHOaYY9bMNI
 6cGYgXGCKmgjCLTeZkVBHRSkxLwGe94hFGKyWPNV5uysJH7XlBxQsJA4rK+bSbAC3lPE
 /5eAF8Muy4yxOZ9FeyC/8Ww/oFzZAnWuxlG0qnHaBMm4VrFZ/pID7lJ+rvdpUDN+Afwv
 SKV/2tHOAvxHZlEDVqewewd4Ct+bUe688uyFUTJ5Yb7H3lDECfCKS/7c7cI423eILx1S
 A8T7U0GXW6MXkYhcJxA2VdJnFVczuH3BXhkExqgrt9f3RnUVIjS1zWmrrEwzUgtTJAta
 LgIw==
X-Gm-Message-State: AOAM530KkqF9aRRT/OIC0IA4yxnPTjR1NMlymFbGnW9qZkaRbgOZLK7Z
 YAEBIouTokjFtV1eeSmOlF0=
X-Google-Smtp-Source: ABdhPJz6lYnPyu0mQrpiz1HjSnbolwJUpaJy7iVIhiwHyzlwegTyNekAgYgri6gIqN+wwTIAdHUnAw==
X-Received: by 2002:a17:90a:230d:: with SMTP id
 f13mr11126659pje.116.1597656420344; 
 Mon, 17 Aug 2020 02:27:00 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id e4sm18904633pfd.204.2020.08.17.02.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:26:59 -0700 (PDT)
Date: Mon, 17 Aug 2020 14:55:11 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Christoph Hellwig <hch@lst.de>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Prabhakar Kushwaha <pkushwaha@marvell.com>,
 Alex Shi <alex.shi@linux.alibaba.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jslaby@suse.cz>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Zhang Rui <rui.zhang@intel.com>
Message-ID: <20200817092511.GA10566@gmail.com>
References: <20200817092245.10478-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817092245.10478-1-vaibhavgupta40@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] ata: use generic power
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

Hello,

I am working to upgrade power management framework support for PCI drivers, as
my project under the Linux Kernel Mentorship Program.

The ultimate goal is to completely remove the legacy framework. And for this we
need to remove ".suspend" and ".resume" pointers from "struct pci_driver".

The patch is doing the change for the same. The actual suspend() and
resume() callbacks are defined in drivers/ata/libata-core.c and are exported.
Which are then used by other files.

Thus removing those pointers, included 54 files in this patch. Although, the
actual changes are done in few files only. The changes should work fine as I
have done similar changes for other drivers too which made their way into the
kernel. Still, tests on few ata devices are necessary.

I tried but unfortunately, I couldn't find or arrange devices to test upon. I
have added the authors of the previous commit(s) for respective drivers as
recipients. It would be very helpful if someone can test it on a device.

Thanks
Vaibhav Gupta
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
