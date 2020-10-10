Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EB9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 08:26:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF66207C4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 08:26:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4JuzuCU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF66207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A7DD87018;
	Sat, 10 Oct 2020 08:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XeJecL9NdxOF; Sat, 10 Oct 2020 08:26:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7679087012;
	Sat, 10 Oct 2020 08:26:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BB76C07FF;
	Sat, 10 Oct 2020 08:26:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2938C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 98ACE8776E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oY8-6gx2-05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:26:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6F3FF87196
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:26:33 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c6so5671899plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dr5qY8NyHjVYH13UhDsjPOas2xGcDA+M5geFB4xe7/8=;
 b=i4JuzuCUv9W34k/rlxlw+/z5GmaiprqIaJcQgDzpAaos3Y7kpGKh1+OwC6XnNeKCe7
 QeItm+DczVgCcOkW5fZY6aCQ4S94F3jQfywY+CL2PKof+ro8UVsBMHex9xU02FliTBAK
 PpH5PPFrJRGd6nkhPCrlCNNK5jqsfchhQMxyvNHDQNWIDrpQfdFIJ56wAiVJ+HCW0IC2
 qZBLbXR3lL7nS79Qr9qAI8i2S6bJk08wor+uD1coQ3gc4XtqmZA6fX7ieOtsWZsk1Gpb
 BVtdUWOWBuN9xsKDM73llWrYrUSWWuPgJOGENL7thsbmkAOZrynDiRikfuFtptR245Ca
 cMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dr5qY8NyHjVYH13UhDsjPOas2xGcDA+M5geFB4xe7/8=;
 b=VKNbE4gRK0bDmKp3E5Y+rv1SZDMvoAzrNOyV7fNvoFY1P6PxZ5bsNV5F5KIj2Ft0Le
 FqSr9cF3mspI3HaYgQ1CQhrtfpCloCdF2uiJHrp3O0b4zAw2D886vWHYfWxpIoz+MN/c
 7RidGHBzezQlH7evlpzn37LLiv6sXwedARHEIyBfu4SbFKjxaasIZTFg40qj7jMZUlOF
 W3uisH3EGoNJD88+XKTTu241RHoybExBZMcYNRw1bXKRqO5s9GVGUW0eerh2CZB/mlLw
 8V/Mx9cYkGryos9ReZKpwUVZiJpfQUhY9yDeYqMJ3pXKUkMY63aJF5+en+htV4MKUeIC
 ewnw==
X-Gm-Message-State: AOAM532fn1xHMUcFx0vWSXZJBeOYMtw+Y233hj/LXOv++kgeqW5IiLgB
 DStAdMKlJXIpdeccmyH/qz8=
X-Google-Smtp-Source: ABdhPJzYMoq3NBhxi7krevICequtWJEfWgUgrtHrAsDTen8PZkYoq9k8IB4yxGcw4QJ+afcOnH6Fnw==
X-Received: by 2002:a17:902:7001:b029:d3:f0d8:d271 with SMTP id
 y1-20020a1709027001b02900d3f0d8d271mr15533920plk.48.1602318392700; 
 Sat, 10 Oct 2020 01:26:32 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id w135sm3681015pfc.103.2020.10.10.01.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2020 01:26:31 -0700 (PDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20201009162030.293781-1-anant.thazhemadam@gmail.com>
 <20201010070007.GB132110@kroah.com>
 <b84879e9-425e-6354-d21a-cd7c5d237be5@gmail.com>
 <20201010080904.GA140279@kroah.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <0abda8b5-a05c-814f-6230-c88e81d5a3d0@gmail.com>
Date: Sat, 10 Oct 2020 13:56:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201010080904.GA140279@kroah.com>
Content-Language: en-US
Cc: devel@driverdev.osuosl.org,
 syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com,
 Ian Abbott <abbotti@mev.co.uk>, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: comedi: check validity
 of wMaxPacketSize of usb endpoints found
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


On 10/10/20 1:39 pm, Greg Kroah-Hartman wrote:
> On Sat, Oct 10, 2020 at 07:29:13AM +0530, Anant Thazhemadam wrote:
>> Hi,
>>
>> On 10-10-2020 12:30, Greg Kroah-Hartman wrote:
>>> On Fri, Oct 09, 2020 at 09:50:29PM +0530, Anant Thazhemadam wrote:
>>>> While finding usb endpoints in vmk80xx_find_usb_endpoints(), check if 
>>>> wMaxPacketSize = 0 for the endpoints found.
>>>>
>>>> Some devices have isochronous endpoints that have wMaxPacketSize = 0
>>>> (as required by the USB-2 spec).
>>>> However, since this doesn't apply here, wMaxPacketSize = 0 can be
>>>> considered to be invalid.
>>>>
>>>> Reported-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
>>>> Tested-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
>>>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>>>> ---
>>> You sent 2 patches with the same subject, which one is the "latest" one?
>> This patch (that you have replied to) is the "latest" one.
>>
>>> Please always version your patches and put below the --- line what
>>> changed from the previous version, so that maintainers have a chance to
>>> know which to accept...
>> The other patch (with the same subject line) wasn't supposed to be sent out.
>> I realized there was a coding style error in that while sending, and cancelled
>> sending it, but it got sent nonetheless.
>> I would have included a v2 tag in this patch itself, but I didn't realize that the
>> previous one got sent until afterwards. :(
>> I'm sorry for that.
>>
>>> Can you fix this up and send a v3?
>> Shouldn't I resend this patch as a v2 instead? Since there wouldn't be any
>> changes from v2 (this patch) to v3 otherwise (unless of course, somebody could
>> suggest some more changes that could be made to this patch itself).
> The change would be that you are correctly listing the version
> information, so it would be v3 :)
>
Understood, thank you. I will send in a v3 as advised. :)

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
