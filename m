Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79A9C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA56208CD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKAVV8Qe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA56208CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C321858BA;
	Mon, 27 Jan 2020 10:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XXS0kGkzwyL; Mon, 27 Jan 2020 10:15:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 20743857A4;
	Mon, 27 Jan 2020 10:15:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 102DBC0177;
	Mon, 27 Jan 2020 10:15:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E1B5C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0DB73878A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHHJfxmq9Kr1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 705088786C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:51 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s64so4906499pgb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6mzLI+wtc2kOuCtFneU5ySfiV5hsQ4urxaDglWXuygk=;
 b=LKAVV8Qe8yGoWxvADsAz8TKDZHz9mguSb91w/doXwhTLS7p0/xtnmPXRqGKbpXb0OS
 i+lFjKus8wnR0C+bB48IC8R+wBj6SWDMynVx91QtPhD7elRxPktRvVqm5h0ijtL8Bu6L
 kt8BGfh/r/riXiF4N+NEw7r0vv1ALJpery+yd5ubfUbIz4JYc2NugWksPYStjcTmF9wm
 26Mc0/qrv34WzyJgzfj/l3rb+/Rpj6t3pt56x0jdhKiaZT++7gK2Sx1YRQZG8nJkf80s
 8HXmQbGhroUjRKwfZCYM77c2aCurM1qHj8lHhCe63sTSUP3e1glnaS8Z+JOYF84VOG1p
 7EXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6mzLI+wtc2kOuCtFneU5ySfiV5hsQ4urxaDglWXuygk=;
 b=t4TvisP328UwLxsSK5O0TIi1D+hjuUwCUciFgUHzfSP8ULXQi5qmNI5Ogl7df4nQAi
 Sjlizt61qLWhvM1I/IrJodM3blvfsC3JZdgheIzHHHje+6SGznm2MiG+FUzRWS4vHhLQ
 o5vz8AjJjsxIafS1RWBazCTaJ4Sz3DMaUDaTzm6rPfPYeuV+RtoZrva3E8dAiC1/xrWR
 wLU2uKCYVoUxQunNyun0w9DiaiKqrSl99yShMLN7a1++anlh9bXeRXvnMiCI7mL0MXd9
 33i4jnB08ewSB26WVexpPSg5Pir4Ar62ZoJvKMy7BEwqX72mIqWQ74d3hEjKXa1XHxY6
 8+TQ==
X-Gm-Message-State: APjAAAVkUvpSc9DylwNJJwg9baEPfgmXqcImvcVy+RHMTvcjU0oeevTD
 9cCP0tEkdF5XjiFpK7q/4sQ=
X-Google-Smtp-Source: APXvYqyG/3pTh8y95FDi/XDOxT/OKY5BScVZUixvzySfgzb2m0a+oRq9Sub5fMZ+2iDhVUkkeFBrUQ==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr18853910pgc.450.1580120151033; 
 Mon, 27 Jan 2020 02:15:51 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:15:50 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:39 +0530
