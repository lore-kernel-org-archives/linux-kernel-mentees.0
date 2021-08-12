Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1600C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 15:43:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4486F60D07
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 15:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4486F60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED05340481;
	Thu, 12 Aug 2021 15:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqJuD5WpJC86; Thu, 12 Aug 2021 15:43:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A9BF74044F;
	Thu, 12 Aug 2021 15:43:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FA5CC001A;
	Thu, 12 Aug 2021 15:43:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34F9EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 15:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D64C400FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 15:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNMtSxKssagX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 15:43:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D719C400DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 15:43:22 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so15874715pjr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iM1MAHtT06LdTsdZuL7f/jmLC2GhMH4t//6vATg9IRg=;
 b=FuBwJlJ/e4+r9tXXYTfMNQJp+aqcRIcBMvMaat12CFxNeqUFRKwuiaeJaowTcNuRyc
 YK8bSyHvy7j8zCI1j0T7QQ67YiipJ1u+kCwHntQlpiLcW3nd4VB9xumFSnheLBukZh4B
 OWPOaegzsMtEdIfWNnSq5Wm2IhX+CGp7dAW2P9IYrSxqbls7lYMo3ZOf9MNUFL6DaRjd
 z/xHHaL774GaRLbP5c7P+OqtyhNc5VhzkjybPvSWVQKOQgsGa882EInpzJUGO8QHBdZs
 RKWMLjegTga913y8VGLU6u80UNLEupj6Siuk6EfTkigio7EksiHMpI617nNNQqaMlyvO
 M17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iM1MAHtT06LdTsdZuL7f/jmLC2GhMH4t//6vATg9IRg=;
 b=jN2Y40mppEc6nJPN7vj4mbqifMpbbL3Y2lymcLL/WZvhWnWj7L1R/KB+cj+tEcQ6iY
 i/fh6aKmzbRUr3DCLfZyv0sX6v7NS8Vaa1csisvJFyzTN0kGkCpS1Q8oaim8VVFbdjyQ
 7DD1XtWMfW5WnQ1gVjcwFkQ3guHxyr7RD7FlakR5MZxY/J8vSNFBJoutHr4UqfjvrpbQ
 B2AxaDQlqnIx6ybe7uh4uYfQzOQXzyb8h6kSEtCUtOkkc6zb+a5BnP2SgRT6eUUNKk9b
 6jY3AcnIbmu1BCL1OV4UOS+dIrWR+jeT3yjAwgFO4e7D4v9xPhP7o+SvQINCTaGOJ4L2
 DWAA==
X-Gm-Message-State: AOAM533yzYwxJTDqDTSodTb2PyicJt6R59ORK13CyV5C2rn0TY4yIJGq
 ok2CvYLotHSZk7UtG5iWyo0=
X-Google-Smtp-Source: ABdhPJwiRejQb843rXCY5J/9cI0FH/ktPXEg1Z+qVjDF/dgfbdJKFB/dKwJ9UBxghOuyJP1ROzVjCw==
X-Received: by 2002:a17:90b:e82:: with SMTP id
 fv2mr16818121pjb.99.1628783002338; 
 Thu, 12 Aug 2021 08:43:22 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 20sm4542174pgg.36.2021.08.12.08.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 08:43:21 -0700 (PDT)
Subject: Re: [PATCH v2] btrfs: fix rw device counting in
 __btrfs_free_extra_devids
To: dsterba@suse.cz, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com,
 anand.jain@oracle.com, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210727071303.113876-1-desmondcheongzx@gmail.com>
 <20210812103851.GC5047@twin.jikos.cz>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <3c48eec9-590c-4974-4026-f74cafa5ac48@gmail.com>
Date: Thu, 12 Aug 2021 23:43:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812103851.GC5047@twin.jikos.cz>
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

