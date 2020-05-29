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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7837C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E1572077D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcyoD/rM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E1572077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82F4C8848A;
	Fri, 29 May 2020 12:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fs2HV5VWLqLJ; Fri, 29 May 2020 12:10:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D086E8848B;
	Fri, 29 May 2020 12:10:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC021C0893;
	Fri, 29 May 2020 12:10:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D26AC0890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5C0AF893CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NkE66haWlZ1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CBC6F893C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:15 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y18so1282500pfl.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q36LaeZDTpziWGoQvRQkTXbRQt72vU9QHB86ae1n9ew=;
 b=qcyoD/rM5mseRAjXyKIGrqO/pJq3I0x1O/hbEt+d97hnZ13JvRVP55afd30b9raQ0F
 S3oxzOhM0lYrZp+4E5UHiMpaTGPIXfGsOgd9IbiC9g7H2N7gcI+ym9FjokbMGarEvQMQ
 jb6R3K3wtR2ulrI4pToDXPf9UJwG481zODObsjkJ3N+ovm9Njlut1NUvUQm+uNuojZfX
 F9lXmONIdX6L0FJnOO54Byp1TXevwbm8bQ/7QHfUxHIYj1SjVa11nCWOC3llVnYH8CZT
 VshbSfu5S1eo+3U9QMDlgLtEH6lQpBI/aMAvFe+D1SVT1A5WPZPrtfG/bvHYuZz7wNVd
 Vryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q36LaeZDTpziWGoQvRQkTXbRQt72vU9QHB86ae1n9ew=;
 b=d6tPWi4ro6KlmK5yvKkWjAu6QHZ3wPrnSFZE3BY0N2DQv6bRTh9HNe2T//70Z/TmrR
 cRNu5EL7B/JOre2VgVEkolvOq5vtBO8sRNzRbIs2HcsLi0xE4qy7pRVt+X6pKPCErFK3
 HQiepKUMI/3ugy0J5EJ1q039/CkiEM+bFak0G5aPJx2WbwxeAFhNLR0e0xK1KpaDS7AD
 RBhLDa3bPol3plihmCBeEzUYGAd6GeJq0iO8cHKgNgOMO9q4th+mLdwJZwJaz3FwIHBI
 yHQDH4uuRCR3ea2R6DJ9Eh+6lDAQcGuEwIW17wBP5Ss6PSc29SrPjy9emLimQ5UlYIcT
 COZg==
X-Gm-Message-State: AOAM531EtbtRVUWNMWRivMMMmWeejwM5msoJZDzr7fJ5Wz1grbT8XNwg
 bPlM7scp6EHISbEcaCBN12s=
X-Google-Smtp-Source: ABdhPJyeld+rPpgA36eiqTuyl97ExmRBx4srWD7ZRCwiEMW9bmKEFM3yCKwbT749P5ZCByjxIt5oAw==
X-Received: by 2002:a05:6a00:46:: with SMTP id
 i6mr8682622pfk.146.1590754215382; 
 Fri, 29 May 2020 05:10:15 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:10:14 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:57 +0530
Message-Id: <20200529120703.31145-28-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 27/32] engine: cocci_vs_c: Match
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
index 66cb104a..54ab21ae 100644
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
