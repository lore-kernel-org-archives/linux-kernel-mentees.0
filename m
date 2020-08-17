Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F266FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 14:13:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B893D205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 14:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="PXpSrxGG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B893D205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8965987CD6;
	Mon, 17 Aug 2020 14:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9IYAZzu8wca; Mon, 17 Aug 2020 14:13:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D87F587B4C;
	Mon, 17 Aug 2020 14:13:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB648C088B;
	Mon, 17 Aug 2020 14:13:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66081C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 14:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4E94C876E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 14:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxsef+F9lqoh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 14:13:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B8294876DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 14:13:03 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id z22so14920679oid.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PIAYKHjJ+03cKYu2JPL6HlkNqktpI5xr9LI9aCcZTZc=;
 b=PXpSrxGG5NQb2WIDkTqTa6tdyZ/m8BuvTDK83BWuHX+Q/99KGjVkYjMKxCJso/bu50
 P0gDNg0ERPM1lvTGmbNHMlupuOOGCwJVrYim4k+LNFSZCgVi/GVq6qP+3A1njqNrR9y2
 sogh8F7SHPR5/IpCnAwdk2PVu6UFxPq0YcDe7bd3Hh29Pgu0G6vzwzDO8iA1y0sbOvOD
 faZ9A0Np7vVm1f/+W02gT63w1ATQX7LsBkzw2K/KJBRm3uyU2UuMjQobY+Fsu/izTBQy
 bu6fZf/4/5iUnlQrPxDrB+CQZJDAsK8JytIs57AH2+y1az/qOeQ6SXQceb3nxa3sAXg2
 fsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PIAYKHjJ+03cKYu2JPL6HlkNqktpI5xr9LI9aCcZTZc=;
 b=ZwoRLKueK5LYPIVq4zVfacN2J3x1MsFpFG2QCjiIcHVAMWUUB9U8uYXXKV8h/wR46r
 1W0zAmekWh5UGGGLn7aY6L6S5OTCc2es14o8JwavP3N7Mc3/mmOI3csqSQxjch2CmXJO
 7NM0JQYtWUABIQxcg86YzWmANG3Bh33QbOTlIO2HzoG098asmX0h/aXkBGB4revmqXoR
 X4rwSxuQKTb0IDROXZWp1UUwyEglWOclsRg6G6kX9HMA8vJtzHVZARLLJQskQGBiea+H
 o/7c9LLIxg8gIVK0u6NXi/nqy/x/WtITyYx2isCikreAFR2bMtqHwLVy8x313bzb5qST
 OT9Q==
X-Gm-Message-State: AOAM532T/FNOEfSTSShSXuY7yLT3a6T9ZdWeTpROpmqoIu/Qg+hiVUd4
 XgbTy3+2SpdT8pd4+2Vaa/mO9W1jk8ysxCX7
X-Google-Smtp-Source: ABdhPJxN5VWrIxn19ZuHvKElObS5gj6AQHW4rCT/F/d8vpnvb6ZtllMPtmvafGqmOsAuPRJ4TsELQQ==
X-Received: by 2002:a17:90b:384b:: with SMTP id
 nl11mr12500874pjb.91.1597673166975; 
 Mon, 17 Aug 2020 07:06:06 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:ff2c:a74f:a461:daa2?
 ([2605:e000:100e:8c61:ff2c:a74f:a461:daa2])
 by smtp.gmail.com with ESMTPSA id d23sm13089251pgm.11.2020.08.17.07.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 07:06:06 -0700 (PDT)
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Vaibhav Gupta
 <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Christoph Hellwig <hch@lst.de>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Prabhakar Kushwaha <pkushwaha@marvell.com>,
 Alex Shi <alex.shi@linux.alibaba.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jslaby@suse.cz>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Zhang Rui <rui.zhang@intel.com>
References: <20200817092245.10478-1-vaibhavgupta40@gmail.com>
 <20200817092511.GA10566@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <11190a0b-1009-caf8-9cbe-6cf296b614bf@kernel.dk>
Date: Mon, 17 Aug 2020 07:06:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817092511.GA10566@gmail.com>
Content-Language: en-US
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

On 8/17/20 2:25 AM, Vaibhav Gupta wrote:
> Hello,
> 
> I am working to upgrade power management framework support for PCI drivers, as
> my project under the Linux Kernel Mentorship Program.
> 
> The ultimate goal is to completely remove the legacy framework. And for this we
> need to remove ".suspend" and ".resume" pointers from "struct pci_driver".
> 
> The patch is doing the change for the same. The actual suspend() and
> resume() callbacks are defined in drivers/ata/libata-core.c and are exported.
> Which are then used by other files.
> 
> Thus removing those pointers, included 54 files in this patch. Although, the
> actual changes are done in few files only. The changes should work fine as I
> have done similar changes for other drivers too which made their way into the
> kernel. Still, tests on few ata devices are necessary.

Didn't we agree to split this up into separate patches??

> I tried but unfortunately, I couldn't find or arrange devices to test upon. I
> have added the authors of the previous commit(s) for respective drivers as
> recipients. It would be very helpful if someone can test it on a device.

Does qemu support any of the affected drivers?

-- 
Jens Axboe

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
