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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC46C352A5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:37:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF3D20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/Mlj6K9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF3D20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7EC4D20452;
	Mon, 10 Feb 2020 18:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMduDkXtw0bJ; Mon, 10 Feb 2020 18:37:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B204520449;
	Mon, 10 Feb 2020 18:37:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9972C07FE;
	Mon, 10 Feb 2020 18:37:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2041C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE9D185190
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Jw8c8h3q8Iw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 43CDE84545
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:05 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g6so3169631plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 10:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VsCf4k2H7Qd6YQ/+eI0UPgq5XblhMAu81QTwn6YWwe0=;
 b=s/Mlj6K97lkaZiXXXT9qKKY/hlanIXfPnP/ayOjS8VuT7p+ZPwYLnB3PGJE/7/dzuN
 /jHt5TyAeXhosT0cyGIMy1oHNPseuVrx1qhYWpnCH84KmOrfbB+VdWggv/egdyk06Twc
 6CKmoE0M5eteweY2FZrmZHUBjou61kUbKknjgZ2GxaBynRlOqw2wQH9zYEO8csPM9O43
 mui9hYiQfX6lfq2FXIEWpC1KkSh0p+02irTkH0oDbyOuncUqeBsJc/77o+N1TFAdXVZs
 /jd0CmJv5/SYeagQ8uJpwFHHkF6xnxDT3gej0UVm9Xwjw3rr7fXMzNV2+994eUn2g/Ll
 zYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VsCf4k2H7Qd6YQ/+eI0UPgq5XblhMAu81QTwn6YWwe0=;
 b=sVWMKOWSMaF+dv8KQQirZRkzmqv03kb7vibXtlngnAos0ZzviiZzCnTD+gPmsvaupj
 MStI+r8kMw71LUzOXuV9CYosPRtOd2LL9wXcpvGzpOeiU8yBJuoW3uHe5B9P9kT0jD/L
 u6bMdFVA+Z2adFLIrzXbmJkxOLAH501hOFFmTYdLlCTgl7DUEr5ZYMcT6mgRAgrcB/Sq
 7tQgWCWlhQHfO2oxgHd0Zbdlm/iFvDHS82oF4ctqqB7lrPChpmE5AEXIgFJrmwqS3HQu
 n6OYZ/BlV860/aZoeldXrIQg0W6MA8oF2W99j6H9wfbp1eCboeoCFAjQ/TBIUy5RibMW
 K1mA==
X-Gm-Message-State: APjAAAXVYoT9Ytzu95+YNx47L8cPK2f5A7aaySTCB1pZTYr1BWXOBb2e
 rON3Mc1Peps2rtCplLBqrIs=
X-Google-Smtp-Source: APXvYqwZ4zsEoVOVi2hsXltqN8RZ+zZe/+WoSUjeCVNe+XW8aeBat4NaYJ028s4jrLMM6RKUTeNYVg==
X-Received: by 2002:a17:90a:7d07:: with SMTP id g7mr467183pjl.17.1581359824819; 
 Mon, 10 Feb 2020 10:37:04 -0800 (PST)
Received: from localhost.localdomain ([2405:204:8308:74f3:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id gc1sm124922pjb.20.2020.02.10.10.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 10:37:04 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 00:05:46 +0530
Message-Id: <20200210183558.11836-8-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210183558.11836-1-pragat.pandya@gmail.com>
References: <20200207094612.GA562325@kroah.com>
 <20200210183558.11836-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 07/19] staging: exfat: Rename
	variable 'MilliSecond' to 'millisecond'
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
Change all occurrences of identifier "MilliSecond" to "millisecond"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
Changes in v1:
 -Rename variable "MilliSecond" to "milli_second"

Changes in v2:
 -Remove unnecessary '_' underscore character in renamed identifier
  name.
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 20179ef7b956..96e1e1553e56 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -228,7 +228,7 @@ struct date_time_t {
 	u16      hour;
 	u16      minute;
 	u16      second;
-	u16      MilliSecond;
+	u16      millisecond;
 };
 
 struct part_info_t {
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index eced4a408f68..472a6c8efcbb 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -62,7 +62,7 @@ static void exfat_time_fat2unix(struct timespec64 *ts, struct date_time_t *tp)
 	ts->tv_sec = mktime64(tp->year + 1980, tp->month + 1, tp->day,
 			      tp->hour, tp->minute, tp->second);
 
-	ts->tv_nsec = tp->MilliSecond * NSEC_PER_MSEC;
+	ts->tv_nsec = tp->millisecond * NSEC_PER_MSEC;
 }
 
 /* Convert linear UNIX date to a FAT time/date pair. */
@@ -74,7 +74,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 	time64_to_tm(second, 0, &tm);
 
 	if (second < UNIX_SECS_1980) {
-		tp->MilliSecond = 0;
+		tp->millisecond = 0;
 		tp->second	= 0;
 		tp->minute	= 0;
 		tp->hour	= 0;
@@ -85,7 +85,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 	}
 
 	if (second >= UNIX_SECS_2108) {
-		tp->MilliSecond = 999;
+		tp->millisecond = 999;
 		tp->second	= 59;
 		tp->minute	= 59;
 		tp->hour	= 23;
@@ -95,7 +95,7 @@ static void exfat_time_unix2fat(struct timespec64 *ts, struct date_time_t *tp)
 		return;
 	}
 
-	tp->MilliSecond = ts->tv_nsec / NSEC_PER_MSEC;
+	tp->millisecond = ts->tv_nsec / NSEC_PER_MSEC;
 	tp->second	= tm.tm_sec;
 	tp->minute	= tm.tm_min;
 	tp->hour	= tm.tm_hour;
@@ -1511,7 +1511,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->CreateTimestamp.hour = tm.hour;
 	info->CreateTimestamp.minute = tm.min;
 	info->CreateTimestamp.second = tm.sec;
-	info->CreateTimestamp.MilliSecond = 0;
+	info->CreateTimestamp.millisecond = 0;
 
 	exfat_get_entry_time(ep, &tm, TM_MODIFY);
 	info->ModifyTimestamp.year = tm.year;
@@ -1520,7 +1520,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->ModifyTimestamp.hour = tm.hour;
 	info->ModifyTimestamp.minute = tm.min;
 	info->ModifyTimestamp.second = tm.sec;
-	info->ModifyTimestamp.MilliSecond = 0;
+	info->ModifyTimestamp.millisecond = 0;
 
 	memset((char *)&info->AccessTimestamp, 0, sizeof(struct date_time_t));
 
@@ -1928,7 +1928,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->CreateTimestamp.hour = tm.hour;
 			dir_entry->CreateTimestamp.minute = tm.min;
 			dir_entry->CreateTimestamp.second = tm.sec;
-			dir_entry->CreateTimestamp.MilliSecond = 0;
+			dir_entry->CreateTimestamp.millisecond = 0;
 
 			exfat_get_entry_time(ep, &tm, TM_MODIFY);
 			dir_entry->ModifyTimestamp.year = tm.year;
@@ -1937,7 +1937,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->ModifyTimestamp.hour = tm.hour;
 			dir_entry->ModifyTimestamp.minute = tm.min;
 			dir_entry->ModifyTimestamp.second = tm.sec;
-			dir_entry->ModifyTimestamp.MilliSecond = 0;
+			dir_entry->ModifyTimestamp.millisecond = 0;
 
 			memset((char *)&dir_entry->AccessTimestamp, 0,
 			       sizeof(struct date_time_t));
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
