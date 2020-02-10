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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA86C352A5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:37:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6A620656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 18:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ttfeDu8Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6A620656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D59986A07;
	Mon, 10 Feb 2020 18:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1HcVfEK4vnl; Mon, 10 Feb 2020 18:37:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EAE53859F8;
	Mon, 10 Feb 2020 18:37:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D34AFC07FE;
	Mon, 10 Feb 2020 18:37:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8045EC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6FA6D86100
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-O6HlKo5gCp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E8F26860F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 18:37:09 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j15so4350194pgm.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 10:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=27GS09eY1gZMvn8ykuFSTchiyR/0xlUbhClAe0LrabY=;
 b=ttfeDu8Zq4PNzrvi+BAn5afh1cmsVKs6haYWiAPBxQZNCe/zQSIihKZG0Pa/WzK1Er
 i9CqtMcAbBu5nv/440DEgGKrTiaAeRqy5hEkCWyeCCRwTMXEl1Apl6/dZcEtEHPiUqdh
 mNUh5JghIJSUW2+hQgc3HBAzutxUazNUYCu+drSFqfpG6jmmmANGYbwRTh3uSgAVrEN6
 SJS234pDg8Ukh2FuAondiOkH/7Oc1/D66HxZCOIdNg6IL98Sds/XPgd2uU43dfROpse2
 ICcyeUKr/M+xLzNtA8IAd4x0M4b0gwNTSTKWdE8tViSs/JKXfnNsARyrRyEd4a52L8nh
 i/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=27GS09eY1gZMvn8ykuFSTchiyR/0xlUbhClAe0LrabY=;
 b=BFalNqP55rztiuYCYlYjZ8w336hU+O+sp2nRmbqRa8Wxsk0klIVdbBMXocoe+SpsMo
 GmEhND3g9w1xdFdPCokSM0wJiYeQQMalrYkOjTnPv4T+0dfcVE2IbSuXNljqDjGrarVW
 kt8NwIOEEurbPVpZamCtmZIYibTOs+ghUEkRZzrdUqNFX487iWypgNKgl0/XBDdynQRm
 zyU09UuYFxe1YiWToFPr1OE54gHCDx5J/urhqP1bhdJi3jgu4Mz6c5EmNdMdTMajs9JW
 qfzNJVppC83VxMUw/pMzYicSFprGxRfMGtNDgdFp+7ZkdwqoMPrT87P37mqPfgoz47to
 +e3A==
X-Gm-Message-State: APjAAAUiWF2ihgr12mGCsUC59GdBV7fXhJU5dVsgPlBfpdS60VtwsiBp
 eil9ZfHuJ57L5XHGQ9GGDCg=
X-Google-Smtp-Source: APXvYqwtTrWXOaXFI4zLrvcX0Q/Ed+c2CsDmDrBwmpAQ640g+GzKUygWUNrHGvfT/Xmqx5u440L/Kg==
X-Received: by 2002:a63:5f10:: with SMTP id t16mr3111488pgb.222.1581359829628; 
 Mon, 10 Feb 2020 10:37:09 -0800 (PST)
Received: from localhost.localdomain ([2405:204:8308:74f3:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id gc1sm124922pjb.20.2020.02.10.10.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 10:37:09 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 00:05:47 +0530
Message-Id: <20200210183558.11836-9-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210183558.11836-1-pragat.pandya@gmail.com>
References: <20200207094612.GA562325@kroah.com>
 <20200210183558.11836-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 08/19] staging: exfat: Rename
	variable 'FatType' to 'fat_type'
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
Change all occurrences of identifier "FatType" to "fat_type"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       | 2 +-
 drivers/staging/exfat/exfat_super.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 96e1e1553e56..43c40addf5a5 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -242,7 +242,7 @@ struct dev_info_t {
 };
 
 struct vol_info_t {
-	u32      FatType;
+	u32      fat_type;
 	u32      ClusterSize;
 	u32      NumClusters;
 	u32      FreeClusters;
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 472a6c8efcbb..7b5be94a0bb7 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -494,7 +494,7 @@ static int ffsGetVolInfo(struct super_block *sb, struct vol_info_t *info)
 	if (p_fs->used_clusters == UINT_MAX)
 		p_fs->used_clusters = exfat_count_used_clusters(sb);
 
-	info->FatType = p_fs->vol_type;
+	info->fat_type = p_fs->vol_type;
 	info->ClusterSize = p_fs->cluster_size;
 	info->NumClusters = p_fs->num_clusters - 2; /* clu 0 & 1 */
 	info->UsedClusters = p_fs->used_clusters;
@@ -3345,7 +3345,7 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 			return -EIO;
 
 	} else {
-		info.FatType = p_fs->vol_type;
+		info.fat_type = p_fs->vol_type;
 		info.ClusterSize = p_fs->cluster_size;
 		info.NumClusters = p_fs->num_clusters - 2;
 		info.UsedClusters = p_fs->used_clusters;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
