Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD94C77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  7 May 2023 05:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC6560BEE;
	Sun,  7 May 2023 05:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEC6560BEE
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SEYRvbYQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yb9cK2xef8dK; Sun,  7 May 2023 05:29:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4520660BED;
	Sun,  7 May 2023 05:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4520660BED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 261D3C0037;
	Sun,  7 May 2023 05:29:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 022A9C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 May 2023 05:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1A75814B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 May 2023 05:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A75814B1
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SEYRvbYQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1zZevBKsdQf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 May 2023 05:29:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90AB781494
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90AB781494
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 May 2023 05:29:07 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-b8f34bca001so4432331276.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 06 May 2023 22:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683437346; x=1686029346;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r9VsomI8HYFx3oLJzVYzc8WqDFNSBbJBqqUVE5TiUyc=;
 b=SEYRvbYQiuoyeXRSe+hrsCaWEaHYu22RwPMmWjeRVCfJE1T3cRSLGPC8/5MoRA7Obj
 Ly0qq9l5X9GgYB2+Q02KwgJ9N+eMUB7wUqF94bNYzB5VakaxTigarpjTG2wFGipmQXrc
 krFshhillfZMYYkYra9XQv6X9gUXuOxYhkK5fWYrtSjBCO/TTS58hjS1ErjwsZxxDQT3
 lkO3uJYSKuWkZiusRWBRdRc42S/hWJciTlTJrF/Z2xblnKEA1zJxd8JK2lXSUAbAZxpI
 dYcLwlUYaCKI6it0GtuRBhYSD0Zhyg0/5TDQdq1ru6h+JqQ3JdsTb8PVMiQ8IXee1/yg
 /S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683437346; x=1686029346;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r9VsomI8HYFx3oLJzVYzc8WqDFNSBbJBqqUVE5TiUyc=;
 b=Vr15iOp4MgwtoQwAPk6HKfwzRFAu0U8tIrAd9T+5N/VfIdPbkBiG3xir3/xjiqvrSq
 vkr7EU2cF6ykuQP/8is9BuKAQ0YdVrSHUnaHb088yHDpunxkeqVfnZyoqT99mFSujzCD
 7cswIhk/EMUkr1zRENY93g1Aq6FiHwbqJ4S5ppnsjb3EAziniLP+74MVVCn8Q4dseYKZ
 n95RcPb8KHBtlF98qvLgo1sKvYh5J0w3BsFLIzFEa2O7Cup1XM6DlJEE8SugaS0phXhA
 spyzNjCzg/GbO1afh5+Gd1ewvN3DSqOGN/EZ3VDdpmHykVq4jvjXAqqa5LiD3wJLee7f
 L7rA==
X-Gm-Message-State: AC+VfDyeWcFAu97N/hratSNr0i6QZJr9g3401erSsd0sLL2Zv6GHlRso
 NvHte1jOlrJiNyht7GkJkDYnJ68zDlYktCse4Ao=
X-Google-Smtp-Source: ACHHUZ6Uh7nvU3ymUNpiksbcolDmJ1sTrE3djrFEWabZtJrevhHQR3v5khk3x2+Tu8Y9w7+Wkp5kCrjWzCsrdBg93eQ=
X-Received: by 2002:a25:2985:0:b0:b95:9e75:ff0d with SMTP id
 p127-20020a252985000000b00b959e75ff0dmr6826914ybp.36.1683437346391; Sat, 06
 May 2023 22:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <ZDla2Nuyq2QLdo96@yoga>
In-Reply-To: <ZDla2Nuyq2QLdo96@yoga>
From: Anup Sharma <anupnewsmail@gmail.com>
Date: Sun, 7 May 2023 10:58:53 +0530
Message-ID: <CAJPAYX=D6aTGOPsOzep2Eq6FaocqDUwGBTzC-c_6n5w8H_AvBA@mail.gmail.com>
Subject: Re: [PATCH] fs: jfs: fixed UBSAN: shift-out-of-bounds in dbFree
To: shaggy@kernel.org, r33s3n6@gmail.com, mudongliangabcd@gmail.com, 
 liushixin2@huawei.com, wuhoipok@gmail.com, 
 jfs-discussion@lists.sourceforge.net, 
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============8525204176780806510=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8525204176780806510==
Content-Type: multipart/alternative; boundary="000000000000088a8805fb13cd68"

--000000000000088a8805fb13cd68
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Apr 2023 at 19:23, anupsharma <anupnewsmail@gmail.com> wrote:

