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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6E4C3B187
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D412082F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtZReSJp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D412082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39FA48739E;
	Tue, 11 Feb 2020 12:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gudCd25tpxU7; Tue, 11 Feb 2020 12:40:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA3388733F;
	Tue, 11 Feb 2020 12:40:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4FEDC1D88;
	Tue, 11 Feb 2020 12:40:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F997C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 498462033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVAVQX-D580C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 9D91C2000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:24 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m13so1208672pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9H40xTTNCEsSBuL3ApPQZ/FNZOtUwfhSHYivqLcrKf4=;
 b=KtZReSJpi3hWMVUhVmGnsinGiYUf0C3wrVLmHcj8YOnQN00ZBNeg7ueov/o9R5IvSL
 5/ok1SzC0S5syDcxJ+TV8EMfFeK2zaKTRhcbtTOFTSYRcB4am2GjP/b5929l3JhqpTiQ
 2QxrYKr07w8d3EREuK9+r9/a3anfq6R5fUOESSyXhb1+EkdDlQFpWEfxahRcGPIDs+0j
 hYw9leuV/VjttbV8rG3/GtVta76Z9FlCRhSa+at+u3YBpGYilCKWX2WyFQNrgEVSB5kV
 eaH7697f5/sKFqZ1f9z2VmQI1GKMHN2frUtieyDUgmHp6b/BO7r6F4CsjAumMY75U/Ip
 c9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9H40xTTNCEsSBuL3ApPQZ/FNZOtUwfhSHYivqLcrKf4=;
 b=jXpz6nvekfi0OmtN1x33M9ZlIm3bxzeZWBKkJ35ofVOvbRF2HcMirvCOtMlhuwNrcw
 W+lbRgDSFHIWF5BxYkgVKEtqFR4Pe3lFkWvb32bBgFK0a/KbWdj37bDih7zH66J+cOfP
 r6yIwyUt7LlXW71EZW0BCwftDw02harj6kJKTkMT9uLjkVo2Cxyu1Tv2SAbepDIOgSN2
 fmLs7FsFC6QFvdhsmxaVSQh/uoPfTeyphnRjdM/kbQynt4e/30luc75pNUapmX0YSF9L
 zyU7oi19zETdjp5exiPVzM4QFXqr1o2v20qixA+SXFD0Alhd78Pcy61sQdUzIKo2UUhA
 mZMA==
X-Gm-Message-State: APjAAAXFaHeYcdGotYcQB29RhG13Qd2RXkBqDRhQuZ1UmgkbGP8PCv9R
 sqh3aNZMYm8gdZnLlwf+MF0=
X-Google-Smtp-Source: APXvYqzkKkB8gpAgfQcowQA+Dx9hPXNvUSm0I0FKqxTW41hc3TNLAMLf938qjCxJbY6020GLeFrINQ==
X-Received: by 2002:a17:902:223:: with SMTP id
 32mr3044488plc.167.1581424824262; 
 Tue, 11 Feb 2020 04:40:24 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:40:23 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:42 +0530
Message-Id: <20200211123859.10429-2-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 01/18] staging: exfat: Rename
	function "ffsUmountVol" to "ffs_umount_vol"
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
Change all occurrences of function "ffsUmountVol" to "ffs_umount_vol"
in the source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index b81d2a87b82e..1e47bfcebed5 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -439,7 +439,7 @@ static int ffsMountVol(struct super_block *sb)
 	return ret;
 }
 
-static int ffsUmountVol(struct super_block *sb)
+static int ffs_umount_vol(struct super_block *sb)
 {
 	struct fs_info_t *p_fs = &(EXFAT_SB(sb)->fs_info);
 	int err = 0;
@@ -3301,7 +3301,7 @@ static void exfat_put_super(struct super_block *sb)
 	if (__is_sb_dirty(sb))
 		exfat_write_super(sb);
 
-	ffsUmountVol(sb);
+	ffs_umount_vol(sb);
 
 	sb->s_fs_info = NULL;
 	exfat_free_super(sbi);
@@ -3753,7 +3753,7 @@ static int exfat_fill_super(struct super_block *sb, void *data, int silent)
 	return 0;
 
 out_fail2:
-	ffsUmountVol(sb);
+	ffs_umount_vol(sb);
 out_fail:
 	if (root_inode)
 		iput(root_inode);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
