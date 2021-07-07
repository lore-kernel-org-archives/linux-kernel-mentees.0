Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3394CC07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 06:54:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9CA961C82
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 06:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9CA961C82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8116086C;
	Wed,  7 Jul 2021 06:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gt7WuL8qxnM; Wed,  7 Jul 2021 06:54:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8AA4B607FE;
	Wed,  7 Jul 2021 06:54:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AF4DC0010;
	Wed,  7 Jul 2021 06:54:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8800EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 06:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 698B282D45
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 06:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xDH2T3QLC0P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 06:54:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C091882D2D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 06:54:08 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id ie21so989792pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Jul 2021 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=29KlgInZ2jmDSdyaEuadEo1RRyP0XOU3F3wxMJ4gF08=;
 b=PIYRoDp9e45o2tqbnJDez56Ho6obbPuxHHPEF/IatZSzIYPH0i+N2/b1x4X+XWreCZ
 9yAcfanBPwYXOv47Y0ypjZMuNVkc6gIP3QVLTvmCLhJrpL4tjqaHHFAAtv/tuP9+vRg0
 yVMQObvdG80Sg1cFsxPq2XdWMT5zLd8HZHKkLT4zxIXKUd+NeHYuv4wtB41u92BjBjfv
 vQXM/2Qln3DCNdrCrj1Y9pHxvwwYucGYgTX2vpwjwhkyiKdoNchesCny/zptsAEggYRQ
 Vg8xLrkV3xwBoNpejL5cGxSA3Y0W+V+I9d8RYWMVJQT61W9EnZNusopKuBBXn5GrBcK5
 1kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=29KlgInZ2jmDSdyaEuadEo1RRyP0XOU3F3wxMJ4gF08=;
 b=fF4OFSzzR2ActL+yN7wlhadYASlwkD+2U7CFW5vpcR8dfmAWdnvdb7snmAXjzkr0WQ
 J/MwJ9fHDic7byMJSd/JxqvSd1AmepziUjNFKM8S4KBF0gomGldSEvPkLfZInIcfQDU6
 gdJUmpQKsFjCohTWitXGdKXUryrL8cmIbZUGFA36+fYYMjgUQjfifHdRu3agRQpE6jIC
 rOdryjh61DCqGnzbFo24/5L412UycZeE35hZJpNShJiAtBT6emRNy1KtqUBezmxFh3YO
 EPJXZV9F1XjwCeckmg0wmqyXzCsIklTvtnGOJh14u8SPoQ3JUiUmx4ieCJW7nDJPZ2pP
 pf0w==
X-Gm-Message-State: AOAM531jcS1wE+ObVHalZ8kVhC7BUMG8t1zN+NTUWtSEyftn+RrGWpav
 1BEoLlI+AlOpJqcm17VPpYU=
X-Google-Smtp-Source: ABdhPJxZ1zdoUYOr/tVPvI2iKEfjV06YlGwS0CcDb679eyGv3+xgPB6ouNFj5g4/DI/XO9X/+SOqBQ==
X-Received: by 2002:a17:902:c981:b029:129:afe:8e30 with SMTP id
 g1-20020a170902c981b02901290afe8e30mr19863712plc.73.1625640847825; 
 Tue, 06 Jul 2021 23:54:07 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q17sm7934444pfk.186.2021.07.06.23.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 23:54:07 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] fcntl: fix potential deadlocks for
 &fown_struct.lock
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210707023548.15872-1-desmondcheongzx@gmail.com>
 <20210707023548.15872-2-desmondcheongzx@gmail.com>
 <YOVENb3X/m/pNrYt@kroah.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <6bc70605-2ed3-98e8-cc48-9bb565cb05bd@gmail.com>
Date: Wed, 7 Jul 2021 14:54:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOVENb3X/m/pNrYt@kroah.com>
Content-Language: en-US
Cc: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, bfields@fieldses.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 7/7/21 2:05 pm, Greg KH wrote:
> On Wed, Jul 07, 2021 at 10:35:47AM +0800, Desmond Cheong Zhi Xi wrote:
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
>> Here read_lock_irq/read_unlock_irq should be safe to use because the
>> functions f_getown_ex and f_getowner_uids are only called from
>> do_fcntl, and f_getown is only called from do_fnctl and
>> sock_ioctl. do_fnctl itself is only called from syscalls.
>>
>> For sock_ioctl, the chain is
>>    compat_sock_ioctl():
>>      compat_sock_ioctl_trans():
>>        sock_ioctl()
>>
>> And interrupts are not disabled on either path. We assert this
>> assumption with WARN_ON_ONCE(irqs_disabled()). This check is also
>> inserted into another use of write_lock_irq in f_modown.
>>
>> Reported-and-tested-by: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   fs/fcntl.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/fcntl.c b/fs/fcntl.c
>> index dfc72f15be7f..262235e02c4b 100644
>> --- a/fs/fcntl.c
>> +++ b/fs/fcntl.c
>> @@ -88,6 +88,7 @@ static int setfl(int fd, struct file * filp, unsigned long arg)
>>   static void f_modown(struct file *filp, struct pid *pid, enum pid_type type,
>>                        int force)
>>   {
>> +	WARN_ON_ONCE(irqs_disabled());
> 
> If this triggers, you just rebooted the box :(
> 
> Please never do this, either properly handle the problem and return an
> error, or do not check for this.  It is not any type of "fix" at all,
> and at most, a debugging aid while you work on the root problem.
> 
> thanks,
> 
> greg k-h
> 

Hi Greg,

Thanks for the feedback. My bad, I was under the impression that 
WARN_ON_ONCE could be used to document assumptions for other developers, 
but I'll stick to using it for debugging in the future.

I think then in this case it would be best to keep the reasoning for why 
the *_irq() locks are safe to use in the commit message. I'll update the 
patch accordingly.

Best wishes,
Desmond
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
