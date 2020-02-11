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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E012C3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027B92465D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwOH1rXD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027B92465D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2D4684539;
	Tue, 11 Feb 2020 12:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqaIHDgEL5Ch; Tue, 11 Feb 2020 12:41:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82F3B84537;
	Tue, 11 Feb 2020 12:41:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72CB9C1D88;
	Tue, 11 Feb 2020 12:41:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AF69C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 16563203F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USy8QT23fin5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 746022000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:25 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c23so4241848plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2LN667GsaIU1PPznCvOIjpYDI6/NrfmfLtQqMg/2m28=;
 b=UwOH1rXDlAVGZ9jRO+T1mltnnyn449Ul/zuLqhaeWyxDB51mpOtRzhAU28xSaZ1hwV
 7v1ooNZ919hPSILlODsm0y3ahQWVZzsuQNGgWJZraEhizrzBY+sfAtGma3uhHChwO7ya
 O0q8qXIXPa/vNPBVyopeivMneqRIUzEd5gZzne9DgiX38JbljSgg9gHJRxJjdPB5y4RG
 WNtLQ3BBDTX9nkVX0PGuodmonZvndaSaNyWfqzmj3YsVJWL94NBG4bjQoALRcN2ANoQp
 +OqmwELQiwYc9UWD6UlCb7i2v0m41yS4MkLJ4GgMk3CnM9jovxs98rxu1WGwXcWpeD6A
 7PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2LN667GsaIU1PPznCvOIjpYDI6/NrfmfLtQqMg/2m28=;
 b=HpBaN9y6EZLW3AIEKmDYqwa0RDNBT1g70NvC1fuQyy1dfAJoEin32eu1YM39/ufjjA
 O4djG2dAiUwGrQsMlAc8yJaiC/HFGbu5iw69tTZyUKfaJnw0aNkS+VcKFktwatej1yJz
 qV3QGVLvxzGXJbDA+8TDafzw7B0WaP9ifrY4kFYQUW0CwmYQ4asq/udzqcdFkFBrIBnW
 qjlnrfo3U1vv0MqYfOJW4mY7e4qCBgOf5RISSECBUQdNor5icT75wTW2wn1b+1FJfURr
 jtVZwRosR9m7TCrNyB44ZYyOnaw2sFQOs1lURiS4F4FYgD5YErVzFkdnIEbTtsXByEjT
 InIw==
X-Gm-Message-State: APjAAAW/nqVoaqkBZdW7CZtP7Tr/3MwRmhpMKt5xIz4DhFtyZAGwDY+7
 R1YwQOB4yJMLQ/1xWhvKyec2OeIci2Y=
X-Google-Smtp-Source: APXvYqxNE7bFwonsXbH3VgCbcK+DHL6GqbObJmayZ5HGDVur+uv+s/v7quE/eYQv4c2S9bpQwJwJOA==
X-Received: by 2002:a17:90a:d205:: with SMTP id
 o5mr5009430pju.46.1581424885066; 
 Tue, 11 Feb 2020 04:41:25 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:41:24 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:53 +0530
Message-Id: <20200211123859.10429-13-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/18] staging: exfat: Rename
	function "ffsMountVol" to "ffs_mount_vol"
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
Change all occurrences of function "ffsMountVol" to "ffs_mount_vol" in
source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 05a4012c5c62..6fa005097a21 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -343,7 +343,7 @@ static inline void exfat_save_attr(struct inode *inode, u32 attr)
 		EXFAT_I(inode)->fid.attr = attr & (ATTR_RWMASK | ATTR_READONLY);
 }
 
-static int ffsMountVol(struct super_block *sb)
+static int ffs_mount_vol(struct super_block *sb)
 {
 	int i, ret;
 	struct pbr_sector_t *p_pbr;
@@ -3710,7 +3710,7 @@ static int exfat_fill_super(struct super_block *sb, void *data, int silent)
 	sb_min_blocksize(sb, 512);
 	sb->s_maxbytes = 0x7fffffffffffffffLL;    /* maximum file size */
 
-	ret = ffsMountVol(sb);
+	ret = ffs_mount_vol(sb);
 	if (ret) {
 		if (!silent)
 			pr_err("[EXFAT] ffsMountVol failed\n");
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
