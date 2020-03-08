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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E4AC18E5B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E16206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clJc066d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E16206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82A5287C56;
	Sun,  8 Mar 2020 08:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANBTjkhnEKS6; Sun,  8 Mar 2020 08:44:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 928CA87987;
	Sun,  8 Mar 2020 08:44:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F8FAC1D7E;
	Sun,  8 Mar 2020 08:44:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60BCFC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5C7CA87A47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tot4Mp3C2C+r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9150A87987
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:27 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i13so3418698pfe.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q6bsRb5FM/CBzfw/Yg19d4VPJnQe18W85S5PoTpmYGE=;
 b=clJc066dLqZWnJjK6cnKSx/RXC0WDd5bUftQrmvV9pgiDpM+xtteXtySvH3XhhiaI0
 7tRe8Q2WKuQLDI5FwfQblpuPCjuzcsZKTgV5r2z5p0CLLUz9PYfUNfnz3BfpxbCH82uU
 FTciS6PfjQc28QfXP6GFVD/nykYpAK6eRc85HfBLKaMBJE58HftLUg9wbPldaBW2l0MW
 xozRJjK8sVHJNZ4jdPP+Ap5Kcj+9t8XSGHKYccnvfRmrZKsYHfrt9E0Fbn85sHfLy8V6
 fqIK+aLOVPvF95kDlOdU30/UXnXQeMxpx9EIrVG22Nd5hj/txjZHUT7RO/mzoHe7TNBz
 B6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q6bsRb5FM/CBzfw/Yg19d4VPJnQe18W85S5PoTpmYGE=;
 b=oy6nKg+sNKpIxJNkYLPlf3wRHwHHGw4G2OHfTxRCOrhuoZYhp2hgT8riUbuElyxxnR
 2Qx7of59F+K0DqTWqfg0dk572ZuPcFu909MAXpcqMpNpu7r+m/mNGBva3P+lZgusTThN
 F5QgGDrSZ4iBMpAt8vGSL+ar7gGxpQnqEx8ubhGtFEVpDKpIlYUPq1I1EyLe654ibuoZ
 nxGzGqJ3IQGM/HKQjY0vIQ2/4MYTWAh8EIktjc9+dauDo+nem1i49f847HMslnRlteD5
 QhROhIWSOdRBPAkNj7S1/mhAiBjKdGwGJjl3lUXuGaxNqCjdZ2/z7kvgv9w1HgX25lBb
 esgg==
X-Gm-Message-State: ANhLgQ0oNCbWfetfpYl6xz6MzR1WnBRm7j87jM7fC7QH8p2qw+4xJljj
 xgdJAGAIHsVtDgR0EBeGZQU=
X-Google-Smtp-Source: ADFU+vu1bMGketovHLqugbeyssswmgg/mlMbnrXsmrLOqiz+UvFFaQwNyHqXQ6U8lnj7BFIV3NEpVg==
X-Received: by 2002:a65:4cc1:: with SMTP id n1mr10630920pgt.94.1583657066752; 
 Sun, 08 Mar 2020 00:44:26 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:26 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:49 +0530
Message-Id: <20200308084356.14506-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 06/13] parsing_cocci: visitor_ast0:
	Add visitor functions for enum_decl
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

An enumerator in the SmPL AST now has the enum_decl type.
Add corresponding functions for the combiner, combiner_rebuilder
and rebuilder in Visitor_ast0.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast0.ml        | 72 ++++++++++++++++++++++++++--
 parsing_cocci/visitor_ast0.mli       |  4 ++
 parsing_cocci/visitor_ast0_types.ml  | 14 ++++++
 parsing_cocci/visitor_ast0_types.mli | 12 +++++
 4 files changed, 98 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/visitor_ast0.ml b/parsing_cocci/visitor_ast0.ml
index c282e1f8..e4ac82bc 100644
--- a/parsing_cocci/visitor_ast0.ml
+++ b/parsing_cocci/visitor_ast0.ml
@@ -22,8 +22,9 @@ let visitor mode bind option_default
     fix_mcode unary_mcode arithOp_mcode logicalOp_mcode cv_mcode sign_mcode
     struct_mcode storage_mcode inc_mcode
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
-    dotscasefn dotsdefparfn
+    dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn binaryOpfn tyfn initfn paramfn declfn fieldfn
+    enumdeclfn
     stmtfn forinfofn casefn string_fragmentfn topfn =
   let multibind l =
     let rec loop = function
@@ -63,6 +64,7 @@ let visitor mode bind option_default
   and statement_dots d = dotsfn dotsstmtfn statement all_functions d
   and declaration_dots d = dotsfn dotsdeclfn declaration all_functions d
   and field_dots d = dotsfn dotsfieldfn field all_functions d
+  and enum_decl_dots d = dotsfn dotsenumdeclfn enum_decl all_functions d
   and case_line_dots d = dotsfn dotscasefn case_line all_functions d
   and string_fragment_dots d = dotsfn strdotsfn string_fragment all_functions d
   and exec_code_dots d = dotsfn ecdotsfn exec_code all_functions d