> Syzkaller reported the following issue:
>          option from the mount to silence this warning.
> =======================================================
> find_entry called with index = 0
> read_mapping_page failed!
> ERROR: (device loop0): txCommit:
> ERROR: (device loop0): remounting filesystem as read-only
>
> ================================================================================
> UBSAN: shift-out-of-bounds in fs/jfs/jfs_dmap.c:381:12
> shift exponent 134217736 is too large for 64-bit type 'long long'
> CPU: 1 PID: 5068 Comm: syz-executor350 Not tainted
> 6.3.0-rc2-syzkaller-00069-g0ddc84d2dd43 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 03/02/2023
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
>  ubsan_epilogue lib/ubsan.c:217 [inline]
>  __ubsan_handle_shift_out_of_bounds+0x3c3/0x420 lib/ubsan.c:387
>  dbFree+0x46e/0x650 fs/jfs/jfs_dmap.c:381
>  txFreeMap+0x96a/0xd50 fs/jfs/jfs_txnmgr.c:2510
>  xtTruncate+0xe5c/0x3260 fs/jfs/jfs_xtree.c:2467
>  jfs_free_zero_link+0x46e/0x6e0 fs/jfs/namei.c:758
>  jfs_evict_inode+0x35f/0x440 fs/jfs/inode.c:153
>  evict+0x2a4/0x620 fs/inode.c:665
>  __dentry_kill+0x436/0x650 fs/dcache.c:607
>  shrink_dentry_list+0x39c/0x6a0 fs/dcache.c:1201
>  shrink_dcache_parent+0xcd/0x480
>  do_one_tree+0x23/0xe0 fs/dcache.c:1682
>  shrink_dcache_for_umount+0x7d/0x120 fs/dcache.c:1699
>  generic_shutdown_super+0x67/0x340 fs/super.c:472
>  kill_block_super+0x7e/0xe0 fs/super.c:1398
>  deactivate_locked_super+0xa4/0x110 fs/super.c:331
>  cleanup_mnt+0x426/0x4c0 fs/namespace.c:1177
>  task_work_run+0x24a/0x300 kernel/task_work.c:179
>  exit_task_work include/linux/task_work.h:38 [inline]
>  do_exit+0x68f/0x2290 kernel/exit.c:869
>  do_group_exit+0x206/0x2c0 kernel/exit.c:1019
>  __do_sys_exit_group kernel/exit.c:1030 [inline]
>  __se_sys_exit_group kernel/exit.c:1028 [inline]
>  __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1028
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7fa87e2289b9
> Code: Unable to access opcode bytes at 0x7fa87e22898f.
> RSP: 002b:00007fff4bfe3938 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fa87e2a3330 RCX: 00007fa87e2289b9
> RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
> RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 00007fa87e29de40
> R10: 00007fff4bfe3850 R11: 0000000000000246 R12: 00007fa87e2a3330
> R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
>  </TASK>
>
> ================================================================================
>
> db_l2nbperpage which is used as a shift exponent to get the buffer
> for the current dmap will be less than and equal to 64.
>
> Tested via syzbot.
>
> Reported-by: syzbot+d2cd27dcf8e04b232eb2@syzkaller.appspotmail.com
> Link:
> https://syzkaller.appspot.com/bug?id=2a70a453331db32ed491f5cbb07e81bf2d225715
>
> Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
> ---
>  fs/jfs/jfs_dmap.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
> index a3eb1e826947..d2cf56dd8f91 100644
> --- a/fs/jfs/jfs_dmap.c
> +++ b/fs/jfs/jfs_dmap.c
> @@ -184,7 +184,10 @@ int dbMount(struct inode *ipbmap)
>                 err = -EINVAL;
>                 goto err_release_metapage;
>         }
> -
> +       if (bmp->db_l2nbperpage >= 64) {
> +               err = -EINVAL;
> +               goto err_release_metapage;
> +       }
>         bmp->db_maxlevel = le32_to_cpu(dbmp_le->dn_maxlevel);
>         bmp->db_maxag = le32_to_cpu(dbmp_le->dn_maxag);
>         bmp->db_agpref = le32_to_cpu(dbmp_le->dn_agpref);
> --
> 2.34.1
>
> Hello All,
Just wanted to follow up on this patch submitted earlier. May I please
request
a review and feedback on this patch.
Thanks,
Anup

