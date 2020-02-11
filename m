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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D167EC352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56132082F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2wK2FU2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56132082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 85CAC874CF;
	Tue, 11 Feb 2020 12:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKDI-fxU3-Dy; Tue, 11 Feb 2020 12:40:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1502F86EA3;
	Tue, 11 Feb 2020 12:40:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01CF5C1D88;
	Tue, 11 Feb 2020 12:40:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D780C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 689D2203F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ao0jzrhS5-IF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id CB69F2000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:35 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 2so5431808pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vNB8GaKg9O+94+m+JhhyWqrlwA28PBFjXIy3V7eDens=;
 b=L2wK2FU299w7KfCcc083qXSVft0zlc6j373IdYsP+mvhUqBf/w/r4V3BP9F1QGYFgP
 3ZVsvOK5jn012+WlILfEfHn5BCnmV6+ZHYHDMqqKIHwen/1JyCDzVI+3YXmbl6xjlQvX
 oN26eAAWuXcRs7gHEEc0oq55MddUp/XEfSEsZVV/QiqcB3jWyKhhwnHE2nGTbVOdPrks
 vNcRiIR8w3lBfF2bamPhR9BQN5oaZNsk8uROEpJCJsnsB7ZFTGuxyfSaYg1wIejfWklW
 G0M0eWs3cJ6lK71N1mOtHWHzDzJKOIYqBvgX2mbxPo3UfdI2peE6Aqe0/PL2iTLjWpyU
 xjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vNB8GaKg9O+94+m+JhhyWqrlwA28PBFjXIy3V7eDens=;
 b=G7XZ25+PhyqlyP5d4/SUuQFi4NJWevIVI2VGuiIaLlOpSkv8+5acYy3Y+jaDsi6vyQ
 YK9/BRhIZL2FuHmuFunWiXt6oRGTjvj84PztN+vcSWZbZzRfB5bojK2Buf1MYKAYZQSz
 eH2AGxBLdQYmd1mR4iTwSDS6fNfb/Dk58bleKJi1BSDa5UvyZf1YQAMP5PSxb3C++p+w
 3B4jTPDEsNgvvoS/BsOoa2BrQx+TTAbLbTX0Mjlclvb39ePIP36tHb9sfy0+n0b0akQe
 JXPEKLG23mz1lLz+clETEultoeAZ0TghQHjAvuWBSKyI0nmqrWbggrClDM0wlyAvxmvy
 p1Tw==
X-Gm-Message-State: APjAAAUdLTNVyp5yYLXXfp70JgEZnXUT41tS8QS0ZCC3/oRQIOABYuc8
 MOh7Vnn32jHY3qv4/sisJk7kw5OiTtU=
X-Google-Smtp-Source: APXvYqzcSqNMjz3nfB8nCri6G1335AxVHlRIBYjnheU+zhYu6CGK6skN+HVh4/my0CPHaqzKio5NTw==
X-Received: by 2002:aa7:85d9:: with SMTP id z25mr3115945pfn.223.1581424835462; 
 Tue, 11 Feb 2020 04:40:35 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:40:34 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:44 +0530
Message-Id: <20200211123859.10429-4-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 03/18] staging: exfat: Rename
	function "ffsSyncVol" to "ffs_sync_vol"
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
Change all occurrences of function "ffsSyncVol" to "ffs_sync_vol" in
source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 06d8e3d60e9e..ba86ca572f32 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -509,7 +509,7 @@ static int ffs_get_vol_info(struct super_block *sb, struct vol_info_t *info)
 	return err;
 }
 
-static int ffsSyncVol(struct super_block *sb, bool do_sync)
+static int ffs_sync_vol(struct super_block *sb, bool do_sync)
 {
 	int err = 0;
 	struct fs_info_t *p_fs = &(EXFAT_SB(sb)->fs_info);
@@ -2899,7 +2899,7 @@ static int exfat_file_release(struct inode *inode, struct file *filp)
 	struct super_block *sb = inode->i_sb;
 
 	EXFAT_I(inode)->fid.size = i_size_read(inode);
-	ffsSyncVol(sb, false);
+	ffs_sync_vol(sb, false);
 	return 0;
 }
 
@@ -3314,7 +3314,7 @@ static void exfat_write_super(struct super_block *sb)
 	__set_sb_clean(sb);
 
 	if (!sb_rdonly(sb))
-		ffsSyncVol(sb, true);
+		ffs_sync_vol(sb, true);
 
 	__unlock_super(sb);
 }
@@ -3326,7 +3326,7 @@ static int exfat_sync_fs(struct super_block *sb, int wait)
 	if (__is_sb_dirty(sb)) {
 		__lock_super(sb);
 		__set_sb_clean(sb);
-		err = ffsSyncVol(sb, true);
+		err = ffs_sync_vol(sb, true);
 		__unlock_super(sb);
 	}
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
