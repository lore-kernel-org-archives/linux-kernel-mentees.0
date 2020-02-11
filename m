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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F44EC352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529DB206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMF2A0nX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529DB206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5CAD52033E;
	Tue, 11 Feb 2020 12:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6ax53h4cGYU; Tue, 11 Feb 2020 12:41:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D8AB22000D;
	Tue, 11 Feb 2020 12:41:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C826DC1D88;
	Tue, 11 Feb 2020 12:41:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9456C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E4B9F852DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMOKgXoO7gpG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7123984537
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:42 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j9so5446324pfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6ta/xN7ibt+T77in/0spMP8Vv8W8F1AAImXcnffdDmE=;
 b=dMF2A0nXHaqBW163aXh9SYI+GkTPe0xRrsia2BvafyJ1fcpcf0+R+gcP2bRZahm8Vc
 Jxo4ZWHidfa6woObm5roDYiaV7iHQcUg4AwHkyoiJ6LTClKD1CqGMP/Satu2Bp/AC7Vd
 mekoYYU/3NDfHOJ85K6XYbsPyO+0PZV1rim3STZA6yTn7J24nIxJSpgc4sSHDz+IDH+9
 y875yzt0fhtapnXJViut3oTM+xKksBj1kwnf3oYVjmHP84Us2cH1BrmU4tzDIqxQArRd
 5dR3hH+Dy/ERT+d3KRlM5xUNHE7u2iUBLo7IMgRlx2lONwBjvqd41sCirk7e8AjIH114
 MmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6ta/xN7ibt+T77in/0spMP8Vv8W8F1AAImXcnffdDmE=;
 b=EEhYXWJbfCgTuGhYDtGLoB2hnmchNtDZIKwUeD8ftZyp4vF8aPHeVZBHBRQ3FhLE43
 XENuYgjJixqWgelDyTiPOBhUZWh69bjQTaqd8EJMwY9RIU0Wxgz+m3N1I8aWrSKVEnsi
 S5fpbU8aD5R95OwPC9aE17GlGsqVSjB7tS2WIlRc7M9c2k/DKri0BSYM9V8FvJ/P8CjV
 MK/EojpSIgjjaDcIQIV7EOu3M8iDGbl4NWcmmpI99TWzJSEPgSxpFjG0hwA5cseBUuV6
 02vN+ZYduRx9EJZrC2Yiwn1gv+Nd2F7s/pZgd1M/ujdOlS2dgaqw4x9N6QqhhX7GSSxi
 06iw==
X-Gm-Message-State: APjAAAU8Rbjrw+CClWBBGlNfdZmFMZsak1Lr/5mLTj+G/rNaau1m1Xcu
 zFrzTpFLDY14oO1s/wpsZIw=
X-Google-Smtp-Source: APXvYqwtWIs1C5aTU+Az8XdsdfcbYa/Wellc0burgYlWjDs7rM4/stxvOvSOVZ/+y328JTtqOj9yhw==
X-Received: by 2002:a63:7457:: with SMTP id e23mr6877579pgn.386.1581424902127; 
 Tue, 11 Feb 2020 04:41:42 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:41:41 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:56 +0530
Message-Id: <20200211123859.10429-16-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 15/18] staging: exfat: Rename
	function "ffsMapCluster" to "ffs_map_cluster"
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
Change all occurrences of function "ffsMapCluster" to "ffs_map_cluster"
in source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 5fb084941c3b..87a7bcba4921 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1638,7 +1638,7 @@ static int ffs_write_stat(struct inode *inode, struct dir_entry_t *info)
 	return ret;
 }
 
-static int ffsMapCluster(struct inode *inode, s32 clu_offset, u32 *clu)
+static int ffs_map_cluster(struct inode *inode, s32 clu_offset, u32 *clu)
 {
 	s32 num_clusters, num_alloced;
 	bool modified = false;
@@ -2954,7 +2954,7 @@ static int exfat_bmap(struct inode *inode, sector_t sector, sector_t *phys,
 
 	EXFAT_I(inode)->fid.size = i_size_read(inode);
 
-	err = ffsMapCluster(inode, clu_offset, &cluster);
+	err = ffs_map_cluster(inode, clu_offset, &cluster);
 
 	if (!err && (cluster != CLUSTER_32(~0))) {
 		*phys = START_SECTOR(cluster) + sec_offset;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
