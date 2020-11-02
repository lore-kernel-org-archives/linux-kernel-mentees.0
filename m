Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A87C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:41:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119F4223BF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozIK3MB3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 119F4223BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A2E586923;
	Mon,  2 Nov 2020 16:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKCWdJATFGpy; Mon,  2 Nov 2020 16:41:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C09F869A7;
	Mon,  2 Nov 2020 16:41:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17F00C088B;
	Mon,  2 Nov 2020 16:41:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45003C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2F78586A72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSkCjZjQ4asD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:41:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9A2B186A6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:41:05 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id r186so11279264pgr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gVScNhg3nwSxNUg/MgfwzotEdUV9MD/rwLFJFqF4KkY=;
 b=ozIK3MB34COjNhsEolV6Im+wdPQSNM2a9DrXoHDCBTmKDqTZRq4rKwEDE4fc9Foo2E
 drGDMGJe9zjkwJRZhAUSPpsqmIXn9sa44qJ8S8VhZ7o6EFuRZ24zdy6dcQtZipSIUtUT
 F6vltHHB9Tsd07KzL81OZF+qBD+jMz6OyGcsJtoAe0ALVKr2ishjGWd3UETyoaVG6HPI
 MNM4i3ppIzXUuUQrBJhr5l5ouCiTYGQPucUBzba/UcSCUfrOosFnHU+2uyNgIjSdgyJ4
 BCUp3iEDGMKQFUSPMN13AWyhcf6njkfO6DmMOvEqYy6+b48QGPiWZjKaYMAFu8vHKguF
 FpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gVScNhg3nwSxNUg/MgfwzotEdUV9MD/rwLFJFqF4KkY=;
 b=NhFqKU0lGSLx3ZFsYeK9hAncz9y0LyDJjLJ91gfwE6ZVzFilvgKoljDZzAYe1b+thd
 J8ML6hK6zE68p6fZBBWPERNZvPuGrmbC/9MyVJ5py7Ymvn9yRQPfEWfIuMZmwpHM40xu
 5h5+gJqIkMq+fWfmBe82PgJY1LRbe5WWiP7GSWaO7yqD5AZ1g0EOgxiROmjWjT/wWTC9
 uywyHk3xmhgsCf5AVdi3MuqAMoBuiAKeiAsU3QwRKWDjf+s48YLJpM9TCIFiZQkjbubP
 dHoxuERzw+fwsaU4qvCAjZ8DYgaj8DsjH+LriflPJ3DJ2oa7x3eeFWJf7qXaIZfOId6J
 XgYA==
X-Gm-Message-State: AOAM530IrJmQ1a1gRcJ37GyEFhxE7FGUGLBztuKVk3g7Y3MBjdcWVMkP
 yKg1EmSdRyMqSCQdvVahke8kCJ5wmd7Pe8r6x+c=
X-Google-Smtp-Source: ABdhPJwOzMbyY75elEDngKQ6pj7PwgayDj5owOPqp10tiA7jB3AWJfZi2U9zYHWZC09YfXWcEeb5RA==
X-Received: by 2002:a17:90a:5c82:: with SMTP id
 r2mr18207842pji.69.1604335264336; 
 Mon, 02 Nov 2020 08:41:04 -0800 (PST)
Received: from [192.168.0.104] ([49.207.221.93])
 by smtp.gmail.com with ESMTPSA id s145sm3272429pfs.187.2020.11.02.08.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:41:02 -0800 (PST)
To: Oliver Neukum <oneukum@suse.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20201029132256.11793-1-anant.thazhemadam@gmail.com>
 <20201031213533.40829-1-anant.thazhemadam@gmail.com>
 <11476cd1da8b63f75d39bd5b8e876ad3968a1903.camel@suse.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <c50d24f5-0ed3-4361-0830-619367a3c99e@gmail.com>
Date: Mon, 2 Nov 2020 22:10:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11476cd1da8b63f75d39bd5b8e876ad3968a1903.camel@suse.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] net: usb: usbnet: update
 __usbnet_{read|write}_cmd() to use new API
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


On 02/11/20 3:10 pm, Oliver Neukum wrote:
> Am Sonntag, den 01.11.2020, 03:05 +0530 schrieb Anant Thazhemadam:
>> Currently, __usbnet_{read|write}_cmd() use usb_control_msg().
>> However, this could lead to potential partial reads/writes being
>> considered valid, and since most of the callers of
>> usbnet_{read|write}_cmd() don't take partial reads/writes into account
>> (only checking for negative error number is done), and this can lead to
>> issues.
>>
> Hi,
>
> plesae send this as a post of its own. We cannot take a new set
> as a reply to an older set.
>
> 	Regards
> 		Oliver
>

Got it. I will do that.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
