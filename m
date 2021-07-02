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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2820AC11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 13:55:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBD261405
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 13:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBD261405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DDC83E03;
	Fri,  2 Jul 2021 13:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwDDnhBXIxTe; Fri,  2 Jul 2021 13:55:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 74EDF83E00;
	Fri,  2 Jul 2021 13:55:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33C6FC001A;
	Fri,  2 Jul 2021 13:55:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 299C6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 13:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16DB24239A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 13:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIxcuY4bBwTb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 13:55:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 405A84238D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 13:55:14 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id o18so8984545pgu.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Jul 2021 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y1GrXpdOcfyCNCbPpQ3waA8nmkYo8TWFbUh8sBdrK/4=;
 b=sf/i4cznLCXWBiLYReZOSVCHY19hOYot1Xv0AAjsNyHvnYyo2/lVEKcknapj4ZTD4n
 8YA+RB1+kWccambkyl/U3j2zSBLZH+T/Lp5ifI5RS1+Mzkdg6+P5OtTW1KQyKpFKsrHR
 TJbpO5VgOBYu+HMXLtTwH+ZmZ3a5K4IT5WRdZzWwnfnNi9cb0jnqiPNZ9/SOL1cM1wL8
 7FjaIN1xlUhvdDPHRk2763ulS62fnOBiettbzvrFkqcMWVGti2SUwVMgFYJ59Ow3pDip
 f2o1IqwuRxc0+10cYOM1qIdBeHlDWlITY+B2sMzJihkhfFHc2pqAM5qtfb71OKaJmA1/
 l2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y1GrXpdOcfyCNCbPpQ3waA8nmkYo8TWFbUh8sBdrK/4=;
 b=ZnwS4afVHt3k8kBP0cgJnUXsdBQVwzXdbjV+XRB0ZqcKFP3h7KyATDjVsX/JW2r6dA
 iNvvKXrzVF052yxWwljJ4cNdHkFZnwVZxKwcdZAlZG4ZAqxevKa/nk1/FKE9jD3FucH6
 jHdEpQE3ZgmX1cVYYgVduaWa0/E9K7ikSUje/uywBUt1wP+3rNjSfg57TbPhTSJ7AL6U
 IG51Eq0CeWVMT7iG5znA4OExdZFF4GFtqa7BvtF4guDrpVtUnH2ReK1E6AnICW7lCFiV
 hnDwM+HIUn4NaB5yUMV7sVdsQCgmZbwFq9TgctqOXAnAAABlivqDi4QtHTu4RHRtG9XL
 mxeA==
X-Gm-Message-State: AOAM532zXHC7gVlrjwbYNjcD78Upv+P4qkabKqBfykz4nO9VZafADjvy
 /VD6QftcimdegLKw5OnLpZU=
X-Google-Smtp-Source: ABdhPJyAc0yNfhesT3vGh5PgKByRO+ThuNWBHLOuWpZuGmqv8XeB8MWbmBT3EPt3fPOvA6jcfFG+Zg==
X-Received: by 2002:a63:1d41:: with SMTP id d1mr133093pgm.199.1625234113630;
 Fri, 02 Jul 2021 06:55:13 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id x17sm3680658pfa.26.2021.07.02.06.55.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 06:55:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] fcntl: fix potential deadlocks for &fown_struct.lock
To: Jeff Layton <jlayton@kernel.org>, bfields@fieldses.org,
 viro@zeniv.linux.org.uk
References: <20210702091831.615042-1-desmondcheongzx@gmail.com>
 <20210702091831.615042-2-desmondcheongzx@gmail.com>
 <43b5f2c7e7e5e5ed35c8e3de2eafeb960f267836.camel@kernel.org>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <9e2a46b9-5735-d73b-d35e-f88dc994f6b4@gmail.com>
Date: Fri, 2 Jul 2021 21:55:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <43b5f2c7e7e5e5ed35c8e3de2eafeb960f267836.camel@kernel.org>
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

