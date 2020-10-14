Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB65EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 08:02:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C49920BED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 08:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnIP9U9h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C49920BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC26A8798C;
	Wed, 14 Oct 2020 08:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYpbNxI0p+x8; Wed, 14 Oct 2020 08:02:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0171187C23;
	Wed, 14 Oct 2020 08:02:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEA8EC07FF;
	Wed, 14 Oct 2020 08:02:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E8E9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 08:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1B4CC8797A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 08:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxmnWrUNgI75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 08:02:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C9F9D87969
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 08:02:27 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id 184so2678754lfd.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 01:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FSZ9a8B85KsDMSHIMarKGmRUtah9ndcgrENtF6R7NaM=;
 b=SnIP9U9h0udVlAM50j/F4dq3ue9Znmtg95FCAxYEJW3eJvBzcCWhz7fJbRtEK8/w8U
 V+6U/cxiieYRA0f5z396rPrvkzvlVJAh5dACLYUmoDqgZ7HdlPJUX9aBeBIi89lapJZd
 o1PD0Jyg/Al1nvI7ZN15S/U9+bwywhPkEQ1PncUBAfpow9Pkf36u0LeMKfOx9IxALCVs
 uWhESlvwdAuC6Ndwwwm78w2+oYghR1aKbl7Sz7IXgVdTp2SUDWAIgzLzTlY8e2EjSTSM
 w6mrBmtfNsyqmoM98rZCyUwDhzt6fmH39g0Uxgq6YG5W9TEub0qoZ9LBaAzCvrGdrQKt
 LgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FSZ9a8B85KsDMSHIMarKGmRUtah9ndcgrENtF6R7NaM=;
 b=bDlbXFdH9ZVg4d2PVr3Udu/G5LQ0W3bi9ov9fzPiX1/ODsWGlj/lppN9L9GEMgQtTS
 NlN891wwwip1BQH2ghjDIZF2+KLRnTTM7Ta5MjBBckWK3fu3r/5sC5c9yoJinckAQLJN
 EZZTE4pHNRkpZreF9HqAZsQsqR6gBfnm98hEY96XMFGOm5homTNK9SpAYQnuzYdU0XOb
 g9TTydeKnlTaCoiY9dRHSsWTTj5SKPNrqIx9gbsSmMDOlPz0xWSSvf0HZ9SHzK4AHpXj
 g4bfz6dB0wl8j5ihHu5fSP/CGkc6+0frWTRB216HevH8piq6pPEJaYp6bELrDrpk0me4
 KOgQ==
X-Gm-Message-State: AOAM532MCWejvVbLXhoh0YfwMpH95UCUYx67GAAZPeSpXH0ilnfuVRxS
 AuXnRdQGrAYnhgnBphxXTiobGXr95gV+M78IGaQ=
X-Google-Smtp-Source: ABdhPJxzXE/JzwtZXEGh+2YT1DWinja2zHoGGrxN6J68QCm1C6L0FQ/RBbO4p/Vfx7daI5sRSw3gxdzkW5UFBUnGr68=
X-Received: by 2002:ac2:4355:: with SMTP id o21mr1059693lfl.210.1602662545737; 
 Wed, 14 Oct 2020 01:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002954fa05b02468d7@google.com>
 <300c32a1-a0de-4f05-b467-0822b3d21733n@googlegroups.com>
 <CACT4Y+bw2EXyKnO6mB3ZKBTWWJ1gd7VMkNvYxD=xwbuRjYwj8g@mail.gmail.com>
In-Reply-To: <CACT4Y+bw2EXyKnO6mB3ZKBTWWJ1gd7VMkNvYxD=xwbuRjYwj8g@mail.gmail.com>
From: Fox Chen <foxhlchen@gmail.com>
Date: Wed, 14 Oct 2020 16:02:14 +0800
Message-ID: <CAC2o3DKaaxoManhVoFVeB8bLQycPVY8z+ndAVqVaT76vvgzm=Q@mail.gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] KASAN: slab-out-of-bounds Read in
	squashfs_get_id
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Oh, Thank you, Dmitry!

