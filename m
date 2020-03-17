Return-Path: <SRS0=z9cQ=5C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B60C10F29
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Mar 2020 05:59:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19616205ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Mar 2020 05:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ey6id6Vs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19616205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD1B0884A8;
	Tue, 17 Mar 2020 05:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oL+OTwEF9sQR; Tue, 17 Mar 2020 05:59:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3185688473;
	Tue, 17 Mar 2020 05:59:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27A56C1D7C;
	Tue, 17 Mar 2020 05:59:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFA4EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BE385226FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvfl0pyvJDAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:59:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id C1D35226B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 05:59:38 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g6so9155264plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 22:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wc/ouDmQcpoUdKtqYW09f9QABpL2Tr3bOwlqrqm68xY=;
 b=Ey6id6Vsru/l7PJaNx/xamnuMOUsNF7qr7Iv6WO+AiqwEvynMSivNdcMmuJqS8YLaU
 QKeUgOmLm1SGmItxnOMqbWjDdvlH+LdV6p4vqg0NhOAvplZjvijiaozKRGtqyTJfJex5
 F8nT6HRoNUDkYlsBZgzObJu2guruMsj3bJzlFPqWc2AZyiprSy0EkfvirJ0IMcjpYUWq
 RqG1CGZ6muXXkIxvb/pTMDnlQIzQ+RKVarbhgANFtMtrWxNj0OZXFIju4SVnIjT4G0Fo
 uYN9dyP64SXBLfkTkxSQUL6zyGrW2iwWACaDou6VdkadJa6Ng6N2NP7Lx/qC0qESQPqA
 bYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wc/ouDmQcpoUdKtqYW09f9QABpL2Tr3bOwlqrqm68xY=;
 b=Bl01NnakIKqXEB2QmIbu3eHW9mzOjRzJD3PUfB2c0mc6JYjD3eQunNvGHS6PjakFsA
 YcPdvzNrfrg7mgzSPE7NxeDkcPjiQuAwJ8Oj/UffuR85+Af1GQRaI8/w7+xxToGvxITi
 L27rGSsYFv/1gRqRDsQMOCy1PAf3UHVhY7G7P3FjeESg9bK0N4A1dCvZVX/3DE9g/Yeb
 Tz2kMaSh46l1W7beBgYaJAfNxYJN7QGvp9CMA9T8kPBdDqHqJn1xQi4PGiSwQtbG4khW
 gy5GKWwdkW6S91CQpIRmqVc4pBm8s3lT9FKIpfvc8ONbHVegHYq44gwn/5ELe2A3HJqL
 E6RQ==
X-Gm-Message-State: ANhLgQ3HmOvoabn/nING1TWDWospQyS6Ewvg7qKgAa12H9tzNECrYfMC
 tn6P3Bi3gq0b/eO44slAXTo=
X-Google-Smtp-Source: ADFU+vvvNho3Xc2JCmG8s36mo7j2f0rMbDMc03Xg6r8zp1eyT0ZgLrT3iBHGXDGrQ0B8FoMNnK834w==
X-Received: by 2002:a17:90a:cc0e:: with SMTP id
 b14mr3646700pju.75.1584424778141; 
 Mon, 16 Mar 2020 22:59:38 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1672:6342:3ccf:a5d:a11e:f77e])
 by smtp.gmail.com with ESMTPSA id 8sm1707961pfv.65.2020.03.16.22.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 22:59:37 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 17 Mar 2020 11:29:20 +0530
Message-Id: <20200317055920.16708-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-6-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-6-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/26] parsing_cocci: visitor_ast:
	Add cases for ParenType/FunctionType
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

The order of the terms in ParenType require implementing a special
case for ParenType. This case handles only the following:

	<type> ( * id [ .* ] ) ( params )

i.e., a function pointer or an array of function pointers, and will fail
for any other cases. This is similar to the function used to print
ParenType in Pretty_print_c.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 3d5de794..99af7652 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -318,6 +318,61 @@ let combiner bind option_default
     let lrb = string_mcode rb in
     multibind ([lty] @ lid @ [lb; lsize; lrb])
 
