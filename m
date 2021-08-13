Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EB7C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 09:57:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F4960F11
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 09:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3F4960F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90EE280E8C;
	Fri, 13 Aug 2021 09:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FYw510zsFm4; Fri, 13 Aug 2021 09:57:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 783CD80E89;
	Fri, 13 Aug 2021 09:57:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5364EC0010;
	Fri, 13 Aug 2021 09:57:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 087E0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA5D94015D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dk3MD7wGhIok
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:57:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE593400BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:57:30 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id w6so4208013plg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9xa/or2zxfta9oIL9kxRKvoHo2J2T3dhJfuhqbaXIeo=;
 b=TnRnbwEDqi2Z7C11syAIEg2i18vdZU6bq60UAK6ruk07i6PR8MZzRObxH3GvEp6D0d
 PDaxSLu0CJHNjdw90AnYSyv/wthRIb4yULF5a9AMn6pE8v+2xhOU4NExcZVdaXWPs911
 fdaoMX8dGkf+bdMrtIyTShDKpkUA8q3Wn7bFsbnOTw1An/GwNTE3728ODs7ojmBiK1te
 8Hf8Ud8VnQNh1LnqH7yBrKegx+qrKWbrVHf2lZZhvVMtiWp9a79hAxbxkdUtQ4aqpAZi
 0dN733nLYoTqVbUVhCL1vsod038817+SVFeqF80C1yO6Zoy2VPtOPVadlADdqYx+VPbh
 6FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9xa/or2zxfta9oIL9kxRKvoHo2J2T3dhJfuhqbaXIeo=;
 b=bkhwWXxgIFlpuAELUitGAsq3/7odCzxWy7FVQqspvMw+F089xefcQvU5tQyyuVto05
 atEHN8nncjwxY2921Oh95Idt+vtmKbWmu8JPzCeAHOqkuiVt0NM9KuEHh30aHSVTrcc4
 CfWrLFTXdMLn5gQHaSqeolHck8uqpopJhAYRt/5podTAagZ5QyPuGj7niB0Mdt46KI69
 1NZBHOfd4OAZtYcwISYsiJKUHBl1fc7v0v5TPnQusu5NxDZH1PYo5F8ztSTYwJnK9qD8
 /54VmgEZfMDGiOxjorU2LfgXxstnuK9Z8kb0fSo+Em7uJoMEKH6dNIl0swfD+zAbEUep
 6mqg==
X-Gm-Message-State: AOAM530GaVdlEAI3tbj6nBnARZRtkROj4V5R9WzjR5iWUqNwNPsJEBaK
 ITI5VC0aO4jD/A2LtK+6EyM=
X-Google-Smtp-Source: ABdhPJzKdbgaBb4P2cq2gHPEJDTB6yvGo84XdpAE/xhurXpQVdOord4XeZd1DoDZUFDmq96kkg5knQ==
X-Received: by 2002:a17:903:1d1:b029:12d:55d4:5ef7 with SMTP id
 e17-20020a17090301d1b029012d55d45ef7mr1452552plh.76.1628848650362; 
 Fri, 13 Aug 2021 02:57:30 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n32sm2022806pgl.69.2021.08.13.02.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 02:57:29 -0700 (PDT)
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
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <a5690ae1-28ba-a933-6473-e9c1e5480f0c@gmail.com>
Date: Fri, 13 Aug 2021 17:57:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813085137.GQ5047@twin.jikos.cz>
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

