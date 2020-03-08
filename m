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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB75EC18E5F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF03206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTIESWNF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DF03206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 549FB204BE;
	Sun,  8 Mar 2020 08:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AL4NksplU6Mp; Sun,  8 Mar 2020 08:44:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 44DE520004;
	Sun,  8 Mar 2020 08:44:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34C01C1D7E;
	Sun,  8 Mar 2020 08:44:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7ED5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E509786C51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ht71WzH7W7Sx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 808CB861FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:16 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m5so3308530pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nSi+dgPVv0xkezcYKd48ZE1X5GOqXzTJa3ohoO1Apmo=;
 b=MTIESWNFcQY2QWPO5eMS6C7CeqW7anSsU6Z793Utd9GI6wnXL4pEk6xRykG5QdhVcF
 HTrfsorFLXxMQU9sFg3glWtpvetTEobTHK3vDRFK7ZsU1ztOqTXPeEu7PemJe+gMsZvd
 fB72E4Rn+xuY04AnURROZFtXiTrmSqYTEW5zxtRSe8iYKu7M8WIjb6WpZ8gVVFfKZu4E
 2u4D4hse21fL/oCw3VpNCOHeP9b+tSoX5rNhrbQgRVoYrzGdej+BIG9wxY+Ea/sgOiNL
 q1A7v0FoZggezQrQFH6Wikqr50DjEw4YEhZtSlIteShsNfTmZFhIs0iT+i8kDOT6K0Ez
 cnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSi+dgPVv0xkezcYKd48ZE1X5GOqXzTJa3ohoO1Apmo=;
 b=ayNu675VUOz03TRNLVRUP5NP6SYpgXxWHpGRUkaaIDlSGmkPmSAVPYfdbtzbrWoiZW
 lrY3z+sHz7ny5l6VEd9ftwQcC0kQ4u7WxvTxr20J2t4sfp5zeAFBXPiWihTScPogHteQ
 uYsy6raLnWtrOB4J6iWgXeqTZsnrvhbwpp46j5/genPjV6YhraFQiVoTqk9fkjk6UIZ7
 /ghSZ/37whIG6JQ7AsQV7S0JtaSNAP4jBtY2JZyoSvDq2ESICzW1MW6pA3R/VJcFJLgj
 Q1JF1+MGKNKIeuIaeF3TVpXeNfbGaZzh4EFnT4b9ovLzsLoQ8lwIxyRCC6S2wZqqPnLj
 fcNA==
X-Gm-Message-State: ANhLgQ2XFzA93t0i96gkad0yLsOpgpMk4JKTA/vMI8ThficrTCQANmNK
 ywSKsX/XK81eMnPyiHtV+uQ=
X-Google-Smtp-Source: ADFU+vu9GWkUHfH56Um7+sGuoWDgr5VRLwBRNq+Y6cecZi6NyGSDkUWq4+Vkr91rmr27KChtEfK0Iw==
X-Received: by 2002:a63:770d:: with SMTP id s13mr10961125pgc.7.1583657055986; 
 Sun, 08 Mar 2020 00:44:15 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:15 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:46 +0530
Message-Id: <20200308084356.14506-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 03/13] parsing_cocci: parser: Parse
	enumerators correctly
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

The EnumDef constructor of the SmPL AST has changed. Make
the SmPL parser parse an EnumDef correctly.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/parse_aux.ml            |  5 +++++
 parsing_cocci/parse_aux.mli           |  9 +++++++++
 parsing_cocci/parser_cocci_menhir.mly | 13 +++++--------
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/parsing_cocci/parse_aux.ml b/parsing_cocci/parse_aux.ml
index 9f2d607b..b5d1afb4 100644
--- a/parsing_cocci/parse_aux.ml
+++ b/parsing_cocci/parse_aux.ml
@@ -136,6 +136,11 @@ let mkpdots str dot =
     "..." -> Ast0.wrap(Ast0.Pdots(clt2mcode str dot))
   | _ -> failwith "cannot happen"
 
+let mkenumdots str (dot,whencode) =
+  match str with
+    "..." -> Ast0.wrap(Ast0.EnumDots(clt2mcode str dot, whencode))
+  | _ -> failwith "cannot happen"
+
 let arith_op ast_op left op right =
   let op' = Ast0.wrap (Ast0.Arith (clt2mcode ast_op op)) in  
   Ast0.wrap (Ast0.Binary(left, op', right))
diff --git a/parsing_cocci/parse_aux.mli b/parsing_cocci/parse_aux.mli
index 63419831..91d7cb26 100644
--- a/parsing_cocci/parse_aux.mli
+++ b/parsing_cocci/parse_aux.mli
@@ -126,6 +126,15 @@ val mkpdots :
   (Ast_cocci.added_string * Ast0_cocci.position_info) list *
   (Ast_cocci.added_string * Ast0_cocci.position_info) list * Ast0_cocci.anything list *
   string -> Ast0_cocci.base_parameterTypeDef Ast0_cocci.wrap
+val mkenumdots :
+  string ->
+  (Data.line_type * int * int * int * int * int *
+   (Ast_cocci.added_string * Ast0_cocci.position_info) list *
+   (Ast_cocci.added_string * Ast0_cocci.position_info) list * Ast0_cocci.anything list *
+   string) *
+  (string Ast0_cocci.mcode * string Ast0_cocci.mcode * Ast0_cocci.enum_decl)
+  option ->
+  Ast0_cocci.base_enum_decl Ast0_cocci.wrap
 val arith_op :
   Ast_cocci.arithOp ->
   Ast0_cocci.expression ->
diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
index 9e6c8a08..ff535729 100644
--- a/parsing_cocci/parser_cocci_menhir.mly
+++ b/parsing_cocci/parser_cocci_menhir.mly
@@ -1160,15 +1160,12 @@ struct_decl_list_start:
 /* very restricted what kinds of expressions can appear in an enum decl */
 
 enum_decl_one:
-    | disj_ident    { Ast0.wrap(Ast0.Ident($1)) }
+    | disj_ident    { Ast0.wrap(Ast0.Enum($1, None)) }
     | disj_ident TEq enum_val
-	{ let id = Ast0.wrap(Ast0.Ident($1)) in
-        let (op,clt) = ("=",$2) in
-        let op' = P.clt2mcode op clt in
-        let op'' = Ast0.wrap (Ast0.SimpleAssign op') in
+	{
 	Ast0.wrap
-	  (Ast0.Assignment
-	     (id, op'', Ast0.set_arg_exp $3, false)) }
+	  (Ast0.Enum
+	     ($1, Some(P.clt2mcode "=" $2, $3))) }
 
 enum_val:
    ident    { Ast0.wrap(Ast0.Ident($1)) }
@@ -1193,7 +1190,7 @@ enum_val:
 
 enum_decl_list:
    nonempty_list_start(enum_decl_one,edots_when(TEllipsis,enum_decl_one))
-     { Ast0.wrap($1 P.mkedots (fun c -> Ast0.EComma c)) }
+     { Ast0.wrap($1 P.mkenumdots (fun c -> Ast0.EnumComma c)) }
 
 /*****************************************************************************/
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
