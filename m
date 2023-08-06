Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A135C04A94
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Aug 2023 12:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920A2817C3;
	Sun,  6 Aug 2023 12:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 920A2817C3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rlM0y2UF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4g8gErHYoEG; Sun,  6 Aug 2023 12:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9711C818BE;
	Sun,  6 Aug 2023 12:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9711C818BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A9EDC0072;
	Sun,  6 Aug 2023 12:24:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 955CAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 12:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F4A81C58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 12:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F4A81C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OWCzG_z0KQkL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 12:24:00 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E01817C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 12:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E01817C3
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-686b9920362so2383228b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Aug 2023 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691324640; x=1691929440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0OP3sZeafU4m0UvmTlOzrFMO40KUOq+JpcUSvznD7bw=;
 b=rlM0y2UFWX5yMGImUCu9Uzd/HOr6asy+NiIwL5GVuh7acTg7rjT8i3fEt7Dx0N9LcK
 ZLTDcXd6ew4TMQTZrJIUk2NlrHrkVpgv1LNjmzcVSyqmtKdDLcx4mCy5IAJKOHYmwVBs
 OUwqNmiw3kiDk9cA+0xhjBERUpIwv+lI3FGGaxUbxvIhdb2P70Zz44Zv02KQ6HTkZ3Pt
 YGqTmdNnfvijvXL9Xyy/n62BQA0rBJ5NeXd1zfvMMNYb+ZeQuuv1SfXFzZxVpNI9APtW
 cjA/QxqvcoEaFWJYFTOUXh+sHe39sKJZS9Bu5QoDxg0jp2XZ6gmey5B/ocJMi0T0itA+
 SDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691324640; x=1691929440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0OP3sZeafU4m0UvmTlOzrFMO40KUOq+JpcUSvznD7bw=;
 b=QErbot0NlnzjJa7WwvQhvD5iwD6ptKRytI51IKtc1g7PZaac61YQajZSTzSAwVAydu
 +2KFj9XQePe/iffJ/QFmZrpqoq6glFHMLwr6WyG76XiRI7u7c/AYD5Pk71jU8XvTFWlU
 0NEnnZbImwZ4oBKBVNk9FRh8z3GzeOAp+lJCzvtuHN+rgYk6dcYdfQbXX5+3v3mgJ+hC
 HhnHK3rKIBW2/Li7Tp84ECeixMjQH4kN2KIsC6w8C3YQ6gHzelBhipK8RvRgOEK5RHyC
 uGRgvF44meMyqiuiDETbEqQk+DU44GGf8C5OVTqm0y0Asj2XTJ375PZ5D0P1wBRLJF0F
 86GQ==
X-Gm-Message-State: AOJu0YyRHWsGsgl/YuTjmgWtR0FamlP2QCVNTLf80ELwIj0f25kHHfMH
 zwl0aI+W1BC1GppBJjxKBLs=
X-Google-Smtp-Source: AGHT+IFr1bZnirGJUFRnxXC9TXA6S12TQZZnJCcuPAvKxdcjo7aby1bQ6E/0zdEL/4qy7x9DgHi4ug==
X-Received: by 2002:a05:6a00:2495:b0:66c:9e97:aece with SMTP id
 c21-20020a056a00249500b0066c9e97aecemr5796227pfv.10.1691324640150; 
 Sun, 06 Aug 2023 05:24:00 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:3a2a:ee75:10eb:7534])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a63741a000000b0054f9936accesm3540570pgc.55.2023.08.06.05.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 05:23:59 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Subject: [PATCH v1] drivers: block: Updates return value check
Date: Sun,  6 Aug 2023 17:53:51 +0530
Message-Id: <20230806122351.157168-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, shuah@kernel.org,
 Atul Kumar Pant <atulpant.linux@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, nbd@other.debian.org
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

Updating the check of return value from debugfs_create_dir
to use IS_ERR.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 drivers/block/nbd.c     | 4 ++--
 drivers/block/pktcdvd.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9c35c958f2c8..65ecde3e2a5b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 		return -EIO;
 
 	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
-	if (!dir) {
+	if (IS_ERR(dir)) {
 		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
 			nbd_name(nbd));
 		return -EIO;
@@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
 	struct dentry *dbg_dir;
 
 	dbg_dir = debugfs_create_dir("nbd", NULL);
-	if (!dbg_dir)
+	if (IS_ERR(dbg_dir))
 		return -EIO;
 
 	nbd_dbg_dir = dbg_dir;
diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index d5d7884cedd4..69e5a100b3cf 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
 	if (!pkt_debugfs_root)
 		return;
 	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
-	if (!pd->dfs_d_root)
+	if (IS_ERR(pd->dfs_d_root))
 		return;
 
 	pd->dfs_f_info = debugfs_create_file("info", 0444,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
