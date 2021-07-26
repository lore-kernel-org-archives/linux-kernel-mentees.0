Return-Path: <SRS0=f8HV=MS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C3AC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 23:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B927B60F23
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 23:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B927B60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 806EA83104;
	Mon, 26 Jul 2021 23:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3FUDTS9nbei; Mon, 26 Jul 2021 23:07:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6210283134;
	Mon, 26 Jul 2021 23:07:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B310C0010;
	Mon, 26 Jul 2021 23:07:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07CA8C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 23:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3188607C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 23:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-7SEKMINWeh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 23:07:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7A2D607B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 23:07:35 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id f13so3049312plj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 16:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=AwUvxXZHVPsyjIzRGNqW1mOJYEUo+Lp4e2HNQ223/bA=;
 b=A19W7RcVR2+BXMVRobALqb2deqUdwsNvTKi98r3pJE+//k1t+Z3Kf0kqW5A7CUFyzp
 rV2gNqM0nUXkvrXILnHN8Z+vZCg9uYVgZIEUMeHhPS0LpxpfXhY3a1zb6xdX5kVh3w02
 2aLf+AAzVXKwbAt5WaJvuXzzdU+P0vhhgJsLRZEF2pYPLdgHDkWMp1wqIk4AjKuqQpAo
 jKQedlS88RLoqAj6W2qlpCDBcE134Qgt9nIb32584nn06liSFz55Zaq/5K3uIMl6W7QJ
 UC9s3HxHfKSc+K/xDguB0N8iSBdNTZL9uQlF86M1/FuAHdFgk9FvO+wKLhxZx5I1tX1A
 iJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AwUvxXZHVPsyjIzRGNqW1mOJYEUo+Lp4e2HNQ223/bA=;
 b=Vs1UljCLSX75CmbfRRfTV2GFtIITs6oFNZab+i3s0r9pzBNtaiQ+ZslM5dWgLL9iGz
 EdnHV+Jt9CELK7rkrpjjcB4NzWr4hoIc+FZ9yc86G4coDJtEspp/HiJexIlTG7Qu6wPs
 VqbGrWKvciA8t6XQMCkOD9VLO2T9rPRjPwjEPUTjFGcFW/lvCPnk7nDFXbfY53am+nJo
 lJjLGntoCpboGYYdR733Qk04yMnZc+J/PS0LasOZdY3stabiD1cRttH5yP1lRw7rls+Q
 bPzQnN8kPvqtXkoOg9Cu5yDBmncLJFf2bmLHX9YmpVGd0TS5U0Hv+1oj8bvmSsGK3+HD
 wnCg==
X-Gm-Message-State: AOAM532tdzlfYnmxGamVMZrld4WmVQKTTlhIG8VOFygynRDNrHbVOfcb
 W53Vqs9Nu5bKzPzXz1Umo7A=
X-Google-Smtp-Source: ABdhPJwoZxPJExUlpSho1Z/Kk7xcNz6HMwYGoiNrQuLkw2CGJrUSAY8aA/TCEpL1riTV5EczLXq38w==
X-Received: by 2002:a17:90a:4417:: with SMTP id
 s23mr1255250pjg.228.1627340855282; 
 Mon, 26 Jul 2021 16:07:35 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id r13sm913715pgi.78.2021.07.26.16.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 16:07:34 -0700 (PDT)
Subject: Re: [PATCH] btrfs: fix rw device counting in __btrfs_free_extra_devids
To: dsterba@suse.cz, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com,
 anand.jain@oracle.com, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210715103403.176695-1-desmondcheongzx@gmail.com>
 <20210721175938.GP19710@twin.jikos.cz>
 <9119934f-fb61-3b55-655c-9a7552e0b30b@gmail.com>
 <20210726175230.GH5047@twin.jikos.cz>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <39398f63-9220-c5ab-04a9-6e5186e1c0da@gmail.com>
Date: Tue, 27 Jul 2021 07:07:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726175230.GH5047@twin.jikos.cz>
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

