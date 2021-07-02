Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957BCC11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 15:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B5AF613CB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 15:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B5AF613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D50A96068F;
	Fri,  2 Jul 2021 15:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7oAs1Yaae3C; Fri,  2 Jul 2021 15:41:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D89DE606B8;
	Fri,  2 Jul 2021 15:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B04F8C001A;
	Fri,  2 Jul 2021 15:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C046C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 15:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01A83606B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 15:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vDTwFuwYG5VE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 15:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 203A26068F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 15:41:38 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id i13so5741441plb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Jul 2021 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KK3MxR0qLHegtXtjdBa6mIQL9eEFTmy8PehJd/2y4JU=;
 b=M/u0o3zzoTdUxRNJwuzLBn0niDD7CnupOn7tviEGUaHK+Bzi18vZvQHxNXmCP900bg
 +vGBi+hCung8BUDwhfbixkZ48kXrX7yv0hY3HCy1bAey2dlshbfRgHcXBTxWNQV2TWOU
 Ft+aMSodXV0FVKBHupX80apjyUyPxmPm+8nSUj9x22F3gaApHXsxrwdRGrlsrX4IwwI7
 36oHxj4bo4wgs/8jLfGv2E89hdXsTEh/O3O9Fx6uKD2FMUPfNl3SKa7B6tb1Ho///UaD
 vTOKCwPczAJlVTZ0l4y8VrnmzOAua+9zc0/x+0lL5q/7C7OKA60tBQZ4GzwJwyIp3LNk
 AjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KK3MxR0qLHegtXtjdBa6mIQL9eEFTmy8PehJd/2y4JU=;
 b=irUpULR4lDG1hPOJmZ6Tkg9RTPtPga3RFLYZUMwWb60cy6cjWAV+6ghL4bazBXwjeZ
 SB8ZwZ9vBLGwefQIFSdO3j+7onSX29m0ZOf88K7dC4IrZHsH/9TG6IqJi8MZ8EE71rl6
 OYY/3TLHvhqFiBhc08H37pnlh8hS04PcMPxIYt8jH6CSz/EuubSRpKu0UFbqMa5frn9h
 4HtIJ2IWE7I1cEODiwHyIr4ICD2DgWG+5ZVqPKUpkbwbs+1kEoUIxmX791voN3QsqaJC
 aemaoMtMYa2OQaPDPAIe0lAV5XNgfWQVXkpMP7JuDN4qaxc+V0OhlZHuwLvV0G0HZ2bT
 wxhg==
X-Gm-Message-State: AOAM533Wi2GidULO1DIPmD337JvD9dG+C6ucz2vltRKCG+TSPRq2ALjA
 COJZSLUjPA4mN+SDPgjvxec=
X-Google-Smtp-Source: ABdhPJxWVhXOIeVyGwLHh6fRO+IXXvAEtIe9g3z+dOcJhuFS+UPcohpRnzYO4VG09ys1jwJ0ujcAcA==
X-Received: by 2002:a17:90a:8596:: with SMTP id
 m22mr405427pjn.110.1625240497630; 
 Fri, 02 Jul 2021 08:41:37 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id na7sm12892376pjb.36.2021.07.02.08.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 08:41:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] fcntl: fix potential deadlocks for &fown_struct.lock
To: Jeff Layton <jlayton@kernel.org>, bfields@fieldses.org,
 viro@zeniv.linux.org.uk
References: <20210702091831.615042-1-desmondcheongzx@gmail.com>
 <20210702091831.615042-2-desmondcheongzx@gmail.com>
 <43b5f2c7e7e5e5ed35c8e3de2eafeb960f267836.camel@kernel.org>
 <9e2a46b9-5735-d73b-d35e-f88dc994f6b4@gmail.com>
 <47d655dba51cd7d3cf3011f30f42bf7120c656db.camel@kernel.org>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <3e88d502-99b6-0dac-8548-a7781beb727a@gmail.com>
