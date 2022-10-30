Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EECFA3742
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Oct 2022 07:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE87040438;
	Sun, 30 Oct 2022 07:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE87040438
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YHomcf24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJnvSCDxG3pQ; Sun, 30 Oct 2022 07:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9FF4C4032D;
	Sun, 30 Oct 2022 07:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF4C4032D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59D69C0033;
	Sun, 30 Oct 2022 07:03:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14DFAC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Oct 2022 07:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAC29607E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Oct 2022 07:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC29607E1
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YHomcf24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ei9r02XEbq2K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Oct 2022 07:03:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EE3605B5
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0EE3605B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Oct 2022 07:03:13 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id q71so8233477pgq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Oct 2022 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DyF/R/2WTrLneukk7kSdKd5EhCLxrsOWmVW7ecTbbfM=;
 b=YHomcf2498kp/tmkp72Pt2Iup6sbFL7DvV7NfXwhPbU6ZLv/+4FHQvJrfvw1OnVN74
 hS0HUxVXnb9p4cnMisRtzLiXm7MwNcW2wohkuUgHYw6lmkjcwhc6n8MOmAhQ3ukz8gHk
 5WdR9Hp4Yb+eG22ZhGGT2A9rDn4cCLywl1cmQgCTMzQVlgle2lgtBNWz7cbtzv1SRy3A
 lN5O6HJnVkX4/MaHOiz62yHDtveVvJtvjsGJ08UBgyDx+QbKocB5xiKulJnZO/7XNWJT
 FHpQKOglixHOlQsUBejX/uy/50/kRwU19TwwORbqXZc70aziIfoNVnMYtCdFvlVnL0Rh
 Ls6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DyF/R/2WTrLneukk7kSdKd5EhCLxrsOWmVW7ecTbbfM=;
 b=PJqYdVy3JPJ7tPubQeEX+e5PaOZCv4dhkEcfNJ0p2bbbeem5fRh6I94UUD36bDNj0P
 FNT7aIizrUeVfjMxw5AhXV3S7IA4Sqln0vNiyA6qld9kDZC5ay4yrVS6pkcP4D1KSygM
 uess9GTqejhHfXvtty/GIrXYjAzvfHvbpzBLndTVS94xUppvBBIu1HW9EZd36/NYgSE3
 PhguFcOuSQ7Ov6h05WP0X/yVjIE6kiaX24e7K3bcEEOVq6i1GMT0CP8yH9lGVF8A+8tY
 /MPE63jiuEEFl4KKSyhsSouyR5Bzn4j/9ZOS6dHMt1VGnUkndGWRfkMB/R6k+/TSI2xq
 TpyA==
X-Gm-Message-State: ACrzQf0hVVBFKjHwK0hhd9JJ/iO9U+YNK5DVE+yiaFBRFSM1zrmfGqSK
 Wp8wpYfvqBOJxGfvA2RF/DQ=
X-Google-Smtp-Source: AMsMyM7mtvGzeJGvFc/LlsYuZ38YYkGPpeb2EP7dJoxa51Wm848cYTSCAQcJ+BsuVUZojhzc9k+g3g==
X-Received: by 2002:a05:6a00:1582:b0:56d:4bc6:68c7 with SMTP id
 u2-20020a056a00158200b0056d4bc668c7mr1629218pfk.31.1667113393458; 
 Sun, 30 Oct 2022 00:03:13 -0700 (PDT)
Received: from localhost.localdomain ([106.201.172.104])
 by smtp.googlemail.com with ESMTPSA id
 p1-20020a170902e74100b0017a032d7ae4sm2234195plf.104.2022.10.30.00.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 00:03:13 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Subject: [PATCH] fs/ntfs3: Fix NULL dereference in ni_write_inode
Date: Sun, 30 Oct 2022 12:32:51 +0530
Message-Id: <20221030070251.614970-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Cc: syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev,
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

Syzbot reports a NULL dereference in ni_write_inode.
When creating a new inode, if allocation fails in mi_init function
(called in mi_format_new function), mi->mrec is set to NULL.
In the error path of this inode creation, mi->mrec is later
dereferenced in ni_write_inode.

Add a NULL check to prevent NULL dereference.

Link: https://syzkaller.appspot.com/bug?extid=f45957555ed4a808cc7a
Reported-and-tested-by: syzbot+f45957555ed4a808cc7a@syzkaller.appspotmail.com
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 fs/ntfs3/frecord.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 70a80f9412f7..e55bbd209ef8 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3243,6 +3243,9 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		return 0;
 	}
 
+	if (!ni->mi.mrec)
+		goto out;
+
 	if (is_rec_inuse(ni->mi.mrec) &&
 	    !(sbi->flags & NTFS_FLAGS_LOG_REPLAYING) && inode->i_nlink) {
 		bool modified = false;
-- 
2.37.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
