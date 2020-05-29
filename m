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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CFDC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E8E2074D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZDTfYs3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E8E2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7BB2B893C5;
	Fri, 29 May 2020 12:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unFxHtUGq+8w; Fri, 29 May 2020 12:09:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 26C07893BF;
	Fri, 29 May 2020 12:09:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FF30C07FF;
	Fri, 29 May 2020 12:09:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7FDBC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 23151220A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Hf6R1kAB-r1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 3508820410
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:15 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id h95so374797pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BoYnjbUIzA7PZWWKCtdCogdX3oJtvleHvw9nDhGFwPM=;
 b=mZDTfYs3pTcqu6+V8dsGTSEfB7+9DfNWr2XJF8CmNrv5NlmrGO4bjvhNo/o+WQaB9k
 sno7qKTYFvC1YYvCT0z3sQWwKpzNoKchpt8WxejelXpbjmPUkJAbC5lQ9SCgZ2k0Zsr4
 6zmw0p0Tuzqu40CEQN65/eCbSOd75vmF/NnxBKUK7fhYtbpfxCJXlYwPJw5iNFu12oN2
 VqmM4D/KTWMVsxalFAnRNDgIse4Vj/5bwdmTi8/Dn4C+p6/k+JoyinRT7zNNUij0gSfs
 pApTQhUFSSYMOH3DpnKCD+qwxarc+FJ01pMdzxNRTB/utyvlCZocCegDmUK2GOhkfHNv
 5wVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BoYnjbUIzA7PZWWKCtdCogdX3oJtvleHvw9nDhGFwPM=;
 b=IyGULPmeJmpheQK2bpwkOJUvKBQ4rhu1274LnuEhfnvCHVAyA9eBH/bb2Z19Y4/4wr
 v1mfnKDh8vhVLErf45sjMmRKfzNqLeLS/MQJvr1PzGt7KZ+G6gQ2vkCbz36VP7DTULd1
 7XtdhU2B3grKKH+4yZerGqpPRX/aR1qhFtSssqtoNdN8ackOqYUj5+yX5N53PU1eUEu8
 9qRsjIYuLC7fF2Jk8zVFt+fP75W9oYOU2+76ZjIMyM3WXScJXqJpFi+sa3GtROpEpjee
 MlgYfBqa2KsQs+GDqFgpzVMroNpzS5jGcLwGU4T8eAtPv3tLgtb38CRJUbJwlkP94abm
 n4Sg==
X-Gm-Message-State: AOAM532jcUKDXJxmS2a0h4en/OEXwly84iQy9rkplbFhmkNedrf/moNu
 tFi3jNMhuxb0LUw0mC3rrwM=
X-Google-Smtp-Source: ABdhPJzsEY4shWALEU++Dc852QvwukAqcjnQS2QsrNY/GMI3Ad5rqIH02E9uEijbRXD0qHhIexHmkQ==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id
 h1mr9330774pjs.145.1590754154772; 
 Fri, 29 May 2020 05:09:14 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:14 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:44 +0530
Message-Id: <20200529120703.31145-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 14/32] parsing_cocci: ast_cocci:
	Add cast attributes
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

Add cast attributes to the SmPL AST. This is a list of attributes in the
Cast type of the SmPL AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast_cocci.ml  | 4 ++--
 parsing_cocci/ast_cocci.mli | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index 919d1dcc..72c613ec 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -194,8 +194,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * fullType * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * fullType * attr list *
+                      string mcode (* ) *) * expression
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
                       fullType * string mcode (* ) *)
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index 4b6e7296..af1563f6 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -178,8 +178,8 @@ and base_expression =
 	              string mcode (* ] *)
   | RecordAccess   of expression * string mcode (* . *) * ident
   | RecordPtAccess of expression * string mcode (* -> *) * ident
-  | Cast           of string mcode (* ( *) * fullType * string mcode (* ) *) *
-                      expression
+  | Cast           of string mcode (* ( *) * fullType * attr list *
+                      string mcode (* ) *) * expression
 
   | SizeOfExpr     of string mcode (* sizeof *) * expression
   | SizeOfType     of string mcode (* sizeof *) * string mcode (* ( *) *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
