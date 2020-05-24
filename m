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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E24AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C72207DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmx9VP/z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41C72207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 27D8F874F7;
	Sun, 24 May 2020 17:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCAuYt7c+Krp; Sun, 24 May 2020 17:21:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C9F0C8746E;
	Sun, 24 May 2020 17:21:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFBBCC0178;
	Sun, 24 May 2020 17:21:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5EC8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DC33322610
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XTAGiSHHYOh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 5F17C221FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:30 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id p21so7679000pgm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ms6UHNFKx95qXnFx7eWKRowPk5NVwtvKW5RD2jrIW8U=;
 b=Tmx9VP/zYAfZtyu7Ne32W2MZkODoDFcU1ay7iT7r2Arvcj7yEzcrwxkJIxTeoY8TkB
 aFoYyU4NdFHncx4iuu9NK8Qy/30P/+EOIUQ/ANgp5mgSsGrYwveeiTmacna4IoYIdfRW
 an5OEaZu42GvmLo4g7PmsSorljKIxFnbHW21JZ344j4N/k3Y4xM1uHCaC/dkjV1xNr9T
 XZURRAi7TAeTptinu+DssSTDe6naneQuYh8ugQbC7mIsJWIxVq+RztyqAyxJC94O4fKq
 HsB9Sc4TD8XOqGKu0mQ22w1WOdqgNxW4M9FQEXg9/3mM7w92M0TTnJhB6usaoDeuzvDj
 HA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ms6UHNFKx95qXnFx7eWKRowPk5NVwtvKW5RD2jrIW8U=;
 b=hF8QPrxVRgu6iCJAKmJtaEW/lhPxDROahBJwt6Ngp/6LUTOOOML42uutmdaG+zguAu
 mq9kHYZrHUv19mDQCGa4kNyLpKgdmjpNPuY8xOk3PousC6jCEJfYNsNNpwQT2KAWTrDC
 UtsIau7lzWxidLdkfHYqPU5/e7ufAYJiu7iY9ljfWT7dTs5yB9/2pwSB12uNhcDdCrHq
 pIDfPxbLBjTA5C8K04FOsOpa+lr2T7HqfamNzgB2Rzp3ENCUMMYeiBDpwJxHPB0j1sLV
 z2IM6s94FKRaOpNCyjFBVPdI+XrLJUxpWQSkL000bAJg1ulUcg4uffuFO6EbmYdYvJqL
 9XuQ==
X-Gm-Message-State: AOAM53000YF2OxQ2npSXy9k3ut5rCC2Ay0tPziLFie6ngcx+/tW6rMgW
 qwX/JhVIsZCds/kJ7OQtDsY=
X-Google-Smtp-Source: ABdhPJwfNWe0g/Lx45cNC3vTGfsVrhncBhAyKZiwbFRyc1VaUD87vTB3cxRX7PndMhclQ60PlwLcfQ==
X-Received: by 2002:a62:174c:: with SMTP id 73mr13148847pfx.71.1590340889945; 
 Sun, 24 May 2020 10:21:29 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:29 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:23 +0530
Message-Id: <20200524171935.2504-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 18/30] parsing_cocci: unify_ast:
	Reflect Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index 68cb6613..c4a6e0ce 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -409,8 +409,8 @@ and unify_declaration d1 d2 =
 	  unify_ident nm1 nm2 &&
 	  unify_dots unify_parameterTypeDef pdots params1 params2
        else false
-  | (Ast.MacroDecl(s1,n1,lp1,args1,rp1,sem1),
-     Ast.MacroDecl(s2,n2,lp2,args2,rp2,sem2)) ->
+  | (Ast.MacroDecl(s1,n1,lp1,args1,rp1,attr1,sem1),
+     Ast.MacroDecl(s2,n2,lp2,args2,rp2,attr2,sem2)) ->
        if bool_unify_option unify_mcode s1 s2
        then
 	 unify_ident n1 n2 &&
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
