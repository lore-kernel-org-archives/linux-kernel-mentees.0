Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7769C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:26:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB3420888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqHYV015"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BB3420888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F797871C8;
	Thu, 28 May 2020 12:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPX_EKcUSkXa; Thu, 28 May 2020 12:26:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 929DC871E2;
	Thu, 28 May 2020 12:26:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82EF2C088D;
	Thu, 28 May 2020 12:26:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D6E0C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7BEE8882F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97EEQehK4O6e
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4F3EF882E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:26:06 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t7so11501418plr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T2brFoIow4rd5tKe3ijdp0ueRTupRQzrSf/7ZqdUTjY=;
 b=TqHYV015n8H4WIlljmFlWyZEeFaaxtoLNqGz0dSzb+9yW4UW/S7J8WyHwjWBLLjKvR
 rYvQJ94tkczZR/pBjCATj/L4UT3MW2Vye+s/PAw/ZEUr5YruH158q01y9un4I7miKrDJ
 kSGCQUc8D8MyYQo0tFu2c9dXukzj09thSeVhhPIrul1G1FvOkkeedlGT/tAKRWkH5Nhw
 b/YMyGEL4saoD9R9U8xmsbeaVgBRR/FBWrDDoqLLo/dpVvjL4DsrIatKtPBOlLHFLFuE
 OWnaYqKzo/BvvwNzNCfK0J9n2DyFwVMNNBppO/ntacPiO4/k1wIN+KsaXdp6MYhyVobX
 Nc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T2brFoIow4rd5tKe3ijdp0ueRTupRQzrSf/7ZqdUTjY=;
 b=MCA1SIPGhxtJghAfwtOnhNCZfTV2dJikoxSB5lWFJkejrRRiOV8tiQwOfFizlChdDg
 6zts3GdnWvoMnKWnKKtNYMFMUdtUHJN0q4roCPQ9dc5VVn+Yv/ej7IbzAIJTJY/2sue/
 35o86+JpsbPgw0ca9HYQilx+37DzhKUL8EB3vLoOBv3+4AWSfLLWiNORaTC1aI96Puk0
 Rj/CjELRrZOg70HhIxQOWab8FJYpaXVb1jdCwVdvP8LMItu7RdPYuCFr3kbS06o90HkV
 ftUMuq+c24aaIAj3+ywFmf5dIMdFsCEhfAdipgiEL9hMr97+2lpF3Vkt9HmPPzrDQdHX
 h5fA==
X-Gm-Message-State: AOAM532JXYLEkh7MBDKPZr67yOSK5DZkCbWqXfB0lXBS8qkxdY9quK+s
 85cov4hDaAesltqrnXnM5iT2G+rC
X-Google-Smtp-Source: ABdhPJzs618xBbe2c7sSFFQ0pxRW5xjR4C6EdWgiodo41oaYH6AqgiV7I1mHg219yQOQlwdT7H46jA==
X-Received: by 2002:a17:902:6a88:: with SMTP id
 n8mr3327098plk.195.1590668765774; 
 Thu, 28 May 2020 05:26:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:26:04 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:26 +0530
Message-Id: <20200528122428.4212-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 24/25] engine: cocci_vs_c: "Match"
	parameter attributes
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

Parameter attributes are added to the C AST, but not to the SmPL AST.
Once parameter attributes are added to SmPL as well, they can actually
be matched, but for now a call to attribute_list is required to
correctly remove attributes. Attributes from a parameter are removed
when the whole parameter is removed, replaced or otherwise.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/cocci_vs_c.ml | 50 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index 413ea220..317fa71e 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -594,6 +594,23 @@ let initialisation_to_affectation decl =
 	Some x -> F.DefineExpr x
       |	None -> F.Decl decl
 
+let check_allminus =
+  let mcode r (_,_,kind,_) =
+    match kind with
+      A.MINUS(_,_,_,_) -> true
+    | _ -> false in
+  let bind x y = x && y in
+  let option_default = true in
+  let donothing r k re = k re in
+  Visitor_ast.combiner bind option_default
+    mcode mcode mcode mcode mcode mcode mcode mcode mcode
+    mcode mcode mcode mcode mcode
+    donothing donothing donothing donothing donothing donothing
+    donothing donothing donothing donothing donothing donothing
+    donothing donothing donothing donothing donothing donothing
+    donothing donothing donothing donothing donothing donothing
+    donothing donothing donothing donothing
+
 (*****************************************************************************)
 (* Functor parameter combinators *)
 (*****************************************************************************)
