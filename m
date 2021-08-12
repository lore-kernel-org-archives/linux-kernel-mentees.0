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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB6CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 17:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A46CC61019
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 17:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A46CC61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 441FA4000B;
	Thu, 12 Aug 2021 17:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yK-DKiyTLn3j; Thu, 12 Aug 2021 17:31:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 15F9C400DB;
	Thu, 12 Aug 2021 17:31:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E41C9C001A;
	Thu, 12 Aug 2021 17:31:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9622DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 17:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EC6840779
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 17:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNDiatrzl9lC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 17:31:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B44BC40755
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 17:31:31 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id j1so10872383pjv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Gz94TVtxWNiNSVxbOnKzfxVBuQm8AVcJ5cdmFzvQsHA=;
 b=Ue5MKLSRbXzCOAY6QQQGD8iKv/ERXos1bKdb+w4oTJTLY526gD4sOXiPUiWGlfiUEn
 FJ2csHMR4GvMjHtpJ0X4L773Ju55sxEaUa7llMKM3gq+nKnqd+bLE0QEkSRvXjPHO5Kh
 5Dec9b61ELYl7Wu+3l9aQxPGLXDmOBnSCx8JIVdAu6c8Na8ZGbsfrKgu7tLyYjEqQMpr
 hwWUYpG7LszTqS5pC5NMIk9twQ0r4YkqKJZR08VDU+CDOv4xxmjudj/OvtvyN/O7kMHq
 JPbW9rvLIiDJ2RRaNKlHARLWUWQfzP1mQRC6KSR2YFESJgR0Nm3ewgBDHLlaQmtc1TQC
 lV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gz94TVtxWNiNSVxbOnKzfxVBuQm8AVcJ5cdmFzvQsHA=;
 b=PRQLs2WliHelSJ0UDIyT9LzzG5RSqQz/jss1n29kDAlig1z+iU29urVatOTFtSh0Xj
 Sswqmpa2VBobqmpUkSEW0pDX5DXYT9eIQ7+q2SoKvM2crGjyKObk3EH+wMpNCMf7YYcO
 EiyM4VX5wDCQk39jDN5Vln/35bWihrOH7ZfB+WmBbMNiBDkpyL0oWWwdeEmvr7M14VpL
 rrvLJGt6asPIIF85084GWk2qFL1yksEn0ItRhQIRpPwW4jgaa4o3l+UIeS9h53w2BebX
 N34uZY/Mpd69EKJuF1gDYtEq8egDsmoeIqjLz1Pekalyoq+OnEcsYG0BKjjlF4xh6XF/
 wYaQ==
X-Gm-Message-State: AOAM5321qyd2OSdCei/tHSt+GOUAk6uMzWh2poInso9OLydHnK4WR7oL
 VxL58Qf7Q0/4pAPcLgHWUaE=
X-Google-Smtp-Source: ABdhPJxLh78LmXjViINrWmcaGjkKurD4OZxwOI8f6s2qMJRnPKh3vytXUKVirwW7ppftgZbydtS1yg==
X-Received: by 2002:a17:902:b593:b0:12d:7aa5:de2d with SMTP id
 a19-20020a170902b59300b0012d7aa5de2dmr3547930pls.31.1628789491181; 
 Thu, 12 Aug 2021 10:31:31 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id a18sm3211465pjq.15.2021.08.12.10.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 10:31:30 -0700 (PDT)
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
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <1e0aafb2-9e55-5f64-d347-1765de0560c5@gmail.com>
Date: Fri, 13 Aug 2021 01:31:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812155032.GL5047@twin.jikos.cz>
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

