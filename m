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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7547C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C76F206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiCHp9Ua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C76F206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7C54C221D2;
	Sun, 24 May 2020 17:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tV9TI5Q9a5Z; Sun, 24 May 2020 17:21:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 482EB221FB;
	Sun, 24 May 2020 17:21:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35F0CC0178;
	Sun, 24 May 2020 17:21:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61FA6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C5F722613
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YrY9+RWy0wtH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id CFCCD221FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:13 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 145so7841443pfw.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TK4SBb9CnUXLZimGDRWYYXGovLdTn8ncKA3GspiW1A=;
 b=eiCHp9Ua4DQ3kpujPkyfEg8FVsLiOBzzUhzjX7CLxAHK+giZx5mJqGQ7PB6atM6KC9
 dwkiL3pCgb5PHU6DO9BeSR5z63C5+zKx5S4ltG4oB0JAgYWaDh9GgCUU/uZFLisWWprF
 Bso+CHmaI89xcvSUGe4yE63sC5OHOAkq+vbtCz52dVPiJnZhFxAZTjeRCLRKT0BG4iBX
 L4dK6afSsoarWE40fEQdgbRmzqvpoE3zAv3innACBHup4qaPbtL3qsdOO356q/aMmSx4
 OTc7gRLRe/eXXlhwm5uZ1ZTs7uckV9bhdAMxfbZGh/h6Vu8PbFY7Ok/LPr/KCOWIXQnc
 diUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TK4SBb9CnUXLZimGDRWYYXGovLdTn8ncKA3GspiW1A=;
 b=jS2EJ+/gFAXSXF1JSutJTNYf1FWsavXF4/24AjjSw4NkjU/+TRaSWZVS42Wr7xsWja
 Mpx5dv5VN5imwceJJqDH7xNLDPw3nMs5okQH/4XUZ++ByjgsfyeLk+Cad/utjkhrB+iO
 h3ZEerLoAzb+lOZ5mzZ1azbAk0nx+9xaO2ehEZRc45nuKpjsYd0CsGh4InQE5+qsVanh
 YXbrWsj/N+cZnvKWa5x194VTwpgtvGqHvRF6EltvzKqB03GOognquB8ZaUhI2Onri0BG
 OciSVXhQz/D7e3JXSJ8XJ4wfP4oNrkF1P2tLBIm+hufp6+cZb/BthDvEr//vDifMuN1d
 4E2A==
X-Gm-Message-State: AOAM530cV26cWhZPtevk4E33cbPqDTsYZOrgPjeIfb0dk/UEF7VppQCa
 WbdehigSwX9NMnPBxlv4+5Y9ntsEnww=
X-Google-Smtp-Source: ABdhPJw6d/g13j418aenPl7ucKgD9sjaJNR1MGBVsQfxX9oJs77E8kAdnlzrRUZ5tBcBw6uVoBpqBA==
X-Received: by 2002:aa7:829a:: with SMTP id s26mr13624818pfm.40.1590340873405; 
 Sun, 24 May 2020 10:21:13 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:12 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:19 +0530
Message-Id: <20200524171935.2504-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 14/30] parsing_cocci: visitor_ast:
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

Macrodecl attributes are added to the SmPL AST. Visit these attributes
in the SmPL AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 8e530114..9746b085 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -470,14 +470,15 @@ let combiner bind option_default
 	  let lrp1 = string_mcode rp1 in
 	  multibind
 	    (lfi @ [lname; llp1; lparams] @ lcomma @ lellipsis @ [lrp1])
-      | Ast.MacroDecl(stg,name,lp,args,rp,sem) ->
+      | Ast.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
 	  let lstg = get_option storage_mcode stg in
 	  let lname = ident name in
 	  let llp = string_mcode lp in
 	  let largs = expression_dots args in
 	  let lrp = string_mcode rp in
+	  let lattr = multibind (List.map string_mcode attr) in
 	  let lsem = string_mcode sem in
-	  multibind [lstg; lname; llp; largs; lrp; lsem]
+	  multibind [lstg; lname; llp; largs; lrp; lattr; lsem]
       | Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
 	  let lstg = get_option storage_mcode stg in
 	  let lname = ident name in
@@ -1417,14 +1418,15 @@ let rebuilder
 	    let lrp = string_mcode rp in
 	    let lsem = string_mcode sem in
 	    Ast.FunProto(lfi,lname,llp,lparams,lva,lrp,lsem)
-	| Ast.MacroDecl(stg,name,lp,args,rp,sem) ->
+	| Ast.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
 	    let lstg = get_option storage_mcode stg in
 	    let lname = ident name in
 	    let llp = string_mcode lp in
 	    let largs = expression_dots args in
 	    let lrp = string_mcode rp in
+	    let lattr = List.map string_mcode attr in
 	    let lsem = string_mcode sem in
-	    Ast.MacroDecl(lstg, lname, llp, largs, lrp, lsem)
+	    Ast.MacroDecl(lstg, lname, llp, largs, lrp, lattr, lsem)
 	| Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
 	    let lstg = get_option storage_mcode stg in
 	    let lname = ident name in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
