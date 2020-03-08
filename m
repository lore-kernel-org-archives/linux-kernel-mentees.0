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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2E5C10F29
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35750206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFKI6UVD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35750206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1CCD586C9B;
	Sun,  8 Mar 2020 08:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZkriC8Th_bZ; Sun,  8 Mar 2020 08:44:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7969F86194;
	Sun,  8 Mar 2020 08:44:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7697EC1D7E;
	Sun,  8 Mar 2020 08:44:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5304C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C187F87C5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofhHSoV8F4pq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E0B7E87987
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:50 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d9so3301304pgu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9JAdyz2iBJMEmw31vFq2hVb+1Gs7bt49sVWPqgDF7jo=;
 b=aFKI6UVDaebs4uc00T2kHOJKk52T3qRsP3Gwu70aUiHEjuDyh9P+pxZR+aG/ATHxKm
 74xz6eoziCYnLFdcDxpZLBXb8ARP+B2QyNhRwFc3HIG1YDRsQKQX1AcehRsoGiZ8c5x0
 DaVopmNtsxyG69kQluqv3KfWAnFfSzJ1F/AeSVRZrqJzpchC5jgDuoxGaOZeyhOuWBXW
 kgonYqXyoJ1LOLcps2BMRgt0FD7jREQyL1Vxv+gZsxhUiNR31Bx20gmhWGLqWyO2/E85
 qDqOXH2m0TxgL/FIQhIIMSg1zLObuzCjXcmgOfdD81HKg8rNTz+dALYNF2NwrnGUwZK5
 oFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JAdyz2iBJMEmw31vFq2hVb+1Gs7bt49sVWPqgDF7jo=;
 b=HvWruwYtTGRGPJ2Vph9aPgNSRkX4sWYfJSc9UkU1XzIxQ0EH5M184dnQSUIDMuHxYA
 a5oFoQbk44tr/58pBv1eFqu8ipc4cAfrSE31T/uYp3j2/q8zLhnfWPxZI0HKHRGb3eah
 i001fiLsX3q5ThDEswtu0wx7dl4CPXK9fuN/KPMHNG4agi7ltRM5pfK7z53wRpcBuMNO
 53zUbQNlovcQMw1DeqdzfKZ7ohzHoSSo+hGfr6dAU3/MuEiFZuCdtYzC6Fg/OIwQN+NI
 SRI+q1PD86X9ih8Q+kbUp1vAVDNvD2ne2Ap1rO9rXqVgfgMlio6iEuV00m9NrzTdB0T6
 w4wg==
X-Gm-Message-State: ANhLgQ2hlQQXw3MNppZinH8eZ7CVsUqicw9E8URv+DIkCAYmd2vbS+Sb
 YmBoNf8e1TblqDIfN+aSZ5A=
X-Google-Smtp-Source: ADFU+vvTP/Sbamu6xSoHJndOb7H5rnt7WWsronG3SqCdb+hve+XroUgvYdE4Blp67RrvmTnpaHHEDA==
X-Received: by 2002:a63:450b:: with SMTP id s11mr11015506pga.45.1583657090377; 
 Sun, 08 Mar 2020 00:44:50 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:50 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:54 +0530
Message-Id: <20200308084356.14506-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 11/13] cocci: pretty print EnumDef as
	per enum_decl type
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

The SmPL AST has a separate enum_decl for a enumerator. Make
corresponding changes in Unparse_cocci and Pretty_print_cocci
to correctly pretty print enumerators.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_cocci.ml          | 27 ++++++++++++++++++++++++---
 parsing_cocci/pretty_print_cocci.ml | 18 +++++++++++++++++-
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 30e755e9..8dff2b81 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -738,7 +738,7 @@ and typeC ty =
   | Ast.EnumDef(ty,lb,ids,rb) ->
       fullType ty; ft_space ty;
       mcode print_string lb;
-      dots force_newline expression ids;
+      dots force_newline enum_decl ids;
       mcode print_string rb
   | Ast.StructUnionName(kind,name) ->
       mcode structUnion kind; print_option_prespace ident name
@@ -952,6 +952,24 @@ and annotated_field d =
   | Ast.OptField(decl) -> raise CantBeInPlus
   | Ast.Fdots(_,_) -> raise CantBeInPlus
 
+and enum_decl d =
+  match Ast.unwrap d with
+    Ast.Enum(name,enum_val) ->
+      ident name;
+      pr_space();
+      print_option
+        (function (eq,eval) ->
+          mcode print_string eq; pr_space(); expression eval) enum_val
+  | Ast.EnumComma(cm) ->
+      mcode (print_string_with_hint (SpaceOrNewline (ref " "))) cm
+  | Ast.EnumDots(dots,whencode) when generating ->
+      mcode print_string dots;
+      print_option
+      (function w ->
+        print_text "   when != ";
+        enum_decl w) whencode
+  | Ast.EnumDots(dots,whencode) -> raise CantBeInPlus
+
 (* --------------------------------------------------------------------- *)
 (* Initialiser *)
 
