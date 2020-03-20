Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5567C4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA22520774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vFQ0l+pF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA22520774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3AFB87477;
	Fri, 20 Mar 2020 07:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K06Hdort35hm; Fri, 20 Mar 2020 07:02:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D92EF87347;
	Fri, 20 Mar 2020 07:02:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8280C089E;
	Fri, 20 Mar 2020 07:02:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF57CC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9CBE787447
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lfQBjR54aOr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C99DB87347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id a32so2609091pga.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ckvc6plc+LC3hFSV6yF0owQPz7JKO44MLZLow7a8p3s=;
 b=vFQ0l+pFUJNwONSzTmEIhnp81Ka/tzJPHswGKa6+aYZdmgRFDkMoF0W7pqWMfU7Pee
 CilFbVIpFk0kyukthRAVKulh3NDBo5Mw+Y9fcSj9+q3BB62YyvMqg2nA/ntAhhZmuZ7v
 gw/tSO+6hPtP5C9QYMljSm2W83G3c2Ap9cfKs7FfJC+3kSRkTpZoe4V8IEfJlJcKC+cD
 Kq86f11aaa1NR8WQo0rZ597DbN+g+j/Tm3PMBcdckmpD/10rwTKS0dmD6YqP99QhxPCY
 r6+7lBV87zhWjYHopQx0K3d6l77ZgpKj+mHmEI60aoegZejk81S0ygHVTqf5LLvTAZXv
 hdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ckvc6plc+LC3hFSV6yF0owQPz7JKO44MLZLow7a8p3s=;
 b=D+LFm53aU3cyD4KaDIWVEvjwabUHVwmCxdoKDJvgRK//zBHRvUD9iwyrQkFFEB9Zji
 M3ehMxenHQRBxrU8cLfEnSDOyo8Q1DCFEnAjIq/hbc9SFDktlluMTmoUWvtjzixM7r1d
 9879JlcFRqzi0CBgw/lJLrWenoduoO0OVZ2kMb111zLwjsMkgpdUHgh/fZiIpZZZTJXX
 hA1qr1lUgrprnS9byqFdh528qdVacG7rFkr4lzpx2Tv2nZynCvX6h5kmv/f1XPRzCFVQ
 /9iTDxacbXeOFUW7dkWh6O86rp939ijC2MbWTNuwoFCbmtHeqr3HxZlx2cu7H9JxafBH
 p1kw==
X-Gm-Message-State: ANhLgQ1CcR4pWDMye02WIvLiGV6mJNUNQQjN03FjtE0NhKZDfCiD8XFe
 WUmYbpE2LLRmmE8erLdiZFU=
X-Google-Smtp-Source: ADFU+vveu2DX72l9mi6636OUv9I9QjQWQgcpHD5HaovEhnKhYWrMrzCrKVuGKo/MPAXDmF/BHg7zTQ==
X-Received: by 2002:a63:144e:: with SMTP id 14mr7475899pgu.264.1584687736201; 
 Fri, 20 Mar 2020 00:02:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:32 +0530
Message-Id: <20200320070157.4206-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 01/26] parsing_cocci: Add Function
	Prototype token
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

To add the types ParenType and FunctionType to the SmPL AST, a
reduce/reduce conflict with the funproto rule of the SmPL parser
must be resolved. This requires explicitly identifying a function
prototype by use of a token (TFunProto).

While the correct method of identifying a function prototype would be to
check if an identifier is preceded by a return type, it is challenging
to implement. This is because implementing an OCaml function, to
correctly determine a C type in SmPL, without the aid of Yacc, would
have to handle a number of cases (disjunctions, typeof expressions,
etc.).

Thus, a slightly hacky approach is taken to determine a function
prototype with not the best certainty but what works for most cases
in SmPL. If the identifier is preceded by any token that does not
seem to be part of a type, then it is not identified as a function
prototype. Else, it is.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/parse_cocci.ml          | 97 +++++++++++++++++++++------
 parsing_cocci/parser_cocci_menhir.mly |  9 ++-
 2 files changed, 83 insertions(+), 23 deletions(-)