@@ -1994,7 +2011,8 @@ and argument arga argb =
   X.all_bound (A.get_inherited arga) >&&>
   match A.unwrap arga, argb with
   | A.TypeExp tya,
-    Right (B.ArgType {B.p_register=b,iib; p_namei=sopt;p_type=tyb}) ->
+    Right (B.ArgType
+            {B.p_register=b,iib; p_namei=sopt;p_type=tyb;p_attr=attrs}) ->
       if b || sopt <> None
       then
         (* failwith "the argument have a storage and ast_cocci does not have"*)
@@ -2006,7 +2024,8 @@ and argument arga argb =
             (A.TypeExp tya) +> A.rewrap arga,
             (Right (B.ArgType {B.p_register=(b,iib);
                                p_namei=sopt;
-                               p_type=tyb;}))
+                               p_type=tyb;
+                               p_attr=attrs;}))
         ))
 
   | A.TypeExp tya,  _                                  -> fail
@@ -2099,19 +2118,25 @@ and parameters_bis eas ebs =
           | [], [Left eb] ->
               let {B.p_register=(hasreg,iihasreg);
                     p_namei = idbopt;
-                    p_type=tb; } = eb in
+                    p_type=tb;
+                    p_attr=attrs; } = eb in
 
+              let attr_allminus =
+                check_allminus.Visitor_ast.combiner_parameter ea in
               if idbopt = None && not hasreg
               then
                 match tb with
                 | (qub, (B.BaseType B.Void,_)) ->
                     fullType ta tb >>= (fun ta tb ->
+                    attribute_list attr_allminus [] attrs >>=
+                    (fun attrsa attrsb ->
                       return (
                       [(A.VoidParam ta) +> A.rewrap ea],
                       [Left {B.p_register=(hasreg, iihasreg);
                               p_namei = idbopt;
-                              p_type = tb;}]
-			))
+                              p_type = tb;
+                              p_attr = attrsb;}]
+			)))
                 | _ -> fail
               else fail
           | _ -> fail)
@@ -2149,9 +2174,14 @@ and parameter = fun parama paramb ->
   | A.Param (typa, idaopt), eb ->
       let {B.p_register = (hasreg,iihasreg);
 	    p_namei = nameidbopt;
-	    p_type = typb;} = paramb in
+	    p_type = typb;
+            p_attr = attrs;} = paramb in
+
+      let attr_allminus =
+        check_allminus.Visitor_ast.combiner_parameter parama in
 
       fullType typa typb >>= (fun typa typb ->
+      attribute_list attr_allminus [] attrs >>= (fun attrsa attrsb ->
 	match idaopt, nameidbopt with
 	| Some ida, Some nameidb ->
       (* todo: if minus on ida, should also minus the iihasreg ? *)
@@ -2160,7 +2190,8 @@ and parameter = fun parama paramb ->
               A.Param (typa, Some ida)+> A.rewrap parama,
               {B.p_register = (hasreg, iihasreg);
 		p_namei = Some (nameidb);
-		p_type = typb}
+                p_type = typb;
+                p_attr = attrsb;}
 		))
 
 	| None, None ->
@@ -2168,7 +2199,8 @@ and parameter = fun parama paramb ->
             A.Param (typa, None)+> A.rewrap parama,
             {B.p_register=(hasreg,iihasreg);
               p_namei = None;
-              p_type = typb;}
+              p_type = typb;
+              p_attr = attrsb;}
 	      )
   (* why handle this case ? because of transform_proto ? we may not
    * have an ident in the proto.
@@ -2183,7 +2215,7 @@ and parameter = fun parama paramb ->
  *)
 
 	| Some _, None -> fail
-	| None, Some _ -> fail)
+	| None, Some _ -> fail))
   | A.OptParam _, _ ->
       failwith "not handling Opt for Param"
   | _ -> fail
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
