Return-Path: <SRS0=zWza=NP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF089C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Aug 2021 22:13:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82948611C8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Aug 2021 22:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82948611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 509C640171;
	Tue, 24 Aug 2021 22:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5vFAyvZByob8; Tue, 24 Aug 2021 22:13:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5A64040163;
	Tue, 24 Aug 2021 22:13:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31630C001A;
	Tue, 24 Aug 2021 22:13:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EC2BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Aug 2021 22:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EA2860639
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Aug 2021 22:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EwAWZU2OAaaK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Aug 2021 22:13:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3878605FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Aug 2021 22:13:51 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so3365662pjx.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Aug 2021 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WQKp3LS9lYFGar1Iiw2shyL2ZMJqOlF/S7BuVlydFVg=;
 b=gKYOMG+zJSBGA9hNa71uZExs93xWxojt3eI7X0J946kDiBjDOpl1Z0IzkVtza2cu4t
 oILr4ehdcKQyugx1mnODTrsJOzh0Qf3G5oSDXTHNgbn07l5J2HuWR19TR5dwm5EcFB/a
 /e+/3RxaJ5IxtLE0x5IhOZEmIZoGtVlyUcBeIkG+eEj9u+ONCDWAEgbCIWIAQUq0fzlb
 1gnL4ReAWL9t3YudvmuH9n3cl008r9e87wHa2cLAPy8/bPIL+IO9/p8M2mrfF68pPUs5
 uXb4pv1a03LLnkdtMMNQYkYqA2c4ORq2zi5fsZ9QIahgdhrhKJ6e60ztT252nn4J7mVr
 adlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WQKp3LS9lYFGar1Iiw2shyL2ZMJqOlF/S7BuVlydFVg=;
 b=c8LFKDBvtMnorChi1qCCBY4KnxlzTRgQPjhP3bF6smiUsaIwwrtjybpbNhZl94zBTi
 wUOmASHkop54pEmygGq+gzGwaMCFMzoBvuR4u9g2UFQFhpfc3cz4gPkCEoWLG2iqmVp0
 dVAYxR7TvIdsoRH8N+Sq7MyB79Q5CVBzVnjOYAaBxBs1GDI+6p+41inAfoC5YJ+Fwone
 bbmD7en7GhpCxfyP2xuqJoi5DcDhg/RO0lnqvRyczQbGHEgeUDlq51+KdS+bHUyrfZjP
 cY7yhkreK+yuONqBUcsxWTLuiFKa/TE0zAiaJoTa7ZW9jgOecTzcc5zvg/U91VDAU+b9
 MduQ==
X-Gm-Message-State: AOAM531ZrIG77WH9jgk0AIq4sG7d9oEUMcxI5BaoTDy1sSZlSCy4RN2d
 7lUDhW1pQzyBxqgUSXm8OGk=
X-Google-Smtp-Source: ABdhPJyTDqGvryNDUvbS6gzh+iQ0iLMIxw8AoY2DYhy8AdJ7LIa6+4GDMLoG3Jua3f/kT6+/dO58Nw==
X-Received: by 2002:a17:90a:a78b:: with SMTP id
 f11mr6834143pjq.91.1629843231208; 
 Tue, 24 Aug 2021 15:13:51 -0700 (PDT)
Received: from localhost.localdomain ([49.36.209.131])
 by smtp.googlemail.com with ESMTPSA id a10sm20003607pfn.48.2021.08.24.15.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 15:13:49 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [PATCH v5] Documentation: checkpatch: Add SYMBOLIC_PERMS message
Date: Wed, 25 Aug 2021 03:43:09 +0530
Message-Id: <20210824221309.4828-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMynfZjh6ZKTmePJVCh_FK4+VhZDYZMzXPT21HLMwWr2xA@mail.gmail.com>
References: <CAKXUXMynfZjh6ZKTmePJVCh_FK4+VhZDYZMzXPT21HLMwWr2xA@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Add a new message type SYMBOLIC_PERMS under the 'Permissions'
subsection. Octal permission bits are easier to read and understand
instead of their symbolic macro names.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea2d8..01105e9c89de 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -957,6 +957,17 @@ Permissions
     Permission bits should use 4 digit octal permissions (like 0700 or 0444).
     Avoid using any other base like decimal.
 
+  **SYMBOLIC_PERMS**
+    Permission bits in the octal form are more readable and easier to
+    understand than their symbolic counterparts because many command-line
+    tools use this notation only. Experienced kernel developers have been using
+    this traditional Unix permission bits for decades and so they find it
+    easier to understand the octal notation than the symbolic macros.
+    Also, it is harder to read S_IWUSR|S_IRUGO than 0644, which obscures the
+    developer's intent rather than clarifying it.
+
+    See: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
+
 
 Spacing and Brackets
 --------------------
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
