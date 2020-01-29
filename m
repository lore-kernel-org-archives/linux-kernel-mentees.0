Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217F1C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E659E2071E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZwC7G6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E659E2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA2D5834A0;
	Wed, 29 Jan 2020 16:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdJyT8r-b-I6; Wed, 29 Jan 2020 16:59:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDCA482015;
	Wed, 29 Jan 2020 16:59:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDCF5C0178;
	Wed, 29 Jan 2020 16:59:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4D0AC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B0B632156F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3Quq0X3ypON
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id CAD562154B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:20 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c23so170617plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+EDxIJsHDlVxQBWoMyDcDk7ul9qL2jdZB2RuqZQeBC0=;
 b=DZwC7G6+wj+08ZAS4cW+cxuXNIxSuh7231GmgclgWEbvbz6Xgew4lzBB5MM3SIFYCW
 BbyWYonm0D2n8EzNW1tC27K9x8Qy7e/b+PFtEPvWzPQaPNQ6CM+08uGUVifnungI9cvS
 fBYBkmKYJChd7h+ldHqGzGH4BKhlPh+/15y74k/LUzu3BvrApPA/WBR49R/F2pTM/uWS
 qlEUgKNt01oc8a/HYvc9g4maj13H3wM0ANYtKhdLRck/t3h6Z+lM7b7CwnY+5Ubl3/gi
 PB3OiigyoGtZWCGJU2BqtHpeuPlLYSL09JZCTFqySFp4a5E4vz90KbOSj3P+EgK0jDf8
 YXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+EDxIJsHDlVxQBWoMyDcDk7ul9qL2jdZB2RuqZQeBC0=;
 b=GE33d8TaOVwvwF7aLEgHzdDGhguRyjeUA1idy6Rehs1ldoqdDVDTxTXEdge9kCxtek
 9Rd+nkv+HiAjz1yr6LUBGMC8+wpj+FKRE6cU/qZV2AczEygsSvC6r+7bNhpniRDbcCYa
 YE56c9+V3X0HLQtilHHSCEV9B4bIOCy9YyhEdbDOZpm41BoaQVXlMM9KrUeVgq18z/4h
 JYjMjRFAW1iZMmuABRDDGYO85p0es5WsI+eAJZc4+/zQ0N4HBkknyzM8raLl2ZBm1vm2
 Lio0xa5H9SxAM4qXC4cJ0BGWsxT/vFOh1qRRTSg3KvP20MM5IGgD/qtBTsESF3CTcLli
 YfPw==
X-Gm-Message-State: APjAAAWPdaLrOi3DOS2mQLDusQ7YN+GoRpnpq16PlHULiFMh5kp7AOhU
 SEDQzQJxXPnOxVza/jSvmAo=
X-Google-Smtp-Source: APXvYqxwdV1PhdQIvaEushK7sV9EooeMcZS6E2Nu2pBf/yMb6m+dNlkJFCF/U9t90jejQiUmUTjrBw==
X-Received: by 2002:a17:90a:98d:: with SMTP id 13mr614520pjo.102.1580317160367; 
 Wed, 29 Jan 2020 08:59:20 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id f8sm3223610pfn.2.2020.01.29.08.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:59:19 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Wed, 29 Jan 2020 22:28:18 +0530
Message-Id: <20200129165832.10574-6-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129165832.10574-1-pragat.pandya@gmail.com>
References: <20200129165832.10574-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/19] staging: exfat: Rename
	variable 'Minute' to 'minute'
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

Fix checkpatch warning: Avoid CamelCase.
Change all occurrences of identifier "Minute" to "minute"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 03eaf25692aa..755e2fd6e3fd 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -226,7 +226,7 @@ struct date_time_t {
 	u16      month;
 	u16      day;
 	u16      hour;
-	u16      Minute;
+	u16      minute;
 	u16      Second;
 	u16      MilliSecond;
 };
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index ae9180be4cc0..70fa5f118a38 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -60,7 +60,7 @@ static void exfat_write_super(struct super_block *sb);
 static void exfat_time_fat2unix(struct timespec64 *ts, struct date_time_t *tp)
 {
 	ts->tv_sec = mktime64(tp->year + 1980, tp->month + 1, tp->day,
-			      tp->hour, tp->Minute, tp->Second);
+			      tp->hour, tp->minute, tp->Second);
 
 	ts->tv_nsec = tp->MilliSecond * NSEC_PER_MSEC;
 }
