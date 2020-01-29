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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C90C33CB7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CEE02082E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnBQTRAd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CEE02082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2F8CA881DC;
	Wed, 29 Jan 2020 16:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ihKWehz7neo; Wed, 29 Jan 2020 16:59:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC873881D9;
	Wed, 29 Jan 2020 16:59:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9459C0178;
	Wed, 29 Jan 2020 16:59:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0F22C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E064F834D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXKcbQJshHWO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5976A834A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:59:55 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i6so8720779pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2KjaafwE2g+wJHMSZXmaiaKXLE2m0dx98a6SWPRLseM=;
 b=QnBQTRAdZ/x2siJeZQ+z/iHOGDk09zkSmwAZy3M5Hew3nw4tVVz8FDsM13lyCwkKpg
 GWKUddVJl5hdPQChCzVp7HAgclYvZwk/1KZGV5stS+abF+KLuLvCp/vORffkMN/QAgej
 CgGdjlar+W80UtxhhwkL92LrnQFdBvQghK22fcjHBV+6XYS+URqAcjz+mx5WKKq30+ro
 GdrTQ6fBT7RUM10o5kXLYmkXADDfwTsHjhFx8/mH46thOJ80AkHctZ/t8K6/4NNyDKYY
 gk9m2YbK1VjZMFq2twKCxjMrJqZJ1i7APYAEEv25+Kh6Y9aL8jo6UOtoqaCZS4uV+QJC
 QHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2KjaafwE2g+wJHMSZXmaiaKXLE2m0dx98a6SWPRLseM=;
 b=Lpx6VI2QzXXotjAEGBdsCCVslEj/UhCjUOhC01GOYeeRMh7ksCI8123HTCjBdsJnnr
 WVCQEUUPzSsxoIJgH/x6x8TdMIHx5lvcGIdof6+hZAK5hy8D3McqMiZdfKkKltwI1evI
 da0Tkx0oDpsPVVpVAxlDGXnBhjXb67vK40Qb0WaQIdTlOAEGbZ4qEs46vYDrh0bu+QQ1
 TOKzIxWtJHDAXzcIWXUNtRYpRjOL9bBM0sf9JxpcP5+FgLQXgutNUcj5xE2yXbAquVfQ
 xwfTSwEtqnEcFC3BAVSzHsXGyanqaIGTwA3hYLtAvUx6UbJvNiO+aCc87/VW4u8wt5l/
 mz7g==
X-Gm-Message-State: APjAAAW6KBiog2NdVjCoDIwERpn02wA0CFurodv4Z9UQJgPQcem13xyF
 KCx3Y2qqhszlHG3Q7SNUQsg=
X-Google-Smtp-Source: APXvYqwNkY7ypwOk+TsF6h58m3fPoIAnGWMdlpqLD4CcSNyWYKt94jpOvrR5EgZbZ5e2eN9iL23/6A==
X-Received: by 2002:aa7:8096:: with SMTP id v22mr504527pff.240.1580317193500; 
 Wed, 29 Jan 2020 08:59:53 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id f8sm3223610pfn.2.2020.01.29.08.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:59:52 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Wed, 29 Jan 2020 22:28:24 +0530
Message-Id: <20200129165832.10574-12-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129165832.10574-1-pragat.pandya@gmail.com>
References: <20200129165832.10574-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 11/19] staging: exfat: Rename
	variable 'FreeClusters' to 'free_clusters'
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
Change all occurrences of identifier "FreeClusters" to "free_clusters"

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h       | 2 +-
 drivers/staging/exfat/exfat_super.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 3fd234a323fb..2c42519d5eba 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -245,7 +245,7 @@ struct vol_info_t {
 	u32      fat_type;
 	u32      cluster_size;
 	u32      num_clusters;
-	u32      FreeClusters;
+	u32      free_clusters;
 	u32      UsedClusters;
 };
 
diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index d8de39917bc0..335bf39aa171 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -498,7 +498,7 @@ static int ffsGetVolInfo(struct super_block *sb, struct vol_info_t *info)
 	info->cluster_size = p_fs->cluster_size;
 	info->num_clusters = p_fs->num_clusters - 2; /* clu 0 & 1 */
 	info->UsedClusters = p_fs->used_clusters;
-	info->FreeClusters = info->num_clusters - info->UsedClusters;
+	info->free_clusters = info->num_clusters - info->UsedClusters;
 
 	if (p_fs->dev_ejected)
 		err = -EIO;
@@ -3352,7 +3352,7 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 		info.cluster_size = p_fs->cluster_size;
 		info.num_clusters = p_fs->num_clusters - 2;
 		info.UsedClusters = p_fs->used_clusters;
-		info.FreeClusters = info.num_clusters - info.UsedClusters;
+		info.free_clusters = info.num_clusters - info.UsedClusters;
 
 		if (p_fs->dev_ejected)
 			pr_info("[EXFAT] statfs on device that is ejected\n");
@@ -3361,8 +3361,8 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 	buf->f_type = sb->s_magic;
 	buf->f_bsize = info.cluster_size;
 	buf->f_blocks = info.num_clusters;
-	buf->f_bfree = info.FreeClusters;
-	buf->f_bavail = info.FreeClusters;
+	buf->f_bfree = info.free_clusters;
+	buf->f_bavail = info.free_clusters;
 	buf->f_fsid.val[0] = (u32)id;
 	buf->f_fsid.val[1] = (u32)(id >> 32);
 	buf->f_namelen = 260;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
