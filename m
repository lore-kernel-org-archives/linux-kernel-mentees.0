Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98642C10F19
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 12:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 095CC81764;
	Mon,  7 Aug 2023 12:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095CC81764
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HPbBKMQG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTEQoaPRtnLJ; Mon,  7 Aug 2023 12:18:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EE2E581551;
	Mon,  7 Aug 2023 12:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE2E581551
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D866BC0071;
	Mon,  7 Aug 2023 12:18:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59968C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 12:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 279F16103F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 12:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 279F16103F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HPbBKMQG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ls_Qxq5ItV1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 12:18:42 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93EA560FF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 12:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93EA560FF1
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686b91c2744so3140223b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 05:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691410722; x=1692015522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QDr2gyLexJ7RwQ2pb56tdD4TsGEQkiPtjXB7Nphmo3c=;
 b=HPbBKMQGbEN0sjjuejM5poJbsvoy01sTUqXR9Czy1lJkcI9FdTOAF1roYZjU8L8bWx
 nuZzjWOsGgwpBvFCkgxRyuNaLXvJDOe546/bU4+Am87WurQ3FqS0M/FGkJ9uXQG3B43T
 I8NKCR1xR0jWV6VII4z1P8io34Lg43GddtIHGlkocIx5udmHjyKbdtlDg7hFjC/eInWC
 BfYMDWxm9+ttVv8LAwe4MmUtwKZMpFpy1KTHOT8OOnp7UN4G2U0/k/z2puzwjt/nr/qS
 GQe4dGiEPN4EcPWEKSi00VaMA7mNJkrwCeUSWTXIC0kQR0ccleWSEf4M7j1ILSRZ1tGO
 vW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691410722; x=1692015522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QDr2gyLexJ7RwQ2pb56tdD4TsGEQkiPtjXB7Nphmo3c=;
 b=hJ7b0PhMEffMkRdoaNIM0+URzXcyDN6EC9H7cTS61buSRUSCrUY/NUl0pZTlZQmNLF
 0sNj9Alor7eEmuHLqvvP7+1XeDQmtiwF5bia19ywl53B2BIUoHWcQcjrRnr9Otp0SDQB
 MZmALVLn28i2NZPZTxP+Gj8ETNJHkOZjg9U0sMl8SP1gpF7syvgQccer/KqbTCrxzZye
 ssK0QlWVkaHxpskBN9Av8HOQqUT4ht1gmsaYsuUeu88fkcENabZ+1+k3l3ZHErsuGLy/
 S+v/1m1Mp3tAu2Pbcl7YsM4J3GYkJDzqh9g+HZ61VxMYfW2Xi3FPcg8Cx/FS34piAMU2
 Hzkg==
X-Gm-Message-State: AOJu0YzYANMEpwzQ0QDXzGJGOm8FDPqiXoRTQolrZZgZt7WhbQ5X8Bn9
 wCfSslCi9Kf1LVUtySwL4fY=
X-Google-Smtp-Source: AGHT+IEE+iXc72yHVCPHrWgWCKsvBmuqdwtO2FailrTLgk6SocY5C4KjjV3MuPbcf9YUCw5KP9DAFw==
X-Received: by 2002:a17:90a:16d6:b0:268:7ce2:ad20 with SMTP id
 y22-20020a17090a16d600b002687ce2ad20mr7732071pje.21.1691410721874; 
 Mon, 07 Aug 2023 05:18:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:dd73:b66e:8c4d:2c58])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a17090a010200b002636dfcc6f5sm6389667pjb.3.2023.08.07.05.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 05:18:41 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, boqun.feng@gmail.com
Subject: [PATCH v2] kernel: locking: Updates return value check
Date: Mon,  7 Aug 2023 17:48:34 +0530
Message-Id: <20230807121834.7438-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: shuah@kernel.org, Atul Kumar Pant <atulpant.linux@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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
Acked-by: Waiman Long <longman@redhat.com>
---

changes since v1:
    Adding linux-kernel@vger.kernel.org mailing list and retaining
    Acked-by tag from Waiman Long

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