diff --git a/parsing_cocci/parse_cocci.ml b/parsing_cocci/parse_cocci.ml
index 679d213a..e92a01d0 100644
--- a/parsing_cocci/parse_cocci.ml
+++ b/parsing_cocci/parse_cocci.ml
@@ -295,6 +295,7 @@ let token2c (tok,_) add_clt =
   | PC.TLineEnd(clt) -> "line end"
   | PC.TInvalid -> "invalid"
   | PC.TFunDecl(clt) -> "fundecl"
+  | PC.TFunProto(clt) -> "funproto"
 
   | PC.TIso -> "<=>"
   | PC.TRightIso -> "=>"
@@ -480,7 +481,7 @@ let get_clt (tok,_) =
 
   | PC.TOPar0(_,clt) | PC.TMid0(_,clt) | PC.TAnd0(_,clt) | PC.TCPar0(_,clt)
   | PC.TOEllipsis(clt) | PC.TCEllipsis(clt)
-  | PC.TPOEllipsis(clt) | PC.TPCEllipsis(clt)
+  | PC.TPOEllipsis(clt) | PC.TPCEllipsis(clt) | PC.TFunProto(clt)
   | PC.TFunDecl(clt) | PC.TDirective(_,clt) | PC.TAttr_(clt)
   | PC.TLineEnd(clt) -> clt
   | PC.TVAEllipsis(clt) -> clt
@@ -718,6 +719,7 @@ let update_clt (tok,x) clt =
 
   | PC.TLineEnd(_) -> (PC.TLineEnd(clt),x)
   | PC.TFunDecl(_) -> (PC.TFunDecl(clt),x)
+  | PC.TFunProto(_) -> (PC.TFunProto(clt),x)
   | PC.TTildeExclEq(_) -> (PC.TTildeExclEq(clt),x)
   | PC.TDirective(a,_) -> (PC.TDirective(a,clt),x)
   | PC.TAttr_(_) -> (PC.TAttr_(clt),x)
@@ -925,7 +927,7 @@ let split_token ((tok,_) as t) =
   | PC.TInitialize | PC.TFinalize -> ([t],[t])
   | PC.TPArob clt | PC.TMetaPos(_,_,_,clt) | PC.TMetaCom(_,_,clt) -> split t clt
 
-  | PC.TFunDecl(clt)
+  | PC.TFunDecl(clt) | PC.TFunProto(clt)
   | PC.TWhen(clt) | PC.TWhenTrue(clt) | PC.TWhenFalse(clt)
   | PC.TAny(clt) | PC.TStrict(clt) | PC.TLineEnd(clt)
   | PC.TEllipsis(clt)
@@ -1006,7 +1008,8 @@ let find_function_names l =
     | _ -> false in
   let rec split acc = function
       [] | [_] -> raise Irrelevant
-    | ((PC.TCPar(_),_) as t1) :: ((PC.TOBrace(_),_) as t2) :: rest ->
+    | ((PC.TCPar(_),_) as t1) :: ((PC.TOBrace(_),_) as t2) :: rest
+    | ((PC.TCPar(_),_) as t1) :: ((PC.TPtVirg(_),_) as t2) :: rest ->
 	(List.rev (t1::acc),(t2::rest))
     | x::xs -> split (x::acc) xs in
   let rec balanced_name level = function
@@ -1024,20 +1027,68 @@ let find_function_names l =
     | t::rest when is_ident t && level = 0 -> rest
     | t::rest when is_ident t || is_mid t -> balanced_name level rest
     | _ -> raise Irrelevant in
-  let rec balanced_args level = function
+  let rec balanced_args level reverse = function
       [] -> raise Irrelevant
     | (PC.TCPar(_),_)::rest ->
-	let level = level - 1 in
-	if level = 0
+	let level = if reverse then level + 1 else level - 1 in
+	if level = 0 && not(reverse)
 	then rest
-	else balanced_args level rest
+	else balanced_args level reverse rest
     | (PC.TOPar(_),_)::rest ->
