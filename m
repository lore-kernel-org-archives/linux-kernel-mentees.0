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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56A6C352A5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:37:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A51F520842
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sANQpXsy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A51F520842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 845C685193;
	Mon, 10 Feb 2020 18:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnmKwfiul5ZU; Mon, 10 Feb 2020 18:37:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2450985116;
	Mon, 10 Feb 2020 18:37:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2111EC07FE;
	Mon, 10 Feb 2020 18:37:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DFCCC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 093408522E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHx9c-_bKTqt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5934E85116
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:20 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id f2so145717pjq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 10:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HS62S5V7Qa07ZQUMT3Q93j8iWGJHMLo+fJYA8CxCock=;
 b=sANQpXsyHmm/d/GWSP7Owb/st6xVfVjs+LDYcZsCf5Bkxukflb2YMvRx6mUTeC/iXk
 BR7doZv8Zfc6hmqMpBpZzA0VKtvFlHqCAsGZjvzA87LL2mhZTcQYRY83egGiB+AvRN++
 pLK90VCEqf2K02OjeE1L6WMTZPVMtQ/WiIvcUIgIhayK+pLjwt51nT7fpPo2WNHqwquH
 uk1DklkNW+P8/MT5qAGxVa8jYNDcMI0fHWavTGmvcWbjRBREDoawRUnI7QVM3N2axFV9
 aHJDRqpDOmFb0yHeIGoayFMwieTr+Mdjr4jJFlMaC88iqT11YB33/x5dF6z9oDR3kWdc
 S+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HS62S5V7Qa07ZQUMT3Q93j8iWGJHMLo+fJYA8CxCock=;
 b=R33NKlRP3IEA3StS85ljBDrTSfO8DKLlxoCFJ4tWnyQA/3l/h2ouNkGV/eDGxeQ1e/
 4U0O8WBjGWiKLOF/onf6pIfkzTdwxu77DbDTAUGEcDPUMVg8Q9a9VNBJbeFJv2OP6zR5
 iNkHu7wvEuh1a5PlRQfVmQHJm4O0RhQ6aVsvOKHspuCl6OKA8Qi0RcTWToUCVz1XYx9E
 G6kJXdUFR0VPknX/AGwWkHyISUgX40RAPns4gJHt8Hjx3LBkrWkKroTzkmhEQInTQ3hV
 e0zMLTRNYMHd/erJTUvWExBf2PoXh/JcfIS4NW72tz6GV9cXzjK025R1U06SuS7kwErJ
 3RPw==
X-Gm-Message-State: APjAAAXrdoVIFLkvbaRe7EzuLbW897CCkbD7O9X2FBVXaGlK79A5hOid
 1V5NBdWfdVBrMpgYRi+XUxE=
X-Google-Smtp-Source: APXvYqzSTCVLpw41wYXgoo9QWkGLg6yuI6kZG3p2+few/NSO+vSp2E5FIKRYxdj+96eNyvrCSRA09A==
X-Received: by 2002:a17:902:b210:: with SMTP id
 t16mr13861164plr.65.1581359839948; 
 Mon, 10 Feb 2020 10:37:19 -0800 (PST)
Received: from localhost.localdomain ([2405:204:8308:74f3:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id gc1sm124922pjb.20.2020.02.10.10.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 10:37:19 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 00:05:49 +0530
Message-Id: <20200210183558.11836-11-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210183558.11836-1-pragat.pandya@gmail.com>
References: <20200207094612.GA562325@kroah.com>
 <20200210183558.11836-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 10/19] staging: exfat: Rename
	variable 'NumClusters' to 'num_clusters'
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
Change all occurrences identifier "NumClusters" to "num_clusters"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       |  2 +-
 drivers/staging/exfat/exfat_super.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index c6e3981cc370..df84a729d5d5 100644
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
index cac5631d0f11..59e18b37dd7d 100644
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
@@ -3347,9 +3347,9 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
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
@@ -3357,7 +3357,7 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 
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
