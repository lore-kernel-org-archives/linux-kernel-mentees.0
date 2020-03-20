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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624E8C4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3670820774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLvzMQgd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3670820774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 14A05873B6;
	Fri, 20 Mar 2020 07:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EwYoJLIgPtD; Fri, 20 Mar 2020 07:02:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D6148667B;
	Fri, 20 Mar 2020 07:02:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B613C089E;
	Fri, 20 Mar 2020 07:02:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90360C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8CCC687447
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0jRoCeuGtJz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E122587347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:28 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id m15so2060511pje.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLpw+4ZTkm4aN/+CYIUq2JumZEIuNhr7XZ/0CwhF+kE=;
 b=LLvzMQgd6ocGL8Lk44X+HYPhNNgA3o/yZqS6cYv1p0tOumlBK7lG+OhDGe6dxBiPMp
 BNV2k1usb5StrVuF8eBgZHf+WsDviuNuySt9lRPDpFNH416iVEOwpiJ1V3oa6AUgD0Mo
 0z+uI/LeHjEpUcE6rtFDgWId3bjKEzmHqApr2RDjytEzNMaeKFQDSM4rBAb0p1LSua8t
 1l0O1TzhPyqEZxnKQ0WLs7KLzLJHb2J1vTSiVCLv3I/0N3QKrvJEb77PRdjuSY83k7sg
 r/spsm9F+agKIsbWXDA7uAQQfAfpKaLW5yoNGc8orgVCyKOyU0A4/TpjqHdB2n2ZS2+p
 vCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLpw+4ZTkm4aN/+CYIUq2JumZEIuNhr7XZ/0CwhF+kE=;
 b=BKyMhFcgISUd8RFhZv+Q0YMHXNa6/istoUH45aCwN+9MAef5rxcMnt4DEv1bZNQuWh
 nJkJ+TuhGRMr+4G+Y5BZgpQbvRO/N5rEC6txjpT+kNV1wASxMufkRMBbveWuZh88KTUv
 ZxqPVdU/msJEXmD4qvThmDnokD89mjtUTrnOm61neMTqFOHsX4A5zkfUxdPpJftCaKZt
 Bm7Di3fJFIqPbk9rhgT9WfGK7VCSHe4lDiNBexf2A5wd7KzIOQqcZGEg7pOLOYjQPH+G
 9mFZIlAthM4V5UjsowEqwoQBmtFznY8VDQ40HhGcCqIaGtOBrxtrrWuQEIjjAZW7VaxM
 hWlQ==
X-Gm-Message-State: ANhLgQ0MOEf7L7gJhJOlN/QXs+97NIuSst5dt7W/G02G806jO5dCku7h
 LrOpKAd47dApJQgh3yyOYMs=
X-Google-Smtp-Source: ADFU+vsBvsH2Mg2wrVbR0W0cUC74l+odnvBshvIOmu938yGhaVHCE8HvQGm5fPsiFk8kVJwcR/EX1w==
X-Received: by 2002:a17:902:7c84:: with SMTP id
 y4mr7477306pll.30.1584687748162; 
 Fri, 20 Mar 2020 00:02:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:27 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:35 +0530
Message-Id: <20200320070157.4206-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 04/26] parsing_cocci:
	visitor_ast0: Add cases for ParenType/FunctionType
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
 parsing_cocci/visitor_ast0.ml | 147 ++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/parsing_cocci/visitor_ast0.ml b/parsing_cocci/visitor_ast0.ml
index c282e1f8..76ec4e5c 100644
--- a/parsing_cocci/visitor_ast0.ml
+++ b/parsing_cocci/visitor_ast0.ml
@@ -339,6 +339,12 @@ let visitor mode bind option_default
 	| Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
 	    let (t,id) =
               function_pointer (ty,lp1,star,None,rp1,lp2,params,rp2) in t
+        | Ast0.ParenType(lp,ty,rp) ->
+	    let (t,id) =
+              parentype_type (lp,ty,None,rp) in t
+        | Ast0.FunctionType(ty,lp,params,rp) ->
+	    let (t,id) =
+              functiontype_type (ty,None,lp,params,rp) in t
 	| Ast0.Array(ty,lb,size,rb) ->
             let (t,id) = array_type (ty,None,lb,size,rb) in t
 	| Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) ->
@@ -435,6 +441,68 @@ let visitor mode bind option_default
     ((multibind ([ty_n] @ idl @ [lb_n;size_n;rb_n]),
      Ast0.Array(ty,lb,size,rb)), idu)
 