@@ -358,7 +360,7 @@ let visitor mode bind option_default
 	| Ast0.EnumDef(ty,lb,ids,rb) ->
 	    let (ty_n,ty) = typeC ty in
 	    let (lb_n,lb) = string_mcode lb in
-	    let (ids_n,ids) = expression_dots ids in
+	    let (ids_n,ids) = enum_decl_dots ids in
 	    let (rb_n,rb) = string_mcode rb in
 	    (multibind [ty_n;lb_n;ids_n;rb_n], Ast0.EnumDef(ty,lb,ids,rb))
 	| Ast0.StructUnionName(kind,name) ->
@@ -622,6 +624,34 @@ let visitor mode bind option_default
 	    let (n,decl) = field decl in (n,Ast0.OptField(decl))) in
     fieldfn all_functions k d
 
+  and enum_decl d =
+    let k d =
+      rewrap d
+	(match Ast0.unwrap d with
+	  Ast0.Enum(name,enum_val) ->
+	    let (name_n,name) = ident name in
+            (match enum_val with
+              None -> (name_n,Ast0.Enum(name,None))
+            | Some(eq,eval) ->
+                let (eq_n,eq) = string_mcode eq in
+                let (eval_n,eval) = expression eval in
+                (multibind [name_n; eq_n; eval_n],
+                 Ast0.Enum(name,Some(eq,eval))))
+	| Ast0.EnumComma(cm) ->
+	    let (cm_n,cm) = string_mcode cm in
+	    (cm_n,Ast0.EnumComma(cm))
+	| Ast0.EnumDots(dots,whencode) ->
+	    let (dots_n,dots) = string_mcode dots in
+	    let (whencode_n, whencode) = match whencode with
+              | Some (a,b,c) ->
+                  let (_,a2) = string_mcode a in
+                  let (_,b2) = string_mcode b in
+                  let (c1,c2) = enum_decl c in (c1, Some (a2,b2,c2))
+              | None -> (option_default, None) in
+	    (bind dots_n whencode_n, Ast0.EnumDots(dots,whencode))) in
+    enumdeclfn all_functions k d
+
+
   and initialiser i =
     let k i =
       rewrap i
@@ -1121,6 +1151,9 @@ let visitor mode bind option_default
       | Ast0.DotsFieldTag(decls) ->
 	  let (decls_n,decls) = field_dots decls in
 	  (decls_n,Ast0.DotsFieldTag(decls))
+      | Ast0.DotsEnumDeclTag(decls) ->
+	  let (decls_n,decls) = enum_decl_dots decls in
+	  (decls_n,Ast0.DotsEnumDeclTag(decls))
       | Ast0.DotsCaseTag(cases) ->
 	  let (cases_n,cases) = case_line_dots cases in
 	  (cases_n,Ast0.DotsCaseTag(cases))
@@ -1160,6 +1193,9 @@ let visitor mode bind option_default
       | Ast0.FieldTag(decl) ->
 	  let (decl_n,decl) = field decl in
 	  (decl_n,Ast0.FieldTag(decl))
+      | Ast0.EnumDeclTag(decl) ->
+	  let (decl_n,decl) = enum_decl decl in
+	  (decl_n,Ast0.EnumDeclTag(decl))
       | Ast0.StmtTag(stmt) ->
 	  let (stmt_n,stmt) = statement stmt in
 	  (stmt_n,Ast0.StmtTag(stmt))
@@ -1204,6 +1240,7 @@ let visitor mode bind option_default
       VT0.typeC = typeC;
       VT0.declaration = declaration;
       VT0.field = field;
+      VT0.enum_decl = enum_decl;
       VT0.initialiser = initialiser;
       VT0.initialiser_list = initialiser_dots;
       VT0.parameter = parameterTypeDef;
@@ -1218,6 +1255,7 @@ let visitor mode bind option_default
       VT0.statement_dots = statement_dots;
       VT0.declaration_dots = declaration_dots;
       VT0.field_dots = field_dots;
+      VT0.enum_decl_dots = enum_decl_dots;
       VT0.case_line_dots = case_line_dots;
       VT0.define_param_dots = define_param_dots;
       VT0.anything = anything} in
@@ -1244,6 +1282,7 @@ let combiner_functions =
    VT0.combiner_dotsstmtfn = (fun r k e -> k e);
    VT0.combiner_dotsdeclfn = (fun r k e -> k e);
    VT0.combiner_dotsfieldfn = (fun r k e -> k e);
+   VT0.combiner_dotsenumdeclfn = (fun r k e -> k e);
    VT0.combiner_dotscasefn = (fun r k e -> k e);
    VT0.combiner_dotsdefparfn = (fun r k e -> k e);
    VT0.combiner_identfn = (fun r k e -> k e);
@@ -1255,6 +1294,7 @@ let combiner_functions =
    VT0.combiner_paramfn = (fun r k e -> k e);
    VT0.combiner_declfn = (fun r k e -> k e);
    VT0.combiner_fieldfn = (fun r k e -> k e);
+   VT0.combiner_enumdeclfn = (fun r k e -> k e);
    VT0.combiner_stmtfn = (fun r k e -> k e);
    VT0.combiner_forinfofn = (fun r k e -> k e);
    VT0.combiner_casefn = (fun r k e -> k e);
