Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D8C61DA4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Mar 2023 09:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93CD04175E;
	Wed, 15 Mar 2023 09:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93CD04175E
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p4W+PejK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlpwfJOe_wyU; Wed, 15 Mar 2023 09:06:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1FC3A415E6;
	Wed, 15 Mar 2023 09:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FC3A415E6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05B72C0035;
	Wed, 15 Mar 2023 09:06:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64079C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Mar 2023 09:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E94360E30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Mar 2023 09:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E94360E30
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p4W+PejK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5kfCfEXUaA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Mar 2023 09:06:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0BF060DF0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0BF060DF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Mar 2023 09:06:26 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x3so72542608edb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Mar 2023 02:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678871185; x=1681463185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mviUQ27/iHZGfwlahjqCZ5wZtdsMAGwoSzooIkgDF+w=;
 b=p4W+PejKtE7ObImdexXA1FMi9bf9soTFJkauE0DTZ7BotV+TTyx3TOWvPkZnIDeqrn
 0ZHscmQF3YQ2yRpdP8TGiSWZ2lmvvS+uquPm5UypqCZGfsSAtlFlJz2pnAV+ZkVXyHJQ
 6JEzwj/8xDAG37aMilglb0eUuSZcvK78rJKxtBqCigIZ3diwHy7x22twUbp2CJ0EU5yr
 RQDtp60Ax+pDCz8JNHC5we5oEYySFibbU0Jg9jjDlRf/3TyAEVBbrlpJlfS/mSyNs4ww
 czEBR7z1dClr2unyVUom2jyqFP7FN888gtV+fqYtl8yBRJ41q5F40tMGby4yn3dqQSyg
 DqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871185; x=1681463185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mviUQ27/iHZGfwlahjqCZ5wZtdsMAGwoSzooIkgDF+w=;
 b=xeswB7tmy2I8lQ4PcoyqAGEQ+hUW1DFK8y7Xh9HK9ZatFXgG9Q46OXHPk1DjlQ44B3
 WVKyPhLqhXel35TwGbuiSwrg/xA7r0aHGLHVqjZlu64Kq5l8hb+wEA67Kf4tDpN0klBD
 9+7iff4Jpk+vl6pt6seiFKiPR+5kuamwBY87t3PKzcbeBQFjTC+0pU7PBtr68kSD8Sud
 P0IyBP3CT6IEfatY4++5PL47uXDLAcJsMo8VOZD8DzG/az84wmsFDt0mS21fQiyvVMDd
 ceuXdu8tWON+hfJA8zcDgMSVnkMGS4RGDudQ/w8rsN8cpMgaPBZjdXdfYkndydNom79Z
 Ksmg==
X-Gm-Message-State: AO0yUKVWMgV/dMmgE47J+TYfKpVkqaoI4wXwo5gnHnuhEdkn35xBAozY
 YyTCLw1lPOwT5PEf8Q7X/uw=
X-Google-Smtp-Source: AK7set/AvPhKa1Udt5DUEvQlOz5vMHUkIaNtdHxKhdF6BLIGq1ynPteZ9cLjl9xXqUBm0xGnIJANuQ==
X-Received: by 2002:a17:906:4c:b0:92e:f520:7779 with SMTP id
 12-20020a170906004c00b0092ef5207779mr1162424ejg.0.1678871184900; 
 Wed, 15 Mar 2023 02:06:24 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([37.252.81.68])
 by smtp.gmail.com with ESMTPSA id
 ss10-20020a170907038a00b008e36f9b2308sm2264411ejb.43.2023.03.15.02.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:06:24 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: rpeterso@redhat.com,
	agruenba@redhat.com
Subject: [PATCH] gfs2 FS: Fix UBSAN array-index-out-of-bounds in
 __gfs2_iomap_get
Date: Wed, 15 Mar 2023 13:06:20 +0400
Message-Id: <20230315090620.7294-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org
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

Syzkaller reported the following issue:

UBSAN: array-index-out-of-bounds in fs/gfs2/bmap.c:901:46
index 11 is out of range for type 'u64 [11]'
CPU: 0 PID: 5067 Comm: syz-executor164 Not tainted 6.1.0-syzkaller-13031-g77856d911a8c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_out_of_bounds+0xe0/0x110 lib/ubsan.c:282
 __gfs2_iomap_get+0x4a4/0x16e0 fs/gfs2/bmap.c:901
 gfs2_iomap_get fs/gfs2/bmap.c:1399 [inline]
 gfs2_block_map+0x28f/0x7f0 fs/gfs2/bmap.c:1214
 gfs2_write_alloc_required+0x441/0x6e0 fs/gfs2/bmap.c:2322
 gfs2_jdesc_check+0x1b9/0x290 fs/gfs2/super.c:114
 init_journal+0x5a4/0x22c0 fs/gfs2/ops_fstype.c:804
 init_inodes+0xdc/0x340 fs/gfs2/ops_fstype.c:889
 gfs2_fill_super+0x1bb2/0x2700 fs/gfs2/ops_fstype.c:1247
 get_tree_bdev+0x400/0x620 fs/super.c:1282
 gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x88/0x270 fs/super.c:1489
 do_new_mount+0x289/0xad0 fs/namespace.c:3145
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f2c63567aca
Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd0e3a28d8 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f2c63567aca
RDX: 0000000020037f40 RSI: 0000000020037f80 RDI: 00007ffd0e3a28e0
RBP: 00007ffd0e3a28e0 R08: 00007ffd0e3a2920 R09: 0000000000043350
R10: 0000000002000011 R11: 0000000000000282 R12: 0000000000000004
R13: 00005555567192c0 R14: 00007ffd0e3a2920 R15: 0000000000000000
 </TASK>

This issue is caused by the 'while' loop in the '__gfs2_iomap_get' function,
which increments 'height' var until it matches the condition. If height is
larger or equal to 'sdp->sd_heightsize' array size (which is GFS2_MAX_META_HEIGHT
+ 1), the array-index-out-of-bounds issue occurs. Therefore we need to add extra
condition to the while loop, which will prevent this issue.

Additionally, if 'height' var after the while ending is equal to GFS2_MAX_META_HEIGHT,
the 'find_metapath' call right after the loop will break (because it assumes that
'height' parameter will not be larger than the size of metapath's mp_list array length,
which is GFS2_MAX_META_HEIGHT). So, we need to check the 'height' after the loop ending,
and if its value is too big we need to break the execution of the function, and return
a proper error if it is too big.

Tested via syzbot.

Reported-by: syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=42296ea544c870f4dde3b25efa4cc1b89515d38e
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 fs/gfs2/bmap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index eedf6926c652..9b7358165f96 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -895,8 +895,16 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 	iomap->length = len << inode->i_blkbits;
 
 	height = ip->i_height;
-	while ((lblock + 1) * sdp->sd_sb.sb_bsize > sdp->sd_heightsize[height])
+
+	while (height <= GFS2_MAX_META_HEIGHT
+		&& (lblock + 1) * sdp->sd_sb.sb_bsize > sdp->sd_heightsize[height])
 		height++;
+
+	if (height > GFS2_MAX_META_HEIGHT) {
+		ret = -ERANGE;
+		goto unlock;
+	}
+
 	find_metapath(sdp, lblock, mp, height);
 	if (height > ip->i_height || gfs2_is_stuffed(ip))
 		goto do_alloc;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
