Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CD6C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:14:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DE02087F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPWPhZFI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DE02087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35478878A0;
	Mon, 27 Jan 2020 10:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXb593hMAaq8; Mon, 27 Jan 2020 10:14:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9403C8786C;
	Mon, 27 Jan 2020 10:14:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90DDFC0177;
	Mon, 27 Jan 2020 10:14:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A93F6C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 947A08789C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHTGzjW-GIha
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F325F8786C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:42 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b9so4897087pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U2kK5QEuHw6BDRLLriJ4VrZEogoNI4xjUaHdmahuy1Q=;
 b=YPWPhZFIgDWywyLJN6/qIsG31ce0rhTRCkzttxPQWlZLq2it1DamghT2wdD4MQHjTi
 RiRAtFCqtlIl0RrD1uW2cu5Qq8KZMD2D0AaORIlqxzcujKZ9pdvd1rgVfUN7pfGOjjQc
 Iep9icpoZgwkoeKFnSoqSmMYTqg62fjwQ1+guGlJFJ86690MNNv14IdSne44L0LIcsbQ
 oFVOC2Mx5EkWi0O4e1LM3tM991IpdNn9vTYgxl1HoKkCZvB9mavpuLy7bIHxs6n8Kijt
 wJrxngQt6ckSAq1FR+CJctU9KMBhZkRnq9tnacepwEGcRl59IHue2pqLYIRFG5TEMwBv
 Xi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U2kK5QEuHw6BDRLLriJ4VrZEogoNI4xjUaHdmahuy1Q=;
 b=R79Tn2TIFRneAcefIU2pYRbXn/R4SmIwM5ijw1eToa/xdBMDrg93UBNPr3iy9eM/Za
 T2EJiYpeKPi3jMVJLCf+rZMoxCsNOH5d2OzQBOw84qOLtMddYTK2Yb/DGQNdY9aCaapP
 AmrYpDvK6X1xgriQUZvLHKZSSa0Z5gV07hi68hjlMKkHO0WU9UKso8kROVOZJCtOBvdM
 eAQq6t3fCOxRVNREW8yrbt++9TdhnRT2mBMXuo0QObphGlxRkdYxIhnz6IJ93elkOTd2
 cJpzDpG9gF2dDaUn538BqQQEUChdPmfiw4Ig/ygTJSQYsG1VgB6uD6hd6pFEgU8i2zdt
 tOyg==
X-Gm-Message-State: APjAAAW5+Qz40z2HQT4uENzkIs/rduj+avwycKaqixDVI6gll716tRSi
 ENG2F664/bZp/jPaSmC7EVs=
X-Google-Smtp-Source: APXvYqwnQX1jR4AsX/BW6ri81emgk7pE+99yO4Hrzl7exS6e/hCGUNhvseS3ECuIo15XYE2rECZXpQ==
X-Received: by 2002:a63:5818:: with SMTP id m24mr18836508pgb.358.1580120082582; 
 Mon, 27 Jan 2020 02:14:42 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:14:41 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:25 +0530
Message-Id: <20200127101343.20415-5-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 04/22] staging: exfat: Rename
	variable "Hour" to "hour"
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

Change all the occurrences of "Hour" to "hour" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 4211148405c5..03eaf25692aa 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -225,7 +225,7 @@ struct date_time_t {
 	u16      year;
 	u16      month;
 	u16      day;
-	u16      Hour;
+	u16      hour;
 	u16      Minute;
 	u16      Second;
 	u16      MilliSecond;
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index b30f9517cfef..ae9180be4cc0 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -60,7 +60,7 @@ static void exfat_write_super(struct super_block *sb);
 static void exfat_time_fat2unix(struct timespec64 *ts, struct date_time_t *tp)
 {
 	ts->tv_sec = mktime64(tp->year + 1980, tp->month + 1, tp->day,
-			      tp->Hour, tp->Minute, tp->Second);
+			      tp->hour, tp->Minute, tp->Second);
 
 	ts->tv_nsec = tp->MilliSecond * NSEC_PER_MSEC;
 }