+  and parentype_type (lp,ty,(id : Ast0.ident option),rp) =
+    let function_pointer ty1 array_decs =
+      match Ast0.unwrap ty1 with
+        Ast0.Pointer(ty2,star) ->
+          (match Ast0.unwrap ty2 with
+            Ast0.FunctionType(ty3,lp3,params,rp3) ->
+              let (ty_n,typ) = typeC ty3 in
+              let (lp_n,lp) = string_mcode lp in
+              let (star_n,star) = string_mcode star in
+              let (idl,idu) =
+                match id with
+                  Some a -> let (b,c) = ident a in ([b],Some c)
+                | None -> ([],None) in
+              let (array_n, array_t) =
+                match array_decs with
+                  Some(lb1,size1,rb1) ->
+                    let (lb1_n,lb1) = string_mcode lb1 in
+                    let (size_n,size1) = get_option expression size1 in
+                    let (rb1_n,rb1) = string_mcode rb1 in
+                    ([lb1_n;size_n;rb1_n],
+                     Some(lb1,size1,rb1))
+                | None -> ([], None) in
+              let (rp_n,rp) = string_mcode rp in
+              let (lp3_n,lp3) = string_mcode lp3 in
+              let (params_n,params) = parameter_dots params in
+              let (rp3_n,rp3) = string_mcode rp3 in
+              let bind_val =
+                multibind ([ty_n;lp_n;star_n]
+                @ idl @ array_n @ [rp_n;lp3_n;params_n;rp3_n]) in
+              let inner_type =
+                let inner_type1 =
+                  Ast0.rewrap ty2
+                    (Ast0.Pointer
+                       (Ast0.rewrap ty3
+                          (Ast0.FunctionType
+                             (typ,lp3,params,rp3)),star)) in
+                match array_t with
+                    Some(lb1,size1,rb1) ->
+                      Ast0.rewrap ty1
+                        (Ast0.Array(inner_type1,lb1,size1,rb1))
+                  | None -> inner_type1 in
+              ((bind_val, Ast0.ParenType (lp,inner_type,rp)), idu)
+        | _ -> failwith "ParenType Visitor_ast0")
+      | _ -> failwith "ParenType Visitor_ast0" in
+    match Ast0.unwrap ty with
+      Ast0.Array(ty1,lb1,size,rb1) ->
+        function_pointer ty1 (Some(lb1,size,rb1))
+    | Ast0.Pointer(ty1,star) ->
+        function_pointer ty None
+    | _ -> failwith "ParenType Visitor_ast0"
+
+  and functiontype_type (ty,(id : Ast0.ident option),lp,params,rp) =
+    let (ty_n,ty) = typeC ty in
+    let (idl,idu) = (match id with
+      | Some a -> let (b,c) = ident a in ([b],Some c)
+      | None -> ([],None)) in
+    let (lp_n,lp) = string_mcode lp in
+    let (params_n,params) = parameter_dots params in
+    let (rp_n,rp) = string_mcode rp in
+    ((multibind ([ty_n] @ idl @ [lp_n; params_n; rp_n]),
+     Ast0.FunctionType(ty,lp,params,rp)), idu)
+
   and named_type ty id =
     match Ast0.unwrap ty with
       Ast0.FunctionPointer(rty,lp1,star,rp1,lp2,params,rp2) ->
@@ -446,6 +514,14 @@ let visitor mode bind option_default
 	let (tyres, idn) = array_type (rty,Some id,lb,size,rb) in
         let idn = match idn with Some i -> i | None -> failwith "Impossible" in
 	(rewrap ty tyres, idn)
+    | Ast0.ParenType(lp,rty,rp) ->
+	let (tyres, idn) = parentype_type (lp,rty,Some id,rp) in
+	let idn = match idn with Some i -> i | None -> failwith "Impossible" in
+	(rewrap ty tyres, idn)
+    | Ast0.FunctionType(rty,lp,params,rp) ->
+	let (tyres, idn) = functiontype_type (rty,Some id,lp,params,rp) in
+	let idn = match idn with Some i -> i | None -> failwith "Impossible" in
+	(rewrap ty tyres, idn)
     | _ -> let (ty_n,ty) = typeC ty in
            let (id_n,id) = ident id in
              ((bind ty_n id_n, ty), id)
@@ -479,6 +555,69 @@ let visitor mode bind option_default
     ((multibind ([ty_n] @ idl @ [lb_n;size_n;rb_n]),
      Ast0.Array(ty,lb,size,rb)), idu)
 
