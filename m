Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648E7C7C8A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC3A20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLfyf8BR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC3A20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0DDA985F4B;
	Mon, 27 Apr 2020 12:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIaRwhJP2bic; Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3FEB985F57;
	Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 300D3C1D88;
	Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E666C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F21A285F29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-Pve1hWV7rQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0041E85F57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id k18so6926505pll.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oiiyaaxVdFQ8E5eoYpxjpSkj51vxoyU7jiIbcmsszCg=;
 b=dLfyf8BRZ+gYE3wuMm3H3v31H4whuRrbXMXyADB9yS3pUSWt63vjZzV0SRCFFiYQBV
 TUEcCfUqy5bUzJcGkSbTtV4LizMAYO1uitOETlHrkfbbW7vqmKxXmyDvFM3VucskcZ+m
 B6N95+xyNSM2dkGv9d38NjOQ48XLs2zm8SZbPMOTf2mS4jkySKYxK7K0B1gzajGgoi7h
 FHPXzQZoEpqioa969J5F0AVJLOgsXDxpN1VSqK/CprevYBaDvcPxP6VUbraTzpimriZ0
 Y8+1XstQnenvV1jyiCwzgZxrdhe80A7IwlUSgalHnDVdJe+o0I4wez8EWa+Z8oeCHxg4
 K5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oiiyaaxVdFQ8E5eoYpxjpSkj51vxoyU7jiIbcmsszCg=;
 b=IHjc+JkzTzuiluYIdjmerlMgVzKk03gllW0Ev62v5kHLxITmTDJECbre6iGXHuh6KN
 +jfZyPrRbjBvOKKJIJYLy3BNA19p6LtNaNMy1nv0f37Gh83K+T9VBuEew4vDU0rp4IZq
 WEL6Kzz4Ckf+21a+erOAYc3dQ3bfmC7Kqepfh5oIc42b5MvsYiKbR1V9/O9+Dq94FPbR
 3Bg9NbS7VQ99BRkE05da+IUsKXMUUbT4Vj+Rbyj38MSoqDIGb+L48ZR/T4E48TqLC3iZ
 FCmtTk5F0D2IHkRM1l+sjeastRtgutop0vmUMQQ7qq6etdu7RDn0fH6Ut64hJfvyPgZ/
 Fr6Q==
X-Gm-Message-State: AGi0PuaNh2hDAgUpor9j+XFShw/oajhy7j0jMAHi+/MOTcWkdwhPi+t0
 obkXQ1ymu18T/saT1gJgrO9r7QHa5W4=
X-Google-Smtp-Source: APiQypIMv4y7ldunFAc0mqPnckhNU4aD+jS9iXsFZGCcNMB8UcXbavZPzfHHhNb7c+xxorASaNuZng==
X-Received: by 2002:a17:90a:8d12:: with SMTP id
 c18mr23163178pjo.144.1587989412518; 
 Mon, 27 Apr 2020 05:10:12 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:10:12 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:33 +0530
Message-Id: <20200427120834.380-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 22/23] tests: Add test case for
	removing parameter attributes
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

Add a test case for removing Parameter attributes. The test case checks
correct removal of the attribute when it is:

- before the parameter type.
- after the parameter type and before the parameter identifier.
- after the parameter identifier.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/remove_param_attrs.c     | 11 +++++++++++
 tests/remove_param_attrs.cocci | 13 +++++++++++++
 tests/remove_param_attrs.res   | 11 +++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 tests/remove_param_attrs.c
 create mode 100644 tests/remove_param_attrs.cocci
 create mode 100644 tests/remove_param_attrs.res

diff --git a/tests/remove_param_attrs.c b/tests/remove_param_attrs.c
new file mode 100644
index 00000000..8ec1ffde
--- /dev/null
+++ b/tests/remove_param_attrs.c
@@ -0,0 +1,11 @@
+int func1(int x, __nocast int y) {
+	return 0;
+}
+
+int func2(int x, int __nocast y) {
+	return 0;
+}
+
+int func3(int x, int y __nocast) {
+	return 0;
+}
diff --git a/tests/remove_param_attrs.cocci b/tests/remove_param_attrs.cocci
new file mode 100644
index 00000000..43f5a204
--- /dev/null
+++ b/tests/remove_param_attrs.cocci
@@ -0,0 +1,13 @@
+@@
+type T,U;
+attribute name __nocast;
+identifier x,y;
+@@
+
+T x(
+    ...,
+    U y
+-	__nocast
+    ,
+    ...
+  ) {...}
diff --git a/tests/remove_param_attrs.res b/tests/remove_param_attrs.res
new file mode 100644
index 00000000..3705e814
--- /dev/null
+++ b/tests/remove_param_attrs.res
@@ -0,0 +1,11 @@
+int func1(int x, int y) {
+	return 0;
+}
+
+int func2(int x, int y) {
+	return 0;
+}
+
+int func3(int x, int y) {
+	return 0;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