On 2/7/21 7:44 pm, Jeff Layton wrote:
> On Fri, 2021-07-02 at 17:18 +0800, Desmond Cheong Zhi Xi wrote:
>> Syzbot reports a potential deadlock in do_fcntl:
>>
>> ========================================================
>> WARNING: possible irq lock inversion dependency detected
>> 5.12.0-syzkaller #0 Not tainted
>> --------------------------------------------------------
>> syz-executor132/8391 just changed the state of lock:
>> ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: f_getown_ex fs/fcntl.c:211 [inline]
>> ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: do_fcntl+0x8b4/0x1200 fs/fcntl.c:395
>> but this lock was taken by another, HARDIRQ-safe lock in the past:
>>   (&dev->event_lock){-...}-{2:2}
>>
>> and interrupts could create inverse lock ordering between them.
>>
>> other info that might help us debug this:
>> Chain exists of:
>>    &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
>>
>>   Possible interrupt unsafe locking scenario:
>>
>>         CPU0                    CPU1
>>         ----                    ----
>>    lock(&f->f_owner.lock);
>>                                 local_irq_disable();
>>                                 lock(&dev->event_lock);
>>                                 lock(&new->fa_lock);
>>    <Interrupt>
>>      lock(&dev->event_lock);
>>
>>   *** DEADLOCK ***
>>
>> This happens because there is a lock hierarchy of
>> &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
>> from the following call chain:
>>
>>    input_inject_event():
>>      spin_lock_irqsave(&dev->event_lock,...);
>>      input_handle_event():
>>        input_pass_values():
>>          input_to_handler():
>>            evdev_events():
>>              evdev_pass_values():
>>                spin_lock(&client->buffer_lock);
>>                __pass_event():
>>                  kill_fasync():
>>                    kill_fasync_rcu():
>>                      read_lock(&fa->fa_lock);
>>                      send_sigio():
>>                        read_lock_irqsave(&fown->lock,...);
>>
>> However, since &dev->event_lock is HARDIRQ-safe, interrupts have to be
>> disabled while grabbing &f->f_owner.lock, otherwise we invert the lock
>> hierarchy.
>>
>> Hence, we replace calls to read_lock/read_unlock on &f->f_owner.lock,
>> with read_lock_irq/read_unlock_irq.
>>
> 
> Patches look reasonable overall, but why does this one use read_lock_irq
> and the other one use read_lock_irqsave? Don't we need to *_irqsasve in
> both patches?
> 
> 

My thinking was that the functions f_getown_ex and f_getowner_uids are 
only called from do_fcntl, and f_getown is only called from do_fnctl and 
sock_ioctl. do_fnctl itself is only called from syscalls.

For sock_ioctl, the chain is
   compat_sock_ioctl():
     compat_sock_ioctl_trans():
       sock_ioctl()

For both paths, it doesn't seem that interrupts are disabled, so I used 
the *irq variants.

But of course, I might be very mistaken on this, and I'd be happy to 
make the change to *_irqsave.

Also, on further inspection, if these calls should be changed to 
*_irqsave, then I believe the call to write_lock_irq in f_modown (called 
from do_fcntl() --> f_setown() --> __f_setown() --> f_modown()) should 
also be changed to *_irqsave.

There's also a call to write_lock_irq(&fa->fa_lock) in 
fasync_remove_entry and fasync_insert_entry. Whether these should be 
changed as well isn't as clear to me, but since it's safe to do, perhaps 
it makes sense to use *_irqsave for them too. Thoughts?

>> Reported-and-tested-by: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   fs/fcntl.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/fcntl.c b/fs/fcntl.c
>> index dfc72f15be7f..cf9e81dfa615 100644
>> --- a/fs/fcntl.c
>> +++ b/fs/fcntl.c
>> @@ -150,7 +150,8 @@ void f_delown(struct file *filp)
>>   pid_t f_getown(struct file *filp)
>>   {
>>   	pid_t pid = 0;
>> -	read_lock(&filp->f_owner.lock);
>> +
>> +	read_lock_irq(&filp->f_owner.lock);
>>   	rcu_read_lock();
>>   	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type)) {
>>   		pid = pid_vnr(filp->f_owner.pid);
>> @@ -158,7 +159,7 @@ pid_t f_getown(struct file *filp)
>>   			pid = -pid;
>>   	}
>>   	rcu_read_unlock();
>> -	read_unlock(&filp->f_owner.lock);
>> +	read_unlock_irq(&filp->f_owner.lock);
>>   	return pid;
>>   }
>>   
>> @@ -208,7 +209,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
>>   	struct f_owner_ex owner = {};
>>   	int ret = 0;
>>   
>> -	read_lock(&filp->f_owner.lock);
>> +	read_lock_irq(&filp->f_owner.lock);
>>   	rcu_read_lock();
>>   	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type))
>>   		owner.pid = pid_vnr(filp->f_owner.pid);
>> @@ -231,7 +232,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
>>   		ret = -EINVAL;
>>   		break;
>>   	}
>> -	read_unlock(&filp->f_owner.lock);
>> +	read_unlock_irq(&filp->f_owner.lock);
>>   
>>   	if (!ret) {
>>   		ret = copy_to_user(owner_p, &owner, sizeof(owner));
>> @@ -249,10 +250,10 @@ static int f_getowner_uids(struct file *filp, unsigned long arg)
>>   	uid_t src[2];
>>   	int err;
>>   
>> -	read_lock(&filp->f_owner.lock);
>> +	read_lock_irq(&filp->f_owner.lock);
>>   	src[0] = from_kuid(user_ns, filp->f_owner.uid);
>>   	src[1] = from_kuid(user_ns, filp->f_owner.euid);
>> -	read_unlock(&filp->f_owner.lock);
>> +	read_unlock_irq(&filp->f_owner.lock);
>>   
>>   	err  = put_user(src[0], &dst[0]);
>>   	err |= put_user(src[1], &dst[1]);
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
