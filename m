Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EB3C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 12:05:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBA3206A4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 12:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffFurLmV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FBA3206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3CFF1864F4;
	Fri,  2 Oct 2020 12:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VK7TDKGcl-DT; Fri,  2 Oct 2020 12:05:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A4BD86511;
	Fri,  2 Oct 2020 12:05:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BC85C016F;
	Fri,  2 Oct 2020 12:05:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E806C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 12:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 39E502001C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 12:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NDVFJuKjnXnd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 12:05:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id E740B2000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 12:05:32 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b124so1056234pfg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 05:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=w1TvZfZh4isNWotj7H9ZpgiclRpL+b6gwGNHtAMeGfA=;
 b=ffFurLmVaxtXwzcnJEaqB1gru5dm6vI+Yy2ehevm3MXFrs8meWnp0RONHY/qpj1ger
 gn6bOStiXStdWk2FP2aswkZ+LFRqEH19tfQ4LSVCPw2kwjiIH+S7+cRaBICWoqvZLZJE
 A64IP3YVBHEryefDcgtKOawzuuSQzsWzIOgQEMJMmUJE7iT4QT5JrQQzy8Vj6tg1XZip
 C3avl1yg+Lt+EAZRCwzDcfMG5rZTtaqkZOwmdXlOeBwih4EgbHbysFycZjTzKC/HmQy3
 ZNXgcObzNdT0kOd6Fbzqvt2KF7H5AZfITtfFb3aw1yu5yJLk4cDeBM5u1m2A+2Cmgs0D
 QBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=w1TvZfZh4isNWotj7H9ZpgiclRpL+b6gwGNHtAMeGfA=;
 b=rVhvsGl7ptsVhi5q95GJWKR7mMabtx9ZhpI++89Fv+MzWFd7yh/LTFWl/SKUI+azn8
 Xhk+M5jBvlvK+9IoT9y0Voa1J8wRqBX0rVFc23J294WXI08wlgW1TxY38nsq/zObTMbR
 q1umeJ3o8ZhEQe8WbIenPLWmHUB1XCyEFBwJxuMJkbBUunI1S13/7aKeb0ITJvLxKU5Q
 21i+j1iRh2+nbqV6jZ3YvVPrIKIKomAOl0b/+xTvEg5f0Zta86cch9zoSxla7vqEJp/t
 CTwgabDlD+kOxhbb6vSho/HD5qdSk5DYWZ3Yk3pEewkCdF5DMHSVV9nCgS8xedEWUCPE
 esAg==
X-Gm-Message-State: AOAM533T5Y1Jw6zr6FrShRZmdU7St75c+fhGjBaWevIniMm4hwZGToKv
 pTx8utt9Tn8Ab+yuJGF1ey8=
X-Google-Smtp-Source: ABdhPJzgdyvn6+K1n7d3iUaIhztN8ozzw6PCYu3w2pr3T3t8cnbc9jj5J5XR82OT43GVhyoVmNILig==
X-Received: by 2002:a63:e:: with SMTP id 14mr1906638pga.426.1601640332098;
 Fri, 02 Oct 2020 05:05:32 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id 1sm1541864pgm.4.2020.10.02.05.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 05:05:30 -0700 (PDT)
To: Greg KH <greg@kroah.com>
References: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
 <20201001.191522.1749084221364678705.davem@davemloft.net>
 <83804e93-8f59-4d35-ec61-e9b5e6f00323@gmail.com>
 <20201002115453.GA3338729@kroah.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <a19aa514-14a9-8c92-d41a-0b9e17daa8e3@gmail.com>
Date: Fri, 2 Oct 2020 17:35:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20201002115453.GA3338729@kroah.com>
Content-Language: en-US
Cc: petkan@nucleusys.com, syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: prevent
 set_ethernet_addr from setting uninit address
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


On 02-10-2020 17:24, Greg KH wrote:
> On Fri, Oct 02, 2020 at 05:04:13PM +0530, Anant Thazhemadam wrote:
>> On 02/10/20 7:45 am, David Miller wrote:
>>> From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>>> Date: Thu,  1 Oct 2020 13:02:20 +0530
>>>
>>>> When get_registers() fails (which happens when usb_control_msg() fails)
>>>> in set_ethernet_addr(), the uninitialized value of node_id gets copied
>>>> as the address.
>>>>
>>>> Checking for the return values appropriately, and handling the case
>>>> wherein set_ethernet_addr() fails like this, helps in avoiding the
>>>> mac address being incorrectly set in this manner.
>>>>
>>>> Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
>>>> Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
>>>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>>>> Acked-by: Petko Manolov <petkan@nucleusys.com>
>>> First, please remove "Linux-kernel-mentees" from the Subject line.
>>>
>>> All patch submitters should have their work judged equally, whoever
>>> they are.  So this Subject text gives no extra information, and it
>>> simply makes scanning Subject lines in one's mailer more difficult.
>> I will keep that in mind for all future submissions. Thank you.
>>
>>> Second, when a MAC address fails to probe a random MAC address should
>>> be selected.  We have helpers for this.  This way an interface still
>>> comes up and is usable, even in the event of a failed MAC address
>>> probe.
>> Okay... I see.
>> But this patch is about ensuring that an uninitialized variable's
>> value (whatever that may be) is not set as the ethernet address
>> blindly (without any form of checking if get_registers() worked
>> as expected, or not). And I didn't think uninitialized values being
>> set as MAC address was considered a good outcome (after all, it
>> seemed to have triggered a bug), especially when it could have
>> been avoided by introducing a simple check that doesn't break
>> anything.
> If the read from the device for the MAC address fails, don't abort the
> whole probe process and make the device not work at all, call the
> networking core to assign a random MAC address.
>
>> However, if I was mistaken, and if that is something that we can live
>> with after all, then I don't really see the understand the purpose of
>> similar checks being made (in all the many places that the return
>> value of get_registers() (or a similar function gets checked) in the first
>> place at all.
> Different values and registers determine what should be done with an
> error.  It's all relative.
>
> For this type of error, we should gracefully recover and keep on going.
> For others, maybe we just ignore the issue, or log it, or something
> else, it all depends.
>
> hope this helps,
>
> greg k-h
Yes, this clears things up for me. I'll see to it that this gets done in a v3.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
