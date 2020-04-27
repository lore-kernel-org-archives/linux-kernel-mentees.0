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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F90C7C8A1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB9E20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H13Xvzjx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB9E20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5A1EA215DF;
	Mon, 27 Apr 2020 12:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zuf4Mi72jara; Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2F0612011B;
	Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EB55C1D87;
	Mon, 27 Apr 2020 12:10:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D389C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8C06186569
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idCrUbGw1tf2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 32276863CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:16 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id p25so8910670pfn.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=teePH2Ulat8wodcKd5cQjWVTcK7pUQ3XouFRKvY7zBg=;
 b=H13XvzjxiNkhxoX5mU8inrjyrwZV9hwECAlnqxGScbk6AwhrPT99ngiaxdy8YbNEpD
 6+TydPz84CTWznNJVZ1IcpPCDetzzEJnLZjBSc8GgbGIdTTn1lm81AQeH7cemNa24Wfe
 VllrGLXZj8FMaKlZX27JtnJ7YlND+7KXyg1oJ4KPK8akidvLK+3mfC6UPjxf+h6SSAV7
 BxrH7HrvfG6IGGHq+Cb8CbHGNzirPzntTCgaA8AQMVPyMraqQLbazmE20c24Xx/fHEwP
 30wpCwkSgyuhtfjkUBVptJgKj1fcw6BjNvsG1laqpyTN2Sgu4FE0KwJ8li7AtHOa6MWE
 VHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=teePH2Ulat8wodcKd5cQjWVTcK7pUQ3XouFRKvY7zBg=;
 b=KnHCXcPYxFOxVCeAwNlxAZaCd2SEGKxKqwqRwnxAH+Rbi5Uf3OZLvtbmfWg3Bfop8G
 RyYrVeeUpWbyz422ZZxLF22QOc7VdSksyc0JJsSpQSaLC/P1KPy8WuUi7DVzhm7gKhq5
 rWO45Vp8Q58rglyVvUk8fzOuuolGtN9xp8t/yGfR/PlVHVo49XRYv2EMUkPoodITwBaS
 SqSlvt9+haIxPibX+K8jiZ2106A7Ek0GBRXbINyeiXxlZDLn/sOgr8mImyShQ56vHmSX
 PS1lDPUPY9pTOZvhWsD0T804ol4vB2g1SvmVahUphEJ2Je4AbuxRb0D8E2ef98D+Yk2e
 v6iw==
X-Gm-Message-State: AGi0PuZOlqu/EAZ85jlo0yEUqq+AISL7MWw7mnnfpiBqnzezNnazMT5T
 Xzer9lCA9MvPW3/IMIypwds=
X-Google-Smtp-Source: APiQypKdoufF4WA7J9k8W8z5+kTddfvSszq1KidT+4yMqFxfI/9DhtaiUuRk4Jy86/XUrLfkzOn/tQ==
X-Received: by 2002:a63:d804:: with SMTP id b4mr22294219pgh.127.1587989415725; 
 Mon, 27 Apr 2020 05:10:15 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:10:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:34 +0530
Message-Id: <20200427120834.380-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 23/23] tests: Add test case to detect
	parameter attributes
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

Add a test case to detect parameter attributes in C. The test case
changes the type of the parameter if it has the attribute. The cases
covered are for when the attribute is:

- before the parameter type.
- after the parameter type and before the parameter identifier.
- after the parameter identifier.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/detect_param_attr.c     |  3 +++
 tests/detect_param_attr.cocci | 13 +++++++++++++
 tests/detect_param_attr.res   |  3 +++
 3 files changed, 19 insertions(+)
 create mode 100644 tests/detect_param_attr.c
 create mode 100644 tests/detect_param_attr.cocci
 create mode 100644 tests/detect_param_attr.res

diff --git a/tests/detect_param_attr.c b/tests/detect_param_attr.c
new file mode 100644
index 00000000..160d6af2
--- /dev/null
+++ b/tests/detect_param_attr.c
@@ -0,0 +1,3 @@
+int func1(int __nocast u, __nocast int z, int q __nocast, int w) {
+	return 0;
+}
diff --git a/tests/detect_param_attr.cocci b/tests/detect_param_attr.cocci
new file mode 100644
index 00000000..53b8668f
--- /dev/null
+++ b/tests/detect_param_attr.cocci
@@ -0,0 +1,13 @@
+@@
+type T1, T2;
+attribute name __nocast;
+identifier x, y;
+@@
+
+T1 x(
+	...,
+-	T2
++	char
+	y __nocast,
+	...
+   ) {...}
diff --git a/tests/detect_param_attr.res b/tests/detect_param_attr.res
new file mode 100644
index 00000000..b3db290e
--- /dev/null
+++ b/tests/detect_param_attr.res
@@ -0,0 +1,3 @@
+int func1(char __nocast u, __nocast char z, char q __nocast, int w) {
+	return 0;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
