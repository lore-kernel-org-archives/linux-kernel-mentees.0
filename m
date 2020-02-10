Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB5C35254
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:38:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B091220656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyeATcJo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B091220656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 86CC18614D;
	Mon, 10 Feb 2020 18:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EGQ7ceb3JQxV; Mon, 10 Feb 2020 18:38:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1936F8610A;
	Mon, 10 Feb 2020 18:38:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0582BC07FE;
	Mon, 10 Feb 2020 18:38:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A03EC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7436520452
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7G2VGPl1jRaH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:38:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id A95FA204A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:38:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 4so4114551pfz.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 10:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OlRrcV4cV+SlhUD75IgA2vuU1RtHvP/9GZxrkhvxchc=;
 b=eyeATcJof+038p+BnoFo7o5+/Wg8N9L2sNXgOUL/t4JnoE5/w5swPUhhBxScTk/DHr
 WMNu7fXE7GqmMHBeupggQm1Z3ykj0g7eQw8WnUuK4U0pQiqSfHdhVwjCgPeuAac4sFlC
 9+hu32uaiFkSy7/WvvWuT7N49ThMt1lyd2U4N8lMQzN52NPseachthwFpS3tO9iocyLM
 EWiPKQzM6Ci56XgrmguS33VSlk5oKSIz0nJIgS3Ekmu8DEE9xopX+M3MwETvxQcPfkhG
 Ej5KC//6tToF6+drHLQNS07RK5XGeLd8fu37NPX3kAnreSm7FJ/mkwz6ydnCAgiKlB7V
 35YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OlRrcV4cV+SlhUD75IgA2vuU1RtHvP/9GZxrkhvxchc=;
 b=fRLIEob+E3IOxPn+maACEk0vNnrGiXXTmWvxqjuKMUH8DNqM2dJbqjufmtOMDQohMD
 Hcz6s3z3xPo8KUxofSTInN1fjZYrIGJ+dZFyYGZ4J4unETSmY71PLZLI60EUXj1JYTO0
 16+20a+dEACaNTziGlOp4yaRX6WmLzVwSUi88haSNTk/b/C0zDZybCCxUbSx0aaY/efN
 RuG0DfY4/qVXLoXhWmAeSh/9uHCHnMgoX2RAQff60P9cG7m9VzbzIGnk08FlTlG1ZpNW
 2o5PsoA5z4+kRhHnqgzSyDganOe/rpHu3JvFPACJEXF/Uko/S9WNnQpH43E7o1epoql8
 VY/Q==
X-Gm-Message-State: APjAAAW0sjFaJhIEKHi5tX0vMoZY7KRZe4+6/Wl42PxbQ5m3uysUTCqB
 z2MhbdH7JV5MvXxaldQqWXU=
X-Google-Smtp-Source: APXvYqwKlPqRa5EC0LwWDP1BusScl/tPVHSEFZRpU+UtUDBjpDgl/nxAobd28LS4kzzlkCdnyEMBAw==
X-Received: by 2002:a63:aa07:: with SMTP id e7mr3020882pgf.90.1581359885308;
 Mon, 10 Feb 2020 10:38:05 -0800 (PST)
Received: from localhost.localdomain ([2405:204:8308:74f3:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id gc1sm124922pjb.20.2020.02.10.10.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 10:38:04 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 00:05:58 +0530
Message-Id: <20200210183558.11836-20-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210183558.11836-1-pragat.pandya@gmail.com>
References: <20200207094612.GA562325@kroah.com>
 <20200210183558.11836-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 19/19] staging: exfat: Rename
	variable 'AccessTimestamp' to 'access_timestamp'
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
Change all occurrences of identifier "AccessTimestamp" to
"access_timestamp"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 2c911f1ea949..46cfac322821 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -280,7 +280,7 @@ struct dir_entry_t {
 	u32 num_subdirs;
 	struct date_time_t create_timestamp;
 	struct date_time_t modify_timestamp;
-	struct date_time_t AccessTimestamp;
+	struct date_time_t access_timestamp;
 };
 
 struct timestamp_t {
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 7388aa8fb344..9f47102e3f38 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1462,7 +1462,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 			       sizeof(struct date_time_t));
 			memset((char *)&info->modify_timestamp, 0,
 			       sizeof(struct date_time_t));
-			memset((char *)&info->AccessTimestamp, 0,
+			memset((char *)&info->access_timestamp, 0,
 			       sizeof(struct date_time_t));
 			strcpy(info->short_name, ".");
 			strcpy(info->name, ".");
@@ -1522,7 +1522,7 @@ static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
 	info->modify_timestamp.second = tm.sec;
 	info->modify_timestamp.millisecond = 0;
 
-	memset((char *)&info->AccessTimestamp, 0, sizeof(struct date_time_t));
+	memset((char *)&info->access_timestamp, 0, sizeof(struct date_time_t));
 
 	*uni_name.name = 0x0;
 	/* XXX this is very bad for exfat cuz name is already included in es.
@@ -1939,7 +1939,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->modify_timestamp.second = tm.sec;
 			dir_entry->modify_timestamp.millisecond = 0;
 
-			memset((char *)&dir_entry->AccessTimestamp, 0,
+			memset((char *)&dir_entry->access_timestamp, 0,
 			       sizeof(struct date_time_t));
 
 			*uni_name.name = 0x0;
@@ -3190,7 +3190,7 @@ static int exfat_fill_inode(struct inode *inode, struct file_id_t *fid)
 
 	exfat_time_fat2unix(&inode->i_mtime, &info.modify_timestamp);
 	exfat_time_fat2unix(&inode->i_ctime, &info.create_timestamp);
-	exfat_time_fat2unix(&inode->i_atime, &info.AccessTimestamp);
+	exfat_time_fat2unix(&inode->i_atime, &info.access_timestamp);
 
 	return 0;
 }
@@ -3261,7 +3261,7 @@ static int exfat_write_inode(struct inode *inode, struct writeback_control *wbc)
 
 	exfat_time_unix2fat(&inode->i_mtime, &info.modify_timestamp);
 	exfat_time_unix2fat(&inode->i_ctime, &info.create_timestamp);
-	exfat_time_unix2fat(&inode->i_atime, &info.AccessTimestamp);
+	exfat_time_unix2fat(&inode->i_atime, &info.access_timestamp);
 
 	ffsWriteStat(inode, &info);
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
