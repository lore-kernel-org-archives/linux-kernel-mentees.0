Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBAEC33CA3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:12:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029D12072E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:12:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3QMATZq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029D12072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC3F186B75;
	Fri, 10 Jan 2020 17:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X4APHtVDcOjK; Fri, 10 Jan 2020 17:12:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22A3186B16;
	Fri, 10 Jan 2020 17:12:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 124FFC1D7D;
	Fri, 10 Jan 2020 17:12:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B213C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4AA3D86B75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqMOczDLiBrS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D0C3B86B16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:21 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id n96so1217459pjc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 09:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tkAbUZB3kx045DRrFSHvA/csk2W/zuhmEtYJ2YpWGs=;
 b=R3QMATZqiFDcjoJNE88i+UddlTUPayeO5QgM7hXDd8xqYx9Ic22UqBe8DR/h03uv8G
 rwEwGKZ6I9bp8+ZoGB/TU3zg633+CpFvBC7MDVMuQabvs8J7R961X9kr+NV1hGwJKo7A
 rBrhuwkk5T3gvG/w25FoacKJVag57yuTEOtQn+EPPgsGVX6PXRdaOy3MKsGrkmRFUrtj
 L5z8OzFfT2vI1vJ8wPvJZmCuPNLJdDHVn/We5+ZzVg38zOHuSNH5LygJE1596gUVkJOy
 6GLGXI2wPCvJoVUfTIMgCDObSAGx1+VhHDn7dpeQpYPZ3Iv0Cb3i7Seon9IDYB1UueUL
 imxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tkAbUZB3kx045DRrFSHvA/csk2W/zuhmEtYJ2YpWGs=;
 b=NvOPXtMWWTc25xUPxYKEcp4EDWAJWTe3M3xfHxy3BoIy4+quBga+pPhWYOwSXmeHZe
 5yEpKlS0ciJLwHV+dhtxOX8ccd+Abe1YTdoca95TjX6Vltjm8U99a7dV+s6qRMcACnMc
 BlndXw60/K8zFqg0fvEdMlsOUweevaxRbV9f2UP8R1naAg1vhxzkm+tbGCh6Vqac+hQY
 tUTuabSp60pSBr+7D+q+6ZLIatyYFBcGSUZy9kxg9U/A068hdOF9NlXw8ei+o+xFDAyp
 VQj7ayMOtWX7sqcYPYib9F2puy2VcecnXQGdOxdyGQdOV52XcZ06iifc6Zi8Y9IPGQjJ
 u/9g==
X-Gm-Message-State: APjAAAVkVVIIOIERE7twdtkxj9IZrxv04YpRDCdc/7nO4uZ6y9g2hEtM
 lov41IhBz1hORhOmlfxgkPY=
X-Google-Smtp-Source: APXvYqwPpyTQHDNlkYoaXyT5xs3VtX/1Q4NpsI8e6Ag1oAOLUpywkcSvZgx0x6bXpDD6DcAlvITeLQ==
X-Received: by 2002:a17:902:bf0a:: with SMTP id
 bi10mr5626849plb.324.1578676341351; 
 Fri, 10 Jan 2020 09:12:21 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:1662:5ce0:c587:cd6:22a3:e892])
 by smtp.gmail.com with ESMTPSA id b24sm3534920pfo.55.2020.01.10.09.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:12:20 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 10 Jan 2020 22:41:50 +0530
Message-Id: <20200110171150.14695-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200110171150.14695-1-jaskaransingh7654321@gmail.com>
References: <20200110171150.14695-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] tests: Add test case for user
	comments attached to ident
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

When comments were appended to an identifier passed from python to cocci or
ocaml to cocci, two cases showed pretty printing errors. Add a test case
for both of the erroneous cases.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/id_comments.c     |  4 ++++
 tests/id_comments.cocci | 19 +++++++++++++++++++
 tests/id_comments.res   |  6 ++++++
 3 files changed, 29 insertions(+)
 create mode 100644 tests/id_comments.c
 create mode 100644 tests/id_comments.cocci
 create mode 100644 tests/id_comments.res

diff --git a/tests/id_comments.c b/tests/id_comments.c
new file mode 100644
index 00000000..b92f346b
--- /dev/null
+++ b/tests/id_comments.c
@@ -0,0 +1,4 @@
+foo () {
+	const void * const id;
+	pgd_t *__meminit id;
+}
diff --git a/tests/id_comments.cocci b/tests/id_comments.cocci
new file mode 100644
index 00000000..971616a5
--- /dev/null
+++ b/tests/id_comments.cocci
@@ -0,0 +1,19 @@
+@ r0 @
+type t;
+position p;
+@@
+t@p
+
+@ script:python r1 @
+id;
+@@
+coccinelle.id = "id/* user comment */"
+
+@ r2 @
+identifier r1.id;
+type r0.t;
+@@
+foo() {
+...
+++ t id;
+}
diff --git a/tests/id_comments.res b/tests/id_comments.res
new file mode 100644
index 00000000..b29ac113
--- /dev/null
+++ b/tests/id_comments.res
@@ -0,0 +1,6 @@
+foo() {
+	const void * const id;
+	pgd_t *__meminit id;
+	const void *const id/* user comment */;
+	pgd_t *__meminit id/* user comment */;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