@@ -1278,6 +1318,8 @@ let combiner_dz r =
       (function e -> let (n,_) = r.VT0.declaration e in n);
       VT0.combiner_rec_field =
       (function e -> let (n,_) = r.VT0.field e in n);
+      VT0.combiner_rec_enumdecl =
+      (function e -> let (n,_) = r.VT0.enum_decl e in n);
       VT0.combiner_rec_initialiser =
       (function e -> let (n,_) = r.VT0.initialiser e in n);
       VT0.combiner_rec_initialiser_list =
@@ -1306,6 +1348,8 @@ let combiner_dz r =
       (function e -> let (n,_) = r.VT0.declaration_dots e in n);
       VT0.combiner_rec_field_dots =
       (function e -> let (n,_) = r.VT0.field_dots e in n);
+      VT0.combiner_rec_enum_decl_dots =
+      (function e -> let (n,_) = r.VT0.enum_decl_dots e in n);
       VT0.combiner_rec_case_line_dots =
       (function e -> let (n,_) = r.VT0.case_line_dots e in n);
       VT0.combiner_rec_define_param_dots =
@@ -1343,6 +1387,7 @@ let combiner bind option_default functions =
     (fun r k e -> (functions.VT0.combiner_dotsstmtfn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_dotsdeclfn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_dotsfieldfn (dz r) (xk k) e, e))
+    (fun r k e -> (functions.VT0.combiner_dotsenumdeclfn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_dotscasefn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_dotsdefparfn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_identfn (dz r) (xk k) e, e))
@@ -1354,6 +1399,7 @@ let combiner bind option_default functions =
     (fun r k e -> (functions.VT0.combiner_paramfn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_declfn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_fieldfn (dz r) (xk k) e, e))
+    (fun r k e -> (functions.VT0.combiner_enumdeclfn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_stmtfn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_forinfofn (dz r) (xk k) e, e))
     (fun r k e -> (functions.VT0.combiner_casefn (dz r) (xk k) e, e))
@@ -1365,8 +1411,9 @@ let flat_combiner bind option_default
     fix_mcode unary_mcode arithOp_mcode logicalOp_mcode cv_mcode sign_mcode
     struct_mcode storage_mcode inc_mcode
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
-    dotscasefn dotsdefparfn
+    dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn binaryOpfn tyfn initfn paramfn declfn fieldfn
+    enumdeclfn
     stmtfn forinfofn casefn string_fragmentfn topfn =
   let dz = combiner_dz in
   let xk k e = let (n,_) = k e in n in
@@ -1391,6 +1438,7 @@ let flat_combiner bind option_default
     (fun r k e -> (dotsstmtfn (dz r) (xk k) e, e))
     (fun r k e -> (dotsdeclfn (dz r) (xk k) e, e))
     (fun r k e -> (dotsfieldfn (dz r) (xk k) e, e))
+    (fun r k e -> (dotsenumdeclfn (dz r) (xk k) e, e))
     (fun r k e -> (dotscasefn (dz r) (xk k) e, e))
     (fun r k e -> (dotsdefparfn (dz r) (xk k) e, e))
     (fun r k e -> (identfn (dz r) (xk k) e, e))
@@ -1402,6 +1450,7 @@ let flat_combiner bind option_default
     (fun r k e -> (paramfn (dz r) (xk k) e, e))
     (fun r k e -> (declfn (dz r) (xk k) e, e))
     (fun r k e -> (fieldfn (dz r) (xk k) e, e))
+    (fun r k e -> (enumdeclfn (dz r) (xk k) e, e))
     (fun r k e -> (stmtfn (dz r) (xk k) e, e))
     (fun r k e -> (forinfofn (dz r) (xk k) e, e))
     (fun r k e -> (casefn (dz r) (xk k) e, e))
@@ -1429,6 +1478,7 @@ let rebuilder_functions =
    VT0.rebuilder_dotsstmtfn = (fun r k e -> k e);
    VT0.rebuilder_dotsdeclfn = (fun r k e -> k e);
    VT0.rebuilder_dotsfieldfn = (fun r k e -> k e);
+   VT0.rebuilder_dotsenumdeclfn = (fun r k e -> k e);
    VT0.rebuilder_dotscasefn = (fun r k e -> k e);
    VT0.rebuilder_dotsdefparfn = (fun r k e -> k e);
    VT0.rebuilder_identfn = (fun r k e -> k e);
@@ -1440,6 +1490,7 @@ let rebuilder_functions =
    VT0.rebuilder_paramfn = (fun r k e -> k e);
    VT0.rebuilder_declfn = (fun r k e -> k e);
    VT0.rebuilder_fieldfn = (fun r k e -> k e);
+   VT0.rebuilder_enumdeclfn = (fun r k e -> k e);
    VT0.rebuilder_stmtfn = (fun r k e -> k e);
    VT0.rebuilder_forinfofn = (fun r k e -> k e);
    VT0.rebuilder_casefn = (fun r k e -> k e);
@@ -1463,6 +1514,8 @@ let rebuilder_dz r =
       (function e -> let (_,e) = r.VT0.declaration e in e);
       VT0.rebuilder_rec_field =
       (function e -> let (_,e) = r.VT0.field e in e);
