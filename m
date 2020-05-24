Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01132C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:23:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA953206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG7J427c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA953206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BAC7887527;
	Sun, 24 May 2020 17:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pv8dMaxnLCxM; Sun, 24 May 2020 17:22:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D0C48701C;
	Sun, 24 May 2020 17:22:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BF4AC0178;
	Sun, 24 May 2020 17:22:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A30BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 77CE386739
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pz95xyGK8Yyu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1BB6086722
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:58 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id k22so6621446pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKt5b00unFqdMIBEAxoAAwrEPkaBpKFIH7Eo5vQ20nc=;
 b=ZG7J427c0DizovDEfaZ9AXdW6fBuYiXaZm82xZFHicxMc8zdbwNCyZ7Z12+122nCHY
 sN/qrNZ76Dj652zFE1ozV5AsIRs9odRJI8TB8yORD1Dks5hcDyp13wFM4TlR7asoyp0D
 JlvkTgQ4ckWnLtf/YTBJ1tG83zn1ycKhuE7TEAx2wFDFhQrVqkSmcx11b53lCmyvi0Yi
 LKQyNDCm+5si4/i05vQeXD2vX9d5/dQ89o4NCZN58lUjMuYrOFsX8QxA74FGFqI4rgJW
 o6rjtZlmF+y/GzzdK5ETGh1zOb7PioDLcjyCbbUJTw/WJcBSZPMasM7tM/9MasXbU5qn
 Tz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKt5b00unFqdMIBEAxoAAwrEPkaBpKFIH7Eo5vQ20nc=;
 b=FzFHZ5N7b5v1uB7IeQYyCR+wnLgX6877v8ZZ20/3KvVPNd/GcxCYJAaR0cnYF68vn3
 cGbmd85eI6U08aXQXsaOn8vliZmz7NUw7ZAeUqU85nZyVsI8tvwJOa6e5atNKerswHfY
 oEX4ftFHCZ0a7SQ6rHtHhwOt+ptdc5TYYqeyMxhjKxXF4xpF88LQSVu109ZLzw6ayaAy
 r5zodmhNnae7wssiNMwM10/dzB2CKZt8+Vt/VA1GPFctlsOKYAInAjhFcC/zPIwbhcAj
 s+sVlTR3aYQzx8Y45st8AuawQSiEGp9T2lzZMcn00Zr7xF9AOr7OgG1eAZiNCVGY64qd
 ujQQ==
X-Gm-Message-State: AOAM533rEhrhAPr1f4DpKKEbweho5VAyl108cRMEtu80nX/UyL+ChVnx
 7bdSRaXMSZzJPlItGDo9jvg=
X-Google-Smtp-Source: ABdhPJxhrX7RZx2WhIrbU1IOS/rRnKzGK3RpCZAtAkCqkzuanIzrli4/VcVhe6ILHOHUzfkXqEal2w==
X-Received: by 2002:a17:90a:e28d:: with SMTP id
 d13mr16397813pjz.128.1590340977695; 
 Sun, 24 May 2020 10:22:57 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:22:57 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:35 +0530
Message-Id: <20200524171935.2504-31-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 30/30] tests: Add test case to detect
	a macrodecl attribute
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

Macrodecl attributes are added to the SmPL and C ASTs. Add a test case
to detect a macrodecl attribute.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/detect_macrodecl_attr.c     |  5 +++++
 tests/detect_macrodecl_attr.cocci | 12 ++++++++++++
 tests/detect_macrodecl_attr.res   |  5 +++++
 3 files changed, 22 insertions(+)
 create mode 100644 tests/detect_macrodecl_attr.c
 create mode 100644 tests/detect_macrodecl_attr.cocci
 create mode 100644 tests/detect_macrodecl_attr.res

diff --git a/tests/detect_macrodecl_attr.c b/tests/detect_macrodecl_attr.c
new file mode 100644
index 00000000..3dd89410
--- /dev/null
+++ b/tests/detect_macrodecl_attr.c
@@ -0,0 +1,5 @@
+#define __macro_attr MACROANNOTATION
+
+DECLARER(a, b) __macro_attr;
+
+DECLARER(a, b);
diff --git a/tests/detect_macrodecl_attr.cocci b/tests/detect_macrodecl_attr.cocci
new file mode 100644
index 00000000..70182f49
--- /dev/null
+++ b/tests/detect_macrodecl_attr.cocci
@@ -0,0 +1,12 @@
+@r0@
+declarer name DECLARER;
+attribute name __macro_attr;
+@@
+
+DECLARER(
+	...,
+-	a
++	c
+	,
+	...
+  ) __macro_attr;
diff --git a/tests/detect_macrodecl_attr.res b/tests/detect_macrodecl_attr.res
new file mode 100644
index 00000000..6574a7ea
--- /dev/null
+++ b/tests/detect_macrodecl_attr.res
@@ -0,0 +1,5 @@
+#define __macro_attr MACROANNOTATION
+
+DECLARER(c, b) __macro_attr;
+
+DECLARER(a, b);
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
