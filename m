Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366C6C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 08:05:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BDC922522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 08:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpktwins"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BDC922522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E02ED8798F;
	Tue, 21 Jan 2020 08:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWUw6+ipfd21; Tue, 21 Jan 2020 08:05:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F5F1879B8;
	Tue, 21 Jan 2020 08:05:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F107BC0176;
	Tue, 21 Jan 2020 08:05:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A841C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 13407204C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vvo8zmMhuu7o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id E44AC2041B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:35 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id a6so1003241plm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 00:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7o2v0dS94cjz4jidh7K1wn2GlfHDkvb7N3VB99YrJYE=;
 b=qpktwins7bhTbnQefJtI5zkmrkqDDkwHaSsFOD8KwH8wjzDn6uePmUld//7IAyOJc0
 9NYU5Z/OLb4cbOHTkLyqbNDHzLCp8fV+Xto8RLGXtMGIbAfM0+c/h0MN1Vb99AlnyYRG
 rVD6YYzfBMhEmajQrZhh6Wa9QraJT7xQT9Rz1DZ1ApHuX6HE9Gls0vc+fLgsEk/CeIPq
 rBBvIee68RY7+U6b8EVUuELrcPn2A9wlrQ2opbWdl+y92nbkme5shIR/6Ljv2LTBla+Y
 pWWJEvthROoJCokv90nTCm9CQOcBJCmTQM8gtCADfnlW3CiDVGo3NpzEgz8bqja0eMu5
 +sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7o2v0dS94cjz4jidh7K1wn2GlfHDkvb7N3VB99YrJYE=;
 b=K30wPCJ3MeoIVmDvvGUwpYUN7B1y5PCxJnsAAraE/IZ809y6MUD0AonbtM65b6BOLk
 EvJ/+38mgZiDytMp2xvMKYESTlM0G+F6Lifb/jdeKITaxYRRycqHse0Rn+ABjuhZDJoM
 /5qOYQLQ0m2+U6VCLV9D+SUmSlNuXlOSXz1u2k7cTUDGVuuZMxCZtDpKVq/OS2Z8shzQ
 CnSmW51Hwt/gSp0vTDgam30qBfi0kGEza5H09BymnB14ygIHPuxudg21xPsMqcErITUP
 b0tzmhdxHgIE6WeMFMm6pApq/BuoF7eqD4mBCDDfwU8LsMNpO3E5NKqnwpxH0AebN56s
 nT9A==
X-Gm-Message-State: APjAAAVwGRGSYzUOpNqDqbTn2pfv0jVBi2ztGmFmbAMcWbboYLdLJOFd
 t6V8B+9MIg+UtAK5TZelJBM=
X-Google-Smtp-Source: APXvYqy5qhJ+4iUUBbX6+fVQAQZJ1YgT0Z8Dh0OYV8WBGhXJouMhCrMtwkNBKJLzsr5zSuIqBaRFQw==
X-Received: by 2002:a17:90a:ba98:: with SMTP id
 t24mr3986773pjr.12.1579593935563; 
 Tue, 21 Jan 2020 00:05:35 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 k23sm39229604pgg.7.2020.01.21.00.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 00:05:35 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 21 Jan 2020 13:34:55 +0530
Message-Id: <20200121080455.24748-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 3/3] tests: Add test case for
	<macro> bool <ident>
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

This would previously yield pretty printing errors,
i.e. bool would be printed on the next line, followed by ret on
the next to next line.

The metatype should be only bool and not <macro> bool.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/macro_before_bool.c     | 4 ++++
 tests/macro_before_bool.cocci | 9 +++++++++
 tests/macro_before_bool.res   | 5 +++++
 3 files changed, 18 insertions(+)
 create mode 100644 tests/macro_before_bool.c
 create mode 100644 tests/macro_before_bool.cocci
 create mode 100644 tests/macro_before_bool.res

diff --git a/tests/macro_before_bool.c b/tests/macro_before_bool.c
new file mode 100644
index 00000000..a59cba5a
--- /dev/null
+++ b/tests/macro_before_bool.c
@@ -0,0 +1,4 @@
+static nokprobe_inline bool trace_kprobe_is_return(struct trace_kprobe *tk)
+{
+	return false;
+}
diff --git a/tests/macro_before_bool.cocci b/tests/macro_before_bool.cocci
new file mode 100644
index 00000000..53b2fd2e
--- /dev/null
+++ b/tests/macro_before_bool.cocci
@@ -0,0 +1,9 @@
+@@
+type t;
+identifier x;
+@@
+
+t x(...) {
++	t ret;
+	return false;
+}
diff --git a/tests/macro_before_bool.res b/tests/macro_before_bool.res
new file mode 100644
index 00000000..1b0ec319
--- /dev/null
+++ b/tests/macro_before_bool.res
@@ -0,0 +1,5 @@
+static nokprobe_inline bool trace_kprobe_is_return(struct trace_kprobe *tk)
+{
+	bool ret;
+	return false;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
