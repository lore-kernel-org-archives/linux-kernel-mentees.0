Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7337F38BDB3
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Jan 2026 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768848661; cv=none; b=EzxCcN5GEEkJPd7SBI4cPzgYJLe0fdEzOxm74vV924NGxvU8rlsLDKU/HBeZPYrhaWulq+OHiM51KC37uzWL0CWbKPHfsM9xstIqm11IONXfNzqLik7Tl4FercMXs/1o186i8jie2bJxRgteuYhzi2ROIxUGd9g2E6n7u8pzhzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768848661; c=relaxed/simple;
	bh=GPBh2qWpyCXo1XUshP2C3TdOgUMqV76uDwXWffPXuuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNN8bfvr1UgVdE/0cZ/NaE2azhs5ugD2ZRI0Ohz/+UaYFLd91db4M1s+Z66hqpQeDmxvUpnFdW8i5aDsXegaqespkg9RDiMAaFjDMDV3oZOTMcriQl44Y2PWdglnf9sSusLIqeQ88hRp9wvDdMxEfccPld+qRRy7V0lq5ZzxW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G76vRNLI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G76vRNLI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a102494058so27293915ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Jan 2026 10:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768848660; x=1769453460; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELu77MSHMdAJE1MG9u8LT8LbmE4aGm6DlWdwArp/Ogc=;
        b=G76vRNLIyy++qkVE4Cy5jpkAQmhewCABspb8vtyGTRYCmG46n5EAKTZGo9dA7mo7el
         /6EJ4lTdnawjrZXMxXd+edm9kwriaoSnqruAefPxHGc2vt9HkZ6uM1ND2iV5r0k/vsFk
         Jrl3LieGIiDQeDzebUS33HP4FB8doZ6vNDRxjC5caW1443XnAGiYzxNOgvvAoA9meiaU
         HO2Ele3mfvNx13EqsaDpM/ldytPcVZcKQz2Ywh0bLE5dH+Ord1MGL0V1yPyHApChq4WY
         Xj7/n5vKvv6o+Euj1/oRVZ2UC9xCwlCAqOwn3hcXOY1VGZOHWVr/EG3tzRVwdfFQURiM
         s4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768848660; x=1769453460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELu77MSHMdAJE1MG9u8LT8LbmE4aGm6DlWdwArp/Ogc=;
        b=Clj1hRj0JV2KhNd5kYfVnJwjXwwBuG8qL00mZa+4qrEQOW8OPkiKqyHaD6X9CzXWWz
         k9BHA5B14eNy4MxTQoAA17ei1KjeccF44XkwgiPXgQKD8X5iBKy/ClJMw6tivYsFNdmc
         88jQu0UzgXo2HdPMbFX+4/hzs4rCZ/XIjmrFqG/ZYalIbQofhjl2yAz6x4HSW2njPOer
         msPVQVM3+jl5O63Np1ahifBtP+Vym5c20tMfgIlPc0kGwbC6bXwFg5LmXtStBg5qRtyD
         pn/AiKRxC6uewe660s2n2BLhLNfTXN+1fQdE1zl2DeLZYil6lpjuNZLWCYSs9JedPT8E
         mY0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWW8FZCBffX7ynBJtGhxX57jBuQMXrUjE83T076pcnc8lBtARJyljZ3ytd9whWqYvgg9AsMgzPBjhNePKSXFwHBcyMUeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/YE/IQ4YwlBT5m2Tp6igGiMTzbQiM+zhJL5RABTwYdFnyFiRN
	2q2nlA0UWPpm9VuVBvGNtnQtNf9+ZERuVtMx5+1wOlZsOczgKuoZOwVs
X-Gm-Gg: AZuq6aLFXm8auxzMZw/sVx6QDaSdqqktu9v7SDROAuZxnDTJtohcu0+F6gYiXuDRbMR
	co5cZCd2ROF8dliqW53/Y8hEnJ7tPFUyXDjQj58NxETH2Wtj3tb48NwIbNxOyYsjiuY2QkBvKqF
	XTqWadqkZ9wyBrDX7OcmwcTUSzXeM4Avi+oCFw+xaOD/PjoQw0qEyo/w+Po1H3cD3xG96Hclv/m
	jZ/wfBDjIsGY22/68Nav9NbUM7r6NzIzS6VQpgdnxvr3KYAWlDormjDxuZ/9zsTIHow4BOUNCsz
	N9Zktt57U64uwMXAuNUZJmmVK6/snwEsiMffOHSDDoBhhHdIj55Rk5xn8I3iIiyptXXZ0Rhh+ph
	/TNxj23QkJgVOk1NSyEjXKqZpq2aiO0OWlgkO/FxG71Rrqa3IpPON7JXCHtZj5jjyk/hZwcdiFc
	e4B0A6OXm/nn4=
X-Received: by 2002:a17:902:ebc8:b0:2a0:9238:881d with SMTP id d9443c01a7336-2a700a1c29fmr150358455ad.15.1768848659415;
        Mon, 19 Jan 2026 10:50:59 -0800 (PST)
