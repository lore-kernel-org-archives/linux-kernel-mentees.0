Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B9EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76CB42074D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsQYrw5I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76CB42074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B2FF893CB;
	Fri, 29 May 2020 12:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UTVOfNJUBw3v; Fri, 29 May 2020 12:09:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 161F8893C4;
	Fri, 29 May 2020 12:09:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05831C07FF;
	Fri, 29 May 2020 12:09:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 180B2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 05789220B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzvfvkLcE4zW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 9780422049
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:41 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z26so1279160pfk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZ6pS8AgHrGgUWxTtl9ZJbx/zzrWJSzl0y4c7eKWW6w=;
 b=KsQYrw5IwHGg6MxG7LMlC1X7GSpV8IO+PpSRq/QJyBgW/OI32SGSn+xW3N5zQOyaQR
 tCjb7rnIwhhTV8I88BOu7ci0OoGPXzs996TQU4ga7vCx4KzMcTbtPu4S4/muuTSeGM7B
 w1/ISxJfnPvlCzk9ZizLwto04CQo/wzzCT3qE1RcfvB367wMpiQj7M+qhpsZgo3Umyz2
 HUVEbfNJDqYvUcY99pNKHmLk9jWtE0Gb7RegfAsHjaWx+3JBX27zzklOEmIRtvZ7tljI
 ngMPkCqsSEBUCG/55pAjVVFRKip0k2R3TuGmVxyacG/LRXNMhLklRChzfxnI6PcBfrn+
 PA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZ6pS8AgHrGgUWxTtl9ZJbx/zzrWJSzl0y4c7eKWW6w=;
 b=BExIrGRVqUZgcLwAmCY4dRGPp+4/05qFF2sySVbwwiCqma5Iy2UcZxkjOlezQASmRp
 0uwh3DPbAGkBlAVFQyS/wQpl9KfxldZxdWSw4GElhp3kYJecqYMHos+FCgGKUt9sDTo5
 YwOZvF+/ZtxhojJc8K5Q572S879hTKLRbjGRlo/SANSXckWAvAqOYfULe5NPPDzz7DLM
 lg8nIaqadFzdgeCNFWz2xeDKvGQ1lOZBPHDmbXBQEq0OY407roUFEhmzrwoFuGjCO4CQ
 6j5S6p8waR1ir9JUy/FASz5Xp+RmBhrVX0QMBk5rFWkRohSEmjkI/3zoi+CqA1Zxevz/
 PyWQ==
X-Gm-Message-State: AOAM530ABVQfZMTzAnNK+/ujXa2weXZqeV/Lkj1WIMxJcN6tbmXOFybx
 hH1UilnCM0chGRAaflaubb7HI/Jy
X-Google-Smtp-Source: ABdhPJxziO4+zD1YQUVFQH6nwQepc9y4ePIdtmyMy+1EEug3r49q6UKOlK3B/86PDK08PApRE8fF/A==
X-Received: by 2002:a63:e804:: with SMTP id s4mr8224234pgh.260.1590754181175; 
 Fri, 29 May 2020 05:09:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:40 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:50 +0530
Message-Id: <20200529120703.31145-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 20/32] parsing_c: ast_c: Add Cast
	attributes
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
Cast type of the C AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/ast_c.ml  | 2 +-
 parsing_c/ast_c.mli | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_c/ast_c.ml b/parsing_c/ast_c.ml
index 204bd412..7a945162 100644
--- a/parsing_c/ast_c.ml
+++ b/parsing_c/ast_c.ml
@@ -343,7 +343,7 @@ and expression = (expressionbis * exp_info ref (* semantic: *)) wrap3
 
   | SizeOfExpr     of expression
   | SizeOfType     of fullType
-  | Cast           of fullType * expression
+  | Cast           of fullType * attribute list * expression
 
   (* gccext: *)
   | StatementExpr of compound wrap (* ( )     new scope *)
diff --git a/parsing_c/ast_c.mli b/parsing_c/ast_c.mli
index 5411bbb3..0e23ceaa 100644
--- a/parsing_c/ast_c.mli
+++ b/parsing_c/ast_c.mli
@@ -104,7 +104,7 @@ and expressionbis =
   | RecordPtAccess of expression * name
   | SizeOfExpr of expression
   | SizeOfType of fullType
-  | Cast of fullType * expression
+  | Cast of fullType * attribute list * expression
   | StatementExpr of compound wrap
   | Constructor of fullType * initialiser
   | ParenExpr of expression
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
