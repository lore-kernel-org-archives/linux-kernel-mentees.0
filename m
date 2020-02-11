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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64ECC352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6502082F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBIPPwds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6502082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8DD8A8739E;
	Tue, 11 Feb 2020 12:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wX-TBd9pcsbB; Tue, 11 Feb 2020 12:40:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D83D086EA3;
	Tue, 11 Feb 2020 12:40:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C85EFC1D88;
	Tue, 11 Feb 2020 12:40:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABEEAC07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A92E7845C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qhIO7MVlFXR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4BDA684537
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:30 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gv17so1208460pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SOR+aKlva87N2LUyxGO5pVucYWF1MeR0uphILcdbOm8=;
 b=GBIPPwdsCRN3EQUw+tg1pYinlqmFaQ2LCe+yWdIr9kLe8wyTCahjNIwYJDDbkSQdYx
 xoQofGXwIiEWhQ6pAMgYpev0EtK86hOw9lKrJe3o/aVZjVeZIiTuK+egEegvivvrK6iq
 bPBKoc1e/tyQDsWGH7R/RF0g3p5fJKAXW57719D2/b/ZOWSsE3PvNMohO1aTdG85GGcq
 8cXAN6WD4dgmJMmUWDEilGwjjf1Ud2kzBJB50TblDPyaOnuTs9GkbwIjvgiJiPxK36iP
 tnwoc+0GHn4e65yo/9jHX2eGSeg/esPzl8v4Gk1SiXUSyUKel47MUOJdljU/muN/K50l
 +lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SOR+aKlva87N2LUyxGO5pVucYWF1MeR0uphILcdbOm8=;
 b=G9BlVRcbpBbOVImmiz0DIdEtfnVxlNt7kRpRl2rrW794z99AOG7NnqS7lkV9G2WPXr
 OOVlPdpyIAxXguC9aKQi5ddPGevUbkUEEiFgFHLlwBT8uRRW9G8LTIT/9RlXjBvxoS8Y
 lbubS3z3wH3VwCqw18twem2r+Jvn9hliU8SKOd0PcLMz/Ec4uU833LTq6LkKILrq6KiZ
 99RSlEgJY4Lp+FuIdMiF3mER5d9YON9dwJATGgZ3fOZzzN1JKm33vSHgUQZJSIAEFv33
 ZDyd0H0BnHSbGGHY0zRkOlQQofJwdyC3We+4FXQxhQFX9U0rCGmyMMrmHUrYqws90dp0
 nNkQ==
X-Gm-Message-State: APjAAAUhDkbnl3FzM0WNvYabKlIvPe3BHJvgHuhQ/qBQgLrKXHo/Vfw/
 VHaGQ/RBreAzJuhvqejZLVg=
X-Google-Smtp-Source: APXvYqweTIzwmY3XCYmc6xk2SBo4/l4bIJllHhaBfOQNJbtfyOCIyKaohxgUpKHYvwZiddGNpoFnvw==
X-Received: by 2002:a17:90a:d986:: with SMTP id
 d6mr3487035pjv.78.1581424829845; 
 Tue, 11 Feb 2020 04:40:29 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:40:29 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:43 +0530
Message-Id: <20200211123859.10429-3-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/18] staging: exfat: Rename
	function "ffsGetVolInfo" to "ffs_get_vol_info"
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
Change all occurrences of function "ffsGetVolInfo" to "ffs_get_vol_info"
in the source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 1e47bfcebed5..06d8e3d60e9e 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -479,7 +479,7 @@ static int ffs_umount_vol(struct super_block *sb)
 	return err;
 }
 
-static int ffsGetVolInfo(struct super_block *sb, struct vol_info_t *info)
+static int ffs_get_vol_info(struct super_block *sb, struct vol_info_t *info)
 {
 	int err = 0;
 	struct fs_info_t *p_fs = &(EXFAT_SB(sb)->fs_info);
@@ -3341,7 +3341,7 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 	struct vol_info_t info;
 
 	if (p_fs->used_clusters == UINT_MAX) {
-		if (ffsGetVolInfo(sb, &info) == -EIO)
+		if (ffs_get_vol_info(sb, &info) == -EIO)
 			return -EIO;
 
 	} else {
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