+  (* returns ((bind value,original value),id) since id may have been updated*)
+  and parentype_typedef (lp,ty,id,rp) =
+    let function_pointer ty1 array_decs =
+      match Ast0.unwrap ty1 with
+        Ast0.Pointer(ty2,star) ->
+          (match Ast0.unwrap ty2 with
+            Ast0.FunctionType(ty3,lp3,params,rp3) ->
+              let (ty_n,typ) = typeC ty3 in
+              let (lp_n,lp) = string_mcode lp in
+              let (star_n,star) = string_mcode star in
+              let (idl,idu) =
+                match id with
+                  Some a -> let (b,c) = typeC a in ([b],Some c)
+                | None -> ([],None) in
+              let (array_n, array_t) =
+                match array_decs with
+                  Some(lb1,size1,rb1) ->
+                    let (lb1_n,lb1) = string_mcode lb1 in
+                    let (size_n,size1) = get_option expression size1 in
+                    let (rb1_n,rb1) = string_mcode rb1 in
+                    ([lb1_n;size_n;rb1_n],
+                     Some(lb1,size1,rb1))
+                | None -> ([], None) in
+              let (rp_n,rp) = string_mcode rp in
+              let (lp3_n,lp3) = string_mcode lp3 in
+              let (params_n,params) = parameter_dots params in
+              let (rp3_n,rp3) = string_mcode rp3 in
+              let bind_val =
+                multibind ([ty_n;lp_n;star_n]
+                @ idl @ array_n @ [rp_n;lp3_n;params_n;rp3_n]) in
+              let inner_type =
+                let inner_type1 =
+                Ast0.rewrap ty2
+                  (Ast0.Pointer
+                     (Ast0.rewrap ty3
+                        (Ast0.FunctionType
+                           (typ,lp3,params,rp3)),star)) in
+                match array_t with
+                    Some(lb1,size1,rb1) ->
+                      Ast0.rewrap ty1
+                        (Ast0.Array(inner_type1,lb1,size1,rb1))
+                  | None -> inner_type1 in
+              ((bind_val, Ast0.ParenType (lp,inner_type,rp)), idu)
+        | _ -> failwith "ParenType Visitor_ast0")
+      | _ -> failwith "ParenType Visitor_ast0" in
+    match Ast0.unwrap ty with
+      Ast0.Array(ty1,lb1,size,rb1) ->
+        function_pointer ty1 (Some(lb1,size,rb1))
+    | Ast0.Pointer(ty1,star) ->
+        function_pointer ty None
+    | _ -> failwith "ParenType Visitor_ast0"
+
+  and functiontype_typedef (ty,id,lp,params,rp) =
+    let (ty_n,ty) = typeC ty in
+    let (idl,idu) = (match id with
+      | Some a -> let (b,c) = typeC a in ([b],Some c)
+      | None -> ([],None)) in
+    let (lp_n,lp) = string_mcode lp in
+    let (params_n,params) = parameter_dots params in
+    let (rp_n,rp) = string_mcode rp in
+    ((multibind ([ty_n] @ idl @ [lp_n; params_n; rp_n]),
+     Ast0.FunctionType(ty,lp,params,rp)), idu)
+
   and named_type_typedef ty id =
     match Ast0.unwrap ty with
       Ast0.FunctionPointer(rty,lp1,star,rp1,lp2,params,rp2) ->
@@ -490,6 +629,14 @@ let visitor mode bind option_default
 	let (tyres, idn) = array_type_typedef (rty,Some id,lb,size,rb) in
         let idn = match idn with Some i -> i | None -> failwith "Impossible" in
 	(rewrap ty tyres, idn)
+    | Ast0.ParenType(lp,rty,rp) ->
+	let (tyres, idn) = parentype_typedef (lp,rty,Some id,rp) in
+	let idn = match idn with Some i -> i | None -> failwith "Impossible" in
+	(rewrap ty tyres, idn)
+    | Ast0.FunctionType(rty,lp,params,rp) ->
+	let (tyres, idn) = functiontype_typedef (rty,Some id,lp,params,rp) in
+	let idn = match idn with Some i -> i | None -> failwith "Impossible" in
+	(rewrap ty tyres, idn)
     | _ -> let (ty_n,ty) = typeC ty in
            let (id_n,id) = typeC id in
              ((bind ty_n id_n, ty), id)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
