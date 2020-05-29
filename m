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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B60DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:08:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E051206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnSZglLc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E051206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 003BA893C1;
	Fri, 29 May 2020 12:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSJigHFqbZfV; Fri, 29 May 2020 12:08:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2698F893BF;
	Fri, 29 May 2020 12:08:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15408C07FF;
	Fri, 29 May 2020 12:08:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA7E1C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C714687416
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g50kijdx2rl4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 60C378740E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:08:48 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t7so1107472plr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQPm62EJTusk3BHa3zj98mruaelNhthwbsiJ/5V4Hvk=;
 b=MnSZglLcaFdl61M12iRUTm/JbKjOJQbfUf2ApmtY5bgaw97OQhxmyaqxY40fjm4ygu
 IWIEQ2RVeGa/6sFh5uB1cnnmYU//njsP4i+31xJMsIPeNxHc1JEedP+5f9FgjIWDgbz0
 /kRQcxrvmHgzPnHM7r8soUOSvIL/sWIwMXjEm5GXNdhkp+uhwg5I6fFDGSPAxwu2AL/p
 27dlqbEzdfqtLhTdKJLjTAajjTmZdmRTnokpD52cpl8VCTqwQaPmzpKde2T7IADgwcHB
 dcgOAnFe07yK4+9PB8mQCLPtBj+vHC3P4h5CUeVvVgZOetqJVsg/kAzkQcGdZn6+X4ui
 mNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JQPm62EJTusk3BHa3zj98mruaelNhthwbsiJ/5V4Hvk=;
 b=SRTQzCGTPyAmuHNO2eVflxSuezeZ17OliVoVLQfrTr3EPwssT7abu0ZnbikRjqA9vO
 ZUn2t0T+V7p3AhvmgbuCG4jgfuDNrAXn2WQc6sO+YWfdUMFNtdwAv4n1+Qqj411rjedu
 +KwXZe81/dKwbop5M2NZnssFPP5kfSpwr+lhAKIPANS6tTxo5+IgHzpZS6WGW8zZtEJM
 X2uWoAW3UWnYW0t6KmySPCS6vu7RPbv2xQeHGjinq5LLhxtmkDj+8/TAuZPBmAml5ulh
 AFW9mWkjrYOH+PBOzZaYo8fG1YLBC7lOz/tfv/lnrMlEz2ZCRdQ/wybkgk1uN64ZeVEC
 TPiw==
X-Gm-Message-State: AOAM5333OUEcXaxqRTu64g6S/R1XVH7ofb2A8FrHGiOby3WAtPtjFaDg
 RPeREjui6Rz+Tg809FdcVus=
X-Google-Smtp-Source: ABdhPJxgTjppAibAa9ql0lql3r0Grxc/1ZFnsYM7bmYG2NxiahjbsClCtTHlXe/mJ9yLdHHVxEIvfA==
X-Received: by 2002:a17:90a:a017:: with SMTP id
 q23mr9285058pjp.4.1590754127913; 
 Fri, 29 May 2020 05:08:47 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:08:47 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:37 +0530
Message-Id: <20200529120703.31145-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 07/32] parsing_cocci: iso_pattern:
	Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/iso_pattern.ml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index b751f3e8..6e75c5c3 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -575,7 +575,7 @@ let match_maker checks_needed context_required whencode_allowed =
 			(* all caps is a const *)
 			Str.string_match all_caps nm 0
 		    | _ -> false)
-		| Ast0.Cast(lp,ty,rp,e) -> matches e
+		| Ast0.Cast(lp,ty,attr,rp,e) -> matches e
 		| Ast0.SizeOfExpr(se,exp) -> true
 		| Ast0.SizeOfType(se,lp,ty,rp) -> true
 		| Ast0.MetaExpr(nm,_,_,Ast.CONST,p,_bitfield) ->
@@ -586,7 +586,7 @@ let match_maker checks_needed context_required whencode_allowed =
 	      let rec matches e =
 		match Ast0.unwrap e with
 		  Ast0.Ident(c) -> true
-		| Ast0.Cast(lp,ty,rp,e) -> matches e
+		| Ast0.Cast(lp,ty,attr,rp,e) -> matches e
 		| Ast0.MetaExpr(nm,_,_,Ast.ID,p,_bitfield) ->
 		    (Ast0.lub_pure p pure) = pure
 		| _ -> false in
@@ -757,10 +757,16 @@ let match_maker checks_needed context_required whencode_allowed =
 	       conjunct_many_bindings
 		 [check_mcode opa op; match_expr expa expb;
 		   match_ident fielda fieldb]
-	  | (Ast0.Cast(lp1,tya,rp1,expa),Ast0.Cast(lp,tyb,rp,expb)) ->
+	  | (Ast0.Cast(lp1,tya,attra,rp1,expa),
+             Ast0.Cast(lp,tyb,attrb,rp,expb)) ->
+              if (List.length attra = List.length attrb &&
+                  List.fold_left2 (fun p a b -> p && mcode_equal a b) true
+                  attra attrb)
+              then
 	      conjunct_many_bindings
 		[check_mcode lp1 lp; check_mcode rp1 rp;
 		  match_typeC tya tyb; match_expr expa expb]
+              else return false
 	  | (Ast0.SizeOfExpr(szf1,expa),Ast0.SizeOfExpr(szf,expb)) ->
 	      conjunct_bindings (check_mcode szf1 szf) (match_expr expa expb)
 	  | (Ast0.SizeOfType(szf1,lp1,tya,rp1),
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
