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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A1DC352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB30020842
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQXUq6D+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB30020842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D6C6C8750A;
	Tue, 11 Feb 2020 12:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSsdsJU6SyoV; Tue, 11 Feb 2020 12:40:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56B0F86EA3;
	Tue, 11 Feb 2020 12:40:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45D5AC1D88;
	Tue, 11 Feb 2020 12:40:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33522C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2F9582033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jb3L2VOge+Ww
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 957432000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:46 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id j17so1205595pjz.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2K+trdnQQOzkzm76zvow5EbebT3tW2J3I9Fu0OdgGmg=;
 b=jQXUq6D+kVuQyeMFk8YoWMTP4vd/bZuZKq1mAjF3G6AvDKTMCGLetBTLVtYEN02hrb
 iqjt/c9NsFHF7aPMmjxJt5zxaRKpq+zfEoy60kma/PY4W51cJe3ffSFUGZNmEeac7gCM
 5kgJ1yYmdo3aiq2r1hXjr//vBGJH8783QvfkAzU6uFdppqaITTO8stvZb9xfRwHNpU7B
 /6xwWpA61Hv7mdMxLrGUM3klom3hSmPimT1Zjiuy6OWp8cQeAdkcpZx2W9ebUbhqsWrt
 b1iAvh8gS7cxYaHPzF4pM/CGySTBbCmBgsD9K07FCoZTo+10ZPTc3GjGvbIQk8Y48Xat
 IuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2K+trdnQQOzkzm76zvow5EbebT3tW2J3I9Fu0OdgGmg=;
 b=YsuTKwVhjCjmywrUSKfZaEaWHCQyCJKgnvTAv8YZztqUn6gAAP4ok8tAAN+kN+Wniv
 q9tpd85IAZVJ+wiwBHRqkpRjAawTYwKvcwlUrVPfjBnq7cw0UKLDhze1JaArLsJgcecU
 WQ2t+E3XcGHZYilXOIE0Wy9z1XjnTRwP8ucZpbjWMXAKYN2M7CrMSp3TVbgj3CMG5y2z
 YRDbOHsxFfe4vDdyeQH3nU/l1DViBUEdBcSEwIJ84iN98IfHZ7xD0d7Y1emuZatISbpx
 Q9ZGb6Hzjz/9cczILMoTiVRrMcndR4n3Nv5VpdSRpuTcTjWvLWO/kLbCC5HLL/XneTNA
 mRNQ==
X-Gm-Message-State: APjAAAXXRR4JyeQEVIgN9s6ltCAj3I0D8qlE7dLGobALfCheGxk/4QV7
 ilf5QrKRyNrpy3Xxi+n+WvI=
X-Google-Smtp-Source: APXvYqw9/y449WJFgZlfmTbcletSIQEX1AfhZGjOyPgAVgPvFIVywtBEJEGT+6aC2rVeWlI2rgw5Mw==
X-Received: by 2002:a17:90a:6c26:: with SMTP id
 x35mr3282984pjj.84.1581424846226; 
 Tue, 11 Feb 2020 04:40:46 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:40:45 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:46 +0530
Message-Id: <20200211123859.10429-6-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/18] staging: exfat: Rename
	function "ffsCreateFile" to "ffs_create_file"
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
Change all occurrences of function "ffsCreateFile" to "ffs_create_file"
in source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 6082c6e75468..5080de9b289a 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -621,8 +621,8 @@ static int ffs_lookup_file(struct inode *inode, char *path, struct file_id_t *fi
 	return ret;
 }
 
-static int ffsCreateFile(struct inode *inode, char *path, u8 mode,
-			 struct file_id_t *fid)
+static int ffs_create_file(struct inode *inode, char *path, u8 mode,
+			   struct file_id_t *fid)
 {
 	struct chain_t dir;
 	struct uni_name_t uni_name;
@@ -2232,7 +2232,7 @@ static int exfat_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 
 	pr_debug("%s entered\n", __func__);
 
-	err = ffsCreateFile(dir, (u8 *)dentry->d_name.name, FM_REGULAR, &fid);
+	err = ffs_create_file(dir, (u8 *)dentry->d_name.name, FM_REGULAR, &fid);
 	if (err)
 		goto out;
 
@@ -2441,7 +2441,7 @@ static int exfat_symlink(struct inode *dir, struct dentry *dentry,
 
 	pr_debug("%s entered\n", __func__);
 
-	err = ffsCreateFile(dir, (u8 *)dentry->d_name.name, FM_SYMLINK, &fid);
+	err = ffs_create_file(dir, (u8 *)dentry->d_name.name, FM_SYMLINK, &fid);
 	if (err)
 		goto out;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
