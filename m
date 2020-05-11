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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96254C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D292075E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoTenM56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D292075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3DE1A24C2A;
	Mon, 11 May 2020 10:14:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wXoUyHm6pZt; Mon, 11 May 2020 10:14:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 498DD24B6E;
	Mon, 11 May 2020 10:14:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3924FC0176;
	Mon, 11 May 2020 10:14:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38F97C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3392087885
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBz8cvi4x-XC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D0F2887858
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:45 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id g11so512406plp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=teePH2Ulat8wodcKd5cQjWVTcK7pUQ3XouFRKvY7zBg=;
 b=GoTenM5697ZnDs74wlK89k1TnX1ADHjDvlW3XdLBQbdTwmzgUWttoJ9B24Zwi8i2qx
 OWfuN23RdxMZbMsCo3IHfjKdtRKRUfjN6QksZbkwwBGnzuiuWmeXhajflUgyrFHxjj4P
 OPGqq30oNzqw5/Ybuu0UbZ1845lHl49YAfVSGDVlwM6bvEt1dkVc49WQ9DjOa+D4Yhg6
 wyjRzLu4jrCuV1H/EI58kJHZUh5eCpwZ69JJqwxIk7HLaurTNZUZ3+AWeZ0kWuGfkvom
 5AjowPlHmDRTO/4kEzwW1ygcF8TEhZjrKcPYHxlEINHvGpLiquSRjD4YTbdrOB5uTrQY
 Z7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=teePH2Ulat8wodcKd5cQjWVTcK7pUQ3XouFRKvY7zBg=;
 b=g55WzDGa8BMokvnUdaZiW8SZFlTNgxeawYYGWn1c0p/nHOd/U9o20FEVj3RTREG9nw
 5ycJqdAHB1sX/jsCkSl0F2rSBohdoYpa2vYa1xi24lzHVjdTu5U/rtwF7Id//XZBPioD
 SHb/hMsB9yY9HcNY3riBjtMulF4dbzH6SQAP5YSsaldLeSlJ0PM+QieN5pQfXOGdHUFT
 3YHcTP8d0DAwjS+0R3nYwMbk0VqPFJ9FDcdYpvSh4g8cLZcscDsaVZX+S0rlaE5MgbGv
 b/qv/zCkQAIj7EJhO0CNrZg52KPzgy6zKZvYMn7tBsFVRV8e+hkwd6EUxUmjHSxVQXXd
 1lsg==
X-Gm-Message-State: AGi0PuYxYtx0MG/G85gjB3Y3C+pktpgFGqBahUe8ZQTkzPouELyErRSJ
 YQY5whBP+plYkX/TwPIsJds=
X-Google-Smtp-Source: APiQypKf5mo4ixZTBH4n8qhFX+5NZdpNjTdpgFqwckBo/YPOpy/rstxypbti1GZqqy72NFPs28M/sA==
X-Received: by 2002:a17:90a:32e3:: with SMTP id
 l90mr20849005pjb.214.1589192085433; 
 Mon, 11 May 2020 03:14:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:45 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:43:00 +0530
Message-Id: <20200511101300.11101-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 23/23] tests: Add test case to
	detect parameter attributes
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
