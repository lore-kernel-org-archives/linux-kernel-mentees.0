Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75797C3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:36:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46BA820863
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3aNBSLc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46BA820863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 19ED4859F8;
	Mon, 10 Feb 2020 18:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vB7YOgeOX4eD; Mon, 10 Feb 2020 18:36:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5408685782;
	Mon, 10 Feb 2020 18:36:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51382C07FE;
	Mon, 10 Feb 2020 18:36:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61D21C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4B56F85C04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aT5NBZigP6tA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:36:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E75B886100
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:36:54 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n7so4136461pfn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 10:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CYh7/xUVZL6cOrMJXppRTQ2cXYmqyF167wYvFRu9QjA=;
 b=r3aNBSLcmojs7vqCMSYWY9Bx8CUf79eeg1YHjqKOKU71KlQ3G2Q8fXV517VaBD8dDc
 GO9P6dl3fIEnvu6YWzBrv0IkWbHaV6iJhWZlCFlR/04+vb3qPr1oMvpOmFD4+GbiGYpi
 QO8XkNZGWbW5Rhdyt4k4aeLnKYEZQAJTOxmQGTKJGw9FZSBYsJbYV/0iAejBGn/+6Tse
 IyBQB7RmRoZWjQaTlKU/5Jh96cubp+rqh7UKsOcuwoDDv7A9vwVz0yrJusoTPOEHdr3R
 OQMMayfPNqD+jFXiZccWQ6cNlLWaqwn+h0gs4LumU3buSjC80LDEvlWGoChJGus+JEY1
 qc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CYh7/xUVZL6cOrMJXppRTQ2cXYmqyF167wYvFRu9QjA=;
 b=D/IDq+Th3OzLwf9CPrN1szzaBzGoFTBg4AKMX0RpBmxr/c5UQGsjG8BIMKtAlnQWgr
 8wvKqyzNhpj6er7jg9yP4G+v0PnIMwqPeX/FxMxcc/ktMwhfDsn5Ozierhm018GCQM/v
 4v7MUWXPblyjoj+U+LWzb783JbCAdWkRnlw9RjUeF3DgzsFD7X5gKaz7+ZdbfSUE2u3G
 EI+RC9FDnvaawxF9yXod1FU9fs8dtkk9YnQqYAXpvX+uETtntGLk4y1P6SQ8o/GhIQlC
 GrfoqYlPLmzyeCMuUYFUAWzhF1Frf+gGjEu9BVU3jx9Hi+X1JBFjFEMcuckk6WhF9e0y
 45TA==
X-Gm-Message-State: APjAAAXCgylZaIymppMqqhhOgbu1nBfEzYjMHw5KWMyAxWoN1MvtmwnQ
 KnvijJiGfaSCFvVF6tKluSs=
X-Google-Smtp-Source: APXvYqxPN+uyjIU8IN1yHzGdC58e5ItJzkaGUyujK0+8qzCL26uf6ahgZYcPiLXOW7dOtI7034mOeg==
X-Received: by 2002:a63:28a:: with SMTP id 132mr2918728pgc.165.1581359814572; 
 Mon, 10 Feb 2020 10:36:54 -0800 (PST)
Received: from localhost.localdomain ([2405:204:8308:74f3:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id gc1sm124922pjb.20.2020.02.10.10.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 10:36:53 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 00:05:44 +0530
Message-Id: <20200210183558.11836-6-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210183558.11836-1-pragat.pandya@gmail.com>
References: <20200207094612.GA562325@kroah.com>
 <20200210183558.11836-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 05/19] staging: exfat: Rename
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

Fix checkpatch warning: Avoid CamelCase
Change all occurrences of identifier "Minute" to "minute"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 4ec4660e3a4d..fe0270e7b685 100644
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
index 41e4fb8b697f..9e1b6a7ad5ff 100644
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
 	exfat_set_entry_time(ep, &tm, TM_CREATE);
 
 	tm.sec  = info->ModifyTimestamp.Second;
-	tm.min  = info->ModifyTimestamp.Minute;
+	tm.min  = info->ModifyTimestamp.minute;
 	tm.hour = info->ModifyTimestamp.hour;
 	tm.day  = info->ModifyTimestamp.day;
 	tm.mon  = info->ModifyTimestamp.month;
@@ -1926,7 +1926,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->CreateTimestamp.month = tm.mon;
 			dir_entry->CreateTimestamp.day = tm.day;
 			dir_entry->CreateTimestamp.hour = tm.hour;
-			dir_entry->CreateTimestamp.Minute = tm.min;
+			dir_entry->CreateTimestamp.minute = tm.min;
 			dir_entry->CreateTimestamp.Second = tm.sec;
 			dir_entry->CreateTimestamp.MilliSecond = 0;
 
@@ -1935,7 +1935,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
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
