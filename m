Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EF6C352A4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 11:55:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B905120726
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 11:55:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOdgrpkD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B905120726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 89C6F87D17;
	Sun,  9 Feb 2020 11:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LPKqOC0A9aGG; Sun,  9 Feb 2020 11:55:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C93587B9B;
	Sun,  9 Feb 2020 11:55:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28320C07FE;
	Sun,  9 Feb 2020 11:55:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 609E4C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4F44787BD3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGOqPtRvukk2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:55:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4DEBD87B9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:55:15 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id gv17so2954955pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Feb 2020 03:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5rugtx9GBe1lG9uj6KsKtPWifj61Jj2aO+D5dGd+5dc=;
 b=oOdgrpkDg6c8nHcFjJVqD2ivvaHLJq8GeS1i23vHDxZuUBFeeBREniTRYIV5/slPMu
 bvgMOE0VZDavNvTXwis1Lg3krB9htJxAAFmrbO+bvZNqyZE5Ye6l/WdUQjktLX/HZvIq
 X5di9HAQWTvwwGuJb54pGbZCVFom6jdTJZNhIwnIa7ef6ejBi/8ReqVqIFIdF7zxHISe
 QRzwvrdWJFtQphKQUp834/84iMTP0azcEQimrb01eRdmNLsOT4MpRGudDYtvP5HtMFXG
 RW+wu2E+tPg+rUC8XiuWFRIujT+DTPTDu0xtHELWmXrOfrvu6g32z3t/hhpSOQHjRMgM
 J6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5rugtx9GBe1lG9uj6KsKtPWifj61Jj2aO+D5dGd+5dc=;
 b=rlUqtf78/lUWEnUHje2OoV9vhZ/PRjA+PO0o6aRNNYL31YfdfyD/RPprjY92JEUq7c
 86Ok91uxnWnP7LtkymoszMcr4hf/0iGu8e1q6jA6/cUzO0hSwBzGiVIIS/0VpOkEIPH7
 O4kFvBDoK6ARIFgVlnNe3XxpTVpWEwlWZgrhEeMl3JkJ3bl+XcQG1Lv9eWVGhE1fl5Qc
 YEOwnp8R17kADjhuC4Lh/ZaEeeF9vwX5tmH7jvxBOzUe+KkGUbGN++vDbc3Q2gs69kB2
 dSUImAotZUaOoGHfQzDm5AE3BFdH3qezFmJ6ee8+9jYmawPOoXgpU3vy1B+h5gZBOPfv
 E2+g==
X-Gm-Message-State: APjAAAUImZ+Bk0WNFibbHi0hb9BlzG5cBQ204lEmtoUPtK50cHsc6EUi
 +l6msCbjHIsOVNuoditJHoo=
X-Google-Smtp-Source: APXvYqzWliVClIlk+PxpNWeAied0QvzrZ/Pv5sQJrXUXxXi6/uWwo6UFZQJZfXNhQXbiAGMA5XYcSA==
X-Received: by 2002:a17:90a:fa94:: with SMTP id
 cu20mr15181924pjb.114.1581249314796; 
 Sun, 09 Feb 2020 03:55:14 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:166e:dca2:8d98:ad42:3c3b:8544])
 by smtp.gmail.com with ESMTPSA id y6sm8947429pgc.10.2020.02.09.03.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 03:55:14 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  9 Feb 2020 17:24:19 +0530
Message-Id: <20200209115419.32337-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209115419.32337-1-jaskaransingh7654321@gmail.com>
References: <20200209115419.32337-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 3/3] tests: Add test case to match
	const pointer variants
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

Pointer to const pointer and its variants would not match previously.
Add a test case for matching these types.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/constptr.c     |  7 +++++++
 tests/constptr.cocci | 19 +++++++++++++++++++
 tests/constptr.res   |  7 +++++++
 3 files changed, 33 insertions(+)
 create mode 100644 tests/constptr.c
 create mode 100644 tests/constptr.cocci
 create mode 100644 tests/constptr.res

diff --git a/tests/constptr.c b/tests/constptr.c
new file mode 100644
index 00000000..13fe064c
--- /dev/null
+++ b/tests/constptr.c
@@ -0,0 +1,7 @@
+int main()
+{
+	const char * const * id;
+	const char * * const * id;
+	const char * const * * id;
+	const char * const id;
+}
diff --git a/tests/constptr.cocci b/tests/constptr.cocci
new file mode 100644
index 00000000..29f0aa96
--- /dev/null
+++ b/tests/constptr.cocci
@@ -0,0 +1,19 @@
+@ r0 @
+identifier id;
+@@
+const char * const *
+- id
++ id1
+;
+const char * * const *
+- id
++ id2
+;
+const char * const * *
+- id
++ id3
+;
+const char * const
+- id
++ id4
+;
diff --git a/tests/constptr.res b/tests/constptr.res
new file mode 100644
index 00000000..0af4de9a
--- /dev/null
+++ b/tests/constptr.res
@@ -0,0 +1,7 @@
+int main()
+{
+	const char * const * id1;
+	const char * * const * id2;
+	const char * const * * id3;
+	const char * const id4;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
