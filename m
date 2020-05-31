Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B2FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C042206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qg5MOcEQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C042206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D91287E62;
	Sun, 31 May 2020 15:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-61Nu1DOefI; Sun, 31 May 2020 15:28:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 21D5A87E3F;
	Sun, 31 May 2020 15:28:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09E05C0863;
	Sun, 31 May 2020 15:28:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84257C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7026F85F93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVqT1WVQkp_n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 238F085F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:27 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id g5so2262169pfm.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86EVu5+u+nNHYvgKzJSdx7Ox/swx4obSjpJyAcAeBA8=;
 b=qg5MOcEQxSPX/nyDJSnZFHCjLM1RqRIsVJOOGFAN7CF9CaJ0ndfDC1ph2y9C3bjz35
 EcShk0OY/8/LAjhf9iIAuNNW3674ZK2aTpjh52qSEQbPY9LGj0GC3C0R9aD+WUT+cKpy
 ZqKK2CeX2Q8WCWFMvxX4Zm4BuAdPx7plMlVQ7bE8amnx78GfC8J5pn7zeRtsm6NY2eqg
 q3/IOLGMMeeBNTBn+Ua/9udE+aZRiq2+9Qo3y/V3aPggNlnlDeProbPs7typzGVGaRrf
 iMUbRZJAJeD/MZ8MlyyY6UOK75ZlOwfY2oChTs9CSMj5SQ0lhTpF1uMNXgUVqdNP58vI
 YxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86EVu5+u+nNHYvgKzJSdx7Ox/swx4obSjpJyAcAeBA8=;
 b=c1Q2YYK6hgIO3D18WrmGLQ0EU1lHd8t9jtPN2uFh0bdhQbxRaSncItgkKWUwvK8XXs
 fWQsdsm9A54fc1k8fDwgy8oDVyVWrHloGNfNW3Oyb/slOVolm/U0jP0QeR0QtYjLm2Fg
 cCtAlRD4Bcjwtvr6sWlbxFlCTmC+sTdmCGcHTT1WI6qfThL7w1K88s8fX9PK7BE9vZLE
 R9aedjgfVLM/0frXibjXWGiGvfGIon7VmG1vc0XP9PEYajsyGWzQQx2PwhElYOhyaqke
 dMEdzkJ1TyFwqnbqYgUJnrH6EG1u25tX3mh0tRKEy+2v5pWIeiVe6j7TxPLD3qX4FZEa
 NUXA==
X-Gm-Message-State: AOAM5302NIo83VliA7PjsD7bY/45CHUtb/IbaaZv9JmycCgJ4egXqHrN
 5u08jHmFW/s9e8Kuk9Cg34z3uPNQ
X-Google-Smtp-Source: ABdhPJyuSMShGJHRbzs1cGtOb4QLMyynrVSKM/6wMyxLjD6iYLBFYYFmWXa5LB6I9QA2ABt9vd7Aow==
X-Received: by 2002:a63:5f11:: with SMTP id t17mr15348813pgb.177.1590938906689; 
 Sun, 31 May 2020 08:28:26 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:26 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:20 +0530
Message-Id: <20200531152621.2886-27-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 26/27] tests: Add test case to detect
	a struct end attribute
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

Struct end attributes are added to the SmPL and C ASTs. Add a test case
to detect a struct end attribute.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/detect_struct_endattr.c     | 13 +++++++++++++
 tests/detect_struct_endattr.cocci |  9 +++++++++
 tests/detect_struct_endattr.res   | 12 ++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 tests/detect_struct_endattr.c
 create mode 100644 tests/detect_struct_endattr.cocci
 create mode 100644 tests/detect_struct_endattr.res

diff --git a/tests/detect_struct_endattr.c b/tests/detect_struct_endattr.c
new file mode 100644
index 00000000..240fcde9
--- /dev/null
+++ b/tests/detect_struct_endattr.c
@@ -0,0 +1,13 @@
+#define __struct_endattr MACROANNOTATION
+
+struct abcd {
+	int a;
+	int b;
+	int c;
+} __struct_endattr;
+
+struct abcd {
+	int a;
+	int b;
+	int c;
+};
diff --git a/tests/detect_struct_endattr.cocci b/tests/detect_struct_endattr.cocci
new file mode 100644
index 00000000..8b6ba797
--- /dev/null
+++ b/tests/detect_struct_endattr.cocci
@@ -0,0 +1,9 @@
+@@
+attribute name __struct_endattr;
+@@
+
+struct abcd {
+	...
+-	int b;
+	...
+} __struct_endattr;
diff --git a/tests/detect_struct_endattr.res b/tests/detect_struct_endattr.res
new file mode 100644
index 00000000..71002542
--- /dev/null
+++ b/tests/detect_struct_endattr.res
@@ -0,0 +1,12 @@
+#define __struct_endattr MACROANNOTATION
+
+struct abcd {
+	int a;
+	int c;
+} __struct_endattr;
+
+struct abcd {
+	int a;
+	int b;
+	int c;
+};
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
