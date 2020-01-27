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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEED3C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:14:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 845A12087F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXsvh4Yv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 845A12087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4D6022047D;
	Mon, 27 Jan 2020 10:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wFDFczJ6Vaj; Mon, 27 Jan 2020 10:14:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 50D6920476;
	Mon, 27 Jan 2020 10:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E627C0177;
	Mon, 27 Jan 2020 10:14:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD5DC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E71320026
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pMD6B6h6BeF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 9D87F20476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:32 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t6so3582657plj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s531A7Z0Ik0oiSQOQqFpgF9IVErIBCQR/I11OaiKgqY=;
 b=TXsvh4YvCTMep5XW9sAfq33cQuGoR5HM1n+LuNq74Cyuw7pJaEFGLdyEzhZcjPSRCm
 AwJaj/opeQTTlirMJUqh2cdooQ/T9rF4bZ7H2C+5Z+uJKqiX7eDVcGUi83gqw42Qgcwx
 Goz/e4te25MkO6NgwaBKhCwLVsDpK1WVATymw6Xb50R/W9Uuv+vcf3nZyIcNCJnRKYHG
 SJwso4atQoy5IGB2qhuujFxVHxYpohu8vN4HZ4AqdyNj4G4UW4S3hTJKy94Cqt61LsdV
 VCwxFkc3MHWLB5XleMQ03jERP283gWofGgvH+0nCUWPNU1QUMfmq5xm+YgWJHULZb688
 zS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s531A7Z0Ik0oiSQOQqFpgF9IVErIBCQR/I11OaiKgqY=;
 b=HXAzr3mXZunytQSeZz/ib2/P0sskso7zJzNhgLppIjVhp+AEQvK4bLw3ZUBM9InucE
 0m4qxcAOjc0tdyp271rlQqsMSy391fpIaPGn4abRo/xH6adaftt9DBMZgoKY4reGBFX1
 F9vNDHLr2O5tIgQ2W/TI72UD9Qgxt6wuq3jvBpPXUc0Ti59J4C1LmQbhcCdLaWlKGiSc
 eR1OpAQPSWHCnalzqwQODgKB4TJvP/uZLYtzstFUvoU8OwBR/Zf7XTDtXL6eX4eONwxg
 Tb7+1Cet/kMqVXlZW0kFHntKZ+VgDcWb/n80mb11+7gBGjASF+XsPUDKBZpujM3Tm+sj
 cNKg==
X-Gm-Message-State: APjAAAWKLGYgAhTmVL4hkUF9G5pQcHJkhzjE/heCAZAqinX0CoMw5QQR
 hPWj+iIfm9tjQBXKwIkwh14=
X-Google-Smtp-Source: APXvYqwku1zLa3MFJlsk1bct0Uc/qAkhHxLuCVvKZ1F+qlhgI6TJxoCA8eUcSpNFONXsxRBpmCxNkg==
X-Received: by 2002:a17:90a:5206:: with SMTP id
 v6mr13627170pjh.136.1580120072238; 
 Mon, 27 Jan 2020 02:14:32 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:14:31 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:23 +0530
Message-Id: <20200127101343.20415-3-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/22] staging: exfat: Rename
	variable "Month" to "mont"h
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

