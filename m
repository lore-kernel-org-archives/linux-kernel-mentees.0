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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAE2C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4AF52071E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PanbDHou"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4AF52071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A7BD881DC;
	Wed, 29 Jan 2020 16:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEjQoOTv2VRe; Wed, 29 Jan 2020 16:59:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9FABB881D9;
	Wed, 29 Jan 2020 16:59:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F660C0178;
	Wed, 29 Jan 2020 16:59:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04E77C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E7ED421552
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fILGQfxO6yCJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id E2C2E2154B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:48 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id e9so25465pjr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6ZbBhIi0riG/FffoHPYCh51NnFjjYqXGbFi/rzBY4g8=;
 b=PanbDHou8mhsrOBc69UOZyTngiEm8iDn5oseDnSAz+rMw8vbwMrDAaSir43qohiOYf
 IBpLw/I1Jiu27c99X6Qhlx2ZoFkAH4WE95oQ3SChbL9B7DAZaNIS6mV18Iu/5zlZeoOp
 iJeX427lwXFFiLFVYHcPwMqZwZAbRpPoAhROajvJWv9sLleTzOqqeRslPFU5fmRYjH4E
 9XzeDtWLlOgBmf0V51vYMfQ3k//tJJhG4UNRcArRq/H2O1dokzfUbKRRg2cE8Ut5i+CI
 Z92auWIftgpF7l8k78ygxTe2ZfYi+tYCOrwPlWSRSR+V3r+6GZNI7UQ4xbhcSQ8kE7Sy
 eDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6ZbBhIi0riG/FffoHPYCh51NnFjjYqXGbFi/rzBY4g8=;
 b=nF5vxgBV6YL39dVoOSB3xtBNVY01nvBQCQj/ezKss3XAIgyydg0DO1O5DyovhgjWAk
 0ZGRAplZFd/czjuN0olGNJYX5aOWtuiOeqctvsuFnnMEmiAexpTt/XZravYbyFYuvMmC
 E2+FyAdr2/z7X5xXdsi+z9fe7/HaLdu950r1n1Wlp3pKvyA0vX3Y5PyPKCTv8tfBw4y/
 9bQy27rl2QWRweIC+UbimLXEjMklH64KsqKIWX0HtRbvndZ6eQ/cgc7cAdyeRD+l67YO
 oDR0a3+O0XolcjNtRvd7ISlgxIUObciTCMoW1EvmahRaAQB8lNgSYwTFYabPcMtD3aeY
 sHQA==
X-Gm-Message-State: APjAAAUB5GkD0Agvfi3rUQxfxl4xUN9CYHopSZPYeeZI0BAVotMBE7Bx
 2ZdSyfHd8NjK+7FxXtqYM44=
X-Google-Smtp-Source: APXvYqwCjJDPtZFFe4m2zkyLFY91/aQnmcgFPFrJlbSY60+TzUbowjEIKyEw9282hQtPDF5v5/eHGw==
X-Received: by 2002:a17:902:6b82:: with SMTP id
 p2mr279070plk.259.1580317188504; 
 Wed, 29 Jan 2020 08:59:48 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id f8sm3223610pfn.2.2020.01.29.08.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:59:47 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Wed, 29 Jan 2020 22:28:23 +0530
Message-Id: <20200129165832.10574-11-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129165832.10574-1-pragat.pandya@gmail.com>
References: <20200129165832.10574-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/19] staging: exfat: Rename
	variable 'NumClusters' to 'num_cluster'
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
Change all occurrences of identifier "NumClusters" to "num_clusters"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index c9d9791312f0..3fd234a323fb 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -244,7 +244,7 @@ struct dev_info_t {
 struct vol_info_t {
 	u32      fat_type;
 	u32      cluster_size;
-	u32      NumClusters;
+	u32      num_clusters;
 	u32      FreeClusters;
 	u32      UsedClusters;
 };
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index ac6f38508d2b..d8de39917bc0 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -496,9 +496,9 @@ static int ffsGetVolInfo(struct super_block *sb, struct vol_info_t *info)
 
 	info->fat_type = p_fs->vol_type;
 	info->cluster_size = p_fs->cluster_size;
-	info->NumClusters = p_fs->num_clusters - 2; /* clu 0 & 1 */
+	info->num_clusters = p_fs->num_clusters - 2; /* clu 0 & 1 */
 	info->UsedClusters = p_fs->used_clusters;
-	info->FreeClusters = info->NumClusters - info->UsedClusters;
+	info->FreeClusters = info->num_clusters - info->UsedClusters;
 
 	if (p_fs->dev_ejected)
 		err = -EIO;
@@ -3350,9 +3350,9 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 	} else {
 		info.fat_type = p_fs->vol_type;
 		info.cluster_size = p_fs->cluster_size;
-		info.NumClusters = p_fs->num_clusters - 2;
+		info.num_clusters = p_fs->num_clusters - 2;
 		info.UsedClusters = p_fs->used_clusters;
-		info.FreeClusters = info.NumClusters - info.UsedClusters;
+		info.FreeClusters = info.num_clusters - info.UsedClusters;
 
 		if (p_fs->dev_ejected)
 			pr_info("[EXFAT] statfs on device that is ejected\n");
@@ -3360,7 +3360,7 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 
 	buf->f_type = sb->s_magic;
 	buf->f_bsize = info.cluster_size;
-	buf->f_blocks = info.NumClusters;
+	buf->f_blocks = info.num_clusters;
 	buf->f_bfree = info.FreeClusters;
 	buf->f_bavail = info.FreeClusters;
 	buf->f_fsid.val[0] = (u32)id;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
