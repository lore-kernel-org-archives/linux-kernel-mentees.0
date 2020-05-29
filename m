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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEE4C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E0A206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbY3lXR4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E0A206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C290287479;
	Fri, 29 May 2020 12:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wi11fjJCuZvC; Fri, 29 May 2020 12:09:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E812850DC;
	Fri, 29 May 2020 12:09:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BA2FC07FF;
	Fri, 29 May 2020 12:09:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14C46C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EFB5A87449
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5LtrOaW6sdL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CADD08744E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:19 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id h95so374861pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oqhDD2uG8vQcyhrC7Efyo1n+ktbg3WbWv1tj/+nZIVw=;
 b=WbY3lXR4jsic/aIhIsqh7mbSsSvNFUOrrPuqZpdkS/sSoC3qcD9e2KL9Dfwp8NsaNu
 uu4hRj3r/Pqo+jdguCCicN8rCkA/DB+S8Hd6KIX/Tt4DUjU9KeAH133/f901ri4AG0j4
 rFD2ngWmzjJ7g2WgcxAy6vIi4RC28Gi5V8Mn2PwpTS2WpYiNg7p0CPfI9nrj45L0GNHh
 3hrt0kKsZaUNpQQ6oP6VZqMQR3kXB5C0eaIpGb/KYWjjtp98LGzBbSqsxpDVrdDazZ6n
 FwbQUGUP30aEFz78JhKrMdabEteZaXwawO+qm5RwF0u3+OAKaq1/wnvkFz8VSc7PUT+a
 oN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oqhDD2uG8vQcyhrC7Efyo1n+ktbg3WbWv1tj/+nZIVw=;
 b=F45jMd0fq2Jdj75eLnZUTxg9E9zdRnivqEEKeD/tyjgSviuv1z1aC8I9WZiOqVVeoz
 FIvyxE44Aq2OPIcb246/cl5RMxL9a+2Na2d/RHA8YzTtM6O1jdHthk65GkOV5FThCGQ9
 EXWQmm3DpuN5TiiGretjDKxs8cvhT8rYl47W2WvFWMOEFziVKblEhIJC7vsj8SBL3Llx
 5fPLOIOrkF1m3oDF0SrnpDmg5SjZ9jDnJbpImjO1EUxw6m5oNTkufyDVenobBKK/gqk9
 OrdHSIowaHgUKHdSRjFWnhE/GbZGOv/c5yDilR8IQSSoKsAWz8QFYo+xhvaxpCgWfxgk
 pORA==
X-Gm-Message-State: AOAM530TI/WH198ujxMKvH1iEkJk5loFokUKfrwgak5Lff2SNfc2dGrn
 Zvpm+Vnpa4G86X8DWchWcAY=
X-Google-Smtp-Source: ABdhPJyibyqRzWQO7+Y6GR63boWn0AvkJicv1u2QCjPFb5/A1heA95tMV8ttdPYbvVeha+HgUWd5Zw==
X-Received: by 2002:a17:90b:d8a:: with SMTP id
 bg10mr9125668pjb.103.1590754158298; 
 Fri, 29 May 2020 05:09:18 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:17 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:45 +0530
Message-Id: <20200529120703.31145-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 15/32] parsing_cocci: visitor_ast:
	Visit cast attributes
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

Cast attributes are added to the SmPL AST. Visit these attributes in the
SmPL AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 63eab999..056f9abf 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -198,12 +198,13 @@ let combiner bind option_default
 	  let lar = string_mcode ar in
 	  let lfield = ident field in
 	  multibind [lexp; lar; lfield]
-      | Ast.Cast(lp,ty,rp,exp) ->
+      | Ast.Cast(lp,ty,attr,rp,exp) ->
 	  let llp = string_mcode lp in
 	  let lty = fullType ty in
+	  let lattr = multibind (List.map string_mcode attr) in
 	  let lrp = string_mcode rp in
 	  let lexp = expression exp in
-	  multibind [llp; lty; lrp; lexp]
+          multibind [llp; lty; lattr; lrp; lexp]
       | Ast.SizeOfExpr(szf,exp) ->
 	  let lszf = string_mcode szf in
 	  let lexp = expression exp in
@@ -1193,12 +1194,13 @@ let rebuilder
 	    let lar = string_mcode ar in
 	    let lfield = ident field in
 	    Ast.RecordPtAccess(lexp, lar, lfield)
-	| Ast.Cast(lp,ty,rp,exp) ->
+	| Ast.Cast(lp,ty,attr,rp,exp) ->
 	    let llp = string_mcode lp in
 	    let lty = fullType ty in
+	    let lattr = List.map string_mcode attr in
 	    let lrp = string_mcode rp in
 	    let lexp = expression exp in
-	    Ast.Cast(llp, lty, lrp, lexp)
+	    Ast.Cast(llp, lty, lattr, lrp, lexp)
 	| Ast.SizeOfExpr(szf,exp) ->
 	    let lszf = string_mcode szf in
 	    let lexp = expression exp in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
