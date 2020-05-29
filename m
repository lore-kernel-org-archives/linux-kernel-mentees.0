Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4C5C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB2620814
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3orgzLh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EB2620814
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2D9F3220A2;
	Fri, 29 May 2020 12:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNXOSIRYs03g; Fri, 29 May 2020 12:10:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9A908220B2;
	Fri, 29 May 2020 12:10:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A58EC07FF;
	Fri, 29 May 2020 12:10:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7EFEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B7ADB88495
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9OA8IrAZyio
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 59A9F8848C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:36 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 185so1398937pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ji5NtgAzooxdhdMeMZ3zeDyqNKeDtDsiR9XjjkqT74Q=;
 b=T3orgzLhrBsQr18/NgTgO8qw1cJXruGXUjlPnR3bsJI69r4csWtyQZR8292HrlmOpA
 1ErLVJWqBWKlWaE4j7UTClf2eu6wJgQ5eH4Isemj8o3DET9yCEhl5YDNaIJSA5hdIH/S
 DKbOzVdJj3jRqa4AVeIZLWacy1zZv9GOYm0jPyP5e8v2zpXwaQ2Pobx6YlT/Ys+7oPf7
 hDaZpZDHMx6r09IYG2EtLUcOgDD4TYodUtdq0NPTRMZt+A0dWvw19zNgOV0mfFbM4WyO
 wX8qYD0TkGZ+QzODLjouwBcW3YTVzR1W53yKq16K2481YBFejJ4V49dWuwq2FsckrIX9
 wuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ji5NtgAzooxdhdMeMZ3zeDyqNKeDtDsiR9XjjkqT74Q=;
 b=HftGR4kF4lIL2C/CBUY/KHzCtcrHQxySlmedZb/oadfzq5htB4UO0c3Ol96gCH2LRd
 UX9TN5DJ2064KUgYly3U2Fd7c2FsC1vDfDCYpXLhpll0Bhn6P/ktcrfQF7Mrmom6hHFe
 /GA9tNtKTTDnC1WVVllkMJxzkmfXQAyHbxk2tDvaKP2A4A6JYQFvUACh2Eqkw7x/rVGr
 0SvO/qqr7puij/vPqNKzXVdFqmK1HI11/PDNgSk7cz0KV4Va0FmpRI9GoXXoyQMUxHeC
 oG9qcH/WsXtsGasuHsGEeJHwEscL6EGFuq97gA7qdujaDEvydK6mgpUvo4e3E+85afLI
 pWjQ==
X-Gm-Message-State: AOAM532OrTWBQ1pWOaQyXWQmsaXKbVT3QQAFKd0g1r0PGlBCJujpifyY
 TAxAoC6816pyEapGks9K/Ak=
X-Google-Smtp-Source: ABdhPJxKFE+w4BBziy90FFuDaUvyNolgko7x+lcEHfp9HSA7z/VnyO207GxHKFpsSYrvhKx3+1P48w==
X-Received: by 2002:aa7:9466:: with SMTP id t6mr8562459pfq.299.1590754235888; 
 Fri, 29 May 2020 05:10:35 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:10:35 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:37:02 +0530
Message-Id: <20200529120703.31145-33-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 32/32] tests: Add test case to
	detect cast attributes
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

Add a test case to detect a cast attribute. The following cases are
covered for when a attribute is:

- Before the cast type.
- After the cast type.
- After the cast type and before the *.
- After the cast type and *.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/detect_cast_attr.c     | 10 ++++++++++
 tests/detect_cast_attr.cocci | 11 +++++++++++
 tests/detect_cast_attr.res   | 10 ++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 tests/detect_cast_attr.c
 create mode 100644 tests/detect_cast_attr.cocci
 create mode 100644 tests/detect_cast_attr.res

diff --git a/tests/detect_cast_attr.c b/tests/detect_cast_attr.c
new file mode 100644
index 00000000..2458ef05
--- /dev/null
+++ b/tests/detect_cast_attr.c
@@ -0,0 +1,10 @@
+#define __cast_attr MACROANNOTATION
+
+int func()
+{
+	char *a = (int __cast_attr) x;
+	char *a = (__cast_attr int) x;
+	char *a = (int __cast_attr *) x;
+	char *a = (int *__cast_attr) x;
+	char *a = (int) x;
+}
diff --git a/tests/detect_cast_attr.cocci b/tests/detect_cast_attr.cocci
new file mode 100644
index 00000000..d626048f
--- /dev/null
+++ b/tests/detect_cast_attr.cocci
@@ -0,0 +1,11 @@
+@r0@
+type T;
+attribute name __cast_attr;
+identifier x;
+@@
+
+  (
+-	T
++	char *
+ 	__cast_attr
+  ) x
diff --git a/tests/detect_cast_attr.res b/tests/detect_cast_attr.res
new file mode 100644
index 00000000..2a273316
--- /dev/null
+++ b/tests/detect_cast_attr.res
@@ -0,0 +1,10 @@
+#define __cast_attr MACROANNOTATION
+
+int func()
+{
+	char *a = (char *__cast_attr) x;
+	char *a = (__cast_attr char *) x;
+	char *a = (char *__cast_attr) x;
+	char *a = (char *__cast_attr) x;
+	char *a = (int) x;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