@@ -77,7 +77,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 		tp->MilliSecond = 0;
 		tp->Second	= 0;
 		tp->Minute	= 0;
-		tp->Hour	= 0;
+		tp->hour	= 0;
 		tp->day		= 1;
 		tp->month	= 1;
 		tp->year	= 0;
@@ -88,7 +88,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 		tp->MilliSecond = 999;
 		tp->Second	= 59;
 		tp->Minute	= 59;
-		tp->Hour	= 23;
+		tp->hour	= 23;
 		tp->day		= 31;
 		tp->month	= 12;
 		tp->year	= 127;
@@ -98,7 +98,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 	tp->MilliSecond = ts->tv_nsec / NSEC_PER_MSEC;
 	tp->Second	= tm.tm_sec;
 	tp->Minute	= tm.tm_min;
-	tp->Hour	= tm.tm_hour;
+	tp->hour	= tm.tm_hour;
 	tp->day		= tm.tm_mday;
 	tp->month	= tm.tm_mon + 1;
 	tp->year	= tm.tm_year + 1900 - 1980;
@@ -1508,7 +1508,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->CreateTimestamp.year = tm.year;
 	info->CreateTimestamp.month = tm.mon;
 	info->CreateTimestamp.day = tm.day;
-	info->CreateTimestamp.Hour = tm.hour;
+	info->CreateTimestamp.hour = tm.hour;
 	info->CreateTimestamp.Minute = tm.min;
 	info->CreateTimestamp.Second = tm.sec;
 	info->CreateTimestamp.MilliSecond = 0;
@@ -1517,7 +1517,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->ModifyTimestamp.year = tm.year;
 	info->ModifyTimestamp.month = tm.mon;
 	info->ModifyTimestamp.day = tm.day;
-	info->ModifyTimestamp.Hour = tm.hour;
+	info->ModifyTimestamp.hour = tm.hour;
 	info->ModifyTimestamp.Minute = tm.min;
 	info->ModifyTimestamp.Second = tm.sec;
 	info->ModifyTimestamp.MilliSecond = 0;
@@ -1607,7 +1607,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	/* set FILE_INFO structure using the acquired struct dentry_t */
 	tm.sec  = info->CreateTimestamp.Second;
 	tm.min  = info->CreateTimestamp.Minute;
-	tm.hour = info->CreateTimestamp.Hour;
+	tm.hour = info->CreateTimestamp.hour;
 	tm.day  = info->CreateTimestamp.day;
 	tm.mon  = info->CreateTimestamp.month;
 	tm.year = info->CreateTimestamp.year;
@@ -1615,7 +1615,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 
 	tm.sec  = info->ModifyTimestamp.Second;
 	tm.min  = info->ModifyTimestamp.Minute;
-	tm.hour = info->ModifyTimestamp.Hour;
+	tm.hour = info->ModifyTimestamp.hour;
 	tm.day  = info->ModifyTimestamp.day;
 	tm.mon  = info->ModifyTimestamp.month;
 	tm.year = info->ModifyTimestamp.year;
@@ -1928,7 +1928,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->CreateTimestamp.year = tm.year;
 			dir_entry->CreateTimestamp.month = tm.mon;
 			dir_entry->CreateTimestamp.day = tm.day;
-			dir_entry->CreateTimestamp.Hour = tm.hour;
+			dir_entry->CreateTimestamp.hour = tm.hour;
 			dir_entry->CreateTimestamp.Minute = tm.min;
 			dir_entry->CreateTimestamp.Second = tm.sec;
 			dir_entry->CreateTimestamp.MilliSecond = 0;
@@ -1937,7 +1937,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->ModifyTimestamp.year = tm.year;
 			dir_entry->ModifyTimestamp.month = tm.mon;
 			dir_entry->ModifyTimestamp.day = tm.day;
-			dir_entry->ModifyTimestamp.Hour = tm.hour;
+			dir_entry->ModifyTimestamp.hour = tm.hour;
 			dir_entry->ModifyTimestamp.Minute = tm.min;
 			dir_entry->ModifyTimestamp.Second = tm.sec;
 			dir_entry->ModifyTimestamp.MilliSecond = 0;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