--000000000000088a8805fb13cd68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 14 Apr 2023 at 19:23, anupsha=
rma &lt;<a href=3D"mailto:anupnewsmail@gmail.com">anupnewsmail@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Syz=
kaller reported the following issue:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0option from the mount to silence this war=
ning.<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
find_entry called with index =3D 0<br>
read_mapping_page failed!<br>
ERROR: (device loop0): txCommit:<br>
ERROR: (device loop0): remounting filesystem as read-only<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
UBSAN: shift-out-of-bounds in fs/jfs/jfs_dmap.c:381:12<br>
shift exponent 134217736 is too large for 64-bit type &#39;long long&#39;<b=
r>
CPU: 1 PID: 5068 Comm: syz-executor350 Not tainted 6.3.0-rc2-syzkaller-0006=
9-g0ddc84d2dd43 #0<br>
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 03/02/2023<br>
Call Trace:<br>
=C2=A0&lt;TASK&gt;<br>
=C2=A0__dump_stack lib/dump_stack.c:88 [inline]<br>
=C2=A0dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106<br>
=C2=A0ubsan_epilogue lib/ubsan.c:217 [inline]<br>
=C2=A0__ubsan_handle_shift_out_of_bounds+0x3c3/0x420 lib/ubsan.c:387<br>
=C2=A0dbFree+0x46e/0x650 fs/jfs/jfs_dmap.c:381<br>
=C2=A0txFreeMap+0x96a/0xd50 fs/jfs/jfs_txnmgr.c:2510<br>
=C2=A0xtTruncate+0xe5c/0x3260 fs/jfs/jfs_xtree.c:2467<br>
=C2=A0jfs_free_zero_link+0x46e/0x6e0 fs/jfs/namei.c:758<br>
=C2=A0jfs_evict_inode+0x35f/0x440 fs/jfs/inode.c:153<br>
=C2=A0evict+0x2a4/0x620 fs/inode.c:665<br>
=C2=A0__dentry_kill+0x436/0x650 fs/dcache.c:607<br>
=C2=A0shrink_dentry_list+0x39c/0x6a0 fs/dcache.c:1201<br>
=C2=A0shrink_dcache_parent+0xcd/0x480<br>
=C2=A0do_one_tree+0x23/0xe0 fs/dcache.c:1682<br>
=C2=A0shrink_dcache_for_umount+0x7d/0x120 fs/dcache.c:1699<br>
=C2=A0generic_shutdown_super+0x67/0x340 fs/super.c:472<br>
=C2=A0kill_block_super+0x7e/0xe0 fs/super.c:1398<br>
=C2=A0deactivate_locked_super+0xa4/0x110 fs/super.c:331<br>
=C2=A0cleanup_mnt+0x426/0x4c0 fs/namespace.c:1177<br>
=C2=A0task_work_run+0x24a/0x300 kernel/task_work.c:179<br>
=C2=A0exit_task_work include/linux/task_work.h:38 [inline]<br>
=C2=A0do_exit+0x68f/0x2290 kernel/exit.c:869<br>
=C2=A0do_group_exit+0x206/0x2c0 kernel/exit.c:1019<br>
=C2=A0__do_sys_exit_group kernel/exit.c:1030 [inline]<br>
=C2=A0__se_sys_exit_group kernel/exit.c:1028 [inline]<br>
=C2=A0__x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1028<br>
=C2=A0do_syscall_x64 arch/x86/entry/common.c:50 [inline]<br>
=C2=A0do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80<br>
=C2=A0entry_SYSCALL_64_after_hwframe+0x63/0xcd<br>
RIP: 0033:0x7fa87e2289b9<br>
Code: Unable to access opcode bytes at 0x7fa87e22898f.<br>
RSP: 002b:00007fff4bfe3938 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7<br>
RAX: ffffffffffffffda RBX: 00007fa87e2a3330 RCX: 00007fa87e2289b9<br>
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001<br>
RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 00007fa87e29de40<br>
R10: 00007fff4bfe3850 R11: 0000000000000246 R12: 00007fa87e2a3330<br>
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001<br>
=C2=A0&lt;/TASK&gt;<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
<br>
db_l2nbperpage which is used as a shift exponent to get the buffer<br>
for the current dmap will be less than and equal to 64. <br>
<br>
Tested via syzbot.<br>
<br>
Reported-by: <a href=3D"mailto:syzbot%2Bd2cd27dcf8e04b232eb2@syzkaller.apps=
potmail.com" target=3D"_blank">syzbot+d2cd27dcf8e04b232eb2@syzkaller.appspo=
tmail.com</a><br>
Link: <a href=3D"https://syzkaller.appspot.com/bug?id=3D2a70a453331db32ed49=
1f5cbb07e81bf2d225715" rel=3D"noreferrer" target=3D"_blank">https://syzkall=
er.appspot.com/bug?id=3D2a70a453331db32ed491f5cbb07e81bf2d225715</a><br>
<br>
Signed-off-by: Anup Sharma &lt;<a href=3D"mailto:anupnewsmail@gmail.com" ta=
rget=3D"_blank">anupnewsmail@gmail.com</a>&gt;<br>
---<br>
=C2=A0fs/jfs/jfs_dmap.c | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c<br>
index a3eb1e826947..d2cf56dd8f91 100644<br>
--- a/fs/jfs/jfs_dmap.c<br>
+++ b/fs/jfs/jfs_dmap.c<br>
@@ -184,7 +184,10 @@ int dbMount(struct inode *ipbmap)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D -EINVAL;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_release_me=
tapage;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bmp-&gt;db_l2nbperpage &gt;=3D 64) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -EINVAL;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_release_me=
tapage;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bmp-&gt;db_maxlevel =3D le32_to_cpu(dbmp_le-&gt=
;dn_maxlevel);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bmp-&gt;db_maxag =3D le32_to_cpu(dbmp_le-&gt;dn=
_maxag);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bmp-&gt;db_agpref =3D le32_to_cpu(dbmp_le-&gt;d=
n_agpref);<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>Hello All,<br>Just wanted to follow up on this patch sub=
mitted earlier. May I please request<br><div>a review and feedback on this =
patch.</div><div>Thanks, <br></div><div>Anup<br></div></div>

--000000000000088a8805fb13cd68--

--===============8525204176780806510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8525204176780806510==--
