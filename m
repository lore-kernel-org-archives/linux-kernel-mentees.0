Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0741EC35240
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D259320732
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJu7NoGu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D259320732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C57668407F;
	Wed, 29 Jan 2020 16:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMsnkj-g5w0c; Wed, 29 Jan 2020 16:59:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 673108357C;
	Wed, 29 Jan 2020 16:59:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56A5FC0178;
	Wed, 29 Jan 2020 16:59:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28675C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 178D5838D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sja88CRsxeF7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9A0B581F2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:37 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x185so8717505pfc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v2M483Nb+iZkWZmPc4XRqpPz0Lt+K12nY/QlfnPGK2M=;
 b=mJu7NoGudWfCS8cD7W26V3T2ehy3yTffZ9Ef64UIY4yUU8URmZvnIZ0z2FBILyF7KF
 x7z1pA49lxyD7b0NMenTv0yCa697NCxI7tz6Zj/YgjIPmB0Ps6Pgjdh0EweDi8FEGJqx
 Sf2B1od5u3Ei/D1WibtvEhJqqv517GwBoPnfv+Ib+NL9dtFkyunT9UdIBrlAmWs0f/Z0
 J9rszrLfnIyxPf4yAJ1eA+Khju15+BMsEYrY99WXcKLHDQlJz7dq9RPp0lmOCt/Tdr7P
 B23U7u46R+Iw4Lgyda7ghaolzEii6pyIKMSDFVYE4u55cLJlWcP1ID+bR6WSiQ7dDky0
 cCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v2M483Nb+iZkWZmPc4XRqpPz0Lt+K12nY/QlfnPGK2M=;
 b=p+YaIm1ut+lpiC0sY+cOpmyj/lyAGIad1xnsJrxInoOx5v8+VYQjMuC0VTNry7/Gn0
 hURHy7sUfY0OWOs8ekVBcaYFdwZQZvGVvzbe8Nk3FyQ7Sn648jRyE0daasOkycvFylea
 cO3NHU4KPSxeD3LF19b1AcgMtoZKa4Ts95s/yeN4wxdaFyzuWMscADIVKRBGc4cHA1GR
 mff5DR41+Nhq5ax3MLQVjD8xd+tgpdgvfV5H8v4PQxkvvuPY7/kuEs7tygPoiIo6E38m
 iDjPWxt668EyRksHGJRgv1RCGimWp7upKgVSRW+QyO3KvhZHwKGQSfkHSK/Z8FITMmgO
 MHjw==
X-Gm-Message-State: APjAAAVmbSUSm2aTgGkXpI7/iykLQS66qcE+8gcExQfS4FVmwVAY3DKe
 3gE4eGq8cAJiJpGNOoNzXfI=
X-Google-Smtp-Source: APXvYqw/2sgeGJUjeHgta0fESRcIDWKcAefrypgb55KtWV4ikjhcQ+MRA6SEB/hicXdUbOEGXGWRHw==
X-Received: by 2002:a63:fb05:: with SMTP id o5mr32245884pgh.355.1580317177241; 
 Wed, 29 Jan 2020 08:59:37 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id f8sm3223610pfn.2.2020.01.29.08.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:59:36 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Wed, 29 Jan 2020 22:28:21 +0530
Message-Id: <20200129165832.10574-9-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129165832.10574-1-pragat.pandya@gmail.com>
References: <20200129165832.10574-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 08/19] staging: exfat: Rename
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

Fix checkpatch warning: Avoid CamelCase.
Change all occurrences of identifier "FatType" to "fat_type"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       | 2 +-
 drivers/staging/exfat/exfat_super.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 55405dcbf8f7..8e01f011ef27 100644
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
index e51abb9b3826..6278fc3eac19 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -494,7 +494,7 @@ static int ffsGetVolInfo(struct super_block *sb, struct vol_info_t *info)
 	if (p_fs->used_clusters == UINT_MAX)
 		p_fs->used_clusters = p_fs->fs_func->count_used_clusters(sb);
 
-	info->FatType = p_fs->vol_type;
+	info->fat_type = p_fs->vol_type;
 	info->ClusterSize = p_fs->cluster_size;
 	info->NumClusters = p_fs->num_clusters - 2; /* clu 0 & 1 */
 	info->UsedClusters = p_fs->used_clusters;
@@ -3348,7 +3348,7 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
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
