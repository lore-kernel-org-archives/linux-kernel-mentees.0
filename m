Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E566C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 03:09:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17F66108B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 03:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D17F66108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9673C40710;
	Fri, 20 Aug 2021 03:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QTtVgM0MqNZ; Fri, 20 Aug 2021 03:09:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9F62940631;
	Fri, 20 Aug 2021 03:09:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8430BC001C;
	Fri, 20 Aug 2021 03:09:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA14CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CADD660B5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-vOyrLWnwBH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:09:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DE2960011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 03:09:11 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id m26so7375247pff.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 20:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qCF4/seF7RLY1q6lnR93coNbkwtTN6+2XurjY+dQfE4=;
 b=MpVDd8OIwStYu3cwSGBo2H4zWmi0UVtlkW5aK8+VgORn6NI4Jn/bj283M3cOC9nBTL
 Ry0gyxlkP0H+tVd1gsA9ZN2R9UK1OZe6I0XaH470Y2gfrt0V/8CFQK39bgAeVPN3GL16
 OYcGkL9GliahrPQ9w9MdyCdgzEnjoePEJqe1W6kS5zIwsuL5oe1vwXdt4rdPewCHc4//
 Wwurxy18x2zbd+QcUR0iL7UlFiouhCQeMhB3ahGpEGvSFJPr+OgjbcyuWZ/L/ZtzuQ4N
 LNNlOSnnY0P6znJy7gO6AccrReFLTT9hyL1OqEIMh/thTJ+YLuuv7I9axmClvSUq+OmN
 sluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qCF4/seF7RLY1q6lnR93coNbkwtTN6+2XurjY+dQfE4=;
 b=ekl4bznQ3qjimJs1suixvFP4yG1+GIpNiJxF/xDYvOLW3pQXtewLVe4SWed6METWbq
 jtHzcMDwjsSN+BxvP5RZqR5l3xMjSkwZPfhjKtKf2oKRtRA8C3gnVHIJoQgsdrwkIGfG
 VmlSVVZJt/amA3WBYtTUZTnPEl28uGKmr0oVIar73BppZaCEaHrknes78AryTcw4yOrF
 mv8t3XZ36CPOcSPM4+lmv0nBpNHFl2lygXH1fAcb/dBNsMNGpar/1l0dUYh+CdJNJeIJ
 EJLqFUeKkydCwDdSZjvOCKFkgUOKBRnxdTqhRPna6cPjqtHNuLPO2PhRiWqQFlt0m0vw
 b53A==
X-Gm-Message-State: AOAM531qeh1LUHHuWghE5nWxbTEvqpUdWZIDhtIy6eh1K2sVXX0g1/9Q
 FrsFSEoBtZUm8Egvlpkjegk=
X-Google-Smtp-Source: ABdhPJwWvTRLKgPLJGt0czPA0HrZCZM/JaeHbR+IDCn0cIskZrWmoZRFUVcQBLzAI4OPfbw4Hhi6eQ==
X-Received: by 2002:a62:864b:0:b029:3c7:7197:59fc with SMTP id
 x72-20020a62864b0000b02903c7719759fcmr17470644pfd.59.1629428950608; 
 Thu, 19 Aug 2021 20:09:10 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id f5sm5365847pfe.128.2021.08.19.20.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 20:09:09 -0700 (PDT)
Subject: Re: [PATCH v2] btrfs: fix rw device counting in
 __btrfs_free_extra_devids
To: dsterba@suse.cz, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com,
 anand.jain@oracle.com, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210727071303.113876-1-desmondcheongzx@gmail.com>
 <20210812103851.GC5047@twin.jikos.cz>
 <3c48eec9-590c-4974-4026-f74cafa5ac48@gmail.com>
 <20210812155032.GL5047@twin.jikos.cz>
 <1e0aafb2-9e55-5f64-d347-1765de0560c5@gmail.com>
 <20210813085137.GQ5047@twin.jikos.cz>
 <a5690ae1-28ba-a933-6473-e9c1e5480f0c@gmail.com>
 <20210813103032.GR5047@twin.jikos.cz>
 <89172356-335f-1ca3-d3a2-78fac7ef93fb@gmail.com>
 <20210819173403.GI5047@twin.jikos.cz>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <e9c5bb00-b609-aff9-fc95-ca1c5b9c2899@gmail.com>
Date: Fri, 20 Aug 2021 11:09:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819173403.GI5047@twin.jikos.cz>
Content-Language: en-US
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

On 20/8/21 1:34 am, David Sterba wrote:
> On Fri, Aug 20, 2021 at 01:11:58AM +0800, Desmond Cheong Zhi Xi wrote:
>>>>> The option #2 does not sound safe because the TGT bit is checked in
>>>>> several places where device list is queried for various reasons, even
>>>>> without a mounted filesystem.
>>>>>
>>>>> Removing the assertion makes more sense but I'm still not convinced that
>>>>> the this is expected/allowed state of a closed device.
>>>>>
>>>>
>>>> Would it be better if we cleared the REPLACE_TGT bit only when closing
>>>> the device where device->devid == BTRFS_DEV_REPLACE_DEVID?
>>>>
>>>> The first conditional in btrfs_close_one_device assumes that we can come
>>>> across such a device. If we come across it, we should properly reset it.
>>>>
>>>> If other devices has this bit set, the ASSERT will still catch it and
>>>> let us know something is wrong.
>>>
>>> That sounds great.
>>>
>>>> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
>>>> index 70f94b75f25a..a5afebb78ecf 100644
>>>> --- a/fs/btrfs/volumes.c
>>>> +++ b/fs/btrfs/volumes.c
>>>> @@ -1130,6 +1130,9 @@ static void btrfs_close_one_device(struct btrfs_device *device)
>>>>                    fs_devices->rw_devices--;
>>>>            }
>>>>     
>>>> +       if (device->devid == BTRFS_DEV_REPLACE_DEVID)
>>>> +               clear_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state);
>>>> +
>>>>            if (test_bit(BTRFS_DEV_STATE_MISSING, &device->dev_state))
>>>>                    fs_devices->missing_devices--;
>>>
>>> I'll do a few test rounds, thanks.
>>
>> Just following up. Did that resolve the issue or is further
>> investigation needed?
> 
> The fix seems to work, I haven't seen the assertion fail anymore,
> incidentally the crash also stopped to show up on an unpatched branch.
> 

Sounds good, thanks for the update. If there's anything else I can help 
with, please let me know.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
