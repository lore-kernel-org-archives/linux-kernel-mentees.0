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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA92BC54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:10:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8111C20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lntl4s2C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8111C20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6370687B72;
	Mon, 11 May 2020 10:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cKicGDt5pfy; Mon, 11 May 2020 10:10:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 953BA87895;
	Mon, 11 May 2020 10:10:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9230DC0176;
	Mon, 11 May 2020 10:10:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84641C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6319D86250
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3or8jWVeBtUr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 97A72863DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:41 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id n11so4340329pgl.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yNcRDX9hmzicpYrIzSR1d5L189a5/jLnt2HECCkQKP0=;
 b=lntl4s2CDHie7lnxp/l+nPSEFmhCXANsCn5Lo6rNkpHECO8WHeqbs7E4+cPy/9YuTv
 rDKtkWEbDbEu6ljgHIlbQLQwB0ZLVVwckGuW8UQskQbHCCM0QaZSkYifYSjon136ZeoC
 P1rVxUzmBLVIeLfrddvbjtBIdvkL2m4yC2QTlRL1xFxWn/29pIbiwUwc9FCqp+GhNQwj
 T3SsLuOT+qYJvFQezVqgEfND04csIqGqIQDOOOgGAO+pMHkjNBzBvEQWxcmax7qWMGew
 NNtA7kpVkoCGH/MKccOGFRqN3l/YEgKsKbGlXyt+6V40A2opdMf7iQ9e2w73J5X1qw/o
 Vu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNcRDX9hmzicpYrIzSR1d5L189a5/jLnt2HECCkQKP0=;
 b=ghcs53AHN5yz5qdcf5wXwsig1GTA17B3gwf/wHMCSjXrM23AHcJfK10FmgXKtvjQLG
 UKcQusCKFXODShvbAuu94cNYxVfeNbxEe0ZRy0RL4a0xOTOM70A/O2giLzqLB2JnndDn
 qfo85kGhlD/TTWKWDBEUE940HXXgX/8nOlAyBa1BfPr/3tXWb2a1+evJbOnk+ll8ajpH
 iO/ZROlf4CKz2NU8uKXrcJ4a3Fmo1P0cLwj7fvE1A1QaABCFacyt5tSRHtVNoZ2kiKcn
 4fKUpWLHjHnu2CAGZZYi+smzkx4FNFRBFSkYKUpXVdp8PJhRykLfFCmLMWO4U5MZuI1q
 76HQ==
X-Gm-Message-State: AGi0PubRqpRBLnLnO658mVIqXtl+9myCrcm7dDxx/QNQpF4Yi10n7n0E
 c1SO8Wy1XmwhdoQ7fcpkPSzLCcU0/zQ=
X-Google-Smtp-Source: APiQypL5XGgTAA+kvZjmuf+gSS7294obD7rRnP9loUThyoxrejIlhEypgkyQht2dm+Pi3zYDLOJDMQ==
X-Received: by 2002:aa7:8bdc:: with SMTP id s28mr15227599pfd.57.1589191781164; 
 Mon, 11 May 2020 03:09:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:40 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:14 +0530
Message-Id: <20200511100715.19819-32-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 31/32] tests: Add test case to
	remove cast attributes
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
