Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E0FC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:15:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6230621481
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXVPXNzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6230621481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0754D86E96;
	Thu,  1 Oct 2020 07:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuDjxcNAtkei; Thu,  1 Oct 2020 07:15:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79A1A86990;
	Thu,  1 Oct 2020 07:15:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60AAFC0889;
	Thu,  1 Oct 2020 07:15:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CE7AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 84BDD87292
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPou7bcIj+DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:14:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D58058728C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:14:58 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id s14so1128437pju.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 00:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=18fd+b9fo3bpVH9WuxwKWQwMWeREwL5PYoJv7GOY6EU=;
 b=OXVPXNzZq/Twzr/dCO6q6XBAWGHRsIEhePpIDDxzJXtDc7AMru4T68vlO73LZOCz14
 53sllW9RCdDYj/6sk6fLZv33OaVJ+QcvDUFkmLCjzD9dbB1oB42pLsnNZ39Z+wmGPKB/
 l95Akp90cQ8woNmnEqahiVRAs1+MrV4BGpVd/H3ynDlcECKwT78YgYX7QNkSO1wxkCqB
 Ldff1DUAFQIHA6fCqEtR3SxfdiLNdWD6rs+ZyQKPNsJ6jLkdA3/JijbSPDViH+0Ohg4k
 jz/+FaADMP83bcyAdLL7WyZf16BqteiGE4tQvsbZhW9b8IKzjAPHieCajRB3/KXmLq0B
 ezcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=18fd+b9fo3bpVH9WuxwKWQwMWeREwL5PYoJv7GOY6EU=;
 b=PnrLD7rKfgBtFXbPMiYOAFyNekBWwZWspXUUaAywOWgi+8lrKvNPojYPqZH4LZWh8s
 l9FlimOJMqtOq9Y1fjyTW13DD0IqUmOWv+ZJx1+lxE0Wp1jXukwy0sVMRevNH5E0i48I
 MCeSDgfIJakbYq67bD2pr8ov3xigc6pEFRLUx9VHiz+AUd6XbzsGQkJQRCtpftfJCtYa
 k5tz4k0+xYfSEdvVeIYpsa7RXOsaCQ1TRtASgx9z7eVaL9ov0jm5ltI2QY6gb86THqJI
 Rd428dyjXbRNaVSPCBpvpGhJlDfUCfnggnJ/WdWDo/npN96Wm8UsMbcy22WMcGrGvmYx
 slJQ==
X-Gm-Message-State: AOAM533FmO83VPYWt61h0PHnMCAeySwQ7wiDGa/kYIpVLMVsetwv9rd+
 11qxcAMJDMTBXPAXZUDLETw=
X-Google-Smtp-Source: ABdhPJwRy468l0C0QhC9Nd/Kmg3aQ5duyQdN1MXlk0LyeQMOnxB8rD3WXbE9pTpdnI2alzEHKoJJyw==
X-Received: by 2002:a17:90b:3852:: with SMTP id
 nl18mr5964487pjb.78.1601536498233; 
 Thu, 01 Oct 2020 00:14:58 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.212.76])
 by smtp.gmail.com with ESMTPSA id j4sm4860185pfd.101.2020.10.01.00.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 00:14:57 -0700 (PDT)
To: Marcel Holtmann <marcel@holtmann.org>
References: <20200905020410.20350-1-anant.thazhemadam@gmail.com>
 <2AEF86AF-8F80-4B01-B506-D2ABC654DBC7@holtmann.org>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <9b8f5993-9956-5a57-89d6-f5ae36e59038@gmail.com>
Date: Thu, 1 Oct 2020 12:44:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2AEF86AF-8F80-4B01-B506-D2ABC654DBC7@holtmann.org>
Content-Language: en-US
Cc: linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Fix uninit-value in
 hci_chan_lookup_handle
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


On 26/09/20 1:16 pm, Marcel Holtmann wrote:
> Hi Anant,
>
>> When the amount of data stored in the location corresponding to
>> iov_iter *from is less then 4, some data seems to go uninitialized.
>>
>> Updating this condition accordingly, makes sense both intuitively and 
>> logically as well, since the other check for extreme condition done is if
>> len > HCI_MAX_FRAME_SIZE, which is HCI_MAX_ACL_SIZE (which is 1024) + 4;
>> which itself gives some idea about what must be the ideal mininum size.
>>
>> Reported-and-tested by: syzbot+4c14a8f574461e1c3659@syzkaller.appspotmail.com
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> ---
>> If there is some explicit reason why len < 4 doesn't work, and only len < 2 works, 
>> please do let me know.
>> The commit message that introduced the initial change 
>> (512b2268156a4e15ebf897f9a883bdee153a54b7) wasn't exactly very helpful in this 
>> respect, and I couldn't find a whole lot of discussion regarding this either.
>>
>> drivers/bluetooth/hci_vhci.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
>> index 8ab26dec5f6e..0c49821d7b98 100644
>> --- a/drivers/bluetooth/hci_vhci.c
>> +++ b/drivers/bluetooth/hci_vhci.c
>> @@ -159,7 +159,7 @@ static inline ssize_t vhci_get_user(struct vhci_data *data,
>> 	__u8 pkt_type, opcode;
>> 	int ret;
>>
>> -	if (len < 2 || len > HCI_MAX_FRAME_SIZE)
>> +	if (len < 4 || len > HCI_MAX_FRAME_SIZE)
>> 		return -EINVAL;
> so the minimum requirement is to have an 1 octet packet indicator. If some other functions are missing length checks, then it should be fixed there. I see that in case of HCI_VENDOR_PKT we need to check for the 2nd octet to be present, but I have no idea why you require 3 octets minimum. As I said, if so, then the other functions that get called require proper range checks.
>
> Regards
>
> Marcel

Ah, I see. That makes sense, and I'm sorry for this. I just thought since
HCI_MAX_FRAME_SIZE was 4 more than 1024, min. len might have to be 4.
Taking a look at the reproducer, it becomes evident that the only reason this
patch didn't trigger an issue was because the reproducer ran with len = 3.

I don't really have a strong enough clue yet about where things are going wrong, so I'd
appreciate any guidance/insight into this, and where I should be looking. :/

Also, although the bug says it is only an uninit-value, it eventually ends up triggering
a kernel panic (looking at a log rather than a report shows that as well).

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
