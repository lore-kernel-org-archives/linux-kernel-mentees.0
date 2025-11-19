Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4A6316192
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763534351; cv=none; b=eQi090qsiaprXsZoIakr6sAm8nTnDZhoy470X+0DJa+Arra/WolH9cteWUSNiPHGt3JbMTn0Jx+K9lnz0qYjyXM9tmlL/v8sqiVpeUyZFGmghws3Mprdj5Lbjs67Fsu5twfJPczJjq3lrwNOuOVuVbhboEJ+qhRNtnOdKVi0fyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763534351; c=relaxed/simple;
	bh=iv/2V65ay3MYD+zg/uXmPYJEYt6c0/sS7ygSOWw1Tzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgCl4nNCWNXnvmlzGJbE3o155HLUrRgl9FvYUm+trmWbzxTIAKJikXTwN5e1lfBplLth/6EaiMvfmuwyDU+iq2lyGfKnss7JFxv0kWxaWkb8geemqDJcsOo9KqPp2H81ZFHfPQeO3H2Z8SePOzOUc6S8MeN2ERJBWxZ0ZN/jb4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+PYFqcu; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+PYFqcu"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93923412EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 06:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3YWe0CDWCIm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Nov 2025 06:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 926C540B7E
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 926C540B7E
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+PYFqcu
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 926C540B7E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Nov 2025 06:39:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4779b49d724so4697485e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Nov 2025 22:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763534346; x=1764139146; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1xVzQCUtlha4eANiMsZQcVMtYn0VURMct9OKFdBU5k=;
        b=m+PYFqcuhb3tfDRS70DwMDLEI7Iy3ztOGQG1BE6q9i/woBco7nq8kZXyBD+jMQUtnB
         /Vs+5Hk1OO1EvQ2nWLay7ZwRyzlQodHAGXXBqhsuIHr/YF9G/wVdVcumPpNimmLf+cl7
         3NaY0HDfA4DMTMxGTA1+2LWwjdtqDh/q9jVQRb0stlb+yuxKEAGBJ5JelnYNeVhjnCDQ
         Qe4CodwAHTl5BOsLreX/OAc04/BEPT8ycbSjCL///bfeNu6GdUkx7Gs8/uVjfqBZfdRG
         fgDM84HfyonAYvwcbncF/k7loTwuWvWO5tjVFfAuztREUbTJB45Kp0FFwksfZeBDRERs
         hu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763534346; x=1764139146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1xVzQCUtlha4eANiMsZQcVMtYn0VURMct9OKFdBU5k=;
        b=bDGOaUG6SZhQYWIgimqGHrt/l8zgNQUqy1wWWl0B0Cs0zYekPpbs0xxNl/9J9LAN9x
         UeHKndi6YGdX9XGS9dTO0HFuZEQXvO2f51KJ6xGYmHBbuM3SJoib03h9ZHELFaNwG1y1
         1vx1uzFlS1dS+hJ46k+cpIDZdCZJSXh5Lj4Oe890jpbADppsjbjII8U3+wZ3PVxh9dHg
         eJruiNP5llmwZFByiPTdAGDgBgXOP0o24ek8JF76fyHF3vU8upcvIzlCearvb92kgL/2
         CwZgDf+LcmpurP8DWnLtq7wASwHbQxnsM4cCXsR5x/NCCVkSdLRNtK3UAV2KuA2vRrc7
         kWZw==
X-Forwarded-Encrypted: i=1; AJvYcCVsiknYZRacWziECzjqd4YwbpYoj8mTkBaK8NohXmdggiZmsCSWfVpq58r2zZgfShl60KuxL1NftfttG+KcE7e74Q41yA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwCDbDCWoHlGLV4npCvuxaWA1GsXrIxrp71bBtpkHq/+i23NZPV
	3ptY0E1TN8dznjdFfyNceAWl42EfFxpVFAJU9bNCEUL/dq0FbidEo2hG
