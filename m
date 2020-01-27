Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FC2C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7B6208CD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9j3oibD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B7B6208CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C9BC420482;
	Mon, 27 Jan 2020 10:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwgZctzOIpH9; Mon, 27 Jan 2020 10:15:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C023A20035;
	Mon, 27 Jan 2020 10:15:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDAE8C0177;
	Mon, 27 Jan 2020 10:15:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBC38C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BAB5320035
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJoVwEpgjjJ2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 495EF20482
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:46 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g6so3576134plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I9pkyhc+eRMc75D37+Ijz8Li4nOzz5kNkid/81a27nw=;
 b=L9j3oibDgnrRL03YsdZBscU5YT8Rv5RVywL/GWNRVCybUYM3dj6iKCW81+uqkYsIdA
 bw53Hh2vqL196hh+keBnqu1qAOu+Fv8X1f58wkVjmJMb6OyFPsoBHbGOxJudnrqfhsED
 sj3txTD0JALBhaJuwmJ2yyIU5f7EPA/5pgIUy0v2LoaLloZ0zWw2uHq2dL+UV/8EPfoU
 DMnP18FyxdexnjLrD06SXoIQfCthKykQ0c0L/y2zGhcl2y0NftH6i8w+9B8fvdvXi/XK
 nQzLK2RwYgVWZkBDXKuuN8DI4gS4EXvaWjJv5yQG/0bQ0sNv8YvGPGX2raR9it67EWNV
 56FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I9pkyhc+eRMc75D37+Ijz8Li4nOzz5kNkid/81a27nw=;
 b=iEEmTWY7DGNVIRsw3ZeRYHwn1W5EdyNQZEeZ6/RvDH/DKGJSyOuJ0wb5Tm8+KN5Egf
 SoL6ROne6Wg6wfK2YCi2xAl2/L7Rt7D8yrPSHE9R7dHlHlPbFpa3/a+WpK6G9qpuoVUK
 qhxyg/5V5Xq88+JiPSN7a1L4dZdspaxyJtGdgQFFQ6riM+bx1JEVhMBNEZPfYzB0QtMQ
 zpKhXDU+wEgH3ojB25gIswD58+ZSGYC98SFRPxP5HwFFUqB9dd8lpDCHrtKAg63kwF7V
 dibwblzbgfoW2I8sLYdWM3CDUFPzvG1MUuke8ChhuKlMQzs4GpBDQkwqpfjArqGREZGS
 EpgA==
X-Gm-Message-State: APjAAAX+AUPksLrOaUmHWOEJ8a7rExbDldLAndazZMgrjpV1ehKPtGcJ
 vIeH0MoHm/n60GrOy9ChfVg=
X-Google-Smtp-Source: APXvYqyN0c3kUL7zYMEV8gTBqJZRquANVf/BMwwevYJCRJD2T+WVZZJZetgB1ahLfrOQp7P/jEHh3g==
X-Received: by 2002:a17:902:654d:: with SMTP id
 d13mr16244156pln.187.1580120145953; 
 Mon, 27 Jan 2020 02:15:45 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:15:45 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:38 +0530
Message-Id: <20200127101343.20415-18-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 17/22] staging: exfat: Rename
	variable "ShortName" to "short_name"
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

Change all the occurrences of "ShortName" to "short_name" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       | 2 +-
 drivers/staging/exfat/exfat_super.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index bc917b241bab..c334467d6c94 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -273,7 +273,7 @@ struct dir_entry_t {
 	char name[MAX_NAME_LENGTH * MAX_CHARSET_SIZE];
 
 	/* used only for FAT12/16/32, not used for exFAT */
-	char ShortName[DOS_NAME_LENGTH + 2];
+	char short_name[DOS_NAME_LENGTH + 2];
 
 	u32 Attr;
 	u64 Size;
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 8a4915aa3849..73ebe5a5dde9 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1464,7 +1464,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 			       sizeof(struct date_time_t));
 			memset((char *)&info->AccessTimestamp, 0,
 			       sizeof(struct date_time_t));
-			strcpy(info->ShortName, ".");
+			strcpy(info->short_name, ".");
 			strcpy(info->name, ".");
 
 			dir.dir = p_fs->root_dir;
@@ -2132,9 +2132,9 @@ static int exfat_readdir(struct file *filp, struct dir_context *ctx)
 	if (!de.name[0])
 		goto end_of_dir;
 
-	if (!memcmp(de.ShortName, DOS_CUR_DIR_NAME, DOS_NAME_LENGTH)) {
+	if (!memcmp(de.short_name, DOS_CUR_DIR_NAME, DOS_NAME_LENGTH)) {
 		inum = inode->i_ino;
-	} else if (!memcmp(de.ShortName, DOS_PAR_DIR_NAME, DOS_NAME_LENGTH)) {
+	} else if (!memcmp(de.short_name, DOS_PAR_DIR_NAME, DOS_NAME_LENGTH)) {
 		inum = parent_ino(filp->f_path.dentry);
 	} else {
 		loff_t i_pos = ((loff_t)EXFAT_I(inode)->fid.start_clu << 32) |
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