On 12/8/21 11:50 pm, David Sterba wrote:
> On Thu, Aug 12, 2021 at 11:43:16PM +0800, Desmond Cheong Zhi Xi wrote:
>> On 12/8/21 6:38 pm, David Sterba wrote:
>>> On Tue, Jul 27, 2021 at 03:13:03PM +0800, Desmond Cheong Zhi Xi wrote:
>>>> When removing a writeable device in __btrfs_free_extra_devids, the rw
>>>> device count should be decremented.
>>>>
>>>> This error was caught by Syzbot which reported a warning in
>>>> close_fs_devices because fs_devices->rw_devices was not 0 after
>>>> closing all devices. Here is the call trace that was observed:
>>>>
>>>>     btrfs_mount_root():
>>>>       btrfs_scan_one_device():
>>>>         device_list_add();   <---------------- device added
>>>>       btrfs_open_devices():
>>>>         open_fs_devices():
>>>>           btrfs_open_one_device();   <-------- writable device opened,
>>>> 	                                     rw device count ++
>>>>       btrfs_fill_super():
>>>>         open_ctree():
>>>>           btrfs_free_extra_devids():
>>>> 	  __btrfs_free_extra_devids();  <--- writable device removed,
>>>> 	                              rw device count not decremented
>>>> 	  fail_tree_roots:
>>>> 	    btrfs_close_devices():
>>>> 	      close_fs_devices();   <------- rw device count off by 1
>>>>
>>>> As a note, prior to commit cf89af146b7e ("btrfs: dev-replace: fail
>>>> mount if we don't have replace item with target device"), rw_devices
>>>> was decremented on removing a writable device in
>>>> __btrfs_free_extra_devids only if the BTRFS_DEV_STATE_REPLACE_TGT bit
>>>> was not set for the device. However, this check does not need to be
>>>> reinstated as it is now redundant and incorrect.
>>>>
>>>> In __btrfs_free_extra_devids, we skip removing the device if it is the
>>>> target for replacement. This is done by checking whether device->devid
>>>> == BTRFS_DEV_REPLACE_DEVID. Since BTRFS_DEV_STATE_REPLACE_TGT is set
>>>> only on the device with devid BTRFS_DEV_REPLACE_DEVID, no devices
>>>> should have the BTRFS_DEV_STATE_REPLACE_TGT bit set after the check,
>>>> and so it's redundant to test for that bit.
>>>>
>>>> Additionally, following commit 82372bc816d7 ("Btrfs: make
>>>> the logic of source device removing more clear"), rw_devices is
>>>> incremented whenever a writeable device is added to the alloc
>>>> list (including the target device in btrfs_dev_replace_finishing), so
>>>> all removals of writable devices from the alloc list should also be
>>>> accompanied by a decrement to rw_devices.
>>>>
>>>> Fixes: cf89af146b7e ("btrfs: dev-replace: fail mount if we don't have replace item with target device")
>>>> Reported-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
>>>> Tested-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
>>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>>>> Reviewed-by: Anand Jain <anand.jain@oracle.com>
>>>> ---
>>>>    fs/btrfs/volumes.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
>>>> index 807502cd6510..916c25371658 100644
>>>> --- a/fs/btrfs/volumes.c
>>>> +++ b/fs/btrfs/volumes.c
>>>> @@ -1078,6 +1078,7 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
>>>>    		if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
>>>>    			list_del_init(&device->dev_alloc_list);
>>>>    			clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
>>>> +			fs_devices->rw_devices--;
>>>>    		}
>>>>    		list_del_init(&device->dev_list);
>>>>    		fs_devices->num_devices--;
>>>
>>> I've hit a crash on master branch with stacktrace very similar to one
>>> this bug was supposed to fix. It's a failed assertion on device close.
>>> This patch was the last one to touch it and it matches some of the
>>> keywords, namely the BTRFS_DEV_STATE_REPLACE_TGT bit that used to be in
>>> the original patch but was not reinstated in your fix.
>>>
>>> I'm not sure how reproducible it is, right now I have only one instance
>>> and am hunting another strange problem. They could be related.
>>>
>>> assertion failed: !test_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state), in fs/btrfs/volumes.c:1150
>>>
>>> https://susepaste.org/view/raw/18223056 full log with other stacktraces,
>>> possibly relatedg
>>>
>>
>> Looking at the logs, it seems that a dev_replace was started, then
>> suspended. But it wasn't canceled or resumed before the fs devices were
>> closed.
>>
>> I'll investigate further, just throwing some observations out there.
> 
> Thanks. I'm testing the patch revert, no crash after first loop, I'll
> run a few more to be sure as it's not entirely reliable.
> 
> Sending the revert is option of last resort as we're approaching end of
> 5.14 dev cycle and the crash prevents testing (unlike the fuzzer
> warning).
> 

I might be missing something, so any thoughts would be appreciated. But 
I don't think the assertion in btrfs_close_one_device is correct.

 From what I see, this crash happens when close_ctree is called while a 
dev_replace hasn't completed. In close_ctree, we suspend the 
dev_replace, but keep the replace target around so that we can resume 
the dev_replace procedure when we mount the root again. This is the call 
trace:

   close_ctree():
     btrfs_dev_replace_suspend_for_unmount();
     btrfs_close_devices():
       btrfs_close_fs_devices():
         btrfs_close_one_device():
           ASSERT(!test_bit(BTRFS_DEV_STATE_REPLACE_TGT, 
&device->dev_state));

However, since the replace target sticks around, there is a device with 
BTRFS_DEV_STATE_REPLACE_TGT set, and we fail the assertion in 
btrfs_close_one_device.

Two options I can think of:

- We could remove the assertion.

- Or we could clear the BTRFS_DEV_STATE_REPLACE_TGT bit in 
btrfs_dev_replace_suspend_for_unmount. This is fine since the bit is set 
again in btrfs_init_dev_replace if the dev_replace->replace_state is 
BTRFS_IOCTL_DEV_REPLACE_STATE_SUSPENDED. But this approach strikes me as 
a little odd because the device is still the replace target when 
mounting in the future.

Thoughts?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