Date: Fri, 2 Jul 2021 23:41:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <47d655dba51cd7d3cf3011f30f42bf7120c656db.camel@kernel.org>
Content-Language: en-US
Cc: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 2/7/21 10:27 pm, Jeff Layton wrote:
> On Fri, 2021-07-02 at 21:55 +0800, Desmond Cheong Zhi Xi wrote:
>> On 2/7/21 7:44 pm, Jeff Layton wrote:
>>> On Fri, 2021-07-02 at 17:18 +0800, Desmond Cheong Zhi Xi wrote:
>>>> Syzbot reports a potential deadlock in do_fcntl:
>>>>
>>>> ========================================================
>>>> WARNING: possible irq lock inversion dependency detected
>>>> 5.12.0-syzkaller #0 Not tainted
>>>> --------------------------------------------------------
>>>> syz-executor132/8391 just changed the state of lock:
>>>> ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: f_getown_ex fs/fcntl.c:211 [inline]
>>>> ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: do_fcntl+0x8b4/0x1200 fs/fcntl.c:395
>>>> but this lock was taken by another, HARDIRQ-safe lock in the past:
>>>>    (&dev->event_lock){-...}-{2:2}
>>>>
>>>> and interrupts could create inverse lock ordering between them.
>>>>
>>>> other info that might help us debug this:
>>>> Chain exists of:
>>>>     &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
>>>>
>>>>    Possible interrupt unsafe locking scenario:
>>>>
>>>>          CPU0                    CPU1
>>>>          ----                    ----
>>>>     lock(&f->f_owner.lock);
>>>>                                  local_irq_disable();
>>>>                                  lock(&dev->event_lock);
>>>>                                  lock(&new->fa_lock);
>>>>     <Interrupt>
>>>>       lock(&dev->event_lock);
>>>>
>>>>    *** DEADLOCK ***
>>>>
>>>> This happens because there is a lock hierarchy of
>>>> &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
>>>> from the following call chain:
>>>>
>>>>     input_inject_event():
>>>>       spin_lock_irqsave(&dev->event_lock,...);
>>>>       input_handle_event():
>>>>         input_pass_values():
>>>>           input_to_handler():
>>>>             evdev_events():
>>>>               evdev_pass_values():
>>>>                 spin_lock(&client->buffer_lock);
>>>>                 __pass_event():
>>>>                   kill_fasync():
>>>>                     kill_fasync_rcu():
>>>>                       read_lock(&fa->fa_lock);
>>>>                       send_sigio():
>>>>                         read_lock_irqsave(&fown->lock,...);
>>>>
>>>> However, since &dev->event_lock is HARDIRQ-safe, interrupts have to be
>>>> disabled while grabbing &f->f_owner.lock, otherwise we invert the lock
>>>> hierarchy.
>>>>
>>>> Hence, we replace calls to read_lock/read_unlock on &f->f_owner.lock,
>>>> with read_lock_irq/read_unlock_irq.
>>>>
>>>
>>> Patches look reasonable overall, but why does this one use read_lock_irq
>>> and the other one use read_lock_irqsave? Don't we need to *_irqsasve in
>>> both patches?
>>>
>>>
>>
>> My thinking was that the functions f_getown_ex and f_getowner_uids are
>> only called from do_fcntl, and f_getown is only called from do_fnctl and
>> sock_ioctl. do_fnctl itself is only called from syscalls.
>>
>> For sock_ioctl, the chain is
>>     compat_sock_ioctl():
>>       compat_sock_ioctl_trans():
>>         sock_ioctl()
>>
>> For both paths, it doesn't seem that interrupts are disabled, so I used
>> the *irq variants.
>>
>> But of course, I might be very mistaken on this, and I'd be happy to
>> make the change to *_irqsave.
>>
>> Also, on further inspection, if these calls should be changed to
>> *_irqsave, then I believe the call to write_lock_irq in f_modown (called
>> from do_fcntl() --> f_setown() --> __f_setown() --> f_modown()) should
>> also be changed to *_irqsave.
>>
>> There's also a call to write_lock_irq(&fa->fa_lock) in
>> fasync_remove_entry and fasync_insert_entry. Whether these should be
>> changed as well isn't as clear to me, but since it's safe to do, perhaps
>> it makes sense to use *_irqsave for them too. Thoughts?
>>
> 
> 
> I think your reasoning is probably valid here and we don't need to
> save/restore. It wasn't obvious to me until you pointed it out though.
> It might be worth a comment, or maybe even this at the top of both
> functions:
> 
>      WARN_ON_ONCE(irqs_disabled());
> 

