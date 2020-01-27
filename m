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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA944C33CB7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:14:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF10820CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:14:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMaa7kMg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF10820CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A1CEF83616;
	Mon, 27 Jan 2020 10:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dst_WxbxEwTU; Mon, 27 Jan 2020 10:14:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 183E383608;
	Mon, 27 Jan 2020 10:14:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14DA7C0177;
	Mon, 27 Jan 2020 10:14:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1D37C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AC10583612
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgBGWuUC_e0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EFF2F83608
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a6so3589051plm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tEM/K2p0OKdkhu4fa54pWtgam3l1wl2+9m+RBwz++1E=;
 b=rMaa7kMgO7Fm538GIgRuCebbJkPnIVc6oEjE0pcPBdYdwEgdsdAlJoXScyL6D2qlpf
 +R+o46/hPgtOusFqsM75WgM3nPT/TCmSL4moIr9G/a9jIHxX6agNdaQfEweZQteF5tul
 NMGhe84rh9fK8ERvr5AQwhkEEPjKBt+5Xc1Gf95JRroE2Zp9lBpmbg9moQhoUaTg6lud
 Kauus6Lcs1ZYHUBVjzzSeSxwlxEeptHUvEbvvzaq5j3O+oPYI6vBwRakht5hrX3tFm9v
 AAHRiA0Au3IWWZ3GFiOvgxzKc95pFeHt/0o+zfwSbjbnv12mCCpMMFm5xwnJ4aM9xxPQ
 J9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tEM/K2p0OKdkhu4fa54pWtgam3l1wl2+9m+RBwz++1E=;
 b=iiN96SXec530VgWd0b7pcCN/nx/m+zoZuKm+vmZKrvEP5PbkmOuRijX0LnnZ4og8tn
 9uUmOdTUOq/4+ekisxYsfuejf34lT6J/OV+clBC6lzTsxB6AglB52ddJSOtEFYLkuKHY
 0gs6VDV3qAIoP3l9PJX409e+DpHoxKU2IfxhZ6nGdRncCQwbI0vG3wDPYji2VPwFAfw4
 bmzxPzBVHmWtHLF9XjmCVv6J1N9uUlRQt2xlTWutSY0wyc2t0UQbmO4CdurenPl2ZzpV
 0RJb0xeFGGnZZhitqR6mYR3r7OhT/MHxw/ZB0M8xx8XZ2hcH8WwkoTB0mN7NUi7rAq9r
 l0nw==
X-Gm-Message-State: APjAAAU118QoUHjRizrEB9/EsFesXIWpyXbcYO3UdxglVKc/RgY/C4uL
 n8BJBasXZUiWJp+iNsv7LUs=
X-Google-Smtp-Source: APXvYqzZsYzpHvcxRkFriY0hHks8yS7FJVowSraYfrsB9k9poiSSDzEpJ1YgV+l5IURSMDIPI0WHjA==
X-Received: by 2002:a17:902:a710:: with SMTP id
 w16mr17139298plq.43.1580120067559; 
 Mon, 27 Jan 2020 02:14:27 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:14:27 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:22 +0530
Message-Id: <20200127101343.20415-2-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 01/22] staging: exfat: Rename
	variable "Year" to "year"
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

