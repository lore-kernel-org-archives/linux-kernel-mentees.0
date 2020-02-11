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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED17C3B187
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66CE4206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gV7+CjZh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66CE4206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 42CC28739E;
	Tue, 11 Feb 2020 12:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vCQBijdE-Gou; Tue, 11 Feb 2020 12:41:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E08E086EA3;
	Tue, 11 Feb 2020 12:41:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0142C1D88;
	Tue, 11 Feb 2020 12:41:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2F59C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DB1C4203F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAn3ojtlQyf8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 74A332000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:03 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id d5so1266802pjz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RBXBZBbISoYp3llZnf8LsJEjZIERQv0jl9ZJUoR46tU=;
 b=gV7+CjZhfp1zQkIOJuLtKKPRqALr+omMQSZcjxi5WAn87q2OuZinkCT95+DSwIfBlt
 lFTkS8Mfv9L4+IqBuRuQGPFArOOrc/MexDZBchQl6onZuuuXv/Wk2NWeXY1paf7Z/dM/
 Idso5vOSJ+GAOF/98IEJWzfwiqNWJze7kgsz7uTrgZO1njWIK8UwXvBB4t/e0KCLBxkP
 pVe638yRl8hwzz1OWHNN7cYJB5/8g4NHH8R6Zyj2wvm4idUwQq3vBskVqxSGjRqrB51H
 SuTlQnsJlmbV8dV1HAmKLkQeJBruaWAmvqhTenscNPt/uTqoVAyu34bHxkh0X+fFBCAz
 ePsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RBXBZBbISoYp3llZnf8LsJEjZIERQv0jl9ZJUoR46tU=;
 b=SAaHhCsL5xbc9qmX7IYkAsWPAgQmtv3LrSeehHTJB1TWKIbZv3pfuXngLRqVjlC6l6
 NU2k2/a36ms/N14B4lL+EbTkpFZU8S0kXB2iXgcsJhBJbM9ocf3O1s0v8fx4wl2N9cnn
 JwB8KIt+EI01Is/DWPM23QWeGsDKwWn9Lw/ke0o3l5fBktwMZPZKYOld16ZHxyMR6A1O
 kEb2bP33uHW+FAkSxZROpl2mhpcb5mGG7Ne0cYNFMOa+JMp4/bHKgHniE8kOQ1twfNNF
 fIOz8MFh/Yp5kgkSoGLwxY9+IlAhhXdkPsbFRJLPsX5pcg2ZuBsTbvWdwb7V/paJeD0V
 Ge5g==
X-Gm-Message-State: APjAAAXFUZBkW3YC8mfG7VEZJdspz00nHtvJlTKSjyVAjK9N7yCig6xK
 0TxAcKbOkYmePLtQtjY64zAtcRndH/s=
X-Google-Smtp-Source: APXvYqzGatr/xVY+vD0uibboZNO1fWmI1WU/x4CE3Kq9QYN7Wn3mi/8Vk4bP3pOCNon2RWGBHBWiaA==
X-Received: by 2002:a17:90a:3188:: with SMTP id
 j8mr3391492pjb.82.1581424863129; 
 Tue, 11 Feb 2020 04:41:03 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:41:02 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:49 +0530
Message-Id: <20200211123859.10429-9-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 08/18] staging: exfat: Rename
	function "ffsWriteFile" to "ffs_write_file"
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
Change all occurrences of function "ffsWriteFile" to "ffs_write_file" in
source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 3393c97bd9cb..d4e6f6a210e9 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -788,8 +788,8 @@ static int ffs_read_file(struct inode *inode, struct file_id_t *fid, void *buffe
 	return ret;
 }
 
-static int ffsWriteFile(struct inode *inode, struct file_id_t *fid,
-			void *buffer, u64 count, u64 *wcount)
+static int ffs_write_file(struct inode *inode, struct file_id_t *fid,
+			  void *buffer, u64 count, u64 *wcount)
 {
 	bool modified = false;
 	s32 offset, sec_offset, clu_offset;
@@ -2446,7 +2446,7 @@ static int exfat_symlink(struct inode *dir, struct dentry *dentry,
 		goto out;
 
 
-	err = ffsWriteFile(dir, &fid, (char *)target, len, &ret);
+	err = ffs_write_file(dir, &fid, (char *)target, len, &ret);
 
 	if (err) {
 		ffsRemoveFile(dir, &fid);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
