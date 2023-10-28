Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B15C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Oct 2023 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B2BD4241A;
	Sat, 28 Oct 2023 20:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B2BD4241A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OvhKJM2u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 312hZP4Ln_Zr; Sat, 28 Oct 2023 20:43:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E95D642077;
	Sat, 28 Oct 2023 20:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95D642077
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC995C0039;
	Sat, 28 Oct 2023 20:43:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13885C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 20:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D118B4187C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 20:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D118B4187C
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OvhKJM2u
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6bE2OGKpRe7H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 20:43:45 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BD1141869
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 20:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BD1141869
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6bcbfecf314so894995b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 13:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698525825; x=1699130625;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ceYIwJI5/04/uPSpsws6LLcq3g+qs0ox6bPNsl8T5AI=;
 b=OvhKJM2uqCBfxzea6jCFjUezOoL6v3dTRlgT5xqPCHRm1XK+1DLn/YGbjb16wC2r3w
 IcYaZTaIWVMf3wsmiAr/FaWDDTh48+1CjCKYoYdPyBxTeC0pogBwfLOFtuFlkP75nbgr
 9Fhs1Y+62BaFQdHcdAC64yIaR2Page/vektSmOSU0vyCRZ2h+Vs5gCHqLtPkziwH6Rny
 LTsjU/9WfsqjWij/kHLyUUEPy1rEwOttdwOn/CFSIagOK0Qw4YnMPsFCqw9iKi91VKuu
 AFXb9i/U+SRZfGbzuqPb6vvLyYmT14GA13crDuk1gnq30EWm7DX1xdTAaxvvYcnI7Jf1
 Z+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698525825; x=1699130625;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ceYIwJI5/04/uPSpsws6LLcq3g+qs0ox6bPNsl8T5AI=;
 b=lh02u9oR7TRkkwpqBRxdAqlq8O5h+u8By/OgqTiGBbz32XSqqCWNvvtTLKEWXgQkKD
 l/df721KhBbnp7GB3l4iH7yZSxlnW8nN7EBJNJYqGK98oPcDxH90P8bNYHCvaN4dzx10
 EidfmXMDnu2uZhwXJf/nC0oX0YXk0tv3BodfCkAo5ZWlG5xJQnlPwolerKcL8AjoXYiC
 PRFYbLR7HMEtV+PhvmLZ2cntah/ZzrD5NVDKj9q7SVONcL0St8pdfd4KkGojxB61C79U
 xpuQfeSeNKvsJbzuPvtI55nETfiWKHIjupFGm7orpRULx+DB0fgalYPULFokqg59yx9Y
 r9Gg==
X-Gm-Message-State: AOJu0Yxtas2dY7KPQuzn8EPpAP5FUARyxWDxX4V7k6zGNQukqaghPajc
 4SYd0AQehfftj71klokgdv8=
X-Google-Smtp-Source: AGHT+IFJDgTO4GC29uJeMqClXt7FNH3XB7LXD899DW+Fr3mNR0Vlq1ylhWgG38hY5tD6bpvYyYIPpg==
X-Received: by 2002:a17:90b:4cd0:b0:27d:2261:73e4 with SMTP id
 nd16-20020a17090b4cd000b0027d226173e4mr6010666pjb.2.1698525824814; 
 Sat, 28 Oct 2023 13:43:44 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.208])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a17090a164800b00278ff752eacsm3362690pje.50.2023.10.28.13.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Oct 2023 13:43:44 -0700 (PDT)
Message-ID: <93115738-6919-4855-81b7-eb9b2fc60137@gmail.com>
Date: Sun, 29 Oct 2023 02:13:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20231027122221.GA24128@redhat.com>
 <20231028102247.404488-1-singhabhinav9051571833@gmail.com>
 <20231028081915-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231028081915-mutt-send-email-mst@kernel.org>
Cc: brauner@kernel.org, mjguzik@gmail.com, peterz@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, mathieu.desnoyers@efficios.com, shakeelb@google.com,
 akpm@linux-foundation.org, surenb@google.com, michael.christie@oracle.com
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

