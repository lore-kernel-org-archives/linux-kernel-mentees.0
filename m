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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB76CC2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B29402071E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gh2RK85B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B29402071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A57FB8350D;
	Wed, 29 Jan 2020 16:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id squE13XLXudq; Wed, 29 Jan 2020 16:59:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E102834D0;
	Wed, 29 Jan 2020 16:59:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 763CFC0178;
	Wed, 29 Jan 2020 16:59:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90A25C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8C3D921552
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nc67UXSYW3O0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id E35102154B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:42 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q127so73178pga.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PJt29fpMlf5QIWbEwlo7IH62d5FhRNTDbUVvQF2baUI=;
 b=gh2RK85B8NOwK3idUEi4OtRe0/WcrHmWcPvrHandlHXU9jkb9hTyq93hIQL+DMaSbs
 NFtEUNTffx/ZEXUWaXUXKvV75dVqzYGuQ/zx8f2ZY93GdTFCiZexoQKAHL31Ggl5SalD
 MisaJ7HRj+uPBftcOeHPW0AFcAxUrOl3A/KFUtRionIqhUcljBJtp48LAHhWjzD9Ix3I
 jEGRf0m1/yTvgKvpMBcdZD6fFTJmhnCTA6EG0DeiuqBVNWI5s/b+YNei+Fsq6A61MkaN
 DDV45wbfRkBDUTek0Jx50NTARF5RaByLEOs647eAD8ViFGSZNq0KRvce+tXoz+YSBIy5
 3Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PJt29fpMlf5QIWbEwlo7IH62d5FhRNTDbUVvQF2baUI=;
 b=G8c6NmBWNRTu100pG35BJu/uDaSdwZGnyQSAT5QvZ6IWJOfaFU9/GzJqutOp0DS2PB
 ZpnRTQ8t4cb+5zG6jYCkbhWVxwl5q3g6GyATMSrM3cWW52hyp5qUiMM61sfa3iDZ7UyJ
 X1sCwUeach9gKKVvkG02kGFi2s7rbh803X8zsN5S0RdRxPjDv4Bs4x+Nw+2Vh111WUK4
 vN1Pt2vr41MCGvhNMTr6DRKr9DljVmrnzUUvromHZ6TfFyEZn+wVe7BCjKESv+q0fw7m
 qBSeJgc2d8xBCjhoEMO9aCQ+VYgGUM+k/oXpO75KHxQlnJwIHhBJJ7eb0FnqDmsRs4/v
 E5hw==
X-Gm-Message-State: APjAAAVyOVa1+ud0TQShoSql14MR4cd96Ebpg2WjxTTJ3Q2kiYqVpAHT
 0PcJeHbPCss/kCUZLRacZwg=
X-Google-Smtp-Source: APXvYqzdQ7nUMbDaA3I6UMgsFCb/dQporMjaJNcyYVfVE/rPc5JH6NfgVyi0Rk/m+wfum951itB5Sw==
X-Received: by 2002:a63:b305:: with SMTP id i5mr24306579pgf.25.1580317182608; 
 Wed, 29 Jan 2020 08:59:42 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id f8sm3223610pfn.2.2020.01.29.08.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:59:42 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Wed, 29 Jan 2020 22:28:22 +0530
Message-Id: <20200129165832.10574-10-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129165832.10574-1-pragat.pandya@gmail.com>
References: <20200129165832.10574-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 09/19] staging: exfat: Rename
	variable 'ClusterSize' to 'cluster_size'
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
Change all occurrences of identifier "ClusterSize" to "cluster_size"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       | 2 +-
 drivers/staging/exfat/exfat_super.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 8e01f011ef27..c9d9791312f0 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -243,7 +243,7 @@ struct dev_info_t {
 
 struct vol_info_t {
 	u32      fat_type;
-	u32      ClusterSize;
+	u32      cluster_size;
 	u32      NumClusters;
 	u32      FreeClusters;
 	u32      UsedClusters;
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 6278fc3eac19..ac6f38508d2b 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -495,7 +495,7 @@ static int ffsGetVolInfo(struct super_block *sb, struct vol_info_t *info)
 		p_fs->used_clusters = p_fs->fs_func->count_used_clusters(sb);
 
 	info->fat_type = p_fs->vol_type;
-	info->ClusterSize = p_fs->cluster_size;
+	info->cluster_size = p_fs->cluster_size;
 	info->NumClusters = p_fs->num_clusters - 2; /* clu 0 & 1 */
 	info->UsedClusters = p_fs->used_clusters;
 	info->FreeClusters = info->NumClusters - info->UsedClusters;
@@ -3349,7 +3349,7 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 
 	} else {
 		info.fat_type = p_fs->vol_type;
-		info.ClusterSize = p_fs->cluster_size;
+		info.cluster_size = p_fs->cluster_size;
 		info.NumClusters = p_fs->num_clusters - 2;
 		info.UsedClusters = p_fs->used_clusters;
 		info.FreeClusters = info.NumClusters - info.UsedClusters;
@@ -3359,7 +3359,7 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 	}
 
 	buf->f_type = sb->s_magic;
-	buf->f_bsize = info.ClusterSize;
+	buf->f_bsize = info.cluster_size;
 	buf->f_blocks = info.NumClusters;
 	buf->f_bfree = info.FreeClusters;
 	buf->f_bavail = info.FreeClusters;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
