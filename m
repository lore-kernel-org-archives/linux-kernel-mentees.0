Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDEAC55186
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:20:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E4220724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pcj5IKYt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E4220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D725C86F53;
	Fri, 24 Apr 2020 09:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2J60LRDaK-Z; Fri, 24 Apr 2020 09:20:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E443386F49;
	Fri, 24 Apr 2020 09:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3ED8C089E;
	Fri, 24 Apr 2020 09:20:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5466C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B23718811E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LoY6VRVVgpDr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:20:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3B300880B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:20:00 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a7so3699476pju.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T2brFoIow4rd5tKe3ijdp0ueRTupRQzrSf/7ZqdUTjY=;
 b=Pcj5IKYtnLPma3u1bUUrDLZybvdUdUr73iD04dU6jrP/l10Bb18K6Kz2ABssTOhQtz
 bw0CbsOTwfAjyjnSLxVV4spbLwn5CZMOxj4Tr7IuFhLBj6kBlchQ5KpbeAu+62djF0Tp
 xI3vYuk/rbhjj+RNW4COYLVZH0YEauRPFsvblMFQsT5X7gUjNIz3o3AzvwuSrRCoMrqC
 P+qppjYj8JVkh7RjYh/A7qOLQ/er2xCRENpCnlmvQTEj0CQeV0lE8aJi5AB4ErNS3cp0
 PPTiuFGERcR5CnJV34Wvg3G4gTmHvTNK5E9xfiQlz6YjrFLl07bpuQg/zBQTdNjwEUU9
 NrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T2brFoIow4rd5tKe3ijdp0ueRTupRQzrSf/7ZqdUTjY=;
 b=fQ/r2i8K/lZKClmpSO4zsUbcTo1xJaRYO3MWmE979DKbb9J1YllLmMzBh2YW5YPE5P
 uK4em7ssUbGr8FSvXUr3xOx3xwSU5jE0mLnQ9/Vds5Um3IYebHUfSwWD9IA+jnqS3syI
 qIGhlPZqxnn66vWjznh6ZlyfmWn6l6qeMwU7n1JO1J7Cvn3eSjPLTjqT5/Z6MnzRYYwb
 ZiqitU616J2AZu9vQXQcM7GasWPpQDqoRoJfc3g0iZVHdbbewl0gP58Rn0TBI/2t4TFC
 PL/m5SYKi46b2oH4m7EKt5un6Bf/kINkJQbsrih8RRzH2/FLc7qF4ijS9aQAu8CMdX1W
 +aqg==
X-Gm-Message-State: AGi0PuZyoorbAal2LbxBjh2tVBzexEruiHKIzg6QL4+SpDW69AJvhIIY
 8k3h+qTKwjwS4NcHx/qe2N4=
X-Google-Smtp-Source: APiQypImi3oQ3T/lxyXIhYw8J4OstF1eH8681cXYnJKlhEOweR6tknOSRDTUFM8DBkV3Ne//icuXaA==
X-Received: by 2002:a17:902:eacb:: with SMTP id
 p11mr8314350pld.220.1587719999755; 
 Fri, 24 Apr 2020 02:19:59 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:59 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:48:00 +0530
Message-Id: <20200424091801.13871-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 24/25] engine: cocci_vs_c:
	"Match" parameter attributes
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
