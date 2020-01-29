Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CFFC33CB7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 17:00:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FCAE2070E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 17:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/FP/kbi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FCAE2070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7C06383B2F;
	Wed, 29 Jan 2020 17:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UU74q+gKI+fS; Wed, 29 Jan 2020 17:00:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FE8781E90;
	Wed, 29 Jan 2020 17:00:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CED0C0178;
	Wed, 29 Jan 2020 17:00:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E689DC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 17:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D54B383505
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 17:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KnG2NYcqj6mp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 17:00:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3EF2B834A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 17:00:39 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k3so78038pgc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 09:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XKusosktXdhQypNmQUgC29Bmq7GAyRxVBNaveBtgBKw=;
 b=B/FP/kbijLoUXdz1aENvwUNjJW/rtL7lcbRg/yjefqqPxANOQz8ACh2s25+Fc83Khy
 RfB+JV1ZHq58qv/E4m4JOIeVSK2gfD1p9As6/oeqXbKdpAxRwH/jk/xvTrQ7pFd9SUyz
 P0ndYQWQ/XFh+Azkch7NvEwnibiVyYJVUUULr6yfGlsdnBE1D6I+Jbuvg7AwUqkwry13
 TN3uUfxWWnjmRb+F8rmC0GoAPADrJqzxVaERsTVFBNOZ4TyeIJReyVzq7qyOU5iQw+dy
 qq41ysbt7H0DnpWmT2S4Og7EuI6uFtahrAsoPZajdg9LjG8u7adxwUlzuDmk19jz9XZ9
 9yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XKusosktXdhQypNmQUgC29Bmq7GAyRxVBNaveBtgBKw=;
 b=GOS9460zpedPxIL8m3l9OuV0tkE7iQ1PHR3/9nsJnZmfZ3gSTXb08SoOBmvIjjhZTG
 5+78KL5yBvdjnNEcNywgA2HgXQLdK1xl07Ij3hMJdiszqvhtdUPYmV5Og38H7OBFHsoc
 5t9DnNnQLwuUVyVznAir/hLQ7/2X5Eg9LIrNJkv80TOuibkYACzyzFd31O7qUASPvNyY
 v4IDrs+I9dxBwBzsNGgRmfnpt/QJ263ouweZbeHoNJHV/yumuBKOsHGWRloE6Vrc+DX/
 foUx3GKiD8d+GX37MKYVl8ga/BfTiB1wJMmFK0txKW1TiHV6vc1NZyrpTFfUhiO4c6+Q
 iW/A==
X-Gm-Message-State: APjAAAVaFb9n1jYS7qZ/yRh32/4BPLOF8EbFzhY3+tI5ganFOitB5rhC
 ZOxWx64r97xgX56GIg3CY2U=
X-Google-Smtp-Source: APXvYqxzAIaEtu+asWCf6V9L0A5X+2P6HuI3uZGFl0xHR4Q5cxutZSQJhBgVkKY3B4g2xbCsK3vmzw==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr476644pfn.245.1580317238848; 
 Wed, 29 Jan 2020 09:00:38 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id f8sm3223610pfn.2.2020.01.29.09.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 09:00:38 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Wed, 29 Jan 2020 22:28:32 +0530
Message-Id: <20200129165832.10574-20-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129165832.10574-1-pragat.pandya@gmail.com>
References: <20200129165832.10574-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 19/19] staging: exfat: Rename
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

Fix checkpatch warning: Avoid CamelCase.
Change all occurrences of identifier "AccessTimestamp" to
"access_timestamp"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 323048cd1903..29762946e773 100644
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
index 92670913971f..d78172d3f6b7 100644
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
@@ -1942,7 +1942,7 @@ static int ffsReadDir(struct inode *inode, struct dir_entry_t *dir_entry)
 			dir_entry->modify_timestamp.second = tm.sec;
 			dir_entry->modify_timestamp.millisecond = 0;
 
-			memset((char *)&dir_entry->AccessTimestamp, 0,
+			memset((char *)&dir_entry->access_timestamp, 0,
 			       sizeof(struct date_time_t));
 
 			*uni_name.name = 0x0;
@@ -3193,7 +3193,7 @@ static int exfat_fill_inode(struct inode *inode, struct file_id_t *fid)
 
 	exfat_time_fat2unix(&inode->i_mtime, &info.modify_timestamp);
 	exfat_time_fat2unix(&inode->i_ctime, &info.create_timestamp);
-	exfat_time_fat2unix(&inode->i_atime, &info.AccessTimestamp);
+	exfat_time_fat2unix(&inode->i_atime, &info.access_timestamp);
 
 	return 0;
 }
@@ -3264,7 +3264,7 @@ static int exfat_write_inode(struct inode *inode, struct writeback_control *wbc)
 
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