Received: from inspiron ([111.125.231.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm102107895ad.90.2026.01.19.10.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:50:59 -0800 (PST)
Date: Tue, 20 Jan 2026 00:20:49 +0530
From: Prithvi <activprithvi@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	hch@lst.de, jlbec@evilplan.org, linux-fsdevel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] scsi: target: Fix recursive locking in
 __configfs_open_file()
Message-ID: <20260119185049.mvcjjntdkmtdk4je@inspiron>
References: <20260108191523.303114-1-activprithvi@gmail.com>
 <2f88aa9b-b1c2-4b02-81e8-1c43b982db1b@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f88aa9b-b1c2-4b02-81e8-1c43b982db1b@acm.org>

On Thu, Jan 15, 2026 at 08:57:28AM -0800, Bart Van Assche wrote:
> On 1/8/26 12:15 PM, Prithvi Tambewagh wrote:
> > This poses a possibility of recursive locking,
> > which triggers the lockdep warning.
> 
> Patches that fix a lockdep complaint should include the full lockdep
> complaint.
> 
> Since the fixed lockdep complaint didn't trigger a deadlock it must be
> a false positive complaint, isn't it? Such complaints should be fixed
> but without additional information we can't tell what the best way is to
> fix the complaint.
> 
> Thanks,
> 
> Bart.

Hello Bart,

Here is the full lockdep complaint, as per the syzkaller dashboard report
for the bug:

============================================
WARNING: possible recursive locking detected
syzkaller #0 Not tainted
--------------------------------------------
syz.0.17/5999 is trying to acquire lock:
ffff888140413f78 (&p->frag_sem){.+.+}-{4:4}, at: __configfs_open_file+0xe8/0x9c0 fs/configfs/file.c:304

but task is already holding lock:
ffff888140413f78 (&p->frag_sem){.+.+}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
ffff888140413f78 (&p->frag_sem){.+.+}-{4:4}, at: configfs_write_iter+0x219/0x4e0 fs/configfs/file.c:229

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&p->frag_sem);
  lock(&p->frag_sem);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

4 locks held by syz.0.17/5999:
 #0: ffff888147ab0420 (sb_writers#12){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:738
 #1: ffff888077d2d688 (&buffer->mutex){+.+.}-{4:4}, at: configfs_write_iter+0x75/0x4e0 fs/configfs/file.c:226
 #2: ffff888140413f78 (&p->frag_sem){.+.+}-{4:4}, at: flush_write_buffer fs/configfs/file.c:205 [inline]
 #2: ffff888140413f78 (&p->frag_sem){.+.+}-{4:4}, at: configfs_write_iter+0x219/0x4e0 fs/configfs/file.c:229
 #3: ffffffff8f4097e8 (target_devices_lock){+.+.}-{4:4}, at: target_core_item_dbroot_store+0x21/0x350 drivers/target/target_core_configfs.c:114

stack backtrace:
CPU: 0 UID: 0 PID: 5999 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_deadlock_bug+0x1e9/0x240 kernel/locking/lockdep.c:3041
 check_deadlock kernel/locking/lockdep.c:3093 [inline]
 validate_chain kernel/locking/lockdep.c:3895 [inline]
 __lock_acquire+0x1106/0x1c90 kernel/locking/lockdep.c:5237
 lock_acquire kernel/locking/lockdep.c:5868 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5825
 down_read+0x9b/0x480 kernel/locking/rwsem.c:1537
 __configfs_open_file+0xe8/0x9c0 fs/configfs/file.c:304
 do_dentry_open+0x982/0x1530 fs/open.c:965
 vfs_open+0x82/0x3f0 fs/open.c:1097
 do_open fs/namei.c:3975 [inline]
 path_openat+0x1de4/0x2cb0 fs/namei.c:4134
 do_filp_open+0x20b/0x470 fs/namei.c:4161
 file_open_name+0x2a3/0x450 fs/open.c:1381
 filp_open+0x4b/0x80 fs/open.c:1401
 target_core_item_dbroot_store+0x108/0x350 drivers/target/target_core_configfs.c:134
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x306/0x4e0 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x7d3/0x11d0 fs/read_write.c:686
 ksys_write+0x12a/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbf49d8eec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd1d0ac1e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fbf49fe5fa0 RCX: 00007fbf49d8eec9
RDX: 0000000000000fff RSI: 0000200000000000 RDI: 0000000000000003
RBP: 00007fbf49e11f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbf49fe5fa0 R14: 00007fbf49fe5fa0 R15: 0000000000000003
 </TASK>
db_root: not a directory: /sys/kernel/config/target/dbroot


Sorry, but I didn't get why this might be a false positive lockdep complaint,
can you please guide? 

From what I understood, in this case, the same rw_semaphore &p->frag_sem is used,
identified by the same addresses (ffff888140413f78), for both the lock held
as well as one being tried to be acquired. This occurs since 
flush_write_buffer() called in configfs_write_iter() first acquires the 
&p->frag_sem lock and then next flush_write_buffer() calls 
target_core_item_dbroot_store(), which attempts to open file with path stored
in db_root_stage using filp_open(). It ultimately calls __configfs_open_file() 
which again tries to acquire exactly the same lock, &p->frag_sem. 

A deadlock can arise, if a writer tries to acquire this lock after it was first
acquired by that thread in flush_write_buffer() and before acquiring it again in
__configfs_open_file(), trying to avoid writer starvation. After checking, I 
found out that down_write() is called for frag_sem, the rw_semaphore in struct 
configfs_fragment, at 3 places:

1. configfs_rmdir() - calls down_write_killable(&frag->frag_sem)
2. configfs_unregister_group() - calls down_write(&frag->frag_sem);
3. configfs_unregister_subsystem() - calls down_write(&frag->frag_sem);

I think any of these may result in a deadlock due to recursive locking, if
the lock is acquired by a writer after being acquired by a reader and then
again being tried to be acquired by a reader.

I attempt to solve this by replaing call to filp_open() in 
target_core_item_dbroot_store() with kern_path(), which just checks if a file 
path exists, as required in target_core_item_dbroot_store(), rather than 
actually opening the file and using the same frag_sem lock, which removes 
the possiblity of recursive deadlock on this path. What do you think of this 
approach?

Best Regards,
Prithvi 