+  and parentype_type (lp, ty, (id : Ast.ident option), rp) =
+    match Ast.unwrap ty with
+     Ast.Type(_,_,fty1) ->
+      (match Ast.unwrap fty1 with
+         Ast.Pointer(ty1,star) ->
+          (match Ast.unwrap ty1 with
+             Ast.Type(_,_,fty2) ->
+              (match Ast.unwrap fty2 with
+                Ast.FunctionType(ty2,lp2,params,rp2) ->
+                  let typ = fullType ty2 in
+                  let lp = string_mcode lp in
+                  let star = string_mcode star in
+                  let idl = match id with
+                    | Some idd -> [ident idd]
+                    | None -> [] in
+                  let rp = string_mcode rp in
+                  let lp2 = string_mcode lp2 in
+                  let params = parameter_dots params in
+                  let rp2 = string_mcode rp2 in
+                  multibind
+                    ([typ;lp;star] @ idl @ [rp;lp2;params;rp2])
+                | _ -> failwith "ParenType Visitor_ast")
+           | _ -> failwith "ParenType Visitor_ast")
+       | Ast.Array(ty1,lb1,size1,rb1) ->
+          (match Ast.unwrap ty1 with
+            Ast.Type(_,_,fty2) ->
+             (match Ast.unwrap fty2 with
+               Ast.Pointer(ty2,star) ->
+                (match Ast.unwrap ty2 with
+                  Ast.Type(_,_,fty3) ->
+                   (match Ast.unwrap fty3 with
+                     Ast.FunctionType(ty3,lp3,params,rp3) ->
+                     let typ = fullType ty3 in
+                     let lp = string_mcode lp in
+                     let star = string_mcode star in
+                     let idl = match id with
+                       | Some idd -> [ident idd]
+                       | None -> [] in
+                     let lb1 = string_mcode lb1 in
+                     let size1 = get_option expression size1 in
+                     let rb1 = string_mcode rb1 in
+                     let rp = string_mcode rp in
+                     let lp3 = string_mcode lp3 in
+                     let params = parameter_dots params in
+                     let rp3 = string_mcode rp3 in
+                     multibind
+                       ([typ;lp;star] @ idl @
+                        [lb1;size1;rb1;rp;lp3;params;rp3])
+   	           | _ -> failwith "ParenType Visitor_ast")
+                | _ -> failwith "ParenType Visitor_ast")
+             | _ -> failwith "ParenType Visitor_ast")
+          | _ -> failwith "ParenType Visitor_ast")
+       | _ -> failwith "ParenType Visitor_ast")
+    | _ -> failwith "ParenType Visitor_ast"
+
   and typeC ty =
     let k ty =
       match Ast.unwrap ty with
@@ -332,6 +387,14 @@ let combiner bind option_default
 	  bind lty lstar
       | Ast.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
 	  function_pointer (ty,lp1,star,None,rp1,lp2,params,rp2)
+      | Ast.ParenType(lp,ty,rp) ->
+          parentype_type (lp,ty,None,rp)
+      | Ast.FunctionType(ty,lp,params,rp) ->
+          let lty = fullType ty in
+          let llp = string_mcode lp in
+          let lparams = parameter_dots params in
+          let lrp = string_mcode rp in
+          multibind [lty; llp; lparams; lrp]
       | Ast.Array(ty,lb,size,rb) -> array_type (ty,None,lb,size,rb)
       | Ast.Decimal(dec,lp,length,comma,precision_opt,rp) ->
 	  let ldec = string_mcode dec in
@@ -384,6 +447,7 @@ let combiner bind option_default
 	  Ast.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
 	    function_pointer (ty, lp1, star, Some id, rp1, lp2, params, rp2)
 	| Ast.Array(ty,lb,size,rb) -> array_type (ty, Some id, lb, size, rb)
+        | Ast.ParenType(lp,ty,rp) -> parentype_type (lp, ty, Some id, rp)
 	| _ -> let lty = fullType ty in
 	       let lid = ident id in
 	       bind lty lid)
@@ -1253,6 +1317,17 @@ let rebuilder
 	    let lparams = parameter_dots params in
 	    let lrp2 = string_mcode rp2 in
 	    Ast.FunctionPointer(lty, llp1, lstar, lrp1, llp2, lparams, lrp2)
+        | Ast.ParenType(lp,ty,rp) ->
+            let llp = string_mcode lp in
+            let lty = fullType ty in
+            let lrp = string_mcode rp in
+            Ast.ParenType(llp,lty,lrp)
+        | Ast.FunctionType(ty,lp,params,rp) ->
+            let lty = fullType ty in
+            let llp = string_mcode lp in
+            let lparams = parameter_dots params in
+            let lrp = string_mcode rp in
+            Ast.FunctionType(lty,llp,lparams,lrp)
 	| Ast.Array(ty,lb,size,rb) ->
 	    let lty = fullType ty in
 	    let llb = string_mcode lb in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