X-Gm-Gg: ASbGncsoIj7aQiYKLSaFrZ2/aVu/IdSN50W+1c5B39bt6Sa0byeVsjLL3tu7IFgFrgx
	HDX2jcecZ/LqKeko6hNC4NQdmtXKlU9VMcLyRgakANF3GHQIaelvfXBPdB0zlA2Fy/tVrKpVmYQ
	lQdJZoZ13j/eF/Lgb96QykhfN49cOwYrYltzkbo9pF/qfR9tyjVdP0ztFBO26mJ528cKCXyApWF
	flTjjmuFETukAosJfWcv5xUQThDmnkU9sDxOcPEHxouHEDHqUPtsswuaw125WxnAiT48A/7SvWa
	IcSglkVRcuUA93DNsjMkjvYNSBZ8D0UFcW2dSaRA5G9uVYEQ6NU4Cg389eywIb6c4CrWmA2ATqi
	qy98VjOGf/G3TstBGyDJBHgtjPCs8m5Bb5Rm6ha1JuW389Xx73hy11rO8Ki2RcfLe4A9va7da/m
	65zSMlOqnK4QZu3fA=
X-Google-Smtp-Source: AGHT+IFVKoZk9N7QhSRfuxnSPuUS4Q1FHG+IbsLr577Ad9xm7bFuDNcywKGc+cpHM2PozpRA9AyIIw==
X-Received: by 2002:a05:600c:1d1b:b0:477:5ca6:4d51 with SMTP id 5b1f17b1804b1-477a9c2aa7amr29179765e9.3.1763534346199;
        Tue, 18 Nov 2025 22:39:06 -0800 (PST)
Received: from bhk ([165.50.116.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10173a3sm29112015e9.5.2025.11.18.22.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:39:05 -0800 (PST)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	brauner@kernel.org,
	jack@suse.cz,
	viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
	syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Subject: [PATCH v2] fs/hfs: fix s_fs_info leak on setup_bdev_super() failure
Date: Wed, 19 Nov 2025 08:38:20 +0100
Message-ID: <20251119073845.18578-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regression introduced by commit aca740cecbe5 ("fs: open block device
after superblock creation") allows setup_bdev_super() to fail after a new
superblock has been allocated by sget_fc(), but before hfs_fill_super()
takes ownership of the filesystem-specific s_fs_info data.

In that case, hfs_put_super() and the failure paths of hfs_fill_super()
are never reached, leaving the HFS mdb structures attached to s->s_fs_info
unreleased.The default kill_block_super() teardown also does not free 
HFS-specific resources, resulting in a memory leak on early mount failure.

Fix this by moving all HFS-specific teardown (hfs_mdb_put()) from
hfs_put_super() and the hfs_fill_super() failure path into a dedicated
hfs_kill_sb() implementation. This ensures that both normal unmount and
early teardown paths (including setup_bdev_super() failure) correctly
release HFS metadata.

This also preserves the intended layering: generic_shutdown_super()
handles VFS-side cleanup, while HFS filesystem state is fully destroyed
afterwards.

Fixes: aca740cecbe5 ("fs: open block device after superblock creation")
Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
Tested-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
ChangeLog:

Changes from v1:

-Changed the patch direction to focus on hfs changes specifically as 
suggested by al viro

Link:https://lore.kernel.org/all/20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com/

Note:This patch might need some more testing as I only did run selftests 
with no regression, check dmesg output for no regression, run reproducer 
with no bug and test it with syzbot as well.

 fs/hfs/super.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index 47f50fa555a4..06e1c25e47dc 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -49,8 +49,6 @@ static void hfs_put_super(struct super_block *sb)
 {
 	cancel_delayed_work_sync(&HFS_SB(sb)->mdb_work);
 	hfs_mdb_close(sb);
-	/* release the MDB's resources */
-	hfs_mdb_put(sb);
 }
 
 static void flush_mdb(struct work_struct *work)
@@ -383,7 +381,6 @@ static int hfs_fill_super(struct super_block *sb, struct fs_context *fc)
 bail_no_root:
 	pr_err("get root inode failed\n");
 bail:
-	hfs_mdb_put(sb);
 	return res;
 }
 
@@ -431,10 +428,21 @@ static int hfs_init_fs_context(struct fs_context *fc)
 	return 0;
 }
 
+static void hfs_kill_sb(struct super_block *sb)
+{
+	generic_shutdown_super(sb);
+	hfs_mdb_put(sb);
+	if (sb->s_bdev) {
+		sync_blockdev(sb->s_bdev);
+		bdev_fput(sb->s_bdev_file);
+	}
+
+}
+
 static struct file_system_type hfs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "hfs",
-	.kill_sb	= kill_block_super,
+	.kill_sb	= hfs_kill_sb,
 	.fs_flags	= FS_REQUIRES_DEV,
 	.init_fs_context = hfs_init_fs_context,
 };
-- 
2.52.0

