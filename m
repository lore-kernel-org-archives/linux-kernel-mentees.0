Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B7EC47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:10:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BEAE20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhPm2u4f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BEAE20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E6518899E;
	Mon, 11 May 2020 10:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOpKhXKplj8T; Mon, 11 May 2020 10:10:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3B13888FC;
	Mon, 11 May 2020 10:10:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A30E8C0176;
	Mon, 11 May 2020 10:10:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD0B5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ACA5185C05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXDrW0gRgnpt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D8C2386925
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:47 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id h12so7260298pjz.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ji5NtgAzooxdhdMeMZ3zeDyqNKeDtDsiR9XjjkqT74Q=;
 b=GhPm2u4fPdNZc93NpaePX9P26r6A2DjhsJ6gsZAPS0deT+8LdaBtHoqI4sr2QOw0y3
 WyCBEC6SfyBUEsaMP+bWWaAyIGs13xBsu0FI3nYRgH1X50026nTAOnsbubLlmkycsIMO
 Wo5ZocZVooc6oTa4Sw7psH5Lx9ZCxIv/itcRI7CUhpZT5FEo1QrxlHZWXCjF2nTIgzrq
 JfhJ8ejaxKFGiVP9k3k32VZCOpRUuWQ8j49Vixv3eTMC/I9Y8VoAd5HtESy3DxgdUCgP
 +B7BHyqBF0rq2U35TSOd1CQ1aAqNznD1vMa5A1FaK+lB5TsGkAK6T/15diWqbqtEZMFD
 6A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ji5NtgAzooxdhdMeMZ3zeDyqNKeDtDsiR9XjjkqT74Q=;
 b=tAzp8WBtKoA3syStV3rzUtf37sj7EB4nh1wYwU3UNHE8pycPDWAvRukZ1q/rGlNQE0
 Ufj4xza6xP1qlttopFPat36wfxFVzR6rhO22ND53j5Crn8NDO5fsopeOaupoHyBugIJR
 ZnyhLUEohpku1/++VI8rMWyA1mK7t2Snrhb6O8sdliXXraer4QmwDkXwoor1e1E4x4D+
 7/ZO7OLFy4fCt5BBPNLtE7zf9H2TfSMkvwTMJO5N12sUxUb7WVH+6kVBd+znHYv5hE6/
 pNlJR+yFWvpfIKayYGVZ3AyzUOhs13wbKIgY5vYZPvDXGfpqf00HNcEBAJIg3a59tkq1
 wP2A==
X-Gm-Message-State: AGi0PuaaH6+9ERhTyR8NIm7ptEWH5W9VzegcrCFZntveOP044J7Y6Kco
 hYmelKD7APuUkwJ1rNJVvAc=
X-Google-Smtp-Source: APiQypIa0gA2Qm+qem8vcDZvuuccVeXB2/QeNhCw43E0XH8XIHrcUwX6Yn/f7qYvsQ+xTmRX/gm7Og==
X-Received: by 2002:a17:902:d30a:: with SMTP id
 b10mr14386897plc.3.1589191786535; 
 Mon, 11 May 2020 03:09:46 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:46 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:15 +0530
Message-Id: <20200511100715.19819-33-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 32/32] tests: Add test case to
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
