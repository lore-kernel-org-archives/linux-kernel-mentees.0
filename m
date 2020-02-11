Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0A6C3B187
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73BC2206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLOD7Ecg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73BC2206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6579F845C5;
	Tue, 11 Feb 2020 12:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_S-GGAXWGJN; Tue, 11 Feb 2020 12:41:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12A1E84537;
	Tue, 11 Feb 2020 12:41:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F307FC1D88;
	Tue, 11 Feb 2020 12:41:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E140FC07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DDC1E84DB8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Klibifm+jISW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 57F9584EA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:09 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l24so5678846pgk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OG3I8u1BtQ4O9rV9GY+FzQTWCyxjIaclYE/ENRCShQ8=;
 b=HLOD7EcgD8fNUAboICtjctQfRY8PFaAl4y583wpQIelBhhlNFszqkyU1Yj9w42eO2F
 lVZpl2VfJgKlrINOE6AeD45iNQT1RLsNItFN1NXLfxgkqOFu4pH5fyE8mG01/iESrZMC
 vbAf4lITfsnxkGkdOBjvNuC38GrE12x6NwO1zZTFeVfJY+oSYr8rCkyMzIo2SCywjBJF
 X/+T10M6BbXeoUa2wLsamgNyq5DAz2GMfr8kFKEYvhXQjl42qYQmmQ16PwlBRlHxaUft
 Ze5zBaw4gnQKS/b8eQ3lx8xaXU0n5TQ5b3frMKkxnuh6sMgLD5yWAWuI2Gz1SDs2DJNr
 yATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OG3I8u1BtQ4O9rV9GY+FzQTWCyxjIaclYE/ENRCShQ8=;
 b=chj0k7SoJgxQDyvR5JNM5KIbeAVRR86kYhfzmNdpS6hvvYBYtgbkv9pCnywcvKRe/l
 niBxSOWF0tC/RHGUoEbjLrX07bXigz9RFJqExtBn7eWfbGQ9qPjzZ7mvOe+6uJoIv6rG
 rwdX44KWEtKZDqe7r0CavFbdYpJJnSWFO4DWn1oQDxs0OcIkYKd6lsQhJv+UhsJfvJ+P
 uFFjcFhAx7J50as12nHKx3NZtvZfU5DFgGNaIc8PoEyT976zHOOTpMRFLCxeAjTlT/2x
 ZIytACOPvOWBPSMRUcZ0bhzM4lY1YMabC7VqyNLxubwIBUzUNuSjocCr15btytPbBGAB
 TbiQ==
X-Gm-Message-State: APjAAAU/PGVYTpOBL7Nvcl7kq9ix4K2IXROlWzS4kpAmhmL98lPCPcql
 JDnuNpFrZ5kw7O8cJCkladk=
X-Google-Smtp-Source: APXvYqyaVllHPFWdIBZNuHzH1mtLPLmniZsElBuH4IFElvC8CM7gTjB8Ldnssx9rRS3Kutgip5Q2NQ==
X-Received: by 2002:a63:131f:: with SMTP id i31mr4067979pgl.101.1581424868948; 
 Tue, 11 Feb 2020 04:41:08 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:41:08 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:50 +0530
Message-Id: <20200211123859.10429-10-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 09/18] staging: exfat: Rename
	function "ffsTruncateFile" to "ffs_truncate_file"
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
Change all occurrences of function "ffsTruncateFile" to
"ffs_truncate_file" in source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index d4e6f6a210e9..5bbd31e6ba3c 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1031,7 +1031,7 @@ static int ffs_write_file(struct inode *inode, struct file_id_t *fid,
 	return ret;
 }
 
-static int ffsTruncateFile(struct inode *inode, u64 old_size, u64 new_size)
+static int ffs_truncate_file(struct inode *inode, u64 old_size, u64 new_size)
 {
 	s32 num_clusters;
 	u32 last_clu = CLUSTER_32(0);
@@ -2763,7 +2763,7 @@ static void exfat_truncate(struct inode *inode, loff_t old_size)
 	if (EXFAT_I(inode)->fid.start_clu == 0)
 		goto out;
 
-	err = ffsTruncateFile(inode, old_size, i_size_read(inode));
+	err = ffs_truncate_file(inode, old_size, i_size_read(inode));
 	if (err)
 		goto out;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
