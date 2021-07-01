Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C3BC11F67
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 03:08:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5936C6108C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 03:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5936C6108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25061607BA;
	Thu,  1 Jul 2021 03:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GodPh-o70MR7; Thu,  1 Jul 2021 03:08:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F1CC46072D;
	Thu,  1 Jul 2021 03:08:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF799C001F;
	Thu,  1 Jul 2021 03:08:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1EB5C001B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84A304028C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUEZI1O3eCxN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BEFB40012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:33 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id i6so4666012pfq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 20:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1cEkAa62CvZ4mqbyDK6dMhTfrSLLUVAknl5Ed3GLxXY=;
 b=RYJGK5U6C3aJ8oaLUZhKwUgDvk9IelyGC/2kx/3d7VY6LYQtL65EyuUK99POf9F/vl
 p1HkyjQ3une836usUBEmliDY8L2mUl8q14kPcD8m91PELFJoLOXtgfNu0he2YPpCch/M
 PWVd7gij6Oni9HBxCWOG1lQNu6AIO2lKGXJiYDvQxGKB7c0BiefqmJzRf79KYnqqdbml
 70DsLsKu69HTZm5CtZ1ayU3ZyDfB1UhuIwGnIZ0uxhwdOaz2H5E7uMPRiILrmF9ibTKu
 m83DyuqmPD7kgV/G7e7RQy7YDmtrHFZsFHyvB30Io+/tjUCaG7Mx1nVcbPsA+D7QNI3t
 IqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1cEkAa62CvZ4mqbyDK6dMhTfrSLLUVAknl5Ed3GLxXY=;
 b=LB6mqWqOWcf9HddyCPV5nZbNjqU7eX35WJ9nQSXwNWXQ5SyL9MbUxzMoPNz6tnQ6ob
 0Q1mdXen4qSpe+h6cahKh4sT+iJXFOgMvZoR0BRpiPKhFWsyLODy/Po6y2Y1yjvX4HoI
 k9blu/TE7bGVwHjlVuW7wM3J2tH/YxQ6mAmLps48Hhm59Abmnzob7lkwo5yzb9tg3P9Y
 kJ7vAFPk9qCNFwMezp8DoGV5Rpkb9GlzyZuM2glM/awtTX6+QxMTAb6KBU0hdFaJTZXP
 wLEFyjtNrCmzGfcPGVkUh6jU+EMe1F92/WEhpN8Sg95V0+/+VTgA0NSyTTH7pgr60HMD
 +XAw==
X-Gm-Message-State: AOAM532IWG7gsH7ztT1JGN69NCGkBcfKSfT5yGX76UMmHCLQk0E1hKpK
 Pydk4M5+U3vakyzCw4fH61Y=
X-Google-Smtp-Source: ABdhPJyI1llPLK7QHRLLgdJdjPQ/hHdaD3/x62XjJIqEH/0EKa8W24O0pcv54UoRHWBCR5LqCwylFw==
X-Received: by 2002:a05:6a00:1898:b029:310:9cd3:7bf8 with SMTP id
 x24-20020a056a001898b02903109cd37bf8mr3901910pfh.12.1625108913546; 
 Wed, 30 Jun 2021 20:08:33 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id g10sm4568568pjv.46.2021.06.30.20.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 20:08:33 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gustavoars@kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v2 1/3] hfs: add missing clean-up in hfs_fill_super
Date: Thu,  1 Jul 2021 11:07:54 +0800
Message-Id: <20210701030756.58760-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701030756.58760-1-desmondcheongzx@gmail.com>
References: <20210701030756.58760-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, slava@dubeyko.com,
 linux-fsdevel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Before exiting hfs_fill_super, the struct hfs_find_data used in
hfs_find_init should be passed to hfs_find_exit to be cleaned up, and
to release the lock held on the btree.

The call to hfs_find_exit is missing from an error path. We add it
back in by consolidating calls to hfs_find_exit for error paths.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 fs/hfs/super.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/hfs/super.c b/fs/hfs/super.c
index 44d07c9e3a7f..12d9bae39363 100644
--- a/fs/hfs/super.c
+++ b/fs/hfs/super.c
@@ -420,14 +420,12 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
 	if (!res) {
 		if (fd.entrylength > sizeof(rec) || fd.entrylength < 0) {
 			res =  -EIO;
-			goto bail;
+			goto bail_hfs_find;
 		}
 		hfs_bnode_read(fd.bnode, &rec, fd.entryoffset, fd.entrylength);
 	}
-	if (res) {
-		hfs_find_exit(&fd);
-		goto bail_no_root;
-	}
+	if (res)
+		goto bail_hfs_find;
 	res = -EINVAL;
 	root_inode = hfs_iget(sb, &fd.search_key->cat, &rec);
 	hfs_find_exit(&fd);
@@ -443,6 +441,8 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
 	/* everything's okay */
 	return 0;
 
+bail_hfs_find:
+	hfs_find_exit(&fd);
 bail_no_root:
 	pr_err("get root inode failed\n");
 bail:
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
