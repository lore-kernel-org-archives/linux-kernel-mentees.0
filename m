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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE53AC3B187
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73042082F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkUYkuDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73042082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B83D84ED7;
	Tue, 11 Feb 2020 12:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evq3S4YMM81W; Tue, 11 Feb 2020 12:41:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2840582EE5;
	Tue, 11 Feb 2020 12:41:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14CCAC1D88;
	Tue, 11 Feb 2020 12:41:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D24A6C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BF204845C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mY7nB-g_jER
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6049484537
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 6so5693386pgk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YnXotBwOZaJ8idgdzUqyvmMqWBBs0bfAHQ43fZW4Xj4=;
 b=XkUYkuDbtptOrXHwl9Ijv80vF/Q3qZ8y+Wfw3Bffj7bzvvHbdAX8gNl0z6d1w9YPbQ
 Uhqr0DQlES8fWSxQesJX+xWI1LClnbNHKcHIYvFU1AgM1NxyLZKBY4ClkL6+OLGUS2Kp
 YZ0WwQd2VrTGyah7FVT16zgf0l5WVoXCBARZ/HqmgG9SBQbZkkZvjffd08a7kBpZCCS5
 HTn5sBRrJBdPcnMfN3kZ/q/4hbFJaQ8xIKh6l1UcrC0B7istiKexg3q63c7f7eHfy02e
 Ywh+8samAAxCRmhZiWwFVFEzpfqXvVHNzICcgnltT/Ve2d0E5wu+TGZY5Dx9JnyvrLTE
 jP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YnXotBwOZaJ8idgdzUqyvmMqWBBs0bfAHQ43fZW4Xj4=;
 b=HWs7ZLtn2WsWRrQ3Ks8gbPvVFUflHiI2Cy5nMxXca4zanZJCIpe/3KkDwWqW2h1imr
 sK4JU1gBdLoEJZ8Jhgavt1uFkvxRSmrAbsvon8xWRdQLt1jNZrPrg/StvGt4KKQ7KCg3
 C3KtrMyQi9gtmlrw9PV624eFqSjsVFUE8GKVwAIa01AS3+Jeb9Y0IBcYEluN7emfClTH
 75kDgpMEbja5oRnYcTmCh0R2aJ/ciV4SZgNvnWulTHUElbAIfkwsu521Pt+ky8gclOPL
 WL3zZPqgmVswHGXW+GWS2L8A/+YgOLqKnwzZSg7c4iHjnjYEtRyclTUKGQINLcp+Cde5
 jzmA==
X-Gm-Message-State: APjAAAUtxvoqvUJwV9HbTBHdm8ryWBCsivFjJdddQT0OFFMKo/OStRi0
 cRDx4S72nWXlTypyf6QUH/A=
X-Google-Smtp-Source: APXvYqyYPE3ywUExVAnAvw8ZK3U1Cvtmqs0951I97W3Yol8d2oLNTpV8scMkF7Bq7s/gidb0+WwjkA==
X-Received: by 2002:aa7:9aa7:: with SMTP id x7mr2984079pfi.78.1581424873956;
 Tue, 11 Feb 2020 04:41:13 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:41:13 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:51 +0530
Message-Id: <20200211123859.10429-11-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/18] staging: exfat: Rename
	function "ffsMoveFile" to "ffs_move_file"
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
Change all occurrences of function "ffsMoveFile" to "ffs_move_file" in
source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 5bbd31e6ba3c..51893f8c3e92 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1167,8 +1167,8 @@ static void update_parent_info(struct file_id_t *fid,
 	}
 }
 
-static int ffsMoveFile(struct inode *old_parent_inode, struct file_id_t *fid,
-		       struct inode *new_parent_inode, struct dentry *new_dentry)
+static int ffs_move_file(struct inode *old_parent_inode, struct file_id_t *fid,
+			 struct inode *new_parent_inode, struct dentry *new_dentry)
 {
 	s32 ret;
 	s32 dentry;
@@ -2605,8 +2605,8 @@ static int exfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	EXFAT_I(old_inode)->fid.size = i_size_read(old_inode);
 
-	err = ffsMoveFile(old_dir, &(EXFAT_I(old_inode)->fid), new_dir,
-			  new_dentry);
+	err = ffs_move_file(old_dir, &(EXFAT_I(old_inode)->fid), new_dir,
+			    new_dentry);
 	if (err)
 		goto out;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