@@ -1420,6 +1438,7 @@ let pp_any = function
   | Ast.InitTag(x) -> initialiser false x; false
   | Ast.DeclarationTag(x) -> declaration x; false
   | Ast.FieldTag(x) -> field x; false
+  | Ast.EnumDeclTag(x) -> enum_decl x; false
 
   | Ast.StorageTag(x) -> storage x unknown unknown; false
   | Ast.IncFileTag(x) -> inc_file x unknown unknown; false
@@ -1473,6 +1492,7 @@ let pp_any = function
   | Ast.StmtDotsTag(x) -> dots force_newline (statement "") x; false
   | Ast.AnnDeclDotsTag(x) -> dots force_newline annotated_decl x; false
   | Ast.AnnFieldDotsTag(x) -> dots force_newline annotated_field x; false
+  | Ast.EnumDeclDotsTag(x) -> dots force_newline enum_decl x; false
   | Ast.DefParDotsTag(x) -> dots (fun _ -> ()) print_define_param x; false
 
   | Ast.TypeCTag(x) -> typeC x; false
@@ -1505,7 +1525,7 @@ in
 	      force_newline(); force_newline()
 	  | (Ast.Directive _::_)
 	  | (Ast.Rule_elemTag _::_) | (Ast.StatementTag _::_)
-	  | (Ast.FieldTag _::_) | (Ast.InitTag _::_)
+	  | (Ast.FieldTag _::_) | (Ast.EnumDeclTag _::_) | (Ast.InitTag _::_)
 	  | (Ast.DeclarationTag _::_) | (Ast.Token ("}",_)::_) -> prnl hd
 	  | _ -> () in
       let newline_after _ =
@@ -1516,7 +1536,8 @@ in
 	      (if isfn s then force_newline());
 	      force_newline()
 	  | (Ast.Directive _::_) | (Ast.StmtDotsTag _::_)
-	  | (Ast.Rule_elemTag _::_) | (Ast.FieldTag _::_) | (Ast.InitTag _::_)
+	  | (Ast.Rule_elemTag _::_) | (Ast.FieldTag _::_)
+	  | (Ast.EnumDeclTag _::_)| (Ast.InitTag _::_)
 	  | (Ast.DeclarationTag _::_) | (Ast.Token ("{",_)::_) ->
 	      force_newline()
 	  | _ -> () in
diff --git a/parsing_cocci/pretty_print_cocci.ml b/parsing_cocci/pretty_print_cocci.ml
index 6338e464..f6b2894f 100644
--- a/parsing_cocci/pretty_print_cocci.ml
+++ b/parsing_cocci/pretty_print_cocci.ml
@@ -439,7 +439,7 @@ and typeC ty =
       print_option (function x -> ident x; print_string " ") name
   | Ast.EnumDef(ty,lb,ids,rb) ->
       fullType ty; mcode print_string lb;
-      dots force_newline expression ids;
+      dots force_newline enum_decl ids;
       mcode print_string rb
   | Ast.StructUnionName(kind,name) ->
       mcode structUnion kind;
@@ -585,6 +585,20 @@ and annotated_field arity d =
   | Ast.ConjField(decls) -> print_disj_list (annotated_field arity) decls "&"
   | Ast.OptField(decl) -> print_string "?"; annotated_field arity decl
 
+and enum_decl d =
+  match Ast.unwrap d with
+    Ast.Enum(name,enum_val) ->
+      ident name;
+      (match enum_val with
+        None -> ()
+      | Some(eq,eval) ->
+          mcode print_string eq;
+          expression eval)
+  | Ast.EnumComma(cm) -> mcode print_string cm
+  | Ast.EnumDots(dots,Some whencode) ->
+      mcode print_string dots; print_string "   when != "; enum_decl whencode
+  | Ast.EnumDots(dots,None) -> mcode print_string dots
+
 (* --------------------------------------------------------------------- *)
 (* Initialiser *)
 
@@ -1090,6 +1104,7 @@ let _ =
     | Ast.InitTag(x) -> initialiser x
     | Ast.DeclarationTag(x) -> declaration x
     | Ast.FieldTag(x) -> field x
+    | Ast.EnumDeclTag(x) -> enum_decl x
     | Ast.StorageTag(x) -> storage x
     | Ast.IncFileTag(x) -> inc_file x
     | Ast.Rule_elemTag(x) -> rule_elem "" x
@@ -1110,6 +1125,7 @@ let _ =
     | Ast.StmtDotsTag(x) -> dots (function _ -> ()) (statement "") x
     | Ast.AnnDeclDotsTag(x) -> dots (function _ -> ()) (annotated_decl "") x
     | Ast.AnnFieldDotsTag(x) -> dots (function _ -> ()) (annotated_field "") x
+    | Ast.EnumDeclDotsTag(x) -> dots (function _ -> ()) enum_decl x
     | Ast.DefParDotsTag(x) -> dots (function _ -> ()) print_define_param x
     | Ast.TypeCTag(x) -> typeC x
     | Ast.ParamTag(x) -> parameterTypeDef x
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