@@ -76,7 +76,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 	if (second < UNIX_SECS_1980) {
 		tp->MilliSecond = 0;
 		tp->Second	= 0;
-		tp->Minute	= 0;
+		tp->minute	= 0;
 		tp->hour	= 0;
 		tp->day		= 1;
 		tp->month	= 1;
@@ -87,7 +87,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 	if (second >= UNIX_SECS_2108) {
 		tp->MilliSecond = 999;
 		tp->Second	= 59;
-		tp->Minute	= 59;
+		tp->minute	= 59;
 		tp->hour	= 23;
 		tp->day		= 31;
 		tp->month	= 12;
@@ -97,7 +97,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 
 	tp->MilliSecond = ts->tv_nsec / NSEC_PER_MSEC;
 	tp->Second	= tm.tm_sec;
-	tp->Minute	= tm.tm_min;
+	tp->minute	= tm.tm_min;
 	tp->hour	= tm.tm_hour;
 	tp->day		= tm.tm_mday;
 	tp->month	= tm.tm_mon + 1;
@@ -1509,7 +1509,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->CreateTimestamp.month = tm.mon;
 	info->CreateTimestamp.day = tm.day;
 	info->CreateTimestamp.hour = tm.hour;
-	info->CreateTimestamp.Minute = tm.min;
+	info->CreateTimestamp.minute = tm.min;
 	info->CreateTimestamp.Second = tm.sec;
 	info->CreateTimestamp.MilliSecond = 0;
 
@@ -1518,7 +1518,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->ModifyTimestamp.month = tm.mon;
 	info->ModifyTimestamp.day = tm.day;
 	info->ModifyTimestamp.hour = tm.hour;
-	info->ModifyTimestamp.Minute = tm.min;
+	info->ModifyTimestamp.minute = tm.min;
 	info->ModifyTimestamp.Second = tm.sec;
 	info->ModifyTimestamp.MilliSecond = 0;
 
@@ -1606,7 +1606,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 
 	/* set FILE_INFO structure using the acquired struct dentry_t */
 	tm.sec  = info->CreateTimestamp.Second;
-	tm.min  = info->CreateTimestamp.Minute;
+	tm.min  = info->CreateTimestamp.minute;
 	tm.hour = info->CreateTimestamp.hour;
 	tm.day  = info->CreateTimestamp.day;
 	tm.mon  = info->CreateTimestamp.month;
@@ -1614,7 +1614,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	p_fs->fs_func->set_entry_time(ep, &tm, TM_CREATE);
 
 	tm.sec  = info->ModifyTimestamp.Second;
-	tm.min  = info->ModifyTimestamp.Minute;
+	tm.min  = info->ModifyTimestamp.minute;
 	tm.hour = info->ModifyTimestamp.hour;
 	tm.day  = info->ModifyTimestamp.day;
 	tm.mon  = info->ModifyTimestamp.month;
@@ -1929,7 +1929,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->CreateTimestamp.month = tm.mon;
 			dir_entry->CreateTimestamp.day = tm.day;
 			dir_entry->CreateTimestamp.hour = tm.hour;
-			dir_entry->CreateTimestamp.Minute = tm.min;
+			dir_entry->CreateTimestamp.minute = tm.min;
 			dir_entry->CreateTimestamp.Second = tm.sec;
 			dir_entry->CreateTimestamp.MilliSecond = 0;
 
@@ -1938,7 +1938,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->ModifyTimestamp.month = tm.mon;
 			dir_entry->ModifyTimestamp.day = tm.day;
 			dir_entry->ModifyTimestamp.hour = tm.hour;
-			dir_entry->ModifyTimestamp.Minute = tm.min;
+			dir_entry->ModifyTimestamp.minute = tm.min;
 			dir_entry->ModifyTimestamp.Second = tm.sec;
 			dir_entry->ModifyTimestamp.MilliSecond = 0;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