On 10/28/23 17:50, Michael S. Tsirkin wrote:
> On Sat, Oct 28, 2023 at 03:52:47PM +0530, Abhinav Singh wrote:
>> This patch fixes the warning about directly dereferencing a pointer
>> tagged with __rcu annotation.
>>
>> Dereferencing the pointers tagged with __rcu directly should
>> always be avoided according to the docs. There is a rcu helper
>> function rcu_dereference(...) to use when dereferencing a __rcu
>> pointer. This function returns the non __rcu tagged pointer which
>> can be dereferenced just like a normal pointer.
>>
>> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
>> ---
>> v1 -> v2 : added rcu_dereference(...) at line 2694
>> v2 -> v3 : added rcu_dereference(...) at line 2695
>>
>>   kernel/fork.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/fork.c b/kernel/fork.c
>> index 10917c3e1f03..e78649974669 100644
>> --- a/kernel/fork.c
>> +++ b/kernel/fork.c
>> @@ -2369,7 +2369,7 @@ __latent_entropy struct task_struct *copy_process(
>>   
>>   	retval = -EAGAIN;
>>   	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
>> -		if (p->real_cred->user != INIT_USER &&
>> +		if (rcu_dereference(p->real_cred)->user != INIT_USER &&
>>   		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
>>   			goto bad_fork_cleanup_count;
>>   	}
>> @@ -2690,9 +2690,9 @@ __latent_entropy struct task_struct *copy_process(
>>   			 * tasklist_lock with adding child to the process tree
>>   			 * for propagate_has_child_subreaper optimization.
>>   			 */
>> -			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
>> -							 p->real_parent->signal->is_child_subreaper;
>> -			list_add_tail(&p->sibling, &p->real_parent->children);
>> +			p->signal->has_child_subreaper = rcu_dereference(p->real_parent)->signal->has_child_subreaper ||
>> +							rcu_dereference(p->real_parent)->signal->is_child_subreaper;
>> +			list_add_tail(&p->sibling, &rcu_dereference(p->real_parent)->children);
>>   			list_add_tail_rcu(&p->tasks, &init_task.tasks);
>>   			attach_pid(p, PIDTYPE_TGID);
>>   			attach_pid(p, PIDTYPE_PGID);
>> -- 
>> 2.39.2
> 
> 
> You seem to just ignore review comments. NAK. I'm not going to review this anymore.
> 
> 
I m really sorry for ignorance and careless behaviour. This is 
completely my fault, a maintainer has to do a lot of work and he cant 
correct me all the times. On my defense I will only say that I was 
really confused about a thing, instead of asking you question, I thought 
of sending in another patch with some more information is a better 
choice then a clearing my confusion by sending in a extra mail. You were 
very concise and clear about your comments but MY stupidity was on 
another level today. I m sorry for ignorant behaviour. And also thanks 
and appreciate a lot for reviewing this patch till now to all the 
maintainers.

Not sure if this patch will be reviewed again or not, but I think I 
should answer the queries.

The last patch I sent, I tested with `lockdep` on (I hope "test with 
`lockdep on`" means booting the kernel with lockdep enabled),
with these config options `CONFIG_PROVE_RCU` and `CONFIG_PROVE_LOCKING` 
enabled and it booted just fine. To confirm if lockdep was really 
enabled I found these paths inside the qemu virtual envirnoment
/proc/lockdep
/proc/lockdep_chains
/proc/lockdep_stat
/proc/locks
/proc/lock_stats

I tested the above kernel using qemu with this command
qemu-system-x86_64 \
	-m 2G \
	-smp 2 \
	-kernel /home/abhinav/linux_work/linux/arch/x86/boot/bzImage \
	-append "console=ttyS0 root=/dev/sda earlyprintk=serial   net.ifnames=0" \
	-drive file=/home/abhinav/linux_work/boot_images/bullseye.img,format=raw \
	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
	-net nic,model=e1000 \
	-enable-kvm \
	-nographic \
	-pidfile vm.pid \
	2>&1 | tee vm.log

I did not get warning `the run-time "suspicious rcu_dereference_check() 
usage"` as mentioned by Oleg Nesterov, which mean rcu_dereference(...) 
it called inside of rcu read side critical sections.




_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