Change all the occurrences of "Year" to "year" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 51c665a924b7..c3c562fba133 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -222,7 +222,7 @@ static inline u16 get_row_index(u16 i)
 #endif
 
 struct date_time_t {
-	u16      Year;
+	u16      year;
 	u16      Month;
 	u16      Day;
 	u16      Hour;
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 9f91853b189b..7534b86192aa 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -59,7 +59,7 @@ static void exfat_write_super(struct super_block *sb);
 /* Convert a FAT time/date pair to a UNIX date (seconds since 1 1 70). */
 static void exfat_time_fat2unix(struct timespec64 *ts, struct date_time_t *tp)
 {
-	ts->tv_sec = mktime64(tp->Year + 1980, tp->Month + 1, tp->Day,
+	ts->tv_sec = mktime64(tp->year + 1980, tp->Month + 1, tp->Day,
 			      tp->Hour, tp->Minute, tp->Second);
 
 	ts->tv_nsec = tp->MilliSecond * NSEC_PER_MSEC;
@@ -80,7 +80,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 		tp->Hour	= 0;
 		tp->Day		= 1;
 		tp->Month	= 1;
-		tp->Year	= 0;
+		tp->year	= 0;
 		return;
 	}
 
@@ -91,7 +91,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 		tp->Hour	= 23;
 		tp->Day		= 31;
 		tp->Month	= 12;
-		tp->Year	= 127;
+		tp->year	= 127;
 		return;
 	}
 
@@ -101,7 +101,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 	tp->Hour	= tm.tm_hour;
 	tp->Day		= tm.tm_mday;
 	tp->Month	= tm.tm_mon + 1;
-	tp->Year	= tm.tm_year + 1900 - 1980;
+	tp->year	= tm.tm_year + 1900 - 1980;
 }
 
 struct timestamp_t *tm_current(struct timestamp_t *tp)
@@ -1505,7 +1505,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->Attr = p_fs->fs_func->get_entry_attr(ep);
 
 	p_fs->fs_func->get_entry_time(ep, &tm, TM_CREATE);
-	info->CreateTimestamp.Year = tm.year;
+	info->CreateTimestamp.year = tm.year;
 	info->CreateTimestamp.Month = tm.mon;
 	info->CreateTimestamp.Day = tm.day;
 	info->CreateTimestamp.Hour = tm.hour;
@@ -1514,7 +1514,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->CreateTimestamp.MilliSecond = 0;
 
 	p_fs->fs_func->get_entry_time(ep, &tm, TM_MODIFY);
-	info->ModifyTimestamp.Year = tm.year;
+	info->ModifyTimestamp.year = tm.year;
 	info->ModifyTimestamp.Month = tm.mon;
 	info->ModifyTimestamp.Day = tm.day;
 	info->ModifyTimestamp.Hour = tm.hour;
@@ -1610,7 +1610,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	tm.hour = info->CreateTimestamp.Hour;
 	tm.day  = info->CreateTimestamp.Day;
 	tm.mon  = info->CreateTimestamp.Month;
-	tm.year = info->CreateTimestamp.Year;
+	tm.year = info->CreateTimestamp.year;
 	p_fs->fs_func->set_entry_time(ep, &tm, TM_CREATE);
 
 	tm.sec  = info->ModifyTimestamp.Second;
@@ -1618,7 +1618,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	tm.hour = info->ModifyTimestamp.Hour;
 	tm.day  = info->ModifyTimestamp.Day;
 	tm.mon  = info->ModifyTimestamp.Month;
-	tm.year = info->ModifyTimestamp.Year;
+	tm.year = info->ModifyTimestamp.year;
 	p_fs->fs_func->set_entry_time(ep, &tm, TM_MODIFY);
 
 	p_fs->fs_func->set_entry_size(ep2, info->Size);
@@ -1925,7 +1925,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->Attr = fs_func->get_entry_attr(ep);
 
 			fs_func->get_entry_time(ep, &tm, TM_CREATE);
-			dir_entry->CreateTimestamp.Year = tm.year;
+			dir_entry->CreateTimestamp.year = tm.year;
 			dir_entry->CreateTimestamp.Month = tm.mon;
 			dir_entry->CreateTimestamp.Day = tm.day;
 			dir_entry->CreateTimestamp.Hour = tm.hour;
@@ -1934,7 +1934,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->CreateTimestamp.MilliSecond = 0;
 
 			fs_func->get_entry_time(ep, &tm, TM_MODIFY);
-			dir_entry->ModifyTimestamp.Year = tm.year;
+			dir_entry->ModifyTimestamp.year = tm.year;
 			dir_entry->ModifyTimestamp.Month = tm.mon;
 			dir_entry->ModifyTimestamp.Day = tm.day;
 			dir_entry->ModifyTimestamp.Hour = tm.hour;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
