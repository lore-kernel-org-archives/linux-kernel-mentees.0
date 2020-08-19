Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066ACC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:53:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2BBE2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:53:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skCBsF03"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2BBE2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8BBF387E6E;
	Wed, 19 Aug 2020 18:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-9+FWLQp3L0; Wed, 19 Aug 2020 18:53:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D02C387E40;
	Wed, 19 Aug 2020 18:53:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B18D4C07FF;
	Wed, 19 Aug 2020 18:53:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24563C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0BB7C87619
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIU-lof14SqJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:53:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7BA3E8760E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:53:07 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t11so11267674plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ojo0vVfxMF4kGimsv0YT84fT9cZgWR2PgPBwNlWXlnI=;
 b=skCBsF03o+nKy1/X62nQs3ZlUExK97yXVDTlRaA8GO72wwa24H1C7qm2MuhrUyaALi
 mpZzXM9DozoVnhGuFMyeGT4y/xG3sviD5GzhhEOku6+iKvJK4t3So16vPlCDSBVw1Y6E
 vjyslNPnU+Ku+7fni24xc9moG9pHb+l08VL1GcDp6yualyjc5WbW86Z2cQQ1FYvroIo/
 0o0CG8HvML5rh5X5QEYPitjvapemHzuaNan08+aYY8bdP+uzd3ROmHemiDph51bwCjl1
 q2yzBJcwp9rpY6gC++vSo4O3mJqFqAYF6o8JaTp7NuP3hY7sEZs06cKm1I+D/ivrvMTT
 YNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ojo0vVfxMF4kGimsv0YT84fT9cZgWR2PgPBwNlWXlnI=;
 b=CteN8FQcFQ94lkULLrc1mw0mWGfOX1yUE5GkyofnQ0ScNAJtE1g7yMdy6MjwgX2+rT
 YdZVojlGgDmoSSQwCnVuvH1o0at1Cuxgc2bhRmVxv7EhyXvBhErjtrFNXoYpC1g9ASo1
 KQDiAGHnqBYJuaxYx9dyYMEHedpsK6Pz+Ka4wdUtqsybbbcWd5nbXlCJLNMoQRXG0noO
 aJPY7aC804lEOL1S4gE5h09PndOy2Rs6x08KEKJUuqeRvV1OA+1dF3xnFWkGAAXMJnV1
 3WcSdfOy7ZIp6mx1OCUuw0vupyGFktOLJgVjsQHj7ig4WXhQLc0XnluGrpsi0k3dpZYD
 pDGw==
X-Gm-Message-State: AOAM533yo7eaJdcNri1GuVmmP978YWz9DV7hYMmcp/1TQh/ttW+gIaZf
 Zz4cQCLXrl+KiFkKFJVqpiU=
X-Google-Smtp-Source: ABdhPJz8qgSUSMAh8sRZsex9BAVPb7wEOcm30G8p5x+PLRkaNGEKbLX19pSFlFe30lZkVGjNFsyTWw==
X-Received: by 2002:a17:902:968d:: with SMTP id
 n13mr10893239plp.260.1597863186960; 
 Wed, 19 Aug 2020 11:53:06 -0700 (PDT)
Received: from gmail.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id x6sm25815940pge.61.2020.08.19.11.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:53:06 -0700 (PDT)
Date: Thu, 20 Aug 2020 00:21:08 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200819184738.GA108131@gmail.com>
References: <20200817092245.10478-1-vaibhavgupta40@gmail.com>
 <20200817092511.GA10566@gmail.com>
 <11190a0b-1009-caf8-9cbe-6cf296b614bf@kernel.dk>
 <20200818130329.GA39194@gmail.com>
 <a1937b38-055f-0fc7-0d08-16af7c42660b@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1937b38-055f-0fc7-0d08-16af7c42660b@kernel.dk>
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

On Wed, Aug 19, 2020 at 12:40:20PM -0600, Jens Axboe wrote:
> On 8/18/20 6:03 AM, Vaibhav Gupta wrote:
> > On Mon, Aug 17, 2020 at 07:06:03AM -0700, Jens Axboe wrote:
> >> On 8/17/20 2:25 AM, Vaibhav Gupta wrote:
> >>> Hello,
> >>>
> >>> I am working to upgrade power management framework support for PCI drivers, as
> >>> my project under the Linux Kernel Mentorship Program.
> >>>
> >>> The ultimate goal is to completely remove the legacy framework. And for this we
> >>> need to remove ".suspend" and ".resume" pointers from "struct pci_driver".
> >>>
> >>> The patch is doing the change for the same. The actual suspend() and
> >>> resume() callbacks are defined in drivers/ata/libata-core.c and are exported.
> >>> Which are then used by other files.
> >>>
> >>> Thus removing those pointers, included 54 files in this patch. Although, the
> >>> actual changes are done in few files only. The changes should work fine as I
> >>> have done similar changes for other drivers too which made their way into the
> >>> kernel. Still, tests on few ata devices are necessary.
> >>
> >> Didn't we agree to split this up into separate patches??
> >>
> >>> I tried but unfortunately, I couldn't find or arrange devices to test upon. I
> >>> have added the authors of the previous commit(s) for respective drivers as
> >>> recipients. It would be very helpful if someone can test it on a device.
> >>
> >> Does qemu support any of the affected drivers?
> >>
> > Hello Jens,
> > Yes we discussed about splitting it and I will surely do it. I just thought that
> > still it has not got tested and in that case keeping check on patch-series with
> > 55+ patches may become somewhat messy. Moreover, to test any driver one will
> > have to apply the patch for libata-core and then that of the driver.
> > So, I sent this v3 in order to get some help for the testing purpose. Once it
> > goes successful, I can split it and send it for the submission.
> > 
> > I am not sure about qemu, I haven't checked for it. Qemu will be appropriate
> > for testing power management for .suspend() and .resume() callbacks?
> 
> Well, that's your homework then, it seems pretty ideal for testing that
> kind of thing and way easier than getting your hands on hardware. It
> won't have support for everything, but so far you are at 0 things
> tested, so any piix and ahci testing would be a win as far as I'm
> concerned.
> 
Okay. Thanks for hinting about qemu. I will get started with it then.

Vaibhav Gupta
> -- 
> Jens Axboe
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
