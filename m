Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8772C3B187
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B911206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S90OjPJk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B911206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5FFA18547D;
	Tue, 11 Feb 2020 12:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vygDpXgbwQ76; Tue, 11 Feb 2020 12:41:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13A5E845C5;
	Tue, 11 Feb 2020 12:41:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 005D2C1D88;
	Tue, 11 Feb 2020 12:41:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5D22C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7EE4F82D8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXD0Z02zxgci
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0139082441
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:47 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t6so4236726plj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AlXfI3TYENDO6EIV6539YfBeSyGhAhgJFR6rgHScXF4=;
 b=S90OjPJkBgFMPll4NjkZiIQ2jRaq6iUsPwIjaYg4s565ns4MsPdSe1HsgjxTuiGnLP
 2Xw5lWRCNMFFEpBPgSpEua/GqybPc4PtlbL1QShJ3Dkd1lp8vhoDLecwhEpW0O9LDBp/
 EN/60+LLrwQnlmv11ezHpOQ+hvF7JktRNT1hGDu73lq5y5idhJhEdxLH6rlZzSstQK1q
 aK9QY6A5WmplN52F30uePV90Y5JQJCs+ZHLrkuepMf6hAtsbfFU8QbZTTbx829vwzrOh
 kLQ5ZpvjOLm++swwRG2EoX/HPUZPB9wvP0qx3h6FKbnHnkPAJoE4Bm1buMsE3FLINj0p
 R+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AlXfI3TYENDO6EIV6539YfBeSyGhAhgJFR6rgHScXF4=;
 b=s/AWyFjPoVh0XzBSRH+1/98uBCbTmGYiZQySTyxXw91rkc7sAVVm7Vk/Kw6mBUrN83
 f/dTO7ttl5t5z7ygJPNf6Fz+0HdrMuLAv4iXddOy5oDIagHiPk75CYQik7RRJYwSOhTo
 7ew99SkOXBo79hffliuwNC5YDlxmN9uPCk23WrhBMFesO8niGrrtL8O/RztGeh4D6dRl
 I69NgN2+qVpkPaV6SEqIhv20toBYEYONpwty5ymSSN9pWjp3bTsA/lZWB4l5APxaCSnA
 h2GPKCDFZbhQ7qnP8LX5AzmNYiePd8G+i0xv2QdhzlSPu2MakI5sZ3gQFZjO4oZoOkBG
 7QgA==
X-Gm-Message-State: APjAAAUHp0Vj8/tk4iq9TJBjnVg2UukAqJGWmYk1lD66tI6rDVmHsfq9
 4VfACl4azqhvd6NyJShZhVA=
X-Google-Smtp-Source: APXvYqz5gZKbIttVFpeyZfSqvDhLaMLAzotEcOmqptNaUCR7PV4pjEavYaL2/BUlCXNGvIxhf8oM7Q==
X-Received: by 2002:a17:902:6b07:: with SMTP id
 o7mr17552526plk.141.1581424907655; 
 Tue, 11 Feb 2020 04:41:47 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:41:47 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:57 +0530
Message-Id: <20200211123859.10429-17-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 16/18] staging: exfat: Rename
	function "ffsCreateDir" to "ffs_create_dir"
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
Change all occurrences of function "ffsCreateDir" to "ffs_create_dir" in
source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 87a7bcba4921..d8265dabe37d 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1776,7 +1776,7 @@ static int ffs_map_cluster(struct inode *inode, s32 clu_offset, u32 *clu)
 /*  Directory Operation Functions                                       */
 /*----------------------------------------------------------------------*/
 
-static int ffsCreateDir(struct inode *inode, char *path, struct file_id_t *fid)
+static int ffs_create_dir(struct inode *inode, char *path, struct file_id_t *fid)
 {
 	int ret = 0;
 	struct chain_t dir;
@@ -2505,7 +2505,7 @@ static int exfat_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 
 	pr_debug("%s entered\n", __func__);
 
-	err = ffsCreateDir(dir, (u8 *)dentry->d_name.name, &fid);
+	err = ffs_create_dir(dir, (u8 *)dentry->d_name.name, &fid);
 	if (err)
 		goto out;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
