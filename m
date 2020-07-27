Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9B7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 18:13:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8AB20714
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 18:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsIZtQnr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8AB20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 13B4A20794;
	Mon, 27 Jul 2020 18:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drOT3tiZ9+gM; Mon, 27 Jul 2020 18:13:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 75CD020477;
	Mon, 27 Jul 2020 18:13:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60AB3C004F;
	Mon, 27 Jul 2020 18:13:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55381C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CA56987E72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O01jRCDb2nZ6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:13:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4B10287E5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 18:13:10 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t10so3198982plz.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kR383wS8kqwekIjxfXK5kIjXSbnIh9i7VOxO4cysSoo=;
 b=dsIZtQnrESfjZx0zpTL6h5JDXL/rRLZ3xWAJWBj3SXWF/o76ZkStabCnFKUDo2LSrh
 aypLIUiYaSJFu8CZsNXXO/X2kJGZXKAy0SEQSp1sSV158dfSWab0RDENgd6qL2h+l/pq
 H7iEhYY7FmoQTM2pLFc2TxcdKbH8wEP+bG5bsq8DMwONxmMdFkroipo1HpSDu0c0VQLc
 lVMkFZOOYuqZ84Xa1StBWtpBMPGzrjUfjUJtvOCbXTZvYIZD2UXA2fsQ7wZh4XyebtHQ
 raVpZi8aaFXiDWANQXFsXr1rsxpymFC5JrWJIuCFhzFJKTUGvtiL09p0oi1GH9SGyZxm
 no7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kR383wS8kqwekIjxfXK5kIjXSbnIh9i7VOxO4cysSoo=;
 b=k+ebJBIeoj6sjibJGieObq4OAnj+TwCPpzq8fr7mvs5HgF8bVKxOekJhR++1gYBHZe
 XDxzcFeYxK9WLAY1wJ/WbrIAbjoXBGpUJMB0brjrJihh9+fbARcsTnIDU0cjyQ840/oD
 B/mX8LpsC0CCOlQw1lYDWQ3X0e2GQoPbkMmSqOPIoHe9hLifHKmpOFvr1UvsmLlduv7/
 f9IZRfxTi6B4C2wjUqtx6Yp4wP4keZUC7UwsQZwJN6wd6if+ztvDGaDZ/g7trbIbUeTk
 SbYl1obM6f0yEyRqv3ok/r0+j67zWR9oL4t3LC+2/BtEtqeoWnj/zdqBaCb3i1x89uxc
 ZcpA==
X-Gm-Message-State: AOAM532/kJblFkbcN5MffUgTnO1W8wBtf0EN/X1gl6NvPLCwBoTwPWin
 NU5dAgnl75Ei4jAE5S+CKMM=
X-Google-Smtp-Source: ABdhPJx2W8GAzXwFm0DY2CvswNN7eeV0OJe+kpgDp9G5l3uvOcy3v3G4ipQeuyhK8me3YL7tW5c4HQ==
X-Received: by 2002:a17:90a:2349:: with SMTP id
 f67mr489127pje.17.1595873589858; 
 Mon, 27 Jul 2020 11:13:09 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id w18sm15382775pgj.31.2020.07.27.11.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 11:13:09 -0700 (PDT)
Date: Mon, 27 Jul 2020 23:41:44 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200727181144.GA543@gmail.com>
References: <20200727173923.694872-1-vaibhavgupta40@gmail.com>
 <20200727174012.GA696265@gmail.com>
 <2b4738b0-5c2c-8ee2-83f9-10b961a5d0d3@kernel.dk>
 <20200727175119.GA700880@gmail.com>
 <99b7cc57-1b4f-6c0b-00c6-08e22021c373@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99b7cc57-1b4f-6c0b-00c6-08e22021c373@kernel.dk>
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

On Mon, Jul 27, 2020 at 11:59:05AM -0600, Jens Axboe wrote:
> On 7/27/20 11:51 AM, Vaibhav Gupta wrote:
> > On Mon, Jul 27, 2020 at 11:42:51AM -0600, Jens Axboe wrote:
> >> On 7/27/20 11:40 AM, Vaibhav Gupta wrote:
> >>> The patch is compile-tested only.
> >>
> >> Please test and verify actual functionality, if you're serious about
> >> potentially getting this into the kernel.
> >>
> > Hello Jens,
> > 
> > Sadly I don't have the hardware. This upgrade is part of my Linux Kernel
> > Mentorship Program project. Like other PCI drivers which I have updated, I could
> > do compile-testing only. Though this patch covers 54 drivers but the actual
> > change is done only in drivers/ata/libata-core. Since rest of the drivers
> > make use of the same ata_pci_device_suspend/resume(), it was a chain reaction. I
> > only had to change variable binding in "struct pci_driver" variable of dependent
> > drivers.
> 
> That's understandable, but you should find at least some hardware (maybe remotely
> accessible) to test this on. I'm not going to apply this without some confidence
> that it actually works, and compile only testing is a far cry from that. Lots of
> code compiles, but fails miserably at runtime.
> 
> While it's touching 54 drivers, at least basic coverage of the most popular
> choices will give everybody some confidence that it works in general.
>
Yes, I agree. Actually with previous drivers, I was able to get help from
maintainers and/or supporters for the hardware testing. Is that possible for
this patch?

Thanks
Vaibhav Gupta 
> -- 
> Jens Axboe
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
