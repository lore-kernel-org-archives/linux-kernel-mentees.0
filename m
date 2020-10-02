Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E60C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 19:45:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6FEF206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 19:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CENHWLnv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6FEF206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F5CC873F2;
	Fri,  2 Oct 2020 19:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fqA9m+rsQ7tg; Fri,  2 Oct 2020 19:45:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F16EA873F0;
	Fri,  2 Oct 2020 19:45:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4E8AC0889;
	Fri,  2 Oct 2020 19:45:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B070C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D3355203A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 19:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WhJHIHxWf3o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 19:45:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id F37B020406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 19:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601667900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgMa0/la5acn2bgv6JrmNlXcDw7ZYgonZFi8exdF+5s=;
 b=CENHWLnvpvaUw4qpKdSuuUNm+t/m953GeNPsLdM8KyXn3dQWtnXq9d/gwcIIQ55NOIJtKB
 RXKT/RPNtxt04kHxiH8wS7imXlzCdnJsr4dQo2f66ADpFIZNqKij5vW+/ZYRqLQqR9eR2V
 zP8rkQ8e9osiTs3jlOI3O7dDkMRvWxA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-uYPapH2UO_Ci20jFRftHUw-1; Fri, 02 Oct 2020 15:44:58 -0400
X-MC-Unique: uYPapH2UO_Ci20jFRftHUw-1
Received: by mail-ed1-f69.google.com with SMTP id r8so1111175edy.17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 12:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jgMa0/la5acn2bgv6JrmNlXcDw7ZYgonZFi8exdF+5s=;
 b=GceLvgvY2jlsWdgN/JCZRLQNwxmR6Xq2AwHbGbILB439R6UsM+fVxnJrPIKvCCH2IB
 +WdCRXolzFrW0JiKhFC1CmlIipxAyPLHjN0SZrD+CHLBHBkXRdrCgXQBtzU8eWQHh++V
 V7vHwV0RIOYb3lgUKNsURLrgbWksqkOYZkWkpdmzANZUrLS7hwOvfbR2YkAcfuvT1noO
 hWsCZSsEhfulAntpWV83pbAMW5kkrt9OiejQkvpnop+/HWb+oaAOQ3agUxwtmfVzNeKK
 z90v/nwH2sFyVaH/De6gJ88emd6kOyqEGRwmXJriT7IsqfEKdAu65bMhHrVoQ1ITY2hB
 30Pw==
X-Gm-Message-State: AOAM5314Rb/LY/O+M5Y7vjMSNfSc86LZ0s4KHVl9rkvRllbEFCwzb/c0
 aDx/QbBWxBBEaxY7ER87qaeFnWVc3FcmH7qpguwF+igid1RwPXsVmIIG0+w0kZO7bRVphbiZRw+
 qWiOnqMpTLFNwIieUM/KzFpjH1R6wNTkIt8gTzccee5dVnTQA
X-Received: by 2002:a17:906:edc4:: with SMTP id
 sb4mr3792260ejb.144.1601667896609; 
 Fri, 02 Oct 2020 12:44:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3ULDQuLHZRT7PJRaf61qpeFeNYqfn7LcmWcfwC+3dwuZARh6VNIbmSTUW+1EGrFVv5B6ODw==
X-Received: by 2002:a17:906:edc4:: with SMTP id
 sb4mr3792251ejb.144.1601667896456; 
 Fri, 02 Oct 2020 12:44:56 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id j18sm829161ejc.111.2020.10.02.12.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 12:44:55 -0700 (PDT)
To: Coiby Xu <coiby.xu@gmail.com>
References: <20201001132258.6yzosj2w7k4eod42@Rk>
 <CACRpkdYvaC_DUJW+nvmofhhHieDYAiREBog6rn5iS=J4moAtZg@mail.gmail.com>
 <3ded544f-be1b-8dc4-16b7-42172b1e1b08@redhat.com>
 <20201002124235.nhjzq7i4gpkzwgbs@Rk>
 <39f03cfe-0e7f-2ab6-7821-048cfcde8baa@redhat.com>
 <20201002145133.a43ypm2z7ofgtt7u@Rk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <eed704f5-4210-788c-37b7-06d65b58d3de@redhat.com>
Date: Fri, 2 Oct 2020 21:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002145133.a43ypm2z7ofgtt7u@Rk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Any other ways to debug GPIO interrupt
 controller (pinctrl-amd) for broken touchpads of a new laptop model?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi,

On 10/2/20 4:51 PM, Coiby Xu wrote:
> On Fri, Oct 02, 2020 at 03:36:29PM +0200, Hans de Goede wrote:

<snip>

>>>> So are you seeing these 7 interrupts / second for the touchpad irq or for
>>>> the GPIO controllers parent irq ?
>>>>
>>>> Also to these 7 interrupts/sec stop happening when you do not touch the
>>>> touchpad ?
>>>>
>>> I see these 7 interrupts / second for the GPIO controller's parent irq.
>>> And they stop happening when I don't touch the touchpad.
>>
>> Only from the parent irq, or also on the touchpad irq itself ?
>>
>> If this only happens on the parent irq, then I would start looking at the
>> amd-pinctrl code which determines which of its "child" irqs to fire.
> 
> This only happens on the parent irq. The input's pin#130 of the GIPO
> chip is low most of the time and pin#130.

Right, but it is a low-level triggered IRQ, so when it is low it should
be executing the i2c-hid interrupt-handler. If it is not executing that
then it is time to look at amd-pinctrl's irq-handler and figure out why
that is not triggering the child irq handler for the touchpad.

Regards,

Hans

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