+      VT0.rebuilder_rec_enumdecl =
+      (function e -> let (_,e) = r.VT0.enum_decl e in e);
       VT0.rebuilder_rec_initialiser =
       (function e -> let (_,e) = r.VT0.initialiser e in e);
       VT0.rebuilder_rec_initialiser_list =
@@ -1489,6 +1542,8 @@ let rebuilder_dz r =
       (function e -> let (_,e) = r.VT0.declaration_dots e in e);
       VT0.rebuilder_rec_field_dots =
       (function e -> let (_,e) = r.VT0.field_dots e in e);
+      VT0.rebuilder_rec_enum_decl_dots =
+      (function e -> let (_,e) = r.VT0.enum_decl_dots e in e);
       VT0.rebuilder_rec_case_line_dots =
       (function e -> let (_,e) = r.VT0.case_line_dots e in e);
       VT0.rebuilder_rec_define_param_dots =
@@ -1521,6 +1576,7 @@ let rebuilder functions =
     (fun r k e -> ((),functions.VT0.rebuilder_dotsstmtfn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_dotsdeclfn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_dotsfieldfn (dz r) (xk k) e))
+    (fun r k e -> ((),functions.VT0.rebuilder_dotsenumdeclfn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_dotscasefn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_dotsdefparfn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_identfn (dz r) (xk k) e))
@@ -1532,6 +1588,7 @@ let rebuilder functions =
     (fun r k e -> ((),functions.VT0.rebuilder_paramfn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_declfn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_fieldfn (dz r) (xk k) e))
+    (fun r k e -> ((),functions.VT0.rebuilder_enumdeclfn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_stmtfn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_forinfofn (dz r) (xk k) e))
     (fun r k e -> ((),functions.VT0.rebuilder_casefn (dz r) (xk k) e))
@@ -1545,8 +1602,9 @@ let flat_rebuilder
     arithOp_mcode logicalOp_mcode cv_mcode sign_mcode struct_mcode
     storage_mcode inc_mcode
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
-    dotscasefn dotsdefparfn
+    dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn arithOpfn tyfn initfn paramfn declfn fieldfn
+    enumdeclfn
     stmtfn forinfofn casefn string_fragmentfn topfn =
   let dz = rebuilder_dz in
   let xk k e = let (_,e) = k e in e in
@@ -1572,6 +1630,7 @@ let flat_rebuilder
     (fun r k e -> ((),dotsstmtfn (dz r) (xk k) e))
     (fun r k e -> ((),dotsdeclfn (dz r) (xk k) e))
     (fun r k e -> ((),dotsfieldfn (dz r) (xk k) e))
+    (fun r k e -> ((),dotsenumdeclfn (dz r) (xk k) e))
     (fun r k e -> ((),dotscasefn (dz r) (xk k) e))
     (fun r k e -> ((),dotsdefparfn (dz r) (xk k) e))
     (fun r k e -> ((),identfn (dz r) (xk k) e))
@@ -1583,6 +1642,7 @@ let flat_rebuilder
     (fun r k e -> ((),paramfn (dz r) (xk k) e))
     (fun r k e -> ((),declfn (dz r) (xk k) e))
     (fun r k e -> ((),fieldfn (dz r) (xk k) e))
+    (fun r k e -> ((),enumdeclfn (dz r) (xk k) e))
     (fun r k e -> ((),stmtfn (dz r) (xk k) e))
     (fun r k e -> ((),forinfofn (dz r) (xk k) e))
     (fun r k e -> ((),casefn (dz r) (xk k) e))
@@ -1624,6 +1684,7 @@ let combiner_rebuilder_functions =
    VT0.combiner_rebuilder_dotsstmtfn = (fun r k e -> k e);
    VT0.combiner_rebuilder_dotsdeclfn = (fun r k e -> k e);
    VT0.combiner_rebuilder_dotsfieldfn = (fun r k e -> k e);
+   VT0.combiner_rebuilder_dotsenumdeclfn = (fun r k e -> k e);
    VT0.combiner_rebuilder_dotscasefn = (fun r k e -> k e);
    VT0.combiner_rebuilder_dotsdefparfn = (fun r k e -> k e);
    VT0.combiner_rebuilder_identfn = (fun r k e -> k e);
@@ -1635,6 +1696,7 @@ let combiner_rebuilder_functions =
    VT0.combiner_rebuilder_paramfn = (fun r k e -> k e);
    VT0.combiner_rebuilder_declfn = (fun r k e -> k e);
    VT0.combiner_rebuilder_fieldfn = (fun r k e -> k e);
+   VT0.combiner_rebuilder_enumdeclfn = (fun r k e -> k e);
    VT0.combiner_rebuilder_stmtfn = (fun r k e -> k e);
    VT0.combiner_rebuilder_forinfofn = (fun r k e -> k e);
    VT0.combiner_rebuilder_casefn = (fun r k e -> k e);
@@ -1663,6 +1725,7 @@ let combiner_rebuilder bind option_default functions =
     functions.VT0.combiner_rebuilder_dotsstmtfn
     functions.VT0.combiner_rebuilder_dotsdeclfn
     functions.VT0.combiner_rebuilder_dotsfieldfn
