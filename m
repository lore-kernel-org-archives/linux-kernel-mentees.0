Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16548C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:06:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE25B20757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBgr0tzd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE25B20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AED5886542;
	Tue, 28 Apr 2020 17:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rh-uZ3z_-X6y; Tue, 28 Apr 2020 17:06:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D3198655C;
	Tue, 28 Apr 2020 17:06:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C268C0864;
	Tue, 28 Apr 2020 17:06:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 217C4C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0E56C8829D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p+n-fut2XWL1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9A6C88829F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:04 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id v63so10964240pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yNcRDX9hmzicpYrIzSR1d5L189a5/jLnt2HECCkQKP0=;
 b=CBgr0tzd5AGY+c/mPbo0I9QCXTGeI6nZPOIftrQdTWpoibUaLe4UhjpT0kgjcLn6IZ
 FinzSKXr7EtmEZd7v3wdm3xr57fYCjjSVGbapaIvlwyJu9+qx8ey/oJvfeQo7oh0NOUq
 xU/dxAHtqzP0BM9dAsSEhpF9q7tSxrhlXDLpu4/Q8SOWUdc+XtkwADf8hJ642U3zm/EX
 cQgMYxQwllFDzyIuXWL6Sn0fcpNIwZUTcuVWUl4ivlt0x5YBGkdnECI10KuOr3ZtV47S
 9eFTUwdoBhqxm1cLW1cX8v+EPDexXZm3ur2vQOktgeCWMOeSDea6QfZXIRUpOGKy2fy3
 6a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNcRDX9hmzicpYrIzSR1d5L189a5/jLnt2HECCkQKP0=;
 b=QvoQXzJg6PY1w4kc88GtgvGDHP9UpxE3CRUQh7Gi1JJJ9knBMUMotPuJ38Ry7XCrzk
 7NTdFclKFBVIVTMDuvftYgEKuE4aEcxqAmPyR7Ri8IBWUNrTMgqgj2yfuKIz1y4SCEzH
 JIIIav8atJ0+A0fMWmlnakQMZrWqx5qwktFGAprMFckbpmhQXNPXG/JRPkhm6poP0DQr
 aT7kXDfi0Zd++KagZcuQfYOa5m3D7WrxYklJ0bD30VV4K6HeHhoDM9t/TrOf6Ia2fCvh
 zu2VRmMkK7alPLkf/gNt/g4P1JDNDHuYxvA0mUh+GTnVdUtrOrLT1jk+dh4bOcKGRhC9
 pFaA==
X-Gm-Message-State: AGi0PuY5SVhpSbSCv2yQYJRIF2VcnCDxM/y9O7VxcfCtsFN1nSdSsSiG
 WUahobzuXuWTilFHmFu8lzk=
X-Google-Smtp-Source: APiQypJaglOJReHvnpjFC1jpxTxwS/rJPuFEjpU3HL/EtjUUtqGXEzt/RnIS6a/EQLnGs1lLRY5gtg==
X-Received: by 2002:a62:25c6:: with SMTP id l189mr31461158pfl.28.1588093564134; 
 Tue, 28 Apr 2020 10:06:04 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:06:03 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:27 +0530
Message-Id: <20200428170228.7002-32-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 31/32] tests: Add test case to remove
	cast attributes
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

Add a test case to remove a cast attribute. The following cases are
covered for when a attribute is:

- Before the cast type.
- After the cast type.
- After the cast type and before the *.
- After the cast type and *.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/remove_cast_attr.c     | 10 ++++++++++
 tests/remove_cast_attr.cocci | 10 ++++++++++
 tests/remove_cast_attr.res   | 10 ++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 tests/remove_cast_attr.c
 create mode 100644 tests/remove_cast_attr.cocci
 create mode 100644 tests/remove_cast_attr.res

diff --git a/tests/remove_cast_attr.c b/tests/remove_cast_attr.c
new file mode 100644
index 00000000..4f6da3e4
--- /dev/null
+++ b/tests/remove_cast_attr.c
@@ -0,0 +1,10 @@
+#define __cast_attr MACROANNOTATION
+
+int func()
+{
+	int *a = (int __cast_attr) x;
+	int *a = (__cast_attr int) x;
+	int *a = (int __cast_attr *) x;
+	int *a = (int *__cast_attr) x;
+	int *a = (int) x;
+}
diff --git a/tests/remove_cast_attr.cocci b/tests/remove_cast_attr.cocci
new file mode 100644
index 00000000..f171d44d
--- /dev/null
+++ b/tests/remove_cast_attr.cocci
@@ -0,0 +1,10 @@
+@r0@
+type T;
+attribute name __cast_attr;
+identifier x;
+@@
+
+  (
+	T
+-	__cast_attr
+  ) x
diff --git a/tests/remove_cast_attr.res b/tests/remove_cast_attr.res
new file mode 100644
index 00000000..fb5001b9
--- /dev/null
+++ b/tests/remove_cast_attr.res
@@ -0,0 +1,10 @@
+#define __cast_attr MACROANNOTATION
+
+int func()
+{
+	int *a = (int) x;
+	int *a = (int) x;
+	int *a = (int *) x;
+	int *a = (int *) x;
+	int *a = (int) x;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
