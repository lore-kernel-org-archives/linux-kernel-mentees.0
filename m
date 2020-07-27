Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F253C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 20:30:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2C4020759
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 20:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="bzNK7nJk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C4020759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A408222170;
	Mon, 27 Jul 2020 20:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lG4IF5bkFTex; Mon, 27 Jul 2020 20:30:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 72180226A9;
	Mon, 27 Jul 2020 20:30:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6464BC004F;
	Mon, 27 Jul 2020 20:30:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45141C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 20:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 344DE882CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 20:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8nYH4r8EToQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 20:30:08 +0000 (UTC)
X-Greylist: delayed 02:47:15 by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 42FC5882ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 20:30:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 1so9713999pfn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2KZJwIkhy/CrWVZLuUHvj+D7ETG92ZsCbDsCh9LqsAY=;
 b=bzNK7nJkhpcctw8iEyrGD9i++PcZ+43Z5mANXDqbCuWyHCiTPy2OM0p3QDbLplwOe6
 R947pngpVc+vbgYMZdf2t5it6MdECh44JwVFT4vhDi9h+AghbzXODHeZ5jXTz92BjLtl
 HfnI6jVQYnOV/rif7oCo6/hCjVKvyciSlAKe4WSub77dvopPM4L40sggklvl14EhyzsW
 nvJASc1EpYMgdBX1NZusbdAloNCuSENRlioBwBbJaOFTSHLUkk+uwQMfErLIn2/pnA7D
 Gqbncdv0tc7FBNAV4YDB74amIK+9LjC1m97MqA+T9VGH215VB/UR8y+78tUxuSXguhNA
 +EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2KZJwIkhy/CrWVZLuUHvj+D7ETG92ZsCbDsCh9LqsAY=;
 b=RHyRQH/ju+knsG3bWFSgke0r/US+megWZ1VkEXxthA7t4VCESEmBTo3/jeA9ou+DAe
 7eV/sv3VXi+/ocUvJu4W8Kji0Q9EVcQJFuJR2vsOwsDovwRaBBKZPyfeBkQbdoNQX2qs
 qU/ulUAq/raezDZrp+i8wbWInoVM/qAVXdGQTVNEte6P9hHMrBF6zzGZ/YrfDZR9QTuv
 iJ6GXbeJs3sh/WywVpysY/hTWV+XHGkn0djkAxIsjsIAh9DHg2rVmhd6lUSR1WxEUxPb
 NAii04W2tWtL69rXNnnSREfDOZmTnsx110UQkTLELp1q/9a11ANPxXJtBhgtsDkmOo9I
 vE2Q==
X-Gm-Message-State: AOAM5325HZu4WGN9BXwgb2rW2piZKUZ29RdxIZt8TFc1PsJOqNeQDct2
 niPXrq57Y4/X5q6kmQ4BBCgAIg==
X-Google-Smtp-Source: ABdhPJxTWacB6EGQGaEQ+NPmcYzQG9/x9QEKKKQnyObZnzJ8sFdEm+YpGl6oy3JUs2H8dTaltB7V2g==
X-Received: by 2002:a62:7942:: with SMTP id u63mr21266195pfc.54.1595881807704; 
 Mon, 27 Jul 2020 13:30:07 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id y6sm467347pji.2.2020.07.27.13.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 13:30:07 -0700 (PDT)
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
References: <20200727173923.694872-1-vaibhavgupta40@gmail.com>
 <20200727174012.GA696265@gmail.com>
 <2b4738b0-5c2c-8ee2-83f9-10b961a5d0d3@kernel.dk>
 <20200727175119.GA700880@gmail.com>
 <99b7cc57-1b4f-6c0b-00c6-08e22021c373@kernel.dk>
 <20200727181144.GA543@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <9718954b-2152-1bc2-e702-ebe8799fdfb3@kernel.dk>
Date: Mon, 27 Jul 2020 14:30:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727181144.GA543@gmail.com>
Content-Language: en-US
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

On 7/27/20 12:11 PM, Vaibhav Gupta wrote:
> On Mon, Jul 27, 2020 at 11:59:05AM -0600, Jens Axboe wrote:
>> On 7/27/20 11:51 AM, Vaibhav Gupta wrote:
>>> On Mon, Jul 27, 2020 at 11:42:51AM -0600, Jens Axboe wrote:
>>>> On 7/27/20 11:40 AM, Vaibhav Gupta wrote:
>>>>> The patch is compile-tested only.
>>>>
>>>> Please test and verify actual functionality, if you're serious
>>>> about potentially getting this into the kernel.
>>>>
>>> Hello Jens,
>>>
>>> Sadly I don't have the hardware. This upgrade is part of my Linux
>>> Kernel Mentorship Program project. Like other PCI drivers which I
>>> have updated, I could do compile-testing only. Though this patch
>>> covers 54 drivers but the actual change is done only in
>>> drivers/ata/libata-core. Since rest of the drivers make use of the
>>> same ata_pci_device_suspend/resume(), it was a chain reaction. I
>>> only had to change variable binding in "struct pci_driver" variable
>>> of dependent drivers.
>>
>> That's understandable, but you should find at least some hardware
>> (maybe remotely accessible) to test this on. I'm not going to apply
>> this without some confidence that it actually works, and compile only
>> testing is a far cry from that. Lots of code compiles, but fails
>> miserably at runtime.
>>
>> While it's touching 54 drivers, at least basic coverage of the most
>> popular choices will give everybody some confidence that it works in
>> general.
>>
> Yes, I agree. Actually with previous drivers, I was able to get help
> from maintainers and/or supporters for the hardware testing. Is that
> possible for this patch?

It might be, you'll have to ask people to help you, very rarely do people
just test patches unsolicited unless they have some sort of interest in the
feature.

This is all part of what it takes to get code upstream. Writing the code
is just a small part of it, the bigger part is usually getting it tested
and providing some assurance that you are willing to fix issues when/if
they come up.

You might want to consider splitting up the patchset a bit - you could
have one patch for the generic bits, then one for each chipset. That
would allow you to at least get some of the work upstream, once tested.

-- 
Jens Axboe

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
