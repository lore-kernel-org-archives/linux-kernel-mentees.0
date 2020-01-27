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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F297C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426D12087F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue4NKg8D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426D12087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3593885465;
	Mon, 27 Jan 2020 10:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZ4HBbXStPGg; Mon, 27 Jan 2020 10:15:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF87084E68;
	Mon, 27 Jan 2020 10:15:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACB06C0177;
	Mon, 27 Jan 2020 10:15:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 256B8C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1C52C878A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VVKjij1hd5tu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 98B39878AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:41 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y8so3566355pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Zrn7+TeOkTDL/p3LQj1UqFH3/1vHE1+1wFLqYAGLVFQ=;
 b=Ue4NKg8DXDExYRFvWUyszMX+E/J0sZFpnwRNCf+XUFtDtHOfJtaQqbGvcIM+Qar5St
 qcbx3ws0c5nX5kwCKMFYHTyvrmTjhTD3jrBp56mLOWQOoVn6wE+v5mC1cycDEgRVF8Dh
 YneupgBhKHzteqCRdHzqsuL5E3SbSOcX2nAUhmiVL21/iGZ1gFuMakOclbdmZ9XoUGJ5
 1/Ro/t8dLB/0J4bfRJqZODjGuPzncpDaEio43mjN6UxspNZW08cVhLOOTvA9VU2SUwRR
 CkVz6ucDgO35azapQBYYyhcXcHX6E+5iNwbfBkwUc3nXrroruRNfBItXS67naqnC6UQu
 EJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Zrn7+TeOkTDL/p3LQj1UqFH3/1vHE1+1wFLqYAGLVFQ=;
 b=lFGG1w1q0mWM7oe0BXv+gMpCiycGs0VplfX/ARMjcyhpgrcDFZWvlTC4qjz+CNIwtx
 m5aNzHBKIMcXuXoGPdUVXGsI1+fR1eMEmaGdpCEcA8aNngug0z5B7cOgvuiNzVuEstJt
 CXcDptWNCQCOgJxpW2kf3Hc8Pe9lJ+/IfUzWUC44+v4IrfpmqYxQUFsTp5SmZzH7zvwf
 Y0/eDhfcesjRQeGCLRAp/5ocH5Ua7U8z1g6UYuKcGsLgQLx41yWmtKlhD+d1s0n+amIx
 81x1/Pp6YH+b4U5JvmII0bWbB05GRv9HsW6zsRhAP5ZFB5BHmLe3ge0B6jgf/1pG5krK
 0lpg==
X-Gm-Message-State: APjAAAWzndkM+0YGnvJyowhuIn+51ic/SodGZmWnnrYXZMVizCOjCjgd
 H1Iyp++43RLHLdqeCQf5DLQ=
X-Google-Smtp-Source: APXvYqyniCKZhC1kuMrRPm8eqcHWxRjMBkQxqVV5/6XC3yNbMSHud/o/D8j5MaJj4DYGbntDxDPjxA==
X-Received: by 2002:a17:902:9f98:: with SMTP id
 g24mr17267550plq.325.1580120141216; 
 Mon, 27 Jan 2020 02:15:41 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:15:40 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:37 +0530
Message-Id: <20200127101343.20415-17-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 16/22] staging: exfat: Rename
	variable "Name" to "name"
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

Change all the occurrences of "Name" to "name" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index abed7fed3823..bc917b241bab 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -270,7 +270,7 @@ struct file_id_t {
 };
 
 struct dir_entry_t {
-	char Name[MAX_NAME_LENGTH * MAX_CHARSET_SIZE];
+	char name[MAX_NAME_LENGTH * MAX_CHARSET_SIZE];
 
 	/* used only for FAT12/16/32, not used for exFAT */
 	char ShortName[DOS_NAME_LENGTH + 2];
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 223699a21079..8a4915aa3849 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1465,7 +1465,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 			memset((char *)&info->AccessTimestamp, 0,
 			       sizeof(struct date_time_t));
 			strcpy(info->ShortName, ".");
-			strcpy(info->Name, ".");
+			strcpy(info->name, ".");
 
 			dir.dir = p_fs->root_dir;
 			dir.flags = 0x01;
@@ -1530,7 +1530,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	 */
 	p_fs->fs_func->get_uni_name_from_ext_entry(sb, &fid->dir, fid->entry,
 						   uni_name.name);
-	nls_uniname_to_cstring(sb, info->Name, &uni_name);
+	nls_uniname_to_cstring(sb, info->name, &uni_name);
 
 	info->NumSubdirs = 2;
 
@@ -1948,7 +1948,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			*uni_name.name = 0x0;
 			fs_func->get_uni_name_from_ext_entry(sb, &dir, dentry,
 							     uni_name.name);
-			nls_uniname_to_cstring(sb, dir_entry->Name, &uni_name);
+			nls_uniname_to_cstring(sb, dir_entry->name, &uni_name);
 			exfat_buf_unlock(sb, sector);
 
 			ep = get_entry_in_dir(sb, &clu, i + 1, NULL);
@@ -1991,7 +1991,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 		}
 	}
 
-	*dir_entry->Name = '\0';
+	*dir_entry->name = '\0';
 
 	fid->rwoffset = (s64)(++dentry);
 
@@ -2129,7 +2129,7 @@ static int exfat_readdir(struct file *filp, struct dir_context *ctx)
 
 	cpos = EXFAT_I(inode)->fid.rwoffset << DENTRY_SIZE_BITS;
 
-	if (!de.Name[0])
+	if (!de.name[0])
 		goto end_of_dir;
 
 	if (!memcmp(de.ShortName, DOS_CUR_DIR_NAME, DOS_NAME_LENGTH)) {
@@ -2149,7 +2149,7 @@ static int exfat_readdir(struct file *filp, struct dir_context *ctx)
 		}
 	}
 
-	if (!dir_emit(ctx, de.Name, strlen(de.Name), inum,
+	if (!dir_emit(ctx, de.name, strlen(de.name), inum,
 		      (de.Attr & ATTR_SUBDIR) ? DT_DIR : DT_REG))
 		goto out;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
