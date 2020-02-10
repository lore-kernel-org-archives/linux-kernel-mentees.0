Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4809EC352A5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:37:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1965720715
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMXGFyJM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1965720715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0912D87918;
	Mon, 10 Feb 2020 18:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1+GoM5wZhnB; Mon, 10 Feb 2020 18:37:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F76F8754B;
	Mon, 10 Feb 2020 18:37:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69EA4C07FE;
	Mon, 10 Feb 2020 18:37:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F7AFC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7F44D851AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOdZj-bBCcw8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E65DB85116
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:45 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id fa20so134582pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 10:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TP4KIXmliZlSTTkmdhzqJOjPZvhN6oRbhKPNHj7WueI=;
 b=DMXGFyJM/yDFrK+YqR/XKM8P9CbDdzXYxFhO7X7bBuVL6jV8OWiJ93N+QOqCFM8eZy
 Nz43tVKSflqXdFbpVUJ4jH76YEzq3dM1WoXvQwin4CsgR3P3F/uwm2Y9/2TQOZGxifTa
 90YcOTyy4nfDzd8hHUwlmumrIWLkwJl9v9QXq0aZB9cB3aZ90n9/7jvdB2RATAr6JGQm
 WdSpAkCGRqXwBr6PqTTwm3OxnDITH3L6MO/RENp5ToBq4dNXRGnN4x11yJvBsdIdlnrr
 Lxx40JH+7NinXGB8An5M7mlc1c0p6NKlzoQqk5iMqB7mHIgwtJfJhlUnAhceMQ7u9qxz
 kkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TP4KIXmliZlSTTkmdhzqJOjPZvhN6oRbhKPNHj7WueI=;
 b=Nq7Iz+ypST5jTkjsiFLkBX1xoqiGomnzjP8npsEuvYUnGtxMTTq3yfRLAr6Q15amvJ
 adqGqciHIKBj6ro8n5N8IvIKjviRoxjBHGsqYzM3g/EOdjXpXZH7F6FaZnzbKRoeh66t
 Fg5J38fI6PSsbewCJC1k2iV9EFqe+PuDUAAnGi6GXlLZKFM8OFzm1gogMHq+PsijNbwW
 uhoVdWILdQiixqBJtAiko++5XOFPP3LHsUNaKK40tZNeFBk7PwwN1c3Gk7mVUl9Z7W2w
 HdbVGMgIsQ6mBZJ6n/Mfe8w6RnGqAheHCYK9JVB7DLRrfsL9STS8m9mbX4iJu9imXX5U
 nELQ==
X-Gm-Message-State: APjAAAU9qkQ/nMWgnmk/ldmkYwcfi2FhyoCcvfNW/h08GTwf1quPHsxM
 m38FmgGdf6mVUDsveJefLKg=
X-Google-Smtp-Source: APXvYqwJJuMPvB7/KCETiV0lz8ywm0ELl2ZAU2n1a/xcBLoTD3dMbg7STDKYTrIYas6lnyUdnpTVlg==
X-Received: by 2002:a17:90a:cb0f:: with SMTP id
 z15mr432958pjt.67.1581359865346; 
 Mon, 10 Feb 2020 10:37:45 -0800 (PST)
Received: from localhost.localdomain ([2405:204:8308:74f3:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id gc1sm124922pjb.20.2020.02.10.10.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 10:37:44 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 00:05:54 +0530
Message-Id: <20200210183558.11836-16-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210183558.11836-1-pragat.pandya@gmail.com>
References: <20200207094612.GA562325@kroah.com>
 <20200210183558.11836-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 15/19] staging: exfat: Rename
	variable 'Attr' to 'attr'
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

Fix checkpatch warning: Avoid CamelCase
Change all occurrences of identifier "Attr" to "attr"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 319c53fb62dc..883e2c5ae6df 100644
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
index d32759d5ba68..13ff6ba97528 100644
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
-	info->Attr = exfat_get_entry_attr(ep);
+	info->attr = exfat_get_entry_attr(ep);
 
 	exfat_get_entry_time(ep, &tm, TM_CREATE);
 	info->CreateTimestamp.year = tm.year;
@@ -1602,7 +1602,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	}
 	ep2 = ep + 1;
 
-	exfat_set_entry_attr(ep, info->Attr);
+	exfat_set_entry_attr(ep, info->attr);
 
 	/* set FILE_INFO structure using the acquired struct dentry_t */
 	tm.sec  = info->CreateTimestamp.second;
@@ -1919,7 +1919,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 				continue;
 
 			exfat_buf_lock(sb, sector);
-			dir_entry->Attr = exfat_get_entry_attr(ep);
+			dir_entry->attr = exfat_get_entry_attr(ep);
 
 			exfat_get_entry_time(ep, &tm, TM_CREATE);
 			dir_entry->CreateTimestamp.year = tm.year;
@@ -2147,7 +2147,7 @@ static int exfat_readdir(struct file *filp, struct dir_context *ctx)
 	}
 
 	if (!dir_emit(ctx, de.name, strlen(de.name), inum,
-		      (de.Attr & ATTR_SUBDIR) ? DT_DIR : DT_REG))
+		      (de.attr & ATTR_SUBDIR) ? DT_DIR : DT_REG))
 		goto out;
 
 	ctx->pos = cpos;
@@ -3156,25 +3156,25 @@ static int exfat_fill_inode(struct inode *inode, struct file_id_t *fid)
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
@@ -3183,7 +3183,7 @@ static int exfat_fill_inode(struct inode *inode, struct file_id_t *fid)
 		i_size_write(inode, info.Size);
 		EXFAT_I(inode)->mmu_private = i_size_read(inode);
 	}
-	exfat_save_attr(inode, info.Attr);
+	exfat_save_attr(inode, info.attr);
 
 	inode->i_blocks = ((i_size_read(inode) + (p_fs->cluster_size - 1))
 				& ~((loff_t)p_fs->cluster_size - 1)) >> 9;
@@ -3256,7 +3256,7 @@ static int exfat_write_inode(struct inode *inode, struct writeback_control *wbc)
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
