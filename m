Return-Path: <SRS0=hY7L=4Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CDDC18E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC071206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSzQHE7G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC071206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 95F9123120;
	Sun,  8 Mar 2020 08:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUv04XKTKnu0; Sun,  8 Mar 2020 08:44:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6C914204BE;
	Sun,  8 Mar 2020 08:44:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C788C1D7E;
	Sun,  8 Mar 2020 08:44:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B112DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A0063204BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QdENE-yjl5n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 75B3F2000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d9so3301271pgu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fysTmO4O6ghGhMX2wDtHaEm/Qh83ihIB7B1VYraQR1Q=;
 b=oSzQHE7Gc/cal9Z65QJEu5b4Ms9MhbDY3OInWYlRd4l4x5DvpQIP2e1MZHQ9kqXJbg
 OxkSmkQLriln+mvsJkEkVh3N1IPdf1I4pqxT5i+TQ7qcWB9lZT40MAhYPYptRdmyeUjK
 Fi1TXQ3ix+wSD7PZtQ7/Y/u7VXzLXqm4L4d8B0Fhvi4P7Ojk+DKJ+h1Of/0PylOG8X0R
 s8h4nZK4/u0+rf5O6VDOIUTIbyvtNTxXM2XU0C0osR7dwaxdJS/wUZMBvVL13w9DXrvu
 IoAUjRKqWq1KB8CiBeb6KpXKKjwxcoLc2SvtwEMVc7HU64hf5cEuka9RsACikW4w6ve6
 eYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fysTmO4O6ghGhMX2wDtHaEm/Qh83ihIB7B1VYraQR1Q=;
 b=WfZ7pj2BTiAMqikLfSXL37ZOTzJRQj4h7SXL6Q1LWKd29jg64XYHf61DXF1Psrm1hL
 Oqt2ezQ/YWAXQ0hK7Sx7ScwYZYw3yQlpJjDBUPtpin0hgt11EWldLBnyvLqqwKnR3EaX
 TXsJghmgtjjnJziSksG7sBik5t3ppghp4OJvSp8/F4zleeuTggJwD9wCr4HpiSA8AY6h
 otu1SS6fijxOWQSniwanR9i7gZw84/0lq+29TU00jJKbbqSWOPNoLYNWhtiPHBWKWiuj
 TseIo/rbeFkMYWDdqh3AhiXRzFtM6bt824sS3w/2AgpmLkupSYAgr3YKwbIFt1FCLLTL
 RrSA==
X-Gm-Message-State: ANhLgQ1YWSSFhe7/FC9QNVJTtOTIZOVR4IZ/arU2oWuRAnBVp0sSO7EJ
 FYT8pEUFm9wG1NX7mgrmUoxKF+nn
X-Google-Smtp-Source: ADFU+vulayWYPzrfKfwu42D9NaMtCb3y0A5vlQay5Q6F+siN5gw4EB/NUvaixXVAyc+sBdXzjAy12g==
X-Received: by 2002:aa7:9a8c:: with SMTP id w12mr11669743pfi.218.1583657086994; 
 Sun, 08 Mar 2020 00:44:46 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:46 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:53 +0530
Message-Id: <20200308084356.14506-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/13] engine: cocci_vs_c: Match
	enumerators properly as per enum_decl
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

The SmPL AST has a separate enum_decl type for an enumerator.
Make corresponding changes in Cocci_vs_c to correctly match
enumerators.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/cocci_vs_c.ml | 44 ++++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/engine/cocci_vs_c.ml b/engine/cocci_vs_c.ml
index 5d123164..1a9b3671 100644
--- a/engine/cocci_vs_c.ml
+++ b/engine/cocci_vs_c.ml
@@ -3304,14 +3304,14 @@ and (struct_field: (A.annotated_field, B.field) matcher) =
 and enum_fields = fun eas ebs ->
   let match_dots ea =
     match A.unwrap ea with
-      A.Edots(mcode, optexpr) -> Some (mcode, optexpr)
+      A.EnumDots(mcode, optexpr) -> Some (mcode, optexpr)
     | _ -> None in
-  let build_dots (mcode, optexpr) = A.Edots(mcode, optexpr) in
+  let build_dots (mcode, optexpr) = A.EnumDots(mcode, optexpr) in
   let match_comma ea =
     match A.unwrap ea with
-      A.EComma ia1 -> Some ia1
+      A.EnumComma ia1 -> Some ia1
     | _ -> None in
-  let build_comma ia1 = A.EComma ia1 in
+  let build_comma ia1 = A.EnumComma ia1 in
   let match_metalist ea = None in
   let build_metalist _ (ida,leninfo,cstr,keep,inherited) =
     failwith "enum: build meta list: not possible" in
@@ -3326,29 +3326,21 @@ and enum_fields = fun eas ebs ->
 and enum_field ida idb =
   X.all_bound (A.get_inherited ida) >&&>
   match A.unwrap ida, idb with
-    A.Ident(id),(nameidb,None) ->
-      ident_cpp DontKnow id nameidb >>= (fun id nameidb ->
-        return ((A.Ident id) +> A.rewrap ida, (nameidb,None)))
-  | A.Ident(id),(nameidb,Some _) -> fail (* should we have an iso? *)
-  | A.Assignment(ea1,opa,ea2,init),(nameidb,Some(opbi,eb2)) ->
-      (match A.unwrap ea1 with
-	A.Ident(id) ->
-	  let assignOp opa0 opbi =
-	    match A.unwrap opa0 with
-              A.SimpleAssign oa ->
-		tokenf oa opbi >>= fun oa opbi ->
-		  return
-                    (A.rewrap opa (A.SimpleAssign oa), opbi)
-            | _ -> failwith "only simple assignment possible here" in
-	  ident_cpp DontKnow id nameidb >>= (fun id nameidb ->
-	  expression ea2 eb2 >>= (fun ea2 eb2 ->
-          assignOp opa opbi >>= (fun opa opbi ->(* only one kind of assignop *)
+    A.Enum(nameida,enum_vala),(nameidb,enum_valb) ->
+      (match enum_vala,enum_valb with
+        (None, Some _)
+      | (Some _, None) -> fail
+      | (None, None) ->
+         ident_cpp DontKnow nameida nameidb >>=
+         (fun nameida nameidb ->
+           return (A.Enum(nameida,None) +> A.rewrap ida, (nameidb,None)))
+      | (Some (eqa,evala), Some(eqb,evalb)) ->
+	  ident_cpp DontKnow nameida nameidb >>= (fun nameida nameidb ->
+          tokenf eqa eqb >>= (fun eqa eqb ->
+	  expression evala evalb >>= (fun ea eb ->
 	    return (
-	    (A.Assignment((A.Ident(id)) +> A.rewrap ea1,opa,ea2,init)) +>
-	    A.rewrap ida,
-	    (nameidb,Some(opbi,eb2))))))
-      |	_ -> failwith "enum: assignment: not possible")
-  | A.Assignment(ea1,opa,ea2,init),(nameidb,None) -> fail
+	    (A.Enum(nameida,Some(eqa,ea)) +> A.rewrap ida),
+	    (nameidb,Some(eqb,eb)))))))
   | _ -> failwith ("not possible: "^(Dumper.dump (A.unwrap ida)))
 
 (* ------------------------------------------------------------------------- *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
