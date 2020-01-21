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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242EDC2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:27:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E95C120882
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UffiRM8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E95C120882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C791185815;
	Tue, 21 Jan 2020 12:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CaajrEPXHw3D; Tue, 21 Jan 2020 12:27:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1623A8561D;
	Tue, 21 Jan 2020 12:27:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01973C0176;
	Tue, 21 Jan 2020 12:27:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81905C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6D3F986420
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uP59QYTOtWrl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E22CE863B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z16so1440607pfk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 04:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jyO5Y6+8ERCgCwJfcrGe6hWYJAjbsP9FEu1YYGqGxxs=;
 b=UffiRM8grrXCjw1pJyCu8hQMZZ8VoMezuzMWoq+snmYgmFFwGkHhB5RbYAtuPDmbDu
 PHCVJN5PmJZeVtnPYjVIbWeSh1BcTvQ0CecH5lgM1NyqfU6XN9C6Og6ahulyf2TeAYH9
 xcT1ErYHfa5KWbGq4qrMWOoxq6pWWZfgLubTSSUSoby6QDVjxqM4U3DxPABjljIRa4Wz
 v4LiclmfCiBMmgOYdhHOO8/65z8NdXeod7HmbpRkMo+vTVQ3drRymTlKhdLagucHLTBR
 I5tjDYAR9SOflDlaq4AWXmP+5A00Rv0DjC6spWyl0BGFsLGiEjMXhHNm8w/Aj57fqXxN
 0aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jyO5Y6+8ERCgCwJfcrGe6hWYJAjbsP9FEu1YYGqGxxs=;
 b=albJ2DK52pvIzGC377nzrjDx7xU/Xtl4Aov86HDcYD3GDyACp8Ndr8kGDlGtw/KvBu
 RjHgmIS2QTDB0SUaqdS6kgauLjZjn3bdDt0LsnSmwhu8q4mlpHDhppqiqYe0+ZU281n8
 9klms5s+gLuohH5xPfoC7uKVeX7pXGqzKttICfR1zb7ZKHoAPCXi2A325z+734K7sOeX
 hFEI5a298fdQVK5On4FLlPauRBJvnwcTujv+D2/7pHJexn51ugqpHp41JYFuerqQqnZB
 /HzOyh/U9jW6gG1vNSNftWEklC8VgNM9oTh47ceQMY3jTaBVKwYd10WpGLfdBPLcBEaN
 vgww==
X-Gm-Message-State: APjAAAVVZ6OZf5YscGFH16+kxNYa3rliLDZZvb7stJkdmjyoVncDfynQ
 IeyYCKR2tqnHrT0WoA9TKns=
X-Google-Smtp-Source: APXvYqw1pAO/taEwX4tig+r3OxJQQrb0yFBiTrKJnGGmq7X9NkrdNDZ3tjC8Sl1dzAfR2KkeiGhM7Q==
X-Received: by 2002:aa7:824d:: with SMTP id e13mr4260462pfn.247.1579609657586; 
 Tue, 21 Jan 2020 04:27:37 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 i9sm44381347pfk.24.2020.01.21.04.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 04:27:37 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 21 Jan 2020 17:57:19 +0530
Message-Id: <20200121122719.24226-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121122719.24226-1-jaskaransingh7654321@gmail.com>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
 <20200121122719.24226-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 3/3] tests: Add test case for
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
 tests/macro_before_bool.c     |  4 ++++
 tests/macro_before_bool.cocci | 10 ++++++++++
 tests/macro_before_bool.res   |  5 +++++
 3 files changed, 19 insertions(+)
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
index 00000000..667e4662
--- /dev/null
+++ b/tests/macro_before_bool.cocci
@@ -0,0 +1,10 @@
+@@
+type t;
+identifier x;
+symbol false;
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