-	let level = level + 1 in
-	balanced_args level rest
+	let level = if reverse then level - 1 else level + 1 in
+	if level = 0 && reverse
+	then rest
+	else balanced_args level reverse rest
     | (PC.TArobArob,_)::_ | (PC.TArob,_)::_ | (PC.EOF,_)::_ ->
 	raise Irrelevant
-    | t::rest -> balanced_args level rest in
-  let rec loop = function
+    | t::rest -> balanced_args level reverse rest in
+  let rec is_permissible_proto = function
+      [] -> false
+    | (PC.TCPar0(_),_)::
+      ((PC.TMid0(_),_) | (PC.TAnd0(_),_))::
+      (PC.TOPar0(_),_)::_ -> false
+    | (PC.TOPar0(_),_)::rest
+    | (PC.TCPar0(_),_)::rest -> is_permissible_proto rest
+    | x::rest when is_mid x ->
+        let rec loop = function
+          [] -> false
+        | (PC.TOPar0(_),_)::xs -> is_permissible_proto xs
+        | x::xs -> loop xs in
+        loop rest
+    | ((PC.TCPar(_),_)::rest as l) ->
+      let l = balanced_args 0 true l in
+      let x = match l with
+        (PC.TAttr_(_),_)::rest -> is_permissible_proto rest
+      | (PC.TTypeof(_),_)::_ -> true
+      | _ -> false in x
+    | _::((PC.TEq(_),_) | (PC.TNotEq(_),_))::(PC.TWhen(_),_)::_
+    | _::(PC.TWhen(_),_)::_
+    | (PC.TComma(_),_)::_
+    | (PC.TDirective(_),_)::_
+    | (PC.TElse(_),_)::_
+    | (PC.TReturn(_),_)::_
+    | (PC.TMetaStm(_),_)::_
+    | (PC.TMetaExp(_),_)::_
+    | (PC.TMetaId(_),_)::_
+    | (PC.TMetaLocalIdExp(_),_)::_
+    | (PC.TEq(_),_)::_
+    | (PC.TEllipsis(_),_)::_
+    | (PC.TOEllipsis(_),_)::_
+    | (PC.TCEllipsis(_),_)::_
+    | (PC.TPOEllipsis(_),_)::_
+    | (PC.TPCEllipsis(_),_)::_
+    | (PC.TPtVirg(_),_)::_
+    | (PC.TOBrace(_),_)::_
+    | (PC.TCBrace(_),_)::_
+    | (PC.TOPar(_),_)::_
+    | (PC.TIdent(_),_)::_ -> false
+    | _ -> true in
+  let decl_or_proto clt info bef aft =
+    match aft with
+      (PC.TOBrace(_),_)::_ -> (((PC.TFunDecl(clt),info) :: bef), aft)
+    | (PC.TPtVirg(_),_)::_ -> (((PC.TFunProto(clt),info) :: bef), aft)
+    | _ -> raise Irrelevant in
+  let rec loop acc = function
       [] -> []
     | t :: rest ->
 	if is_par t || is_mid t || is_ident t
@@ -1046,26 +1097,30 @@ let find_function_names l =
 	    try
 	      let (bef,aft) = split [] (t::rest) in
 	      let rest = balanced_name 0 bef in
