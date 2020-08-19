Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A11FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:45:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8B120758
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="e+mMmkTZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8B120758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DCA278761D;
	Wed, 19 Aug 2020 18:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vef8hWNmSL21; Wed, 19 Aug 2020 18:45:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E54C6874DA;
	Wed, 19 Aug 2020 18:45:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAAF5C07FF;
	Wed, 19 Aug 2020 18:45:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10F47C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F3CF285F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:45:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdoxjSZZSRMV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:45:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CE5F285EB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:45:47 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id z22so21940143oid.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S1EUhordtUMjel9FzBtn8TtSvL9SVNZ9uwAnsm6qFvw=;
 b=e+mMmkTZHdUnOzUeVKsZZ9CczIEu12TU8Kve2CC8dc6MqNmTEWTaZ348q66vWBSfQF
 GIklVGsrgvsTEi1Qo4eoBoX6yS36bEKuwLEDTe9RkBCSPbDnBBXP6W0qOW5001XEK0Qt
 BkCV9STVWZ3StfyFgDVToDTKDhXjLPEHSiqjoDG8SYkTzLcjxMH4/00xiBfEgzz2mUTW
 +JK9+Bh7w2UX6zSUKJnkIqT8hbNPAph1a/yxm3dqaYY30/wyoRpifLbnVPoVYkVOUGQD
 v7S+6t27MltFWBp/vody+r29b/EGImRaMm5d0kwzHa/ke2SzSzF7lV3zpxK7bhO/2nf2
 6Emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S1EUhordtUMjel9FzBtn8TtSvL9SVNZ9uwAnsm6qFvw=;
 b=IqL2X/dbDaQkttqD+SgBu8TKbdHRKTZRt6q0KwUzSvUCZwmvGoxWdb9+dZelg5s2pW
 PY4aHZyVQDl+RM0citzIC3qCAv6wY28VPC9VcOtdYBXFq7tTtSfsyKgXCRx05EUxEp55
 jH4bchcRebTwwglH+wbwyB9z4ksYnR0ZcoCFUu8XeMUFjxAkkFo4DbNAVRvJa58ZB9LP
 W5YJ+xo0PcpxQQlT5l03R28qIa5vcsOXK13ed2jSjqIKX+eMuWzKrlQoO35KhRu7XHFA
 /rz/Hh+7VWboqVV2EHG5EjWO92lh2IoNDUIaNY21oy0Ka7Ru3eTORve6kA6eA+ZYDDC3
 i7kw==
X-Gm-Message-State: AOAM533t3B9XUYHf73t/jlN6dAmrDCvsp+nKiIISgZ78iyYh/ZINdDKC
 qCPVKhIoqwo4nbbt2Qh9yq59V9AxYAEpmPrUdJM=
X-Google-Smtp-Source: ABdhPJxp72MaH2m2nPgfUrred95nj+8zIrU+NNhgrwSD/P/pZgzig9Z2qyQTh3Wm88TgTsloY+2vBg==
X-Received: by 2002:a17:90a:ab96:: with SMTP id
 n22mr5132823pjq.52.1597862424863; 
 Wed, 19 Aug 2020 11:40:24 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id y79sm28201877pfb.65.2020.08.19.11.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 11:40:23 -0700 (PDT)
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
References: <20200817092245.10478-1-vaibhavgupta40@gmail.com>
 <20200817092511.GA10566@gmail.com>
 <11190a0b-1009-caf8-9cbe-6cf296b614bf@kernel.dk>
 <20200818130329.GA39194@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a1937b38-055f-0fc7-0d08-16af7c42660b@kernel.dk>
Date: Wed, 19 Aug 2020 12:40:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818130329.GA39194@gmail.com>
Content-Language: en-US
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
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
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

On 8/18/20 6:03 AM, Vaibhav Gupta wrote:
> On Mon, Aug 17, 2020 at 07:06:03AM -0700, Jens Axboe wrote:
>> On 8/17/20 2:25 AM, Vaibhav Gupta wrote:
>>> Hello,
>>>
>>> I am working to upgrade power management framework support for PCI drivers, as
>>> my project under the Linux Kernel Mentorship Program.
>>>
>>> The ultimate goal is to completely remove the legacy framework. And for this we
>>> need to remove ".suspend" and ".resume" pointers from "struct pci_driver".
>>>
>>> The patch is doing the change for the same. The actual suspend() and
>>> resume() callbacks are defined in drivers/ata/libata-core.c and are exported.
>>> Which are then used by other files.
>>>
>>> Thus removing those pointers, included 54 files in this patch. Although, the
>>> actual changes are done in few files only. The changes should work fine as I
>>> have done similar changes for other drivers too which made their way into the
>>> kernel. Still, tests on few ata devices are necessary.
>>
>> Didn't we agree to split this up into separate patches??
>>
>>> I tried but unfortunately, I couldn't find or arrange devices to test upon. I
>>> have added the authors of the previous commit(s) for respective drivers as
>>> recipients. It would be very helpful if someone can test it on a device.
>>
>> Does qemu support any of the affected drivers?
>>
> Hello Jens,
> Yes we discussed about splitting it and I will surely do it. I just thought that
> still it has not got tested and in that case keeping check on patch-series with
> 55+ patches may become somewhat messy. Moreover, to test any driver one will
> have to apply the patch for libata-core and then that of the driver.
> So, I sent this v3 in order to get some help for the testing purpose. Once it
> goes successful, I can split it and send it for the submission.
> 
> I am not sure about qemu, I haven't checked for it. Qemu will be appropriate
> for testing power management for .suspend() and .resume() callbacks?

Well, that's your homework then, it seems pretty ideal for testing that
kind of thing and way easier than getting your hands on hardware. It
won't have support for everything, but so far you are at 0 things
tested, so any piix and ahci testing would be a win as far as I'm
concerned.

-- 
Jens Axboe

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
