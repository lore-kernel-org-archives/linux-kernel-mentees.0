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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E12C3B187
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CE92082F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gm6lza3t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CE92082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0F79784ED7;
	Tue, 11 Feb 2020 12:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoMLEPPrfAne; Tue, 11 Feb 2020 12:41:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACEE682441;
	Tue, 11 Feb 2020 12:41:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BD7EC1D88;
	Tue, 11 Feb 2020 12:41:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27676C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1503B84ED7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb5xFPjeHVPU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9991582441
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:31 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id r67so1277564pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JPEXRrqVk1GdXx8VX7m7B/Egm4j+wVyV7Wz6lHZEIqA=;
 b=Gm6lza3tFHot7xPi/MjRiouQwnLsnUKLXQNTDLkx14LfKRI3gMaVYQeLEY1z5PDYiI
 HIl9vg5kooSwAsfJZTKE/GSGZfskHerWpl7iFlkjnXd4VIsutWzA5o/F27m/vxYF3jMH
 mW/JVqre/IRZ9ktVoYQ0yysxu+vhgW9ul7dKpZy0wwt8+FsJWiCDejWWI4m2sMjy2707
 oa7X7N3lx+GMhL5b9O8U/fTkaRyXsFvkyyAE3pCZ8iadEti6h77EcZ1qGZ55L5sn6vcf
 lGQBi5l5bEMevV8ZCCrJgb+aDVqL2l4E+tfgbuM81ksCCAYwZq2cO5m3uqum26btFsuv
 b9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JPEXRrqVk1GdXx8VX7m7B/Egm4j+wVyV7Wz6lHZEIqA=;
 b=IT3UYR3ccKFaN9X9O7faCf/gMceq2tyrGjYCYn2+UWE3KjLlrolmgJu25BpYXqlPYZ
 tlaeND0JfrS3caqmo9xa1Hk/I9AtGt7JRFYrCfoM3BhMEGbKQ54Ab0AS5Yi/NoGh8e99
 mf3N/qpZlQyZQ5RS27LuprsjQfRSScTHK1WYYx1xRPt2JLKKI8VP9FVheVmuIoKiU+ZX
 uFtTwwOdavNJPmhgbMS9GKDo4UeO8K/Eil1iDweyeY+uTCWiT88XmYiSryd87jjlK7dC
 hfQfdrrHvp9h5a7UR6te+3cD8Si4aZAtE3GWs8t76Ft0Pzf/QU/sdzvvK+WPw5Qppmw9
 4Cnw==
X-Gm-Message-State: APjAAAUBTmHlPaXU00gcuXQCzaUXPsKUgHX8xj5e7+sQfxw09GXl7+i+
 lugBanYOSqZBsShdNDOwJHk=
X-Google-Smtp-Source: APXvYqxkVBM62/1fq/HV58DaT6xc2LUugIaqeNiuuJ/lOSHnGAfQ1FYU0rd5RnPwmSiPXZn33T6ueA==
X-Received: by 2002:a17:90a:21c7:: with SMTP id
 q65mr3542449pjc.8.1581424891284; 
 Tue, 11 Feb 2020 04:41:31 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:41:30 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:54 +0530
Message-Id: <20200211123859.10429-14-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 13/18] staging: exfat: Rename
	function "ffsReadStat" to "ffs_read_stat"
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
Change all occurrences of function "ffsReadStat" to "ffs_read_stat" in
source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 6fa005097a21..6d21c0161419 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1435,7 +1435,7 @@ static int ffsSetAttr(struct inode *inode, u32 attr)
 }
 #endif
 
-static int ffsReadStat(struct inode *inode, struct dir_entry_t *info)
+static int ffs_read_stat(struct inode *inode, struct dir_entry_t *info)
 {
 	s32 count;
 	int ret = 0;
@@ -3147,7 +3147,7 @@ static int exfat_fill_inode(struct inode *inode, struct file_id_t *fid)
 
 	memcpy(&(EXFAT_I(inode)->fid), fid, sizeof(struct file_id_t));
 
-	ffsReadStat(inode, &info);
+	ffs_read_stat(inode, &info);
 
 	EXFAT_I(inode)->i_pos = 0;
 	EXFAT_I(inode)->target = NULL;
@@ -3643,7 +3643,7 @@ static int exfat_read_root(struct inode *inode)
 
 	EXFAT_I(inode)->target = NULL;
 
-	ffsReadStat(inode, &info);
+	ffs_read_stat(inode, &info);
 
 	inode->i_uid = sbi->options.fs_uid;
 	inode->i_gid = sbi->options.fs_gid;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
