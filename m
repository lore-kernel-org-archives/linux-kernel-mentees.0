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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8E1C83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:06:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B8E20730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xnk5ILG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B8E20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BE671875DC;
	Tue, 28 Apr 2020 17:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MwUfKCUnGCq; Tue, 28 Apr 2020 17:06:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B32D584415;
	Tue, 28 Apr 2020 17:06:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C7E4C0864;
	Tue, 28 Apr 2020 17:06:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99CE5C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 845DE22668
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFjQ5a7uCA6c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by silver.osuosl.org (Postfix) with ESMTPS id E1CB420464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:08 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id r4so10638633pgg.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ji5NtgAzooxdhdMeMZ3zeDyqNKeDtDsiR9XjjkqT74Q=;
 b=Xnk5ILG+ctusxihp3HX5D5aamCSWqJ2nBS97PkCkiUV8s/WNSiuRfnUGwK1KaeSFin
 Lgh06SmMjR7LTS4DcnZ2ZVFVCYHCIy594UUyipD2K6XOmSc3aSUWD2NfVR9aLgFI6uny
 6Qve5SWLVCwAeioq/qrlPc1ldcdWXlAUpUPhcmMmHDP9JgiBVVTtcwp2lEUrYvHG1rT3
 4wRxVQheiBO21NFHNhiPYpaL2Oam4wTDji2QDPk/Ry+3PHRru+3uy7CjQ0GD4cxyIVIe
 NjhhQiNfHEBtjxr39ooKqmRtg8VWq4izfuMc1jcVE/lSPix6wUpBnbX4RX3zpqUgMHbL
 aQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ji5NtgAzooxdhdMeMZ3zeDyqNKeDtDsiR9XjjkqT74Q=;
 b=qJAlcFBDNU/LPZRix117DR4fPpGQ5eu+X+CemGTlzw8hrd8NdEVJhA5pIAUzLJgtGW
 1nzEgD9Zdn5JSbvuw/Di+igksmFYhtMAq+lSyBoGKB7SLNrcytmLfaem8tx9VielsM5u
 Bh9G8j4xz5qmo4v2RBtf+VuZO/xsxgCORYxJDcrpILAo24ppb3j2mfgq+p6V36fIaDYE
 nsbExrDsUwENklV9Kwn8+f4SQG0C71R8kOvI1/9LwUtDx8xrzSajI/Ot7Ri6hTNvuluM
 F1uCjLKsDmpjwSVrE87HcEb+W3eRwLP2pe8ug3uRHL+d5o4mJuQ0kMoLi6O+lbBlVDYK
 K3uQ==
X-Gm-Message-State: AGi0PuYZ9sHvmUuLN77t78mAYLAiBHKIqYf6QfVWt1im508QQ6NcRORR
 2KVh8N4fjpwZbsAR0JmZhl0=
X-Google-Smtp-Source: APiQypLJ9vedTj016yBIIfeD7/CUTh0ageSSJeHU6riRQ0/mMBlDqf4ZYLgED51jUmnvRYQd1P9UNg==
X-Received: by 2002:a65:4641:: with SMTP id k1mr30891357pgr.406.1588093568352; 
 Tue, 28 Apr 2020 10:06:08 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:06:07 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:28 +0530
Message-Id: <20200428170228.7002-33-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 32/32] tests: Add test case to detect
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