Message-Id: <20200127101343.20415-19-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 18/22] staging: exfat: Rename
	variable "Attr" to "attr"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Change all the occurrences of "Attr" to "attr" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index c334467d6c94..ab48bbd083e5 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -275,7 +275,7 @@ struct dir_entry_t {
 	/* used only for FAT12/16/32, not used for exFAT */
 	char short_name[DOS_NAME_LENGTH + 2];
 
-	u32 Attr;
+	u32 attr;
 	u64 Size;
 	u32 NumSubdirs;
 	struct date_time_t CreateTimestamp;
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 73ebe5a5dde9..27d6362f2102 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1457,7 +1457,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	if (is_dir) {
 		if ((fid->dir.dir == p_fs->root_dir) &&
 		    (fid->entry == -1)) {
-			info->Attr = ATTR_SUBDIR;
+			info->attr = ATTR_SUBDIR;
 			memset((char *)&info->CreateTimestamp, 0,
 			       sizeof(struct date_time_t));
 			memset((char *)&info->ModifyTimestamp, 0,
@@ -1502,7 +1502,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	ep2 = ep + 1;
 
 	/* set FILE_INFO structure using the acquired struct dentry_t */
-	info->Attr = p_fs->fs_func->get_entry_attr(ep);
+	info->attr = p_fs->fs_func->get_entry_attr(ep);
 
 	p_fs->fs_func->get_entry_time(ep, &tm, TM_CREATE);
 	info->CreateTimestamp.year = tm.year;
@@ -1602,7 +1602,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	}
 	ep2 = ep + 1;
 
-	p_fs->fs_func->set_entry_attr(ep, info->Attr);
+	p_fs->fs_func->set_entry_attr(ep, info->attr);
 
 	/* set FILE_INFO structure using the acquired struct dentry_t */
 	tm.sec  = info->CreateTimestamp.second;
@@ -1922,7 +1922,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 				continue;
 
 			exfat_buf_lock(sb, sector);
-			dir_entry->Attr = fs_func->get_entry_attr(ep);
+			dir_entry->attr = fs_func->get_entry_attr(ep);
 
 			fs_func->get_entry_time(ep, &tm, TM_CREATE);
 			dir_entry->CreateTimestamp.year = tm.year;
@@ -2150,7 +2150,7 @@ static int exfat_readdir(struct file *filp, struct dir_context *ctx)
 	}
 
 	if (!dir_emit(ctx, de.name, strlen(de.name), inum,
-		      (de.Attr & ATTR_SUBDIR) ? DT_DIR : DT_REG))
+		      (de.attr & ATTR_SUBDIR) ? DT_DIR : DT_REG))
 		goto out;
 
 	ctx->pos = cpos;
@@ -3159,25 +3159,25 @@ static int exfat_fill_inode(struct inode *inode, struct file_id_t *fid)
 	INC_IVERSION(inode);
 	inode->i_generation = prandom_u32();
 
-	if (info.Attr & ATTR_SUBDIR) { /* directory */
+	if (info.attr & ATTR_SUBDIR) { /* directory */
 		inode->i_generation &= ~1;
-		inode->i_mode = exfat_make_mode(sbi, info.Attr, 0777);
+		inode->i_mode = exfat_make_mode(sbi, info.attr, 0777);
 		inode->i_op = &exfat_dir_inode_operations;
 		inode->i_fop = &exfat_dir_operations;
 
 		i_size_write(inode, info.Size);
 		EXFAT_I(inode)->mmu_private = i_size_read(inode);
 		set_nlink(inode, info.NumSubdirs);
-	} else if (info.Attr & ATTR_SYMLINK) { /* symbolic link */
+	} else if (info.attr & ATTR_SYMLINK) { /* symbolic link */
 		inode->i_generation |= 1;
-		inode->i_mode = exfat_make_mode(sbi, info.Attr, 0777);
+		inode->i_mode = exfat_make_mode(sbi, info.attr, 0777);
 		inode->i_op = &exfat_symlink_inode_operations;
 
 		i_size_write(inode, info.Size);
 		EXFAT_I(inode)->mmu_private = i_size_read(inode);
 	} else { /* regular file */
 		inode->i_generation |= 1;
-		inode->i_mode = exfat_make_mode(sbi, info.Attr, 0777);
+		inode->i_mode = exfat_make_mode(sbi, info.attr, 0777);
 		inode->i_op = &exfat_file_inode_operations;
 		inode->i_fop = &exfat_file_operations;
 		inode->i_mapping->a_ops = &exfat_aops;
@@ -3186,7 +3186,7 @@ static int exfat_fill_inode(struct inode *inode, struct file_id_t *fid)
 		i_size_write(inode, info.Size);
 		EXFAT_I(inode)->mmu_private = i_size_read(inode);
 	}
-	exfat_save_attr(inode, info.Attr);
+	exfat_save_attr(inode, info.attr);
 
 	inode->i_blocks = ((i_size_read(inode) + (p_fs->cluster_size - 1))
 				& ~((loff_t)p_fs->cluster_size - 1)) >> 9;
@@ -3259,7 +3259,7 @@ static int exfat_write_inode(struct inode *inode, struct writeback_control *wbc)
 	if (inode->i_ino == EXFAT_ROOT_INO)
 		return 0;
 
-	info.Attr = exfat_make_attr(inode);
+	info.attr = exfat_make_attr(inode);
 	info.Size = i_size_read(inode);
 
 	exfat_time_unix2fat(&inode->i_mtime, &info.ModifyTimestamp);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
