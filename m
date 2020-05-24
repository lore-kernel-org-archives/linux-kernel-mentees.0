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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2CEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFEDB206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vE94AdOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFEDB206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4827C81A70;
	Sun, 24 May 2020 17:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7TihbGNTC8T; Sun, 24 May 2020 17:20:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E59F580CF0;
	Sun, 24 May 2020 17:20:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4C5DC0178;
	Sun, 24 May 2020 17:20:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 949C9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8095F863A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usmbxGDn_4yB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B04386267
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t7so6628111plr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vZTLyxSMO4D6l8LWn8/g+XmxYvohWd+GhczidP/ewsg=;
 b=vE94AdObCqFZHeiCbehkd53qYCkHHjm6XKC6KYN7E5FQLurU7JljqiD0AIwhWM3PIQ
 jdtd5hTCgGKpJ7EicgZ6jyqBynKiLn1nhG8S5J+uaaMTSV8qemmbTlzhC9pCRqG9L6Bs
 jlQjMplo+oiZMFFVbCdM8+mbicOh3UZKE5LaRPCAngqcaUaYjMMG/yDEpe7bMvi9PMmR
 4A6IXNPisJC8v+QmRvYvgMbrJdHvZ0VYbL738yTcG4J+ynERa7SAYlO1ngvFzFxzLOj0
 yFbseOEPItFX5SmDZQ++99g0PBvJoQUebsgBe8GQ5J86ojiPRyomdP3LCtZQ43eIay/o
 I9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vZTLyxSMO4D6l8LWn8/g+XmxYvohWd+GhczidP/ewsg=;
 b=amD+mqBOyhS3YcbrucymvA/gh7mwbe9oOAPpyGD9cV/ftMinuQWP/DIcp/0mxR/igA
 MdyGNehxj/N5pt4Bv3qncG9QIlYkOjo0PQKsd3FuqNDu0gNzNBs/ectjC2N4QO34U7E4
 pOetcvRim16+0nHLUHQ8dST2QCUMYRiUIu3Cs8rQvvx48Rx8KnUtjQrIWzyG6Dpm2ZsW
 g3YMoTwJ5ePzlMAYY8PL9XFi9USn+tanQ8lSmA8kBsA8SwzvmlnWZgmNnrPJ1ySXyiWO
 P0lwxHFRgXh1NthmUFwaLEn+SiMSrHHRumLrzCLnm1xreXL3kLgLIN22gMnBrTKgUA9C
 m+oA==
X-Gm-Message-State: AOAM531/pyhul79Twr6fRFLhVGMerHnVKa2yFeR23EVKUTuidhglKb6l
 6P7MZn6IcF+SILD1IQBKSuA=
X-Google-Smtp-Source: ABdhPJyCEFbCL82Wnk+8z8h3hxdhH64kNk7trIi6AJoQpGPv7+sMwwacnRRRuYZ3f4B62koDEwwgtA==
X-Received: by 2002:a17:90a:ad92:: with SMTP id
 s18mr16755197pjq.30.1590340816665; 
 Sun, 24 May 2020 10:20:16 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:16 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:08 +0530
Message-Id: <20200524171935.2504-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 03/30] parsing_cocci: visitor_ast0:
	Visit Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Visit these attributes
the AST0 visitor of SmPL.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast0.ml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/visitor_ast0.ml b/parsing_cocci/visitor_ast0.ml
index d9e340ed..edc8ff78 100644
--- a/parsing_cocci/visitor_ast0.ml
+++ b/parsing_cocci/visitor_ast0.ml
@@ -637,15 +637,16 @@ let visitor mode bind option_default
 	    let (sem_n,sem) = string_mcode sem in
 	    (multibind [fi_n;name_n;lp1_n;params_n;va_n;rp1_n;sem_n],
 	     Ast0.FunProto(fi,name,lp1,params,va,rp1,sem))
-	| Ast0.MacroDecl(stg,name,lp,args,rp,sem) ->
+	| Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
 	    let (stg_n,stg) = get_option storage_mcode stg in
 	    let (name_n,name) = ident name in
 	    let (lp_n,lp) = string_mcode lp in
 	    let (args_n,args) = expression_dots args in
 	    let (rp_n,rp) = string_mcode rp in
+	    let (attr_n,attr) = map_split_bind string_mcode attr in
 	    let (sem_n,sem) = string_mcode sem in
-	    (multibind [stg_n;name_n;lp_n;args_n;rp_n;sem_n],
-	     Ast0.MacroDecl(stg,name,lp,args,rp,sem))
+	    (multibind [stg_n;name_n;lp_n;args_n;rp_n;attr_n;sem_n],
+	     Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem))
 	| Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
 	    let (stg_n,stg) = get_option storage_mcode stg in
 	    let (name_n,name) = ident name in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
