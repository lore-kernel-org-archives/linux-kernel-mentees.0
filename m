Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891C8C35240
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 606972071E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uWnUO9+u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 606972071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2ECB785F6F;
	Wed, 29 Jan 2020 16:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoF0WutwVNgW; Wed, 29 Jan 2020 16:59:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4BC4285F89;
	Wed, 29 Jan 2020 16:59:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 446E7C0178;
	Wed, 29 Jan 2020 16:59:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF181C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CDF442155E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jdm7dR8hOUpH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:58:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id D963C21552
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:58:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q8so8718007pfh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fxM0wwnpk8IneLFf4ZZ3Vk1Wy5NcKBevBAG7IqTUmK0=;
 b=uWnUO9+uG5E8MW+zp1akeOm5vcXMhyBmeb0c2VqJ64EHy3zqNOJ3zOZPuCvD7EENfO
 gWAqizDeeAVJY2fMXil+/5KK1ynQMZXC5RMLVXJ9rw5+8+A64cxEnJoV6jhyuNJllNbi
 dx+DJMyriD6rT6Hl36SJSEiUwAJeQUxHmm5l9+AkjiVJzoG5JVrcVo8hpLMVrppPgEp2
 DEd/X2JIZYtSPOo8+yKZkpzVIyHOBOgRR6jO/BMY42FQk/26aSWpGQTgsaknSCm1KvG9
 B8Fr3w0M0cCURiJJjKMyB53kcIPA3xHj/m7oXi06pSeE1Hd1HVosINBHxOB2H4YTy+d+
 4+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fxM0wwnpk8IneLFf4ZZ3Vk1Wy5NcKBevBAG7IqTUmK0=;
 b=Ym/dudPUvonHCXkTQO8zi+Scx6KlsfwWWDZsDxhdzSt+0T3snOnlpRhIssNjytBzns
 7QPnc2FI8xf2/dfs524ns6enLo2hFOCgVTC0jqMpmSiqCtGRSJxNCJrnM1ifT20GhFqg
 Qs3sOehErUoMelDw5WedqDD6YpCD5crAkVjiNvr9Wq6RMCZakNSA0nugTFfUFNJvvU/e
 LHthS47d0JMV1NHIW2xwAwGFa9+lHyEJH1TIMn+KyEG6ba/m9adNa3I/3PmYf/QxgxGI
 bVRWSl5Tp5sJKGUOx9e8Nz9IKTXVLiaerjocKd7hvtigfe0uQ8NQ7zLVnkn0cFI0l51O
 9DwA==
X-Gm-Message-State: APjAAAWEcyxMAJU3b4oy0audG8DvDySPuh4Y2l+aEID2Flkqfwf9NGyE
 thH6EsjIAi4GUm3g40DIRw4=
X-Google-Smtp-Source: APXvYqxYw5FFiJZaZznRyy3hLbyWOuH/t9REAM5vWATskN4z5Xa52XkhX5x31ljAr/CC8gbu5JJMlA==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr468484pfn.245.1580317139356; 
 Wed, 29 Jan 2020 08:58:59 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id f8sm3223610pfn.2.2020.01.29.08.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:58:58 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Wed, 29 Jan 2020 22:28:14 +0530
Message-Id: <20200129165832.10574-2-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129165832.10574-1-pragat.pandya@gmail.com>
References: <20200129165832.10574-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 01/19] staging: exfat: Rename
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

Fix checkpatch warning: Avoid CamelCase.
Change all occurrences of identifier "Year" to "year"

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
