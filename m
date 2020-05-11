Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8559CC47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5441820731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+52gxoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5441820731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F28386E3A;
	Mon, 11 May 2020 10:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iaGtFx9+jxex; Mon, 11 May 2020 10:08:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EFFC38787C;
	Mon, 11 May 2020 10:08:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFC63C0178;
	Mon, 11 May 2020 10:08:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44DC4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 33E5A87853
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMpABXV8lKPj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C43ED86E3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:02 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t7so3746092plr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=baLXxpVeWEBfxtTo4sAaWBj7RQkMl3/SHWSBubRN2Uk=;
 b=f+52gxoEYvT8HUHr6aZjAiX2HfZf8dZJ/kjPkvW2sTrfgf/qaZkQl/POEMkj8SzSAX
 iCOf3cBOGT+pwvHjeABmwKIh6Nu1IUptMCGN4qgCCWRxaswEapkp1zntsNi7+Bbcfs5i
 +ZeF7adMSifqZxso7sP5OBIvf6YUF/ARcK03pbXidy9boPjtUk3Ai0U3Enil+iBo/qJ2
 watLsbbvryL6hXgfXggdaxGjRESmX2MjMB1SoGeOwcXsZ8syr4Sffm1gYpkjseG8XMs0
 0AF834o4GTVAp7Fm9wMdq696yE+gW3BHvlaVzjwP+57hotT7JIGAazMdhFck45GBRXfT
 7HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=baLXxpVeWEBfxtTo4sAaWBj7RQkMl3/SHWSBubRN2Uk=;
 b=ePGTrLkJWN2QcKMfRQZv8pC3OtreOWoO6TMtpkNurvCnATbhEYRNNYpUi0GScnhOUR
 JFuPjS7XVfgO4jV5zzfXOZ1UBiM+Enrws2LMzjrxK8MpP740Y7JJPpkDcdJiVI+WY4Q3
 LLAqeiKZSN9D4Xr6A5eQ78oCn0wuDw89bc9oCXOvsvlHJ+k2mxN9gujH0aHJEKOB0cAo
 7pxs4rsiAR6U70ZfFG2BxOIPmxfbgKV24NzzgQ9VSp9O4lh1ZFj5QkyO64E/Nbvg8Zms
 SLIc/iRw+x13Z+92hc6mqRAE9I1/88sKgK7Qn+y3ncvJKs5QzfXZadOnU08+jLoViOFV
 npIw==
X-Gm-Message-State: AGi0PubF8LrIZD9+nouTbBZ7aoEAZrL4Zw50HxFk5KtpZ3cYZpGbGBsY
 T8SXyQ2K29k8MDXFMB1S7Qc=
X-Google-Smtp-Source: APiQypIZv43dAv84R2THSBWcBO0ZHEcWm5cXH8bxs3tdYG4GEr6up4qn2ONh9+OcaNkRsZB/FiMZHQ==
X-Received: by 2002:a17:90b:19c9:: with SMTP id
 nm9mr22047232pjb.86.1589191682329; 
 Mon, 11 May 2020 03:08:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:02 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:50 +0530
Message-Id: <20200511100715.19819-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 07/32] parsing_cocci: iso_pattern:
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
index 9df21fb9..b57e293e 100644
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