+              (match aft with
+                (PC.TPtVirg(_),_)::_
+                 when not(is_permissible_proto acc) -> raise Irrelevant
+              | _ ->
 	      (match rest with
 		(PC.TOPar(_),_)::_ ->
-		  (match balanced_args 0 rest with
+		  (match balanced_args 0 false rest with
 		    [] ->
 		      let (_,info) as h = List.hd bef in
 		      let clt = get_clt h in
-		      (((PC.TFunDecl(clt),info) :: bef), aft)
+                      decl_or_proto clt info bef aft
 		  | (PC.TAttr_(_),_)::rest ->
-		      (match balanced_args 0 rest with
+		      (match balanced_args 0 false rest with
 			[] ->
 			  let (_,info) as h = List.hd bef in
 			  let clt = get_clt h in
-			  (((PC.TFunDecl(clt),info) :: bef), aft)
+                          decl_or_proto clt info bef aft
 		      | _ -> raise Irrelevant)
 		  | _ -> raise Irrelevant)
-	      | _ -> raise Irrelevant)
+	      | _ -> raise Irrelevant))
 	    with Irrelevant -> ([t],rest) in
-	  t @ (loop rest)
-	else t :: (loop rest) in
-  loop l
+          t @ (loop (t @ acc) rest)
+        else t :: (loop (t :: acc) rest) in
+  loop [] l
 
 (* ----------------------------------------------------------------------- *)
 (* an attribute is an identifier that precedes another identifier and
@@ -1168,6 +1223,8 @@ let detect_types in_meta_decls l =
 	delim::newid::id::(loop false infn (ident::type_names) rest)
     | ((PC.TFunDecl(_),_) as fn)::rest ->
 	fn::(loop false 1 type_names rest)
+    | ((PC.TFunProto(_),_) as fn)::rest ->
+	fn::(loop false 1 type_names rest)
     | ((PC.TOPar(_),_) as lp)::rest when infn > 0 ->
 	lp::(loop false (infn + 1) type_names rest)
     | ((PC.TCPar(_),_) as rp)::rest when infn > 0 ->
@@ -1252,7 +1309,7 @@ let token2line (tok,_) =
   | PC.TMetaDParamList(_,_,_,_,clt) | PC.TMetaFunc(_,_,_,clt)
   | PC.TMetaLocalFunc(_,_,_,clt) | PC.TMetaPos(_,_,_,clt) | PC.TMetaCom(_,_,clt)
 
-  | PC.TFunDecl(clt)
+  | PC.TFunDecl(clt) | PC.TFunProto(clt)
   | PC.TWhen(clt) | PC.TWhenTrue(clt) | PC.TWhenFalse(clt)
   | PC.TAny(clt) | PC.TStrict(clt) | PC.TEllipsis(clt)
 
diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
index 9e6c8a08..26958f63 100644
--- a/parsing_cocci/parser_cocci_menhir.mly
+++ b/parsing_cocci/parser_cocci_menhir.mly
@@ -239,7 +239,8 @@ let inline_id aft = function
 
 %token <Data.clt> TVAEllipsis
 %token <Data.clt> TIf TElse TWhile TFor TDo TSwitch TCase TDefault TReturn
-%token <Data.clt> TBreak TContinue TGoto TSizeof TTypeof TFunDecl Tdecimal Texec
+%token <Data.clt> TBreak TContinue TGoto TSizeof TTypeof TFunDecl TFunProto
+%token <Data.clt> Tdecimal Texec
 %token <string * Data.clt> TIdent TTypeId TDeclarerId TIteratorId TSymId
 %token <Ast_cocci.added_string * Data.clt> TDirective
 %token <Data.clt> TAttr_
@@ -1439,7 +1440,8 @@ reverse_separated_nonempty_llist(separator, X):
 
 funproto:
   s=ioption(storage) i=ioption(Tinline) t=ctype
-  id=fn_ident lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar pt=TPtVirg
+  TFunProto id=fn_ident
+  lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar pt=TPtVirg
       { let s = match s with None -> [] | Some s -> [Ast0.FStorage s] in
         let i =
 	  match i with
@@ -1453,7 +1455,8 @@ funproto:
 	      P.clt2mcode "(" lp, args, vararg, P.clt2mcode ")" rp,
 	      P.clt2mcode ";" pt)) }
 | i=Tinline s=storage t=ctype
-  id=fn_ident lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar pt=TPtVirg
+  TFunProto id=fn_ident
+  lp=TOPar arglist=arg_list(name_opt_decl) rp=TCPar pt=TPtVirg
       { let s = [Ast0.FStorage s] in
         let i = [Ast0.FInline (P.clt2mcode "inline" i)] in
 	let t = [Ast0.FType t] in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
