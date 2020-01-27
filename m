Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BA3C32771
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87CDC20CC7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2BMAGxj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87CDC20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BAC185497;
	Mon, 27 Jan 2020 10:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqFUE4IyA91m; Mon, 27 Jan 2020 10:15:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0395D85465;
	Mon, 27 Jan 2020 10:15:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7FC0C0177;
	Mon, 27 Jan 2020 10:15:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C223C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4800B2037E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvzfeKyJueYa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 940C320026
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:22 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q8so4695639pfh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JcRIPbkub/tWCLWv2xyN/6N5F607AAwY0FQRtWmXUeA=;
 b=I2BMAGxj91JaWVFHnYf9So8bsD1dfH8idbbGesPL0ij3BPjgFCvpvLWjduaA5C8qkg
 8Qa2UOd3foVbMQcndVTWVnlpHv/PNu9eGY+jlTMlbamIIvBw196VKKknWRvCeGjqnGII
 fSQhGwKhVMDj4ynx6uiUTHYjo7it5NW7KImy6H4XpdoHZW28L6ZDnSGNHdOGOhxCkQs5
 9t1ebEbrxNhPlpwApa/W8pVeqbRL3ovJXuWiFKAXF5LM+LJbbGheNJL2AQYnsxQJocku
 BfMyoYnDgZXkYoUcRo1KAkkDppttvlREYu5vumOWZvCWvGurNJzFRHQPh66Feu0z/OYr
 9AAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JcRIPbkub/tWCLWv2xyN/6N5F607AAwY0FQRtWmXUeA=;
 b=jJSMjq9V7/AiYHZ+EodU57yh+f77Vi2vKPDnnB7Z+capWKmhPFyRVeRRmYlDlLW51h
 3kD0Nv6IEKfB5YHpE4PHkZ8W1vPXb+8wukR4Sra402dlTZDfl6VIcxQrV6iEhGACynFU
 S8yPx4W/B325OkBKrygQ+72CdhG/eevLs4lQO/SzX7Tog3yhi6VTgr9X7EggA9Gd39W1
 +sBG4dD2E7S1rC7mBeaLF1xlPK6J7WkZCpee7S2eQuTDwkCs+Vo9jP7zYn3yjQooEJXi
 PXe26tgjrApYu6Y5NZxM8HZETuMtqT0d+n4406jK0hDbURVa/d9nQq/qIBGNYpA7yky3
 YJPw==
X-Gm-Message-State: APjAAAVX3e2qyvWTwsMTyLQSyH8Vh1T/pKnLKeAFC/8UiGfHv20FY0Xk
 CAUG8CdzhatvJVGGB0v66Fc=
X-Google-Smtp-Source: APXvYqz4cpaQhSrx7z63SDuOGFvrj5XzI/Ry023qsgX7Z6Wknq4LZXkbYdBRvnz+HNjoGYRxXi+zWg==
X-Received: by 2002:a63:7c55:: with SMTP id l21mr18809439pgn.57.1580120122163; 
 Mon, 27 Jan 2020 02:15:22 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:15:21 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:33 +0530
Message-Id: <20200127101343.20415-13-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 12/22] staging: exfat: Rename
	variable "ClusterSize" to "cluster_size"
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

Change all the occurrences of "ClusterSize" to "cluster_size" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       | 2 +-
 drivers/staging/exfat/exfat_super.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 8a4668d301fc..8787cb3203ba 100644
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
index 695c8793fe5f..b9445bef0e6d 100644
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
