Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E924EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Jul 2023 18:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 019E340606;
	Sun, 16 Jul 2023 18:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 019E340606
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=caiZEoW0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOb9aVTXaRkz; Sun, 16 Jul 2023 18:07:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 05A224013C;
	Sun, 16 Jul 2023 18:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05A224013C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C75A1C0072;
	Sun, 16 Jul 2023 18:07:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85CA9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59223818AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59223818AC
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=caiZEoW0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CagXdD02ZRXl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:07:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648548188D
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 648548188D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:07:07 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b9c5e07c1bso29836635ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689530827; x=1692122827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2VN5BCe7p3k/rs5+lmswJ5ZOTa7xgkaiKZ5S+/FFp8A=;
 b=caiZEoW0EPHIIxNMdUUNKMhZhVpZbEBO4OQAFtb8vcsiEpiMx7xV/qWiMCVglDi2Ji
 BOZvUjPgZg64xUoLdJEAWFZQp1I7Uka7652WTbWxHKXikXUqEkHBuQeydmF2k/IKP0Fj
 Uhr3R/ZVfgi8SCGlQRPl7/kCSPR+VvAeNOBuQsfHyxbpXAKFLlyJ1vRWOxmXabR77uUc
 L/i5PT05Hw7ehPOjQTZrulbiUEbKy7tsRim1WovLn8v2xvla5GfK/LMgcXCOeP8F3y6G
 vplirf82Q3JsroE14agGPcnG/M9PmpurdpqphaK5OuYTkELCyBqGUvy0tb8oTlZvcGhZ
 +QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689530827; x=1692122827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2VN5BCe7p3k/rs5+lmswJ5ZOTa7xgkaiKZ5S+/FFp8A=;
 b=MMWMQKV42vmTabdwfpv5GoylrSTjKzgn2yPlDA1HSyB/H40hFO1mAvVzNj8uKTvBB6
 CtYMMoKz5qObvuu8Kt3RJKVt6HrUeHR9P1aKz9EFvF3oNWQ2pXpHjwZ65y/uEAgltOZe
 npg9uSPJq4AneqEQ9QNpL03Y0OZ4k1QNhbwggGYoU+SLM8XI7e3J2csI96sMBbj+7w2X
 iiV3sygQOwjwv4LOjVs19xnu2yDHFGSciaBsmUKYdTdhZM4BU+/SVaeelrBxcMWpEaXU
 j6kPVMRnNKzlkyO2LoLzT88g9cNp8EM3+E5IN+PON6iA31mO+rTR1AxUW6lFDOtFDCP+
 pX7Q==
X-Gm-Message-State: ABy/qLbKdv2+wN0BGdCafOUciej86mFVrb+OcW07xHtxSpbNOg76GQaZ
 p2VWO4hUFQbqoS5NpQz3c0Q=
X-Google-Smtp-Source: APBJJlE8z7XDsmxrRKCo902XDhR2VOfV92jlIj//5GuW318hNTRIXOhzyLMxvU4AUh0ddNOFFes/Kg==
X-Received: by 2002:a17:902:ab03:b0:1b7:ecbb:aa06 with SMTP id
 ik3-20020a170902ab0300b001b7ecbbaa06mr11358326plb.55.1689530826624; 
 Sun, 16 Jul 2023 11:07:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58ea:65e4:f662:2536:5ba8])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a1709026b0b00b001b392bf9192sm11231480plk.145.2023.07.16.11.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jul 2023 11:07:06 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, boqun.feng@gmail.com
Subject: [PATCH v1] kernel: locking: Updates return value check
Date: Sun, 16 Jul 2023 23:36:57 +0530
Message-Id: <20230716180657.44056-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: shuah@kernel.org, Atul Kumar Pant <atulpant.linux@gmail.com>,
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

Updating the check of return value from debugfs_create_file
and debugfs_create_dir to use IS_ERR.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 kernel/locking/lock_events.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/locking/lock_events.c b/kernel/locking/lock_events.c
index fa2c2f951c6b..e68d82099558 100644
--- a/kernel/locking/lock_events.c
+++ b/kernel/locking/lock_events.c
@@ -146,7 +146,7 @@ static int __init init_lockevent_counts(void)
 	struct dentry *d_counts = debugfs_create_dir(LOCK_EVENTS_DIR, NULL);
 	int i;
 
-	if (!d_counts)
+	if (IS_ERR(d_counts))
 		goto out;
 
 	/*
@@ -159,14 +159,14 @@ static int __init init_lockevent_counts(void)
 	for (i = 0; i < lockevent_num; i++) {
 		if (skip_lockevent(lockevent_names[i]))
 			continue;
-		if (!debugfs_create_file(lockevent_names[i], 0400, d_counts,
-					 (void *)(long)i, &fops_lockevent))
+		if (IS_ERR(debugfs_create_file(lockevent_names[i], 0400, d_counts,
+					 (void *)(long)i, &fops_lockevent)))
 			goto fail_undo;
 	}
 
-	if (!debugfs_create_file(lockevent_names[LOCKEVENT_reset_cnts], 0200,
+	if (IS_ERR(debugfs_create_file(lockevent_names[LOCKEVENT_reset_cnts], 0200,
 				 d_counts, (void *)(long)LOCKEVENT_reset_cnts,
-				 &fops_lockevent))
+				 &fops_lockevent)))
 		goto fail_undo;
 
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