+    functions.VT0.combiner_rebuilder_dotsenumdeclfn
     functions.VT0.combiner_rebuilder_dotscasefn
     functions.VT0.combiner_rebuilder_dotsdefparfn
     functions.VT0.combiner_rebuilder_identfn
@@ -1674,6 +1737,7 @@ let combiner_rebuilder bind option_default functions =
     functions.VT0.combiner_rebuilder_paramfn
     functions.VT0.combiner_rebuilder_declfn
     functions.VT0.combiner_rebuilder_fieldfn
+    functions.VT0.combiner_rebuilder_enumdeclfn
     functions.VT0.combiner_rebuilder_stmtfn
     functions.VT0.combiner_rebuilder_forinfofn
     functions.VT0.combiner_rebuilder_casefn
diff --git a/parsing_cocci/visitor_ast0.mli b/parsing_cocci/visitor_ast0.mli
index 5784e9e6..e801c983 100644
--- a/parsing_cocci/visitor_ast0.mli
+++ b/parsing_cocci/visitor_ast0.mli
@@ -33,6 +33,7 @@ val flat_combiner :
     ((Ast0_cocci.statement Ast0_cocci.dots,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.declaration Ast0_cocci.dots,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.field Ast0_cocci.dots,'a) Visitor_ast0_types.ccode) ->
+    ((Ast0_cocci.enum_decl Ast0_cocci.dots,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.case_line Ast0_cocci.dots,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.define_param Ast0_cocci.dots,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.ident,'a) Visitor_ast0_types.ccode) ->
@@ -44,6 +45,7 @@ val flat_combiner :
     ((Ast0_cocci.parameterTypeDef,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.declaration,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.field,'a) Visitor_ast0_types.ccode) ->
+    ((Ast0_cocci.enum_decl,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.statement,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.forinfo,'a) Visitor_ast0_types.ccode) ->
     ((Ast0_cocci.case_line,'a) Visitor_ast0_types.ccode) ->
@@ -76,6 +78,7 @@ val flat_rebuilder :
     (Ast0_cocci.statement Ast0_cocci.dots Visitor_ast0_types.rcode) ->
     (Ast0_cocci.declaration Ast0_cocci.dots Visitor_ast0_types.rcode) ->
     (Ast0_cocci.field Ast0_cocci.dots Visitor_ast0_types.rcode) ->
+    (Ast0_cocci.enum_decl Ast0_cocci.dots Visitor_ast0_types.rcode) ->
     (Ast0_cocci.case_line Ast0_cocci.dots Visitor_ast0_types.rcode) ->
     (Ast0_cocci.define_param Ast0_cocci.dots Visitor_ast0_types.rcode) ->
     (Ast0_cocci.ident Visitor_ast0_types.rcode) ->
@@ -87,6 +90,7 @@ val flat_rebuilder :
     (Ast0_cocci.parameterTypeDef Visitor_ast0_types.rcode) ->
     (Ast0_cocci.declaration Visitor_ast0_types.rcode) ->
     (Ast0_cocci.field Visitor_ast0_types.rcode) ->
+    (Ast0_cocci.enum_decl Visitor_ast0_types.rcode) ->
     (Ast0_cocci.statement Visitor_ast0_types.rcode) ->
     (Ast0_cocci.forinfo Visitor_ast0_types.rcode) ->
     (Ast0_cocci.case_line Visitor_ast0_types.rcode) ->
diff --git a/parsing_cocci/visitor_ast0_types.ml b/parsing_cocci/visitor_ast0_types.ml
index c24a0c0a..7a00c702 100644
--- a/parsing_cocci/visitor_ast0_types.ml
+++ b/parsing_cocci/visitor_ast0_types.ml
@@ -18,6 +18,7 @@ type 'n all_functions =
       typeC : (Ast0.typeC,'n) inout;
       declaration : (Ast0.declaration,'n) inout;
       field : (Ast0.field,'n) inout;
+      enum_decl : (Ast0.enum_decl,'n) inout;
       initialiser : (Ast0.initialiser,'n) inout;
       initialiser_list : (Ast0.initialiser_list,'n) inout;
       parameter : (Ast0.parameterTypeDef,'n) inout;
@@ -32,6 +33,7 @@ type 'n all_functions =
       statement_dots : (Ast0.statement Ast0.dots,'n) inout;
       declaration_dots : (Ast0.declaration Ast0.dots,'n) inout;
       field_dots : (Ast0.field Ast0.dots,'n) inout;
+      enum_decl_dots : (Ast0.enum_decl Ast0.dots,'n) inout;
       case_line_dots : (Ast0.case_line Ast0.dots,'n) inout;
       define_param_dots : (Ast0.define_param Ast0.dots,'n) inout;
       anything : (Ast0.anything,'n) inout}
@@ -50,6 +52,7 @@ type 'n combiner_rec_functions =
       combiner_rec_typeC : (Ast0.typeC,'n) combiner_inout;
       combiner_rec_declaration : (Ast0.declaration,'n) combiner_inout;
       combiner_rec_field : (Ast0.field,'n) combiner_inout;
+      combiner_rec_enumdecl : (Ast0.enum_decl,'n) combiner_inout;
       combiner_rec_initialiser : (Ast0.initialiser,'n) combiner_inout;
       combiner_rec_initialiser_list :
 	(Ast0.initialiser_list,'n) combiner_inout;
@@ -69,6 +72,8 @@ type 'n combiner_rec_functions =
 	(Ast0.declaration Ast0.dots,'n) combiner_inout;
       combiner_rec_field_dots :
 	(Ast0.field Ast0.dots,'n) combiner_inout;
+      combiner_rec_enum_decl_dots :
+	(Ast0.enum_decl Ast0.dots,'n) combiner_inout;
       combiner_rec_case_line_dots :
 	(Ast0.case_line Ast0.dots,'n) combiner_inout;
       combiner_rec_define_param_dots :
@@ -100,6 +105,7 @@ type 'n combiner_functions =
    combiner_dotsstmtfn : (Ast0.statement Ast0.dots,'n) ccode;
    combiner_dotsdeclfn : (Ast0.declaration Ast0.dots,'n) ccode;
    combiner_dotsfieldfn : (Ast0.field Ast0.dots,'n) ccode;
+   combiner_dotsenumdeclfn : (Ast0.enum_decl Ast0.dots,'n) ccode;
    combiner_dotscasefn : (Ast0.case_line Ast0.dots,'n) ccode;
    combiner_dotsdefparfn : (Ast0.define_param Ast0.dots,'n) ccode;
    combiner_identfn : (Ast0.ident,'n) ccode;
@@ -111,6 +117,7 @@ type 'n combiner_functions =
    combiner_paramfn : (Ast0.parameterTypeDef,'n) ccode;
    combiner_declfn : (Ast0.declaration,'n) ccode;
    combiner_fieldfn : (Ast0.field,'n) ccode;
+   combiner_enumdeclfn : (Ast0.enum_decl,'n) ccode;
    combiner_stmtfn : (Ast0.statement,'n) ccode;
    combiner_forinfofn : (Ast0.forinfo,'n) ccode;
    combiner_casefn : (Ast0.case_line,'n) ccode;
@@ -131,6 +138,7 @@ type rebuilder_rec_functions =
       rebuilder_rec_typeC : Ast0.typeC rebuilder_inout;
       rebuilder_rec_declaration : Ast0.declaration rebuilder_inout;
       rebuilder_rec_field : Ast0.field rebuilder_inout;
+      rebuilder_rec_enumdecl : Ast0.enum_decl rebuilder_inout;
       rebuilder_rec_initialiser : Ast0.initialiser rebuilder_inout;
       rebuilder_rec_initialiser_list :
 	Ast0.initialiser_list rebuilder_inout;
@@ -149,6 +157,8 @@ type rebuilder_rec_functions =
 	Ast0.declaration Ast0.dots rebuilder_inout;
       rebuilder_rec_field_dots :
 	Ast0.field Ast0.dots rebuilder_inout;
+      rebuilder_rec_enum_decl_dots :
+	Ast0.enum_decl Ast0.dots rebuilder_inout;
       rebuilder_rec_case_line_dots :
 	Ast0.case_line Ast0.dots rebuilder_inout;
       rebuilder_rec_define_param_dots :
@@ -180,6 +190,7 @@ type rebuilder_functions =
    rebuilder_dotsstmtfn : Ast0.statement Ast0.dots rcode;
    rebuilder_dotsdeclfn : Ast0.declaration Ast0.dots rcode;
    rebuilder_dotsfieldfn : Ast0.field Ast0.dots rcode;
+   rebuilder_dotsenumdeclfn : Ast0.enum_decl Ast0.dots rcode;
    rebuilder_dotscasefn : Ast0.case_line Ast0.dots rcode;
    rebuilder_dotsdefparfn : Ast0.define_param Ast0.dots rcode;
    rebuilder_identfn : Ast0.ident rcode;
@@ -192,6 +203,7 @@ type rebuilder_functions =
    rebuilder_paramfn : Ast0.parameterTypeDef rcode;
    rebuilder_declfn : Ast0.declaration rcode;
    rebuilder_fieldfn : Ast0.field rcode;
+   rebuilder_enumdeclfn : Ast0.enum_decl rcode;
    rebuilder_stmtfn : Ast0.statement rcode;
    rebuilder_forinfofn : Ast0.forinfo rcode;
    rebuilder_casefn : Ast0.case_line rcode;
@@ -227,6 +239,7 @@ type 'n combiner_rebuilder_functions =
    combiner_rebuilder_dotsstmtfn : (Ast0.statement Ast0.dots,'n) rccode;
    combiner_rebuilder_dotsdeclfn : (Ast0.declaration Ast0.dots,'n) rccode;
    combiner_rebuilder_dotsfieldfn : (Ast0.field Ast0.dots,'n) rccode;
+   combiner_rebuilder_dotsenumdeclfn : (Ast0.enum_decl Ast0.dots,'n) rccode;
    combiner_rebuilder_dotscasefn : (Ast0.case_line Ast0.dots,'n) rccode;
    combiner_rebuilder_dotsdefparfn : (Ast0.define_param Ast0.dots,'n) rccode;
    combiner_rebuilder_identfn : (Ast0.ident,'n) rccode;
@@ -238,6 +251,7 @@ type 'n combiner_rebuilder_functions =
    combiner_rebuilder_paramfn : (Ast0.parameterTypeDef,'n) rccode;
    combiner_rebuilder_declfn : (Ast0.declaration,'n) rccode;
    combiner_rebuilder_fieldfn : (Ast0.field,'n) rccode;
+   combiner_rebuilder_enumdeclfn : (Ast0.enum_decl,'n) rccode;
    combiner_rebuilder_stmtfn : (Ast0.statement,'n) rccode;
    combiner_rebuilder_forinfofn : (Ast0.forinfo,'n) rccode;
    combiner_rebuilder_casefn : (Ast0.case_line,'n) rccode;
diff --git a/parsing_cocci/visitor_ast0_types.mli b/parsing_cocci/visitor_ast0_types.mli
index 78e3b804..d06baaf7 100644
--- a/parsing_cocci/visitor_ast0_types.mli
+++ b/parsing_cocci/visitor_ast0_types.mli
@@ -8,6 +8,7 @@ type 'n all_functions = {
   typeC : (Ast0_cocci.typeC, 'n) inout;
   declaration : (Ast0_cocci.declaration, 'n) inout;
   field : (Ast0_cocci.field, 'n) inout;
+  enum_decl : (Ast0_cocci.enum_decl,'n) inout;
   initialiser : (Ast0_cocci.initialiser, 'n) inout;
   initialiser_list : (Ast0_cocci.initialiser_list, 'n) inout;
   parameter : (Ast0_cocci.parameterTypeDef, 'n) inout;
@@ -22,6 +23,7 @@ type 'n all_functions = {
   statement_dots : (Ast0_cocci.statement Ast0_cocci.dots, 'n) inout;
   declaration_dots : (Ast0_cocci.declaration Ast0_cocci.dots, 'n) inout;
   field_dots : (Ast0_cocci.field Ast0_cocci.dots, 'n) inout;
+  enum_decl_dots : (Ast0_cocci.enum_decl Ast0_cocci.dots, 'n) inout;
   case_line_dots : (Ast0_cocci.case_line Ast0_cocci.dots, 'n) inout;
   define_param_dots : (Ast0_cocci.define_param Ast0_cocci.dots, 'n) inout;
   anything : (Ast0_cocci.anything, 'n) inout;
@@ -36,6 +38,7 @@ type 'n combiner_rec_functions = {
   combiner_rec_typeC : (Ast0_cocci.typeC, 'n) combiner_inout;
   combiner_rec_declaration : (Ast0_cocci.declaration, 'n) combiner_inout;
   combiner_rec_field : (Ast0_cocci.field, 'n) combiner_inout;
+  combiner_rec_enumdecl : (Ast0_cocci.enum_decl,'n) combiner_inout;
   combiner_rec_initialiser : (Ast0_cocci.initialiser, 'n) combiner_inout;
   combiner_rec_initialiser_list : (Ast0_cocci.initialiser_list, 'n) combiner_inout;
   combiner_rec_parameter : (Ast0_cocci.parameterTypeDef, 'n) combiner_inout;
@@ -52,6 +55,7 @@ type 'n combiner_rec_functions = {
   combiner_rec_declaration_dots :
     (Ast0_cocci.declaration Ast0_cocci.dots, 'n) combiner_inout;
   combiner_rec_field_dots : (Ast0_cocci.field Ast0_cocci.dots, 'n) combiner_inout;
+  combiner_rec_enum_decl_dots : (Ast0_cocci.enum_decl Ast0_cocci.dots, 'n) combiner_inout;
   combiner_rec_case_line_dots : (Ast0_cocci.case_line Ast0_cocci.dots, 'n) combiner_inout;
   combiner_rec_define_param_dots :
     (Ast0_cocci.define_param Ast0_cocci.dots, 'n) combiner_inout;
@@ -81,6 +85,7 @@ type 'n combiner_functions = {
   combiner_dotsstmtfn : (Ast0_cocci.statement Ast0_cocci.dots, 'n) ccode;
   combiner_dotsdeclfn : (Ast0_cocci.declaration Ast0_cocci.dots, 'n) ccode;
   combiner_dotsfieldfn : (Ast0_cocci.field Ast0_cocci.dots, 'n) ccode;
+  combiner_dotsenumdeclfn : (Ast0_cocci.enum_decl Ast0_cocci.dots, 'n) ccode;
   combiner_dotscasefn : (Ast0_cocci.case_line Ast0_cocci.dots, 'n) ccode;
   combiner_dotsdefparfn : (Ast0_cocci.define_param Ast0_cocci.dots, 'n) ccode;
   combiner_identfn : (Ast0_cocci.ident, 'n) ccode;
@@ -92,6 +97,7 @@ type 'n combiner_functions = {
   combiner_paramfn : (Ast0_cocci.parameterTypeDef, 'n) ccode;
   combiner_declfn : (Ast0_cocci.declaration, 'n) ccode;
   combiner_fieldfn : (Ast0_cocci.field, 'n) ccode;
+  combiner_enumdeclfn : (Ast0_cocci.enum_decl,'n) ccode;
   combiner_stmtfn : (Ast0_cocci.statement, 'n) ccode;
   combiner_forinfofn : (Ast0_cocci.forinfo, 'n) ccode;
   combiner_casefn : (Ast0_cocci.case_line, 'n) ccode;
@@ -108,6 +114,7 @@ type rebuilder_rec_functions = {
   rebuilder_rec_typeC : Ast0_cocci.typeC rebuilder_inout;
   rebuilder_rec_declaration : Ast0_cocci.declaration rebuilder_inout;
   rebuilder_rec_field : Ast0_cocci.field rebuilder_inout;
+  rebuilder_rec_enumdecl : Ast0_cocci.enum_decl rebuilder_inout;
   rebuilder_rec_initialiser : Ast0_cocci.initialiser rebuilder_inout;
   rebuilder_rec_initialiser_list : Ast0_cocci.initialiser_list rebuilder_inout;
   rebuilder_rec_parameter : Ast0_cocci.parameterTypeDef rebuilder_inout;
@@ -121,6 +128,7 @@ type rebuilder_rec_functions = {
   rebuilder_rec_statement_dots : Ast0_cocci.statement Ast0_cocci.dots rebuilder_inout;
   rebuilder_rec_declaration_dots : Ast0_cocci.declaration Ast0_cocci.dots rebuilder_inout;
   rebuilder_rec_field_dots : Ast0_cocci.field Ast0_cocci.dots rebuilder_inout;
+  rebuilder_rec_enum_decl_dots : Ast0_cocci.enum_decl Ast0_cocci.dots rebuilder_inout;
   rebuilder_rec_case_line_dots : Ast0_cocci.case_line Ast0_cocci.dots rebuilder_inout;
   rebuilder_rec_define_param_dots :
     Ast0_cocci.define_param Ast0_cocci.dots rebuilder_inout;
@@ -150,6 +158,7 @@ type rebuilder_functions = {
   rebuilder_dotsstmtfn : Ast0_cocci.statement Ast0_cocci.dots rcode;
   rebuilder_dotsdeclfn : Ast0_cocci.declaration Ast0_cocci.dots rcode;
   rebuilder_dotsfieldfn : Ast0_cocci.field Ast0_cocci.dots rcode;
+  rebuilder_dotsenumdeclfn : Ast0_cocci.enum_decl Ast0_cocci.dots rcode;
   rebuilder_dotscasefn : Ast0_cocci.case_line Ast0_cocci.dots rcode;
   rebuilder_dotsdefparfn : Ast0_cocci.define_param Ast0_cocci.dots rcode;
   rebuilder_identfn : Ast0_cocci.ident rcode;
@@ -161,6 +170,7 @@ type rebuilder_functions = {
   rebuilder_paramfn : Ast0_cocci.parameterTypeDef rcode;
   rebuilder_declfn : Ast0_cocci.declaration rcode;
   rebuilder_fieldfn : Ast0_cocci.field rcode;
+  rebuilder_enumdeclfn : Ast0_cocci.enum_decl rcode;
   rebuilder_stmtfn : Ast0_cocci.statement rcode;
   rebuilder_forinfofn : Ast0_cocci.forinfo rcode;
   rebuilder_casefn : Ast0_cocci.case_line rcode;
@@ -192,6 +202,7 @@ type 'n combiner_rebuilder_functions = {
   combiner_rebuilder_dotsstmtfn : (Ast0_cocci.statement Ast0_cocci.dots, 'n) rccode;
   combiner_rebuilder_dotsdeclfn : (Ast0_cocci.declaration Ast0_cocci.dots, 'n) rccode;
   combiner_rebuilder_dotsfieldfn : (Ast0_cocci.field Ast0_cocci.dots, 'n) rccode;
+  combiner_rebuilder_dotsenumdeclfn : (Ast0_cocci.enum_decl Ast0_cocci.dots, 'n) rccode;
   combiner_rebuilder_dotscasefn : (Ast0_cocci.case_line Ast0_cocci.dots, 'n) rccode;
   combiner_rebuilder_dotsdefparfn : (Ast0_cocci.define_param Ast0_cocci.dots, 'n) rccode;
   combiner_rebuilder_identfn : (Ast0_cocci.ident, 'n) rccode;
@@ -203,6 +214,7 @@ type 'n combiner_rebuilder_functions = {
   combiner_rebuilder_paramfn : (Ast0_cocci.parameterTypeDef, 'n) rccode;
   combiner_rebuilder_declfn : (Ast0_cocci.declaration, 'n) rccode;
   combiner_rebuilder_fieldfn : (Ast0_cocci.field, 'n) rccode;
+  combiner_rebuilder_enumdeclfn : (Ast0_cocci.enum_decl,'n) rccode;
   combiner_rebuilder_stmtfn : (Ast0_cocci.statement, 'n) rccode;
   combiner_rebuilder_forinfofn : (Ast0_cocci.forinfo, 'n) rccode;
   combiner_rebuilder_casefn : (Ast0_cocci.case_line, 'n) rccode;
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