On 27/7/21 1:52 am, David Sterba wrote:
> On Sun, Jul 25, 2021 at 02:19:52PM +0800, Desmond Cheong Zhi Xi wrote:
>> On 22/7/21 1:59 am, David Sterba wrote:
>>> On Thu, Jul 15, 2021 at 06:34:03PM +0800, Desmond Cheong Zhi Xi wrote:
>>>> Syzbot reports a warning in close_fs_devices that happens because
>>>> fs_devices->rw_devices is not 0 after calling btrfs_close_one_device
>>>> on each device.
>>>>
>>>> This happens when a writeable device is removed in
>>>> __btrfs_free_extra_devids, but the rw device count is not decremented
>>>> accordingly. So when close_fs_devices is called, the removed device is
>>>> still counted and we get an off by 1 error.
>>>>
>>>> Here is one call trace that was observed:
>>>>     btrfs_mount_root():
>>>>       btrfs_scan_one_device():
>>>>         device_list_add();   <---------------- device added
>>>>       btrfs_open_devices():
>>>>         open_fs_devices():
>>>>           btrfs_open_one_device();   <-------- rw device count ++
>>>>       btrfs_fill_super():
>>>>         open_ctree():
>>>>           btrfs_free_extra_devids():
>>>> 	  __btrfs_free_extra_devids();  <--- device removed
>>>> 	  fail_tree_roots:
>>>> 	    btrfs_close_devices():
>>>> 	      close_fs_devices();   <------- rw device count off by 1
>>>>
>>>> Fixes: cf89af146b7e ("btrfs: dev-replace: fail mount if we don't have replace item with target device")
>>>
>>> What this patch did in the last hunk was the rw_devices decrement, but
>>> conditional:
>>>
>>> @@ -1080,9 +1071,6 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
>>>                   if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
>>>                           list_del_init(&device->dev_alloc_list);
>>>                           clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
>>> -                       if (!test_bit(BTRFS_DEV_STATE_REPLACE_TGT,
>>> -                                     &device->dev_state))
>>> -                               fs_devices->rw_devices--;
>>>                   }
>>>                   list_del_init(&device->dev_list);
>>>                   fs_devices->num_devices--;
>>> ---
>>>
>>>
>>>> @@ -1078,6 +1078,7 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
>>>>    		if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
>>>>    			list_del_init(&device->dev_alloc_list);
>>>>    			clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
>>>> +			fs_devices->rw_devices--;
>>>>    		}
>>>>    		list_del_init(&device->dev_list);
>>>>    		fs_devices->num_devices--;
>>>
>>> So should it be reinstated in the original form? The rest of
>>> cf89af146b7e handles unexpected device replace item during mount.
>>>
>>> Adding the decrement is correct, but right now I'm not sure about the
>>> corner case when teh devcie has the BTRFS_DEV_STATE_REPLACE_TGT bit set.
>>> The state machine of the device bits and counters is not trivial so
>>> fixing it one way or the other could lead to further syzbot reports if
>>> we don't understand the issue.
>>>
>>
>> Hi David,
>>
>> Thanks for raising this issue. I took a closer look and I think we don't
>> have to reinstate the original form because it's a historical artifact.
>>
>> The short version of the story is that going by the intention of
>> __btrfs_free_extra_devids, we skip removing the replace target device.
>> Hence, by the time we've reached the decrement in question, the device
>> is not the replace target device and the BTRFS_DEV_STATE_REPLACE_TGT bit
>> should not be set.
>>
>> But we should also try to understand the original intention of the code.
>> The check in question was first introduced in commit 8dabb7420f01
>> ("Btrfs: change core code of btrfs to support the device replace
>> operations"):
>>> @@ -536,7 +553,8 @@ void btrfs_close_extra_devices(struct btrfs_fs_devices *fs_devices)
>>>                  if (device->writeable) {
>>>                          list_del_init(&device->dev_alloc_list);
>>>                          device->writeable = 0;
>>> -                       fs_devices->rw_devices--;
>>> +                       if (!device->is_tgtdev_for_dev_replace)
>>> +                               fs_devices->rw_devices--;
>>>                  }
>>>                  list_del_init(&device->dev_list);
>>>                  fs_devices->num_devices--;
>>
>> If we take a trip back in time to this commit we see that
>> btrfs_dev_replace_finishing added the target device to the alloc list
>> without incrementing the rw_devices count. So this check was likely
>> originally meant to prevent under-counting of rw_devices.
>>
>> However, the situation has changed, following various fixes to
>> rw_devices counting. Commit 63dd86fa79db ("btrfs: fix rw_devices miss
>> match after seed replace") added an increment to rw_devices when
>> replacing a seed device with a writable one in btrfs_dev_replace_finishing:
>>> diff --git a/fs/btrfs/dev-replace.c b/fs/btrfs/dev-replace.c
>>> index eea26e1b2fda..fb0a7fa2f70c 100644
>>> --- a/fs/btrfs/dev-replace.c
>>> +++ b/fs/btrfs/dev-replace.c
>>> @@ -562,6 +562,8 @@ static int btrfs_dev_replace_finishing(struct btrfs_fs_info *fs_info,
>>>          if (fs_info->fs_devices->latest_bdev == src_device->bdev)
>>>                  fs_info->fs_devices->latest_bdev = tgt_device->bdev;
>>>          list_add(&tgt_device->dev_alloc_list, &fs_info->fs_devices->alloc_list);
>>> +       if (src_device->fs_devices->seeding)
>>> +               fs_info->fs_devices->rw_devices++;
>>>   
>>>          /* replace the sysfs entry */
>>>          btrfs_kobj_rm_device(fs_info, src_device);
>>
>> This was later simplified in commit 82372bc816d7 ("Btrfs: make the logic
>> of source device removing more clear") that simply decremented
>> rw_devices in btrfs_rm_dev_replace_srcdev if the replaced device was
>> writable. This meant that the rw_devices count could be incremented in
>> btrfs_dev_replace_finishing without any checks:
>>> diff --git a/fs/btrfs/dev-replace.c b/fs/btrfs/dev-replace.c
>>> index e9cbbdb72978..6f662b34ba0e 100644
>>> --- a/fs/btrfs/dev-replace.c
>>> +++ b/fs/btrfs/dev-replace.c
>>> @@ -569,8 +569,7 @@ static int btrfs_dev_replace_finishing(struct btrfs_fs_info *fs_info,
>>>          if (fs_info->fs_devices->latest_bdev == src_device->bdev)
>>>                  fs_info->fs_devices->latest_bdev = tgt_device->bdev;
>>>          list_add(&tgt_device->dev_alloc_list, &fs_info->fs_devices->alloc_list);
>>> -       if (src_device->fs_devices->seeding)
>>> -               fs_info->fs_devices->rw_devices++;
>>> +       fs_info->fs_devices->rw_devices++;
>>>   
>>>          /* replace the sysfs entry */
>>>          btrfs_kobj_rm_device(fs_info, src_device);
>>
>> Thus, given the current state of the code base, the original check is
>> now incorrect, because we want to decrement rw_devices as long as the
>> device is being removed from the alloc list.
>>
>> To further convince ourselves of this, we can take a closer look at the
>> relation between the device with devid BTRFS_DEV_REPLACE_DEVID and the
>> BTRFS_DEV_STATE_REPLACE_TGT bit for devices.
>>
>> BTRFS_DEV_STATE_REPLACE_TGT is set in two places:
>> - btrfs_init_dev_replace_tgtdev
>> - btrfs_init_dev_replace
>>
>> In btrfs_init_dev_replace_tgtdev, the BTRFS_DEV_STATE_REPLACE_TGT bit is
>> set for a device allocated with devid BTRFS_DEV_REPLACE_DEVID.
>>
>> In btrfs_init_dev_replace, the BTRFS_DEV_STATE_REPLACE_TGT bit is set
>> for the target device found with devid BTRFS_DEV_REPLACE_DEVID.
>>
>>   From both cases, we see that the BTRFS_DEV_STATE_REPLACE_TGT bit is set
>> only for the device with devid BTRFS_DEV_REPLACE_DEVID.
>>
>> It follows that if a device does not have devid BTRFS_DEV_REPLACE_DEVID,
>> then the BTRFS_DEV_STATE_REPLACE_TGT bit will not be set.
>>
>> With commit cf89af146b7e ("btrfs: dev-replace: fail mount if we don't
>> have replace item with target device"), we skip removing the device in
>> __btrfs_free_extra_devids as long as the devid is BTRFS_DEV_REPLACE_DEVID:
>>> -               if (device->devid == BTRFS_DEV_REPLACE_DEVID) {
>>> -                       /*
>>> -                        * In the first step, keep the device which has
>>> -                        * the correct fsid and the devid that is used
>>> -                        * for the dev_replace procedure.
>>> -                        * In the second step, the dev_replace state is
>>> -                        * read from the device tree and it is known
>>> -                        * whether the procedure is really active or
>>> -                        * not, which means whether this device is
>>> -                        * used or whether it should be removed.
>>> -                        */
>>> -                       if (step == 0 || test_bit(BTRFS_DEV_STATE_REPLACE_TGT,
>>> -                                                 &device->dev_state)) {
>>> -                               continue;
>>> -                       }
>>> -               }
>>> +               /*
>>> +                * We have already validated the presence of BTRFS_DEV_REPLACE_DEVID,
>>> +                * in btrfs_init_dev_replace() so just continue.
>>> +                */
>>> +               if (device->devid == BTRFS_DEV_REPLACE_DEVID)
>>> +                       continue;
>>
>> Given the discussion above, after we fail the check for device->devid ==
>> BTRFS_DEV_REPLACE_DEVID, all devices from that point are not the replace
>> target device, and do not have the BTRFS_DEV_STATE_REPLACE_TGT bit set.
>>
>> So the original check for the BTRFS_DEV_STATE_REPLACE_TGT bit before
>> incrementing rw_devices is not just incorrect at this point, it's also
>> redundant.
> 
> Could you please write some condensed version of the above and resend?
> The original changelog says what happends and how, the analysis here
> is the actual explanation and I'd like to have that recorded. Thanks.
> 

Sure thing, I'll prepare a v2 with an updated commit message. Thanks for 
the feedback, David.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
