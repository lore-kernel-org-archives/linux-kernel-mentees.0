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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A063FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C0F206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEeo/ccl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76C0F206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6928F8671E;
	Sun, 24 May 2020 17:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9Uq7n8T2O68; Sun, 24 May 2020 17:21:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0B6E9866AD;
	Sun, 24 May 2020 17:21:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEE20C0178;
	Sun, 24 May 2020 17:21:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16455C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0477E87B69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4EZuiJMkhk8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7AFFE87A43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:42 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 145so7841704pfw.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwXHrBD+rmq9gdOcoavOOb0N3UvZHXCtuCVe4UcJ9D0=;
 b=sEeo/cclPX9AMnvlalYglPPiHiRdTleXiIRY3/3xckIGZ83965nkFuzOs+yCm9vMaa
 NL8lzUfFgv03WNoabO5XwniVDf7mj8q6iub0eArrGbd4dCse+W147sGzN6oYF/EdwLjo
 vgjzKr922olBizK4OSg4/rhnY23NEI2UUrb2PkyA+VcJe6iPzinYwQg34Tz68FhrIz2R
 48lHa/uHTWz3+dj/kOEYcJnhU9+oqZ7bB9f3QlDorUPUdvif9drFqYGH6ZhpwIAI5zo/
 DpwuvvOKigt1coc/FYH7thQw8FxE5cZkrjD09VGn2D3qwiNcbd+tK7ygSDdKK97n8j6H
 v6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwXHrBD+rmq9gdOcoavOOb0N3UvZHXCtuCVe4UcJ9D0=;
 b=YVQAZ0FudxB7jVY0dzWT7frrbthz7aPRjGEqP3El2Qe4z5adfkKu8EdYFXr1O8LzX0
 VzcpWliOBVkZBDXnRoaGmAxMa21v19sGnilGy7n0aXdoXxKyILazcI5qESjDD1SBADz6
 wkRUWPAA/ULgRnlteCFG7NwFErdGLYvksjLtsSkpH42XuS3oE3dVx1LJQXJHrHdzzRkP
 YAzp15haqATyoXI7BnCfKegojfo+/Q2B6SnipvLtAhVX/b6MhSkLOkVrAR+PVtsDwrF8
 WLvGihKlhfxtvczOSmQRTUTXQN/UqugBcDzxzaesnGhgz/pdPYVS2B3bo0zJhzUIIm26
 iKhA==
X-Gm-Message-State: AOAM531woqFT6Qm8uINbkUbMwS/8EKAg0HwtSFHJv2Ohgocu7StCFXKG
 FS3/llpDchVBYusitNR3ZB8=
X-Google-Smtp-Source: ABdhPJy9UHE2uySp1fP7Q7tceRsZo5fjJGyZ0fS9lNHE3abeyXcRjQbJQzeJ77/Q4pKEHTabSCc+ag==
X-Received: by 2002:a63:df42:: with SMTP id h2mr23942179pgj.216.1590340902072; 
 Sun, 24 May 2020 10:21:42 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:39 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:25 +0530
Message-Id: <20200524171935.2504-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 20/30] parsing_c: ast_c: Add
	Macrodecl attributes
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

Add cast attributes to the C AST. This is a list of attributes in the
Macrodecl type of the C AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/ast_c.ml  | 3 ++-
 parsing_c/ast_c.mli | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/parsing_c/ast_c.ml b/parsing_c/ast_c.ml
index 204bd412..f666d33c 100644
--- a/parsing_c/ast_c.ml
+++ b/parsing_c/ast_c.ml
@@ -561,7 +561,8 @@ and declaration =
   (* cppext: *)
     (* bool is true if there is a ; at the end *)
   | MacroDecl of
-      (storagebis * string * argument wrap2 list * bool) wrap (* fakestart *)
+      (storagebis * string * argument wrap2 list * attribute list * bool)
+        wrap (* fakestart *)
   | MacroDeclInit of
       (storagebis * string * argument wrap2 list * initialiser)
 	wrap (* fakestart *)
diff --git a/parsing_c/ast_c.mli b/parsing_c/ast_c.mli
index 5411bbb3..95da1f5f 100644
--- a/parsing_c/ast_c.mli
+++ b/parsing_c/ast_c.mli
@@ -201,7 +201,9 @@ and exec_code_bis = ExecEval of expression | ExecToken
 and exec_code = exec_code_bis wrap
 and declaration =
     DeclList of onedecl wrap2 list wrap
-  | MacroDecl of (storagebis * string * argument wrap2 list * bool) wrap
+  | MacroDecl of
+      (storagebis * string * argument wrap2 list * attribute list * bool)
+        wrap
   | MacroDeclInit of
       (storagebis * string * argument wrap2 list * initialiser) wrap
 and onedecl = {
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
