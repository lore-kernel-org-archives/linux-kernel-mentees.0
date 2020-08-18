Return-Path: <SRS0=9k96=B4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD0BC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 13:05:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A6A204FD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 13:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkJQeBD5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A6A204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2EF4B203C2;
	Tue, 18 Aug 2020 13:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUvHSrIVTVuO; Tue, 18 Aug 2020 13:05:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4895020034;
	Tue, 18 Aug 2020 13:05:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BD94C088B;
	Tue, 18 Aug 2020 13:05:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8381C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ACB5820034
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7uHxCG-vW2ER
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:05:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 286DC203A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 13:05:16 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id c6so9388486pje.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pwfLT3a+GHxpttTxhdKznWycfaefCqBgiAPgz6BJmtY=;
 b=HkJQeBD5RoedbtQ3hdyc9mVT3V3Wm52mIEQ8fUV+kXzwwZ+jTgbFyiKb7RmZ93qqme
 gAavNE7bb8gNdldcQR87zIEPLrakfEJ0pJkp7GQtVliBebOjI/wNHC65s4Ihpt2DsCMq
 WbycO9JRo46e4OBf+gsAbvjWRRYRJXfZpZKm63fkuY3ChIv5u3+VTNTLAo6QVRbw3yNZ
 dhO3lOf4RR2e8pwI1gfrxw4Dbak6tLWCRJAONIMi1OxTGt4e1ap+pLsHM3wxEAMVrGp7
 G1ovOufmVmk/ZUluGDT+SCK+i5IhKIV/Hd+XE+9ViiokyP9nhXvRBnRdFzlxuDyJeob7
 q97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pwfLT3a+GHxpttTxhdKznWycfaefCqBgiAPgz6BJmtY=;
 b=Dmv1Evz7a01QhjDgLnMT6f3yQaqRcHAzjz7Wehl3M60QNiDK1Zi2PjkhIhsMBfFc56
 mUnkjCsFtXvjqTnxhcDq7jGnZS9vYQpeUK1HAPktDtaU6Mj3MHUDjB9PByAQU2t3/b75
 E91COsGEW4kLs+qh6TbA88y4Rty6Ow+tbEZeGtG7yPLMOF50lJ7L+bvoeJTX62JC7gPs
 3m937tqfco78Nxc5wOd+xPK3Ma0whoXVNItGAXoNIIC2YfCMNOzOF5NjqhtfPUa0dBsj
 +ApQI+3ZqHO+gWToLpoBwxVhPm/aOxfnSlk94lj9UCHFXAFOXuxaqpBnvkBR1x4YJRvl
 o5WA==
X-Gm-Message-State: AOAM530fCHTilqhJsEwHDZ7+Zg0d/DMyFfLex9PuLczP/QHcQASpWRZ3
 fmoJF7qAk9Bl0DfD0KrR4sw=
X-Google-Smtp-Source: ABdhPJwc5hrEFoEiKPxK3iuQJNxaRnHhfTDQfAxZpVW8kajYdWW9rkzCpNpBtHszvSibdhdi1EB6Nw==
X-Received: by 2002:a17:90a:ea0b:: with SMTP id
 w11mr15397420pjy.80.1597755915458; 
 Tue, 18 Aug 2020 06:05:15 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id u14sm25042508pfm.103.2020.08.18.06.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 06:05:14 -0700 (PDT)
Date: Tue, 18 Aug 2020 18:33:29 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200818130329.GA39194@gmail.com>
References: <20200817092245.10478-1-vaibhavgupta40@gmail.com>
 <20200817092511.GA10566@gmail.com>
 <11190a0b-1009-caf8-9cbe-6cf296b614bf@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11190a0b-1009-caf8-9cbe-6cf296b614bf@kernel.dk>
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 Alex Shi <alex.shi@linux.alibaba.com>, Jiri Slaby <jslaby@suse.cz>,
 Christoph Hellwig <hch@lst.de>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Prabhakar Kushwaha <pkushwaha@marvell.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <bhelgaas@google.com>
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

On Mon, Aug 17, 2020 at 07:06:03AM -0700, Jens Axboe wrote:
> On 8/17/20 2:25 AM, Vaibhav Gupta wrote:
> > Hello,
> > 
> > I am working to upgrade power management framework support for PCI drivers, as
> > my project under the Linux Kernel Mentorship Program.
> > 
> > The ultimate goal is to completely remove the legacy framework. And for this we
> > need to remove ".suspend" and ".resume" pointers from "struct pci_driver".
> > 
> > The patch is doing the change for the same. The actual suspend() and
> > resume() callbacks are defined in drivers/ata/libata-core.c and are exported.
> > Which are then used by other files.
> > 
> > Thus removing those pointers, included 54 files in this patch. Although, the
> > actual changes are done in few files only. The changes should work fine as I
> > have done similar changes for other drivers too which made their way into the
> > kernel. Still, tests on few ata devices are necessary.
> 
> Didn't we agree to split this up into separate patches??
> 
> > I tried but unfortunately, I couldn't find or arrange devices to test upon. I
> > have added the authors of the previous commit(s) for respective drivers as
> > recipients. It would be very helpful if someone can test it on a device.
> 
> Does qemu support any of the affected drivers?
> 
Hello Jens,
Yes we discussed about splitting it and I will surely do it. I just thought that
still it has not got tested and in that case keeping check on patch-series with
55+ patches may become somewhat messy. Moreover, to test any driver one will
have to apply the patch for libata-core and then that of the driver.
So, I sent this v3 in order to get some help for the testing purpose. Once it
goes successful, I can split it and send it for the submission.

I am not sure about qemu, I haven't checked for it. Qemu will be appropriate
for testing power management for .suspend() and .resume() callbacks?

Thanks
Vaibhav Gupta
> -- 
> Jens Axboe
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