Change all the occurrences of "Month" to "month" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index c3c562fba133..95e27aed350d 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -223,7 +223,7 @@ static inline u16 get_row_index(u16 i)
 
 struct date_time_t {
 	u16      year;
-	u16      Month;
+	u16      month;
 	u16      Day;
 	u16      Hour;
 	u16      Minute;
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 7534b86192aa..293d103a6b54 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -59,7 +59,7 @@ static void exfat_write_super(struct super_block *sb);
 /* Convert a FAT time/date pair to a UNIX date (seconds since 1 1 70). */
 static void exfat_time_fat2unix(struct timespec64 *ts, struct date_time_t *tp)
 {
-	ts->tv_sec = mktime64(tp->year + 1980, tp->Month + 1, tp->Day,
+	ts->tv_sec = mktime64(tp->year + 1980, tp->month + 1, tp->Day,
 			      tp->Hour, tp->Minute, tp->Second);
 
 	ts->tv_nsec = tp->MilliSecond * NSEC_PER_MSEC;
@@ -79,7 +79,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 		tp->Minute	= 0;
 		tp->Hour	= 0;
 		tp->Day		= 1;
-		tp->Month	= 1;
+		tp->month	= 1;
 		tp->year	= 0;
 		return;
 	}
@@ -90,7 +90,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 		tp->Minute	= 59;
 		tp->Hour	= 23;
 		tp->Day		= 31;
-		tp->Month	= 12;
+		tp->month	= 12;
 		tp->year	= 127;
 		return;
 	}
@@ -100,7 +100,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 	tp->Minute	= tm.tm_min;
 	tp->Hour	= tm.tm_hour;
 	tp->Day		= tm.tm_mday;
-	tp->Month	= tm.tm_mon + 1;
+	tp->month	= tm.tm_mon + 1;
 	tp->year	= tm.tm_year + 1900 - 1980;
 }
 
@@ -1506,7 +1506,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 
 	p_fs->fs_func->get_entry_time(ep, &tm, TM_CREATE);
 	info->CreateTimestamp.year = tm.year;
-	info->CreateTimestamp.Month = tm.mon;
+	info->CreateTimestamp.month = tm.mon;
 	info->CreateTimestamp.Day = tm.day;
 	info->CreateTimestamp.Hour = tm.hour;
 	info->CreateTimestamp.Minute = tm.min;
@@ -1515,7 +1515,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 
 	p_fs->fs_func->get_entry_time(ep, &tm, TM_MODIFY);
 	info->ModifyTimestamp.year = tm.year;
-	info->ModifyTimestamp.Month = tm.mon;
+	info->ModifyTimestamp.month = tm.mon;
 	info->ModifyTimestamp.Day = tm.day;
 	info->ModifyTimestamp.Hour = tm.hour;
 	info->ModifyTimestamp.Minute = tm.min;
@@ -1609,7 +1609,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	tm.min  = info->CreateTimestamp.Minute;
 	tm.hour = info->CreateTimestamp.Hour;
 	tm.day  = info->CreateTimestamp.Day;
-	tm.mon  = info->CreateTimestamp.Month;
+	tm.mon  = info->CreateTimestamp.month;
 	tm.year = info->CreateTimestamp.year;
 	p_fs->fs_func->set_entry_time(ep, &tm, TM_CREATE);
 
@@ -1617,7 +1617,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	tm.min  = info->ModifyTimestamp.Minute;
 	tm.hour = info->ModifyTimestamp.Hour;
 	tm.day  = info->ModifyTimestamp.Day;
-	tm.mon  = info->ModifyTimestamp.Month;
+	tm.mon  = info->ModifyTimestamp.month;
 	tm.year = info->ModifyTimestamp.year;
 	p_fs->fs_func->set_entry_time(ep, &tm, TM_MODIFY);
 
@@ -1926,7 +1926,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 
 			fs_func->get_entry_time(ep, &tm, TM_CREATE);
 			dir_entry->CreateTimestamp.year = tm.year;
-			dir_entry->CreateTimestamp.Month = tm.mon;
+			dir_entry->CreateTimestamp.month = tm.mon;
 			dir_entry->CreateTimestamp.Day = tm.day;
 			dir_entry->CreateTimestamp.Hour = tm.hour;
 			dir_entry->CreateTimestamp.Minute = tm.min;
@@ -1935,7 +1935,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 
 			fs_func->get_entry_time(ep, &tm, TM_MODIFY);
 			dir_entry->ModifyTimestamp.year = tm.year;
-			dir_entry->ModifyTimestamp.Month = tm.mon;
+			dir_entry->ModifyTimestamp.month = tm.mon;
 			dir_entry->ModifyTimestamp.Day = tm.day;
 			dir_entry->ModifyTimestamp.Hour = tm.hour;
 			dir_entry->ModifyTimestamp.Minute = tm.min;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
