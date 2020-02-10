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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20398C352A5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:36:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08F520715
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:36:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uxHdw1vc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08F520715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D103E204A2;
	Mon, 10 Feb 2020 18:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4J9SGJP2MTCF; Mon, 10 Feb 2020 18:36:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C742420418;
	Mon, 10 Feb 2020 18:36:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6F97C07FE;
	Mon, 10 Feb 2020 18:36:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13FF5C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 09F2885C04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6tKS1dlWsBX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:36:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4F954861B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:36:33 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id ep11so129920pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 10:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MK4FsxQjpBNz1uNjA2K6ekiAek4HjCsK/Enob1qIWZI=;
 b=uxHdw1vc9gBxU31jAbcH/OYulGOnEK1+UslP0RDl0CtmGs4N+K5pwHErkxDppi/DeH
 T/4jDepJekHSiDfAvF5f+HMyY79O3gnaQCF+SLOJXR49AXsqwUhsEVWfJrH+zIvdufl6
 hbAKUh4Xz5N+Fy+OYjQYcDQY83GLE5Nfg+Uon6tKnJbTSqlGVyFU2Zk59YTbXvHIpGru
 lvrn8hcENFUYLIxpCqEah48gIYbS0N1FqXSPsPYoJ7n6rzVCJIrhfNiNFLRizA/LsW8F
 bu4To/edOREVdlZaEJYMq6zJdIXvN+uKXuDLhR7fKjsmUTeuKimOAXsewDR3LAQi5fQ4
 0j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MK4FsxQjpBNz1uNjA2K6ekiAek4HjCsK/Enob1qIWZI=;
 b=ft/kPX6FPr3deq5/d6dW4VzpGecWXixMtYcIUM3ehkL21iaPImJdjD8cvOofJ1Tw29
 HNrnnfr/YqFwue5dg9qYWUXS85b5NgI/f0dku89Oe1v+6YB2QCltScGLYDZRGElpAuv7
 UpBsAlEtUwh1K6HoJoZn6e0qgfNhylMIC97ErgDvQsAzvQ0WC5KaleUO61uKAACSgkqk
 Xm1Pt0sigiuvuLpOJDWa4mrPn1uHYX8Drdi8bHUeiXgFv56XOKPm517Q6PndrAkpHTLo
 1YOUud5J9i9cynzS18n0zWPFlxrjW8cnpWZKrRQzcGw8IqP+AuCitY1vThh8rKnbsaQE
 8Emw==
X-Gm-Message-State: APjAAAXS8FFSlE/zmI3DUK2sP8LMuFKMuVdQ48UP4bKHoDlnskKDH1Qh
 jUwbNxBGNM8OYt5pqBvL41A=
X-Google-Smtp-Source: APXvYqxrh57Ubkljq7LtUH0VkJ43yunbCWzoZ8Itz+ryTwxjAJJQEu9mcmlZH8yyul3LIohZ3QJyRw==
X-Received: by 2002:a17:902:694c:: with SMTP id
 k12mr13765402plt.329.1581359792899; 
 Mon, 10 Feb 2020 10:36:32 -0800 (PST)
Received: from localhost.localdomain ([2405:204:8308:74f3:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id gc1sm124922pjb.20.2020.02.10.10.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 10:36:32 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 00:05:40 +0530
Message-Id: <20200210183558.11836-2-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210183558.11836-1-pragat.pandya@gmail.com>
References: <20200207094612.GA562325@kroah.com>
 <20200210183558.11836-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 01/19] staging: exfat: Rename
	variable 'Year' to 'year'
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
Change all occurrences of identifier "Year" to "year"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 4d87360fab35..30ec81250f08 100644
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
index b81d2a87b82e..c2b97a059f52 100644
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
 	info->Attr = exfat_get_entry_attr(ep);
 
 	exfat_get_entry_time(ep, &tm, TM_CREATE);
-	info->CreateTimestamp.Year = tm.year;
+	info->CreateTimestamp.year = tm.year;
 	info->CreateTimestamp.Month = tm.mon;
 	info->CreateTimestamp.Day = tm.day;
 	info->CreateTimestamp.Hour = tm.hour;
@@ -1514,7 +1514,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->CreateTimestamp.MilliSecond = 0;
 
 	exfat_get_entry_time(ep, &tm, TM_MODIFY);
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
 	exfat_set_entry_time(ep, &tm, TM_CREATE);
 
 	tm.sec  = info->ModifyTimestamp.Second;
@@ -1618,7 +1618,7 @@ static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
 	tm.hour = info->ModifyTimestamp.Hour;
 	tm.day  = info->ModifyTimestamp.Day;
 	tm.mon  = info->ModifyTimestamp.Month;
-	tm.year = info->ModifyTimestamp.Year;
+	tm.year = info->ModifyTimestamp.year;
 	exfat_set_entry_time(ep, &tm, TM_MODIFY);
 
 	exfat_set_entry_size(ep2, info->Size);
@@ -1922,7 +1922,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->Attr = exfat_get_entry_attr(ep);
 
 			exfat_get_entry_time(ep, &tm, TM_CREATE);
-			dir_entry->CreateTimestamp.Year = tm.year;
+			dir_entry->CreateTimestamp.year = tm.year;
 			dir_entry->CreateTimestamp.Month = tm.mon;
 			dir_entry->CreateTimestamp.Day = tm.day;
 			dir_entry->CreateTimestamp.Hour = tm.hour;
@@ -1931,7 +1931,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->CreateTimestamp.MilliSecond = 0;
 
 			exfat_get_entry_time(ep, &tm, TM_MODIFY);
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