Adding the WARN_ON_ONCE makes sense. I'll test it with Syzbot then 
prepare a v2 series.

> I'll pick these into linux-next soon and plan to merge them for v5.15.
> Let me know if you think they need to go in sooner.
> 
> 

Sounds good to me. Thanks for the feedback, Jeff.

>>>> Reported-and-tested-by: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com
>>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>>>> ---
>>>>    fs/fcntl.c | 13 +++++++------
>>>>    1 file changed, 7 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/fs/fcntl.c b/fs/fcntl.c
>>>> index dfc72f15be7f..cf9e81dfa615 100644
>>>> --- a/fs/fcntl.c
>>>> +++ b/fs/fcntl.c
>>>> @@ -150,7 +150,8 @@ void f_delown(struct file *filp)
>>>>    pid_t f_getown(struct file *filp)
>>>>    {
>>>>    	pid_t pid = 0;
>>>> -	read_lock(&filp->f_owner.lock);
>>>> +
>>>> +	read_lock_irq(&filp->f_owner.lock);
>>>>    	rcu_read_lock();
>>>>    	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type)) {
>>>>    		pid = pid_vnr(filp->f_owner.pid);
>>>> @@ -158,7 +159,7 @@ pid_t f_getown(struct file *filp)
>>>>    			pid = -pid;
>>>>    	}
>>>>    	rcu_read_unlock();
>>>> -	read_unlock(&filp->f_owner.lock);
>>>> +	read_unlock_irq(&filp->f_owner.lock);
>>>>    	return pid;
>>>>    }
>>>>    
>>>> @@ -208,7 +209,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
>>>>    	struct f_owner_ex owner = {};
>>>>    	int ret = 0;
>>>>    
>>>> -	read_lock(&filp->f_owner.lock);
>>>> +	read_lock_irq(&filp->f_owner.lock);
>>>>    	rcu_read_lock();
>>>>    	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type))
>>>>    		owner.pid = pid_vnr(filp->f_owner.pid);
>>>> @@ -231,7 +232,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
>>>>    		ret = -EINVAL;
>>>>    		break;
>>>>    	}
>>>> -	read_unlock(&filp->f_owner.lock);
>>>> +	read_unlock_irq(&filp->f_owner.lock);
>>>>    
>>>>    	if (!ret) {
>>>>    		ret = copy_to_user(owner_p, &owner, sizeof(owner));
>>>> @@ -249,10 +250,10 @@ static int f_getowner_uids(struct file *filp, unsigned long arg)
>>>>    	uid_t src[2];
>>>>    	int err;
>>>>    
>>>> -	read_lock(&filp->f_owner.lock);
>>>> +	read_lock_irq(&filp->f_owner.lock);
>>>>    	src[0] = from_kuid(user_ns, filp->f_owner.uid);
>>>>    	src[1] = from_kuid(user_ns, filp->f_owner.euid);
>>>> -	read_unlock(&filp->f_owner.lock);
>>>> +	read_unlock_irq(&filp->f_owner.lock);
>>>>    
>>>>    	err  = put_user(src[0], &dst[0]);
>>>>    	err |= put_user(src[1], &dst[1]);
>>>
>>
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
