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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AA2C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 096BB20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyN2+VqA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 096BB20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED4A5888FC;
	Mon, 11 May 2020 10:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9akq9OzPlPxd; Mon, 11 May 2020 10:09:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6411A888E4;
	Mon, 11 May 2020 10:09:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60401C08A2;
	Mon, 11 May 2020 10:09:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8959BC089E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 749A724B59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGaiFPxU07jc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id EFAE62050E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:23 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id f7so4528552pfa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XuPFrwuWq6NuiENxiCfyOsgjvaeRNzYflde0XQeU41k=;
 b=QyN2+VqAWmY39JYUX0uPwnhfq1lXa5sQISqDl6C0kv7zwJatCwnR06z1AMeNpAoC5K
 HXogBGmzxgDXtUzizQK8a1gb5wj7qA/oSPRBBGFb1Fw+z5ygBmKPaVJwfrmMv6XXCmTP
 fUjwGiZbbGmqgXDuoSgNRZfnNhM7XOpD93PA5jE4daD9PDcVe/Vei4c0qnhZjCaNJDZq
 O+kGPvwSlYTjC54rrcIJSRkjONFYUwycNH5lpcm+KJGbgD1X55PC7fZYRsNcTyMUFvZQ
 O33Z9bYpgGs3TY3o9B+zo0NgEAealA05gUQ0XdXVuvXo8l9Y1ZK4JO7Tw3c21Ux9AMSx
 sm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuPFrwuWq6NuiENxiCfyOsgjvaeRNzYflde0XQeU41k=;
 b=oHNwj4xPu1SoCW4mwhcenWh9ywd1dwR65gevZVS1WKFeFf9gv9LyxOEaC4N9RyO9eT
 SINOD2cm/GQPpUqz7agupfFVAY28HctNrvUeUg6SG0AuxZ0ZP8xzytlJ8UxY1aDFxGxR
 hixhOklDdIlnZ17F2v90ocQC2THT5Mp9g1xRUNC5hT0UNHSAg32MS7fW+llYD1TPOu4H
 3RUgufrF9IKphHmUoHFuQJEFFCEp69NCVdD6beDdGnOHnJXNI/tmS1+r4qLcHs3S1qyL
 AskhEw549qzRHeUwSKJB1DDPVOi3Uo0FDV7C+etP0fiT4Q6E0zLZtuSTVIT6ng4qjnwy
 C+ow==
X-Gm-Message-State: AGi0PubpLDeCAdHJOhgTZV9u/fJWf4BdANGjaDs+jEVCt1EJDEU14psQ
 vie4Gu3J9y8xwy+pDMko+UQ=
X-Google-Smtp-Source: APiQypJEJcH5C+xRyh0XzWcTfMI/YAkOn6uXNXTLi6CnDmyv4AeQHQW9gU1GaPv0MrCh6TTVfs3jnQ==
X-Received: by 2002:a65:4bc6:: with SMTP id p6mr13722210pgr.20.1589191763466; 
 Mon, 11 May 2020 03:09:23 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:23 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:10 +0530
Message-Id: <20200511100715.19819-28-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 27/32] engine: cocci_vs_c: Match
	Cast attributes
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

Cast attributes are added to the C and SmPL ASTs. Match these attributes
in cocci_vs_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/cocci_vs_c.ml | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index 317fa71e..3f46a60c 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -1121,7 +1121,7 @@ let rec (expression: (A.expression, Ast_c.expression) matcher) =
        * differentiate between different cases *)
       let rec matches_id = function
 	  B.Ident(name) -> true
-	| B.Cast(ty,e) -> matches_id (B.unwrap_expr e)
+	| B.Cast(ty,a,e) -> matches_id (B.unwrap_expr e)
 	| _ -> false in
       let form_ok =
 	match (form,expr) with
@@ -1137,7 +1137,7 @@ let rec (expression: (A.expression, Ast_c.expression) matcher) =
 		    true
                   end
                   else false
-	      | B.Cast(ty,e) -> matches (B.unwrap_expr e)
+	      | B.Cast(ty,a,e) -> matches (B.unwrap_expr e)
 	      |	B.Unary(e,B.UnMinus) -> matches (B.unwrap_expr e)
 	      | B.SizeOfExpr(exp) -> true
 	      | B.SizeOfType(ty) -> true
@@ -1525,16 +1525,26 @@ let rec (expression: (A.expression, Ast_c.expression) matcher) =
    *    by trying | ea, B.Case (typb, eb) -> match_e_e ea eb ?
    *)
 
-  | A.Cast (ia1, typa, ia2, ea), ((B.Cast (typb, eb), typ),ii) ->
+  | A.Cast (ia1, typa, attrsa, ia2, ea),
+    ((B.Cast (typb, attrsb, eb), typ),ii) ->
+
+      let attr_allminus =
+        let mcode_is_not_context = function
+          | (_,_,A.CONTEXT(_,_),_) -> false
+          | _ -> true in
+        check_allminus.Visitor_ast.combiner_fullType typa &&
+        List.for_all mcode_is_not_context attrsa in
+
       let (ib1, ib2) = tuple_of_list2 ii in
       fullType typa typb >>= (fun typa typb ->
+      attribute_list attr_allminus attrsa attrsb >>= (fun attrsa attrsb ->
       expression ea eb >>= (fun ea eb ->
       tokenf ia1 ib1 >>= (fun ia1 ib1 ->
       tokenf ia2 ib2 >>= (fun ia2 ib2 ->
         return (
-          ((A.Cast (ia1, typa, ia2, ea))) +> wa,
-          ((B.Cast (typb, eb),typ),[ib1;ib2])
-        )))))
+          ((A.Cast (ia1, typa, attrsa, ia2, ea))) +> wa,
+          ((B.Cast (typb, attrsb, eb),typ),[ib1;ib2])
+        ))))))
 
   | A.SizeOfExpr (ia1, ea), ((B.SizeOfExpr (eb), typ),ii) ->
       let ib1 = tuple_of_list1 ii in
@@ -1641,7 +1651,7 @@ let rec (expression: (A.expression, Ast_c.expression) matcher) =
 
 
   | _,
-     (((B.Cast (_, _)|B.ParenExpr _|B.SizeOfType _|B.SizeOfExpr _|
+     (((B.Cast (_, _, _)|B.ParenExpr _|B.SizeOfType _|B.SizeOfExpr _|
      B.Constructor (_, _)|
      B.RecordPtAccess (_, _)|
      B.RecordAccess (_, _)|B.ArrayAccess (_, _)|
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
