Return-Path: <SRS0=A+ee=ZT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3564C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 17:39:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1502071E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 17:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzWRGVM/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A1502071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7430187A9C;
	Wed, 27 Nov 2019 17:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tqi20j3IG8pP; Wed, 27 Nov 2019 17:39:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05F6087A52;
	Wed, 27 Nov 2019 17:39:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA3C4C1DDA;
	Wed, 27 Nov 2019 17:39:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF4FBC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 17:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B9FA386237
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 17:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0EFIdEv4zeKr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 17:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 48BD986204
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 17:39:24 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t3so10783894pgl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 09:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XI2+aCDvSDzw7sp0F3NSfsmqm2bx8d6RjVRQ43Sv6SI=;
 b=nzWRGVM/s3nDWNoHhBrxShxfFMTVYkQ4JsR9X6x+AmyO2eoUIwmihEut8p5pn+1Jsq
 IOTz7NpH1Z5cxJ/VYnhLAo/T6a4OhQqAmulMm2bWYrwlyh0pzYUt3aV1KVqN7MpToMMB
 I8BzJ9oqcEwDLIOpLEWUR2qabSpI/8GGdnvba0E16HHVFdM9sZnx8Z35p0VnBdDauS74
 DTl6jGHnqNIouIwFo3MqDSqyU3eURsT3xGqGacnc7MU7Iljqndg2wuzw7e/qGKHwLY3W
 GRaeQ81O782Lv4KsZCFkJIEH/9ifPYV45JOI9QltanZsFg5OEKJLiFTaCQCxehJF5S8I
 8y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XI2+aCDvSDzw7sp0F3NSfsmqm2bx8d6RjVRQ43Sv6SI=;
 b=IXr0Kevs83MJkti0hSwMDtN10Ir/aEnyaYf8356Hukh2nicC11dy3uIJPcF/++Bbri
 NZ6xLhNC2P/is4D3WVmHbEWojFs/TB+/XnN8dhI57+a9DBIvDTpZ/Gh2NsdtOWjT6hOE
 SWuoqWYjJhUSnPis5fsy6bu4K4kIXWVeiqEpjAYu8waTM80dLSe6vd2JApW24ZcD29+y
 65jIRBahpgNCp7qZHFBFwjrUdXi8rq/vifCObayVzaU3piks20dpKqggxC1XEmYBipR2
 TBPvzNNvIsx6dFewSAE3D7ifZdVwv55PLUNi1vFWvTK94EZuiuYdILW3WvKT9PUiFQzh
 EQgQ==
X-Gm-Message-State: APjAAAVsYBekhVkXNsf1Ut/HiXer6StUV91YmQXWjt9NTQ/oYkUb/7Gt
 KNzYBhz1sIuwWvy9La3JqsY=
X-Google-Smtp-Source: APXvYqyVJYEQFE0zdBAikqy01aRhDIZuH1OYQFvPgZep80EZyVkbnbpSLwr6N52fxk8t51p+v4aUfw==
X-Received: by 2002:aa7:828c:: with SMTP id s12mr47700052pfm.166.1574876363779; 
 Wed, 27 Nov 2019 09:39:23 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:167f:97a7:3939:930e:5cf8:fd50])
 by smtp.googlemail.com with ESMTPSA id j23sm17028240pfe.95.2019.11.27.09.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 09:39:23 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed, 27 Nov 2019 23:08:15 +0530
Message-Id: <20191127173815.24988-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191127173815.24988-1-jaskaransingh7654321@gmail.com>
References: <20191127173815.24988-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] tests: Add test case for
	statement removed and added
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

This is in response to the following "continue statement of death"
report:

https://www.mail-archive.com/cocci@systeme.lip6.fr/msg06199.html

Coccinelle would crash in similar cases, so add a test case for it.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/stmt_removed_and_added.c     | 8 ++++++++
 tests/stmt_removed_and_added.cocci | 7 +++++++
 tests/stmt_removed_and_added.res   | 8 ++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 tests/stmt_removed_and_added.c
 create mode 100644 tests/stmt_removed_and_added.cocci
 create mode 100644 tests/stmt_removed_and_added.res

diff --git a/tests/stmt_removed_and_added.c b/tests/stmt_removed_and_added.c
new file mode 100644
index 00000000..cbc64f42
--- /dev/null
+++ b/tests/stmt_removed_and_added.c
@@ -0,0 +1,8 @@
+void main()
+{
+	for(i; j; k) {
+		if (1)
+			continue;
+		c++;
+	}
+}
diff --git a/tests/stmt_removed_and_added.cocci b/tests/stmt_removed_and_added.cocci
new file mode 100644
index 00000000..93558a19
--- /dev/null
+++ b/tests/stmt_removed_and_added.cocci
@@ -0,0 +1,7 @@
+@@
+expression I, J, K;
+statement S;
+@@
+
+- for (I; J; K) S
++ while(1) S
diff --git a/tests/stmt_removed_and_added.res b/tests/stmt_removed_and_added.res
new file mode 100644
index 00000000..4b20027a
--- /dev/null
+++ b/tests/stmt_removed_and_added.res
@@ -0,0 +1,8 @@
+void main()
+{
+	while (1) {
+		if (1)
+			continue;
+		c++;
+	}
+}
-- 
2.21.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
