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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3796CC83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:06:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DFD220757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4SZB4xe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DFD220757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E33D38827C;
	Tue, 28 Apr 2020 17:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjy8BIDwnJQq; Tue, 28 Apr 2020 17:06:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 821AC86E1A;
	Tue, 28 Apr 2020 17:06:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7152EC0864;
	Tue, 28 Apr 2020 17:06:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 587E2C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 462848625C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfMYRDMk2y8T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3833587118
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:06:00 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id q124so481593pgq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B+UOGyiCUJNuhbwqPHUKqo90Wxp/xQ4Ay09qO0K/Zhg=;
 b=q4SZB4xeVvKOBALjbc9vKge8j7+PUWUu0X54FAOpxommTSdnTUSFbs1dVFdNLphhmy
 8Tkauy9uyuz05RTTUwz/hXiStFODvxiDmb0HdSi6IzdcJIlLhBR1nHq+J7jhjuuWxJD3
 +EFTuv9st/YKtS9i01a1j3FD5PEI+fXslJz1axm3SDcHE0WRbX3n48TfZL10miiJ0tCy
 M+SfTv0jX8rajJ6PpoLy4Rl9MBsLn4K7rBTTSoC4K1t1URF4wz7ieuEElhkrcVUaPbrN
 aaP7J4AvYcUKiJsZG2fFzoQmWDg2vGPLIA+PtTxd3CKn7kDWze52092RQxoV8lGiHYig
 7Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B+UOGyiCUJNuhbwqPHUKqo90Wxp/xQ4Ay09qO0K/Zhg=;
 b=hoO9ZtbIkbOD9MYjS75pWhSmSMMTkMYYWQZ9dzILf19sq0dQfzTM4jsL6Kr+2x4TZg
 Xaw0wds7oqacHy4ug3D+TdHGSKVbNmkhIvMsChYhuWcTcG+SqL1QWlmFFmArGuXvrpdH
 7UTs+8G0tVlNoabnSB3ZEMkgB72kFiBbGNqePdBmh8sCbjazAo31MqAoaw/rYGxH3eyP
 R62T2/9ZNmSlPEPbA7dUP8czw073Vo3L1j0kMhn4ZQZCJh/HfWRkkEm6qUKr8yNgdw9T
 +dBlmGVJwfxx4pIb1aS9tXPjq9+i1hvy/sfSyvSf5W25G88NqeE90kswwNIVi26i3Yhn
 qDNA==
X-Gm-Message-State: AGi0PuZznpn3Pfvb9B/w2WDayAC65X3CFdW0jDXyoDtCvED8dO3IWova
 Zti+H54SDAQE2LRjS4TFWBwzIRHjshw=
X-Google-Smtp-Source: APiQypLouT7zrIuJqnHZuxoUUsI3qpiYT/XmxYgMsCzD7xmheaw40tmVNqYr+IUykTXf9iUpB3ytAw==
X-Received: by 2002:a62:f908:: with SMTP id o8mr359724pfh.170.1588093559767;
 Tue, 28 Apr 2020 10:05:59 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:05:59 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:26 +0530
Message-Id: <20200428170228.7002-31-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 30/32] tests: Add test case to check
	cast attribute allminus
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

Add a test case to check allminus for cast attributes. The test case
replaces all the cast types in the C program. Cases covered are for when
the attribute is:

- Before the cast type.
- After the cast type.
- After the cast type and before the *.
- After the cast type and *.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/remove_cast_attr_allminus.c     | 10 ++++++++++
 tests/remove_cast_attr_allminus.cocci |  9 +++++++++
 tests/remove_cast_attr_allminus.res   | 10 ++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 tests/remove_cast_attr_allminus.c
 create mode 100644 tests/remove_cast_attr_allminus.cocci
 create mode 100644 tests/remove_cast_attr_allminus.res

diff --git a/tests/remove_cast_attr_allminus.c b/tests/remove_cast_attr_allminus.c
new file mode 100644
index 00000000..4f6da3e4
--- /dev/null
+++ b/tests/remove_cast_attr_allminus.c
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
diff --git a/tests/remove_cast_attr_allminus.cocci b/tests/remove_cast_attr_allminus.cocci
new file mode 100644
index 00000000..320fee93
--- /dev/null
+++ b/tests/remove_cast_attr_allminus.cocci
@@ -0,0 +1,9 @@
+@r0@
+type T;
+identifier x;
+@@
+
+  (
+-	T
++	int *
+  ) x
diff --git a/tests/remove_cast_attr_allminus.res b/tests/remove_cast_attr_allminus.res
new file mode 100644
index 00000000..befec630
--- /dev/null
+++ b/tests/remove_cast_attr_allminus.res
@@ -0,0 +1,10 @@
+#define __cast_attr MACROANNOTATION
+
+int func()
+{
+	int *a = (int *) x;
+	int *a = (int *) x;
+	int *a = (int *) x;
+	int *a = (int *) x;
+	int *a = (int *) x;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