On 13/8/21 4:51 pm, David Sterba wrote:
> On Fri, Aug 13, 2021 at 01:31:25AM +0800, Desmond Cheong Zhi Xi wrote:
>> On 12/8/21 11:50 pm, David Sterba wrote:
>>> On Thu, Aug 12, 2021 at 11:43:16PM +0800, Desmond Cheong Zhi Xi wrote:
>>>> On 12/8/21 6:38 pm, David Sterba wrote:
>>>>> On Tue, Jul 27, 2021 at 03:13:03PM +0800, Desmond Cheong Zhi Xi wrote:
>>>>>> --- a/fs/btrfs/volumes.c
>>>>>> +++ b/fs/btrfs/volumes.c
>>>>>> @@ -1078,6 +1078,7 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
>>>>>>     		if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
>>>>>>     			list_del_init(&device->dev_alloc_list);
>>>>>>     			clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
>>>>>> +			fs_devices->rw_devices--;
>>>>>>     		}
>>>>>>     		list_del_init(&device->dev_list);
>>>>>>     		fs_devices->num_devices--;
>>>>>
>>>>> I've hit a crash on master branch with stacktrace very similar to one
>>>>> this bug was supposed to fix. It's a failed assertion on device close.
>>>>> This patch was the last one to touch it and it matches some of the
>>>>> keywords, namely the BTRFS_DEV_STATE_REPLACE_TGT bit that used to be in
>>>>> the original patch but was not reinstated in your fix.
>>>>>
>>>>> I'm not sure how reproducible it is, right now I have only one instance
>>>>> and am hunting another strange problem. They could be related.
>>>>>
>>>>> assertion failed: !test_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state), in fs/btrfs/volumes.c:1150
>>>>>
>>>>> https://susepaste.org/view/raw/18223056 full log with other stacktraces,
>>>>> possibly relatedg
>>>>>
>>>>
>>>> Looking at the logs, it seems that a dev_replace was started, then
>>>> suspended. But it wasn't canceled or resumed before the fs devices were
>>>> closed.
>>>>
>>>> I'll investigate further, just throwing some observations out there.
>>>
>>> Thanks. I'm testing the patch revert, no crash after first loop, I'll
>>> run a few more to be sure as it's not entirely reliable.
>>>
>>> Sending the revert is option of last resort as we're approaching end of
>>> 5.14 dev cycle and the crash prevents testing (unlike the fuzzer
>>> warning).
>>>
>>
>> I might be missing something, so any thoughts would be appreciated. But
>> I don't think the assertion in btrfs_close_one_device is correct.
>>
>>   From what I see, this crash happens when close_ctree is called while a
>> dev_replace hasn't completed. In close_ctree, we suspend the
>> dev_replace, but keep the replace target around so that we can resume
>> the dev_replace procedure when we mount the root again. This is the call
>> trace:
>>
>>     close_ctree():
>>       btrfs_dev_replace_suspend_for_unmount();
>>       btrfs_close_devices():
>>         btrfs_close_fs_devices():
>>           btrfs_close_one_device():
>>             ASSERT(!test_bit(BTRFS_DEV_STATE_REPLACE_TGT,
>> &device->dev_state));
>>
>> However, since the replace target sticks around, there is a device with
>> BTRFS_DEV_STATE_REPLACE_TGT set, and we fail the assertion in
>> btrfs_close_one_device.
>>
>> Two options I can think of:
>>
>> - We could remove the assertion.
>>
>> - Or we could clear the BTRFS_DEV_STATE_REPLACE_TGT bit in
>> btrfs_dev_replace_suspend_for_unmount. This is fine since the bit is set
>> again in btrfs_init_dev_replace if the dev_replace->replace_state is
>> BTRFS_IOCTL_DEV_REPLACE_STATE_SUSPENDED. But this approach strikes me as
>> a little odd because the device is still the replace target when
>> mounting in the future.
> 
> The option #2 does not sound safe because the TGT bit is checked in
> several places where device list is queried for various reasons, even
> without a mounted filesystem.
> 
> Removing the assertion makes more sense but I'm still not convinced that
> the this is expected/allowed state of a closed device.
> 

Would it be better if we cleared the REPLACE_TGT bit only when closing
the device where device->devid == BTRFS_DEV_REPLACE_DEVID?

The first conditional in btrfs_close_one_device assumes that we can come
across such a device. If we come across it, we should properly reset it.

If other devices has this bit set, the ASSERT will still catch it and
let us know something is wrong.

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 70f94b75f25a..a5afebb78ecf 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -1130,6 +1130,9 @@ static void btrfs_close_one_device(struct btrfs_device *device)
                 fs_devices->rw_devices--;
         }
  
+       if (device->devid == BTRFS_DEV_REPLACE_DEVID)
+               clear_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state);
+
         if (test_bit(BTRFS_DEV_STATE_MISSING, &device->dev_state))
                 fs_devices->missing_devices--;

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
