Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA48AC7C8A0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E54E20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltstyDlC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E54E20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 563102156B;
	Mon, 27 Apr 2020 12:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5Cjgq1myYxn; Mon, 27 Apr 2020 12:09:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C36F92011B;
	Mon, 27 Apr 2020 12:09:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0750C1D74;
	Mon, 27 Apr 2020 12:09:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D5A3C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 790CA87D5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Tn5a2imgopa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 69B7687D48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:45 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id 7so6654057pjo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOXqqQIKxCE3fAslrFlFgyBgp0iUgXeNGD0vo0kS0Yg=;
 b=ltstyDlCBCkshFtWKkjMVmxR8Frnie48g47uJy/N3KdF5yZKiRgAd+eVmshMIEjYXy
 FISM+fKL8q96IS2Njp0eWxr0CYL51S9k+uXJ1TftG0XKPubwIH0+aJ+PapRkmB6no0ps
 SEIwu8wq9pn+AyguI+1iDy4mPHZCezxjqnsgY11h6vQ+IJ58CUeN0PesvhZVBS5jrd2j
 RYZj1pWToaoVRnE3GVV45irfTZft2Uj+U3xHpyiXAQtvYCXYW9lTFK+Y8BlGZKzGNDaf
 la7TAhPuYpHnw+GQWP97Z+K02/pP+v4ABKmZGBY4ocwrI/yNkSiAl25IWNJqNQgTlLYM
 LiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOXqqQIKxCE3fAslrFlFgyBgp0iUgXeNGD0vo0kS0Yg=;
 b=fqxyRfEOKMcMXR7bCXm7nHFJXJtFSIpY0TSyw8YiIwTBKhwzXB5hAxtxq8hG7hCMj4
 PWRDQuanCCCkVA4d5CzOuvJJLeYUzuJFNa3NokEtcoW9lFt9DHAsDVo2m5zneWsoD9/U
 OgEdqiuBGOTPa678Hbb6UFETNZx+LekektS2aniAZdYZ9wcoV2ljSfhZpM57d0TuzfTX
 SPTWXnihUf1llgKBryQmMgguFGUDRM6usBvebWR9HaZd3llq0njDdWCr6o33fts02L9I
 mcrCtHlCfBnT/WJMTEUpA4Sz0/FutYLp7V3YW4t8RM3Jc+xd67gCFLbhMvoXvu6nK/6r
 69Yw==
X-Gm-Message-State: AGi0PuZwKm7bniAG+xNxu0IihGnqdlRw/AAGBWbdtmnnlmD3FYmXEXYf
 bAkFmaCiW4ECYmZHsxyQBoo=
X-Google-Smtp-Source: APiQypKjH4cv+7G1F3yBIyxw15J9bOo8j1X/fJMZ5hDYzDgJT9C1pb7c9G710zjE8W7Xlsd6nZc2sg==
X-Received: by 2002:a17:902:8202:: with SMTP id
 x2mr23045093pln.287.1587989384923; 
 Mon, 27 Apr 2020 05:09:44 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:44 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:25 +0530
Message-Id: <20200427120834.380-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 14/23] parsing_cocci: ast_cocci: Add
	Parameter attributes
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

Add parameter attributes to the SmPL AST. This is a list of attributes
in the VoidParam and Param types of the SmPL AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast_cocci.ml  | 4 ++--
 parsing_cocci/ast_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index 9b147e5c..919d1dcc 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -487,8 +487,8 @@ and initialiser = base_initialiser wrap
 (* Parameter *)
 
 and base_parameterTypeDef =
-    VoidParam     of fullType
-  | Param         of fullType * ident option
+    VoidParam     of fullType * attr list
+  | Param         of fullType * ident option * attr list
 
   | MetaParam     of meta_name mcode * constraints * keep_binding * inherited
   | MetaParamList of meta_name mcode * listlen * constraints * keep_binding *
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index c56bba88..4b6e7296 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -468,8 +468,8 @@ and initialiser = base_initialiser wrap
 (* Parameter *)
 
 and base_parameterTypeDef =
-    VoidParam     of fullType
-  | Param         of fullType * ident option
+    VoidParam     of fullType * attr list
+  | Param         of fullType * ident option * attr list
 
   | MetaParam     of meta_name mcode * constraints * keep_binding * inherited
   | MetaParamList of meta_name mcode * listlen * constraints * keep_binding *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