On 12/8/21 6:38 pm, David Sterba wrote:
> On Tue, Jul 27, 2021 at 03:13:03PM +0800, Desmond Cheong Zhi Xi wrote:
>> When removing a writeable device in __btrfs_free_extra_devids, the rw
>> device count should be decremented.
>>
>> This error was caught by Syzbot which reported a warning in
>> close_fs_devices because fs_devices->rw_devices was not 0 after
>> closing all devices. Here is the call trace that was observed:
>>
>>    btrfs_mount_root():
>>      btrfs_scan_one_device():
>>        device_list_add();   <---------------- device added
>>      btrfs_open_devices():
>>        open_fs_devices():
>>          btrfs_open_one_device();   <-------- writable device opened,
>> 	                                     rw device count ++
>>      btrfs_fill_super():
>>        open_ctree():
>>          btrfs_free_extra_devids():
>> 	  __btrfs_free_extra_devids();  <--- writable device removed,
>> 	                              rw device count not decremented
>> 	  fail_tree_roots:
>> 	    btrfs_close_devices():
>> 	      close_fs_devices();   <------- rw device count off by 1
>>
>> As a note, prior to commit cf89af146b7e ("btrfs: dev-replace: fail
>> mount if we don't have replace item with target device"), rw_devices
>> was decremented on removing a writable device in
>> __btrfs_free_extra_devids only if the BTRFS_DEV_STATE_REPLACE_TGT bit
>> was not set for the device. However, this check does not need to be
>> reinstated as it is now redundant and incorrect.
>>
>> In __btrfs_free_extra_devids, we skip removing the device if it is the
>> target for replacement. This is done by checking whether device->devid
>> == BTRFS_DEV_REPLACE_DEVID. Since BTRFS_DEV_STATE_REPLACE_TGT is set
>> only on the device with devid BTRFS_DEV_REPLACE_DEVID, no devices
>> should have the BTRFS_DEV_STATE_REPLACE_TGT bit set after the check,
>> and so it's redundant to test for that bit.
>>
>> Additionally, following commit 82372bc816d7 ("Btrfs: make
>> the logic of source device removing more clear"), rw_devices is
>> incremented whenever a writeable device is added to the alloc
>> list (including the target device in btrfs_dev_replace_finishing), so
>> all removals of writable devices from the alloc list should also be
>> accompanied by a decrement to rw_devices.
>>
>> Fixes: cf89af146b7e ("btrfs: dev-replace: fail mount if we don't have replace item with target device")
>> Reported-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
>> Tested-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> Reviewed-by: Anand Jain <anand.jain@oracle.com>
>> ---
>>   fs/btrfs/volumes.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
>> index 807502cd6510..916c25371658 100644
>> --- a/fs/btrfs/volumes.c
>> +++ b/fs/btrfs/volumes.c
>> @@ -1078,6 +1078,7 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
>>   		if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
>>   			list_del_init(&device->dev_alloc_list);
>>   			clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
>> +			fs_devices->rw_devices--;
>>   		}
>>   		list_del_init(&device->dev_list);
>>   		fs_devices->num_devices--;
> 
> I've hit a crash on master branch with stacktrace very similar to one
> this bug was supposed to fix. It's a failed assertion on device close.
> This patch was the last one to touch it and it matches some of the
> keywords, namely the BTRFS_DEV_STATE_REPLACE_TGT bit that used to be in
> the original patch but was not reinstated in your fix.
> 
> I'm not sure how reproducible it is, right now I have only one instance
> and am hunting another strange problem. They could be related.
> 
> assertion failed: !test_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state), in fs/btrfs/volumes.c:1150
> 
> https://susepaste.org/view/raw/18223056 full log with other stacktraces,
> possibly relatedg
> 

Looking at the logs, it seems that a dev_replace was started, then 
suspended. But it wasn't canceled or resumed before the fs devices were 
closed.

I'll investigate further, just throwing some observations out there.

> [ 3310.383268] kernel BUG at fs/btrfs/ctree.h:3431!
> [ 3310.384586] invalid opcode: 0000 [#1] PREEMPT SMP
> [ 3310.385848] CPU: 1 PID: 3982 Comm: umount Tainted: G        W         5.14.0-rc5-default+ #1532
> [ 3310.388216] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
> [ 3310.391054] RIP: 0010:assertfail.constprop.0+0x18/0x1a [btrfs]
> [ 3310.397628] RSP: 0018:ffffb7a5454c7db8 EFLAGS: 00010246
> [ 3310.399079] RAX: 0000000000000068 RBX: ffff978364b91c00 RCX: 0000000000000000
> [ 3310.400990] RDX: 0000000000000000 RSI: ffffffffabee13c4 RDI: 00000000ffffffff
> [ 3310.402504] RBP: ffff9783523a4c00 R08: 0000000000000001 R09: 0000000000000001
> [ 3310.404025] R10: 0000000000000000 R11: 0000000000000001 R12: ffff9783523a4d18
> [ 3310.405074] R13: 0000000000000000 R14: 0000000000000004 R15: 0000000000000003
> [ 3310.406130] FS:  00007f61c8f42800(0000) GS:ffff9783bd800000(0000) knlGS:0000000000000000
> [ 3310.407649] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3310.409022] CR2: 000056190cffa810 CR3: 0000000030b96002 CR4: 0000000000170ea0
> [ 3310.410111] Call Trace:
> [ 3310.410561]  btrfs_close_one_device.cold+0x11/0x55 [btrfs]
> [ 3310.411788]  close_fs_devices+0x44/0xb0 [btrfs]
> [ 3310.412654]  btrfs_close_devices+0x48/0x160 [btrfs]
> [ 3310.413449]  generic_shutdown_super+0x69/0x100
> [ 3310.414155]  kill_anon_super+0x14/0x30
> [ 3310.414802]  btrfs_kill_super+0x12/0x20 [btrfs]
> [ 3310.415767]  deactivate_locked_super+0x2c/0xa0
> [ 3310.416562]  cleanup_mnt+0x144/0x1b0
> [ 3310.417153]  task_work_run+0x59/0xa0
> [ 3310.417744]  exit_to_user_mode_loop+0xe7/0xf0
> [ 3310.418440]  exit_to_user_mode_prepare+0xaf/0xf0
> [ 3310.419425]  syscall_exit_to_user_mode+0x19/0x50
> [ 3310.420281]  do_syscall_64+0x4a/0x90
> [ 3310.420934]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [ 3310.421718] RIP: 0033:0x7f61c91654db
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
