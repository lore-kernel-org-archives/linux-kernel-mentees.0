Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E133CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 17:54:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7A960F58
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 17:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B7A960F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C55140113;
	Fri, 20 Aug 2021 17:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uEa6xiAELdUh; Fri, 20 Aug 2021 17:53:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5574840253;
	Fri, 20 Aug 2021 17:53:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 401D7C001A;
	Fri, 20 Aug 2021 17:53:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98103C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 17:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79A5B4021B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 17:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExKgCmZhATIZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 17:53:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 522EA40219
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 17:53:53 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e15so6370692plh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wGEmsQipr5gzuljiPseq2A0Fn1otMeloCg6zZW6nEZM=;
 b=Z7iolNUcZI7SC3hr+wJwvmRBysaz9H/26a5BtromWHnFojn2eMmJX7iO+ARXKVgNRo
 P26oAv6NLCeH2FS7F5rk3ovdhh5nOJbsgoXdt8y0ZwoWM5Z7dS+ObBGpySxUuO9/mPM2
 +kVF4Cd0On7pNvyIv58CBmKNMGvOl2/fypV67NpUYt9p2bvHbAdBb/ypvTs9n2QHozJY
 zXGIZo7Wq082AqdIqvmKIaUEXad6z114VT+WUYOJ7z6SNuDMDz4BbF99h2eFE3IIefyg
 8xfH34vDfYbbeBC3VzQu+pB1x1svtypQql7yl7dvjNC7GCFDTtpyLWo2UA7qHVqZZJSn
 jDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wGEmsQipr5gzuljiPseq2A0Fn1otMeloCg6zZW6nEZM=;
 b=ovnq9IdTnnQoOgd/ISIGEbfUmmxepwX54EieHTphUPNPYJC0E87umGUFIUbDN++BZ4
 xiFn0+SR2t/2aWCVbvflvbJHj9Ni7yqwtvHRD5lU+YkELaemvBQmYriO8mrvcJtRm2xC
 NOHNkz10REtghwe+muXd2Ntja9rNLn0qu1LCdyweH9HKgd+oQVHxCfoPuFXfWTILBbBV
 776EmfHEGVgGJBAmCCXbtXBHpvqToLrE0oQH58nZ0U489bU5sj3PyMOoibNSZl4JVgRf
 vfJTIMhTI18qmTm0pC30Y0vqsdSkVu3xEusOcgf+s2unEaWdkzh27td2n7/s6/kAS0B7
 F3qQ==
X-Gm-Message-State: AOAM532q9VYMYDBfd706I7EdWWfIkkHbbZNr/aElHG5XmfMpO/TGIeXL
 pBNBTFBMmWS0vJjf+3hYE5A=
X-Google-Smtp-Source: ABdhPJycAHJDcAUXZIxndEcPoSl619LFgLTgEMLLDpnLHIsB4NecSA18q3/B2VgxNkvcnM5UX5E4uQ==
X-Received: by 2002:a17:902:8506:b029:12c:76a8:d1b8 with SMTP id
 bj6-20020a1709028506b029012c76a8d1b8mr17413188plb.14.1629482032699; 
 Fri, 20 Aug 2021 10:53:52 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id m2sm8883434pgu.15.2021.08.20.10.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 10:53:52 -0700 (PDT)
Subject: Re: [PATCH v2] btrfs: fix rw device counting in
 __btrfs_free_extra_devids
To: dsterba@suse.cz, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com,
 anand.jain@oracle.com, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210812103851.GC5047@twin.jikos.cz>
 <3c48eec9-590c-4974-4026-f74cafa5ac48@gmail.com>
 <20210812155032.GL5047@twin.jikos.cz>
 <1e0aafb2-9e55-5f64-d347-1765de0560c5@gmail.com>
 <20210813085137.GQ5047@twin.jikos.cz>
 <a5690ae1-28ba-a933-6473-e9c1e5480f0c@gmail.com>
 <20210813103032.GR5047@twin.jikos.cz>
 <89172356-335f-1ca3-d3a2-78fac7ef93fb@gmail.com>
 <20210819173403.GI5047@twin.jikos.cz>
 <e9c5bb00-b609-aff9-fc95-ca1c5b9c2899@gmail.com>
 <20210820105828.GN5047@twin.jikos.cz>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <e1bce692-b233-2d74-f366-dc0ec43ead84@gmail.com>
Date: Sat, 21 Aug 2021 01:53:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820105828.GN5047@twin.jikos.cz>
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

On 20/8/21 6:58 pm, David Sterba wrote:
> On Fri, Aug 20, 2021 at 11:09:05AM +0800, Desmond Cheong Zhi Xi wrote:
>> On 20/8/21 1:34 am, David Sterba wrote:
>>> On Fri, Aug 20, 2021 at 01:11:58AM +0800, Desmond Cheong Zhi Xi wrote:
>>>>>>> The option #2 does not sound safe because the TGT bit is checked in
>>>>>>> several places where device list is queried for various reasons, even
>>>>>>> without a mounted filesystem.
>>>>>>>
>>>>>>> Removing the assertion makes more sense but I'm still not convinced that
>>>>>>> the this is expected/allowed state of a closed device.
>>>>>>>
>>>>>>
>>>>>> Would it be better if we cleared the REPLACE_TGT bit only when closing
>>>>>> the device where device->devid == BTRFS_DEV_REPLACE_DEVID?
>>>>>>
>>>>>> The first conditional in btrfs_close_one_device assumes that we can come
>>>>>> across such a device. If we come across it, we should properly reset it.
>>>>>>
>>>>>> If other devices has this bit set, the ASSERT will still catch it and
>>>>>> let us know something is wrong.
>>>>>
>>>>> That sounds great.
>>>>>
>>>>>> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
>>>>>> index 70f94b75f25a..a5afebb78ecf 100644
>>>>>> --- a/fs/btrfs/volumes.c
>>>>>> +++ b/fs/btrfs/volumes.c
>>>>>> @@ -1130,6 +1130,9 @@ static void btrfs_close_one_device(struct btrfs_device *device)
>>>>>>                     fs_devices->rw_devices--;
>>>>>>             }
>>>>>>      
>>>>>> +       if (device->devid == BTRFS_DEV_REPLACE_DEVID)
>>>>>> +               clear_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state);
>>>>>> +
>>>>>>             if (test_bit(BTRFS_DEV_STATE_MISSING, &device->dev_state))
>>>>>>                     fs_devices->missing_devices--;
>>>>>
>>>>> I'll do a few test rounds, thanks.
>>>>
>>>> Just following up. Did that resolve the issue or is further
>>>> investigation needed?
>>>
>>> The fix seems to work, I haven't seen the assertion fail anymore,
>>> incidentally the crash also stopped to show up on an unpatched branch.
>>>
>>
>> Sounds good, thanks for the update. If there's anything else I can help
>> with, please let me know.
> 
> So are you going to send the patch with the fix?
> 

Right, just sent. For some reason I thought it was already patched.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