I firstly replied to this from
https://groups.google.com/g/syzkaller-bugs/c/SPtlDDI7jmw/m/BtgjaCcDAwAJ.
I don't know why "reply all" only replies to syzkaller-bugs and I
didn't notice that.

Sorry about that.

On Wed, Oct 14, 2020 at 3:57 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> FYI Gmail has a setting of making Replay All the default button.
>
>
> On Wed, Oct 14, 2020 at 9:39 AM Fox Chen <foxhlchen@gmail.com> wrote:
>>
>> Hi,
>>
>> I found this bug was caused by either uid/gid info in superblocks or id_index_table is corrupted. The uid/gid index is larger than the size of msblk->id_table.
>>
>> Should I add a sanity check to squashfs_get_id??
>>
>>
>> The complete solution is to record the size of msblk->id_table in msblk and check uid/gid index each time in squashfs_get_id. However, this requires a change to msblk struct.
>>
>> A simple solution is to calculate the max available room for uid/gid table by doing msblk->xattr_table - msblk->id_table[0] and check if index is larger than this. While this provides some sort of check, it is imperfect because id_table can be smaller than that.
>>
>> Both of them work out for this bug.
>>
>>
>> thanks,
>> fox
>>
>> On Friday, September 25, 2020 at 10:48:18 PM UTC+8 syzbot wrote:
>>>
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit: 171d4ff7 Merge tag 'mmc-v5.9-rc4-2' of git://git.kernel.or..
>>> git tree: upstream
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1597ead3900000
>>> kernel config: https://syzkaller.appspot.com/x/.config?x=af502ec9a451c9fc
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=8e28bba73ed1772a6802
>>> compiler: clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
>>> syz repro: https://syzkaller.appspot.com/x/repro.syz?x=172ff481900000
>>> C reproducer: https://syzkaller.appspot.com/x/repro.c?x=17c3e6c5900000
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>> Reported-by: syzbot+8e28bb...@syzkaller.appspotmail.com
>>>
>>> ==================================================================
>>> BUG: KASAN: slab-out-of-bounds in squashfs_get_id+0xb9/0x1c0 fs/squashfs/id.c:38
>>> Read of size 8 at addr ffff8880a9684b98 by task syz-executor329/6836
>>>
>>> CPU: 1 PID: 6836 Comm: syz-executor329 Not tainted 5.9.0-rc6-syzkaller #0
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>>> Call Trace:
>>> __dump_stack lib/dump_stack.c:77 [inline]
>>> dump_stack+0x1d6/0x29e lib/dump_stack.c:118
>>> print_address_description+0x66/0x620 mm/kasan/report.c:383
>>> __kasan_report mm/kasan/report.c:513 [inline]
>>> kasan_report+0x132/0x1d0 mm/kasan/report.c:530
>>> squashfs_get_id+0xb9/0x1c0 fs/squashfs/id.c:38
>>> squashfs_new_inode fs/squashfs/inode.c:51 [inline]
>>> squashfs_read_inode+0x155/0x2170 fs/squashfs/inode.c:120
>>> squashfs_fill_super+0x1478/0x1790 fs/squashfs/super.c:310
>>> get_tree_bdev+0x3e9/0x5f0 fs/super.c:1342
>>> vfs_get_tree+0x88/0x270 fs/super.c:1547
>>> do_new_mount fs/namespace.c:2875 [inline]
>>> path_mount+0x179d/0x29e0 fs/namespace.c:3192
>>> do_mount fs/namespace.c:3205 [inline]
>>> __do_sys_mount fs/namespace.c:3413 [inline]
>>> __se_sys_mount+0x126/0x180 fs/namespace.c:3390
>>> do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
>>> entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>> RIP: 0033:0x446d1a
>>> Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 fd ad fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 da ad fb ff c3 66 0f 1f 84 00 00 00 00 00
>>> RSP: 002b:00007ffd7dd4f8b8 EFLAGS: 00000293 ORIG_RAX: 00000000000000a5
>>> RAX: ffffffffffffffda RBX: 00007ffd7dd4f910 RCX: 0000000000446d1a
>>> RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffd7dd4f8d0
>>> RBP: 00007ffd7dd4f8d0 R08: 00007ffd7dd4f910 R09: 00007ffd00000015
>>> R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000001
>>> R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003
>>>
>>> Allocated by task 3913:
>>> kasan_save_stack mm/kasan/common.c:48 [inline]
>>> kasan_set_track mm/kasan/common.c:56 [inline]
>>> __kasan_kmalloc+0x100/0x130 mm/kasan/common.c:461
>>> kmalloc_node include/linux/slab.h:577 [inline]
>>> __vmalloc_area_node mm/vmalloc.c:2429 [inline]
>>> __vmalloc_node_range+0x2c7/0x870 mm/vmalloc.c:2511
>>> module_alloc+0x7e/0x90 arch/x86/kernel/module.c:75
>>> bpf_jit_binary_alloc+0x123/0x230 kernel/bpf/core.c:871
>>> bpf_int_jit_compile+0x7995/0x8920 arch/x86/net/bpf_jit_comp.c:1911
>>> bpf_prog_select_runtime+0x76d/0xa60 kernel/bpf/core.c:1807
>>> bpf_migrate_filter net/core/filter.c:1290 [inline]
>>> bpf_prepare_filter+0xec2/0x1140 net/core/filter.c:1338
>>> bpf_prog_create_from_user+0x2ad/0x3e0 net/core/filter.c:1432
>>> seccomp_prepare_filter kernel/seccomp.c:567 [inline]
>>> seccomp_prepare_user_filter kernel/seccomp.c:604 [inline]
>>> seccomp_set_mode_filter kernel/seccomp.c:1546 [inline]
>>> do_seccomp+0x852/0x20b0 kernel/seccomp.c:1661
>>> do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
>>> entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>>
>>> The buggy address belongs to the object at ffff8880a9684b80
>>> which belongs to the cache kmalloc-32 of size 32
>>> The buggy address is located 24 bytes inside of
>>> 32-byte region [ffff8880a9684b80, ffff8880a9684ba0)
>>> The buggy address belongs to the page:
>>> page:00000000f697ca3d refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff8880a9684fc1 pfn:0xa9684
>>> flags: 0xfffe0000000200(slab)
>>> raw: 00fffe0000000200 ffffea0002a5d5c8 ffffea0002a98588 ffff8880aa440100
>>> raw: ffff8880a9684fc1 ffff8880a9684000 000000010000003f 0000000000000000
>>> page dumped because: kasan: bad access detected
>>>
>>> Memory state around the buggy address:
>>> ffff8880a9684a80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>>> ffff8880a9684b00: 00 fc fc fc fc fc fc fc fa fb fb fb fc fc fc fc
>>> >ffff8880a9684b80: 00 fc fc fc fc fc fc fc fa fb fb fb fc fc fc fc
>>> ^
>>> ffff8880a9684c00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>>> ffff8880a9684c80: 00 00 01 fc fc fc fc fc fa fb fb fb fc fc fc fc
>>> ==================================================================
>>>
>>>
>>> ---
>>> This report is generated by a bot. It may contain errors.
>>> See https://goo.gl/tpsmEJ for more information about syzbot.
>>> syzbot engineers can be reached at syzk...@googlegroups.com.
>>>
>>> syzbot will keep track of this issue. See:
>>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>> syzbot can test patches for this issue, for details see:
>>> https://goo.gl/tpsmEJ#testing-patches
>>
>> --
>> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/300c32a1-a0de-4f05-b467-0822b3d21733n%40googlegroups.com.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
