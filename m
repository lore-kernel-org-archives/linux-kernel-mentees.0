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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE10C4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027F020774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+boi/e/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027F020774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC9E68689B;
	Fri, 20 Mar 2020 07:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rqtO6uIAA1e; Fri, 20 Mar 2020 07:03:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B6A08685D;
	Fri, 20 Mar 2020 07:03:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00499C089E;
	Fri, 20 Mar 2020 07:03:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66F7EC089E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44DE9873E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9QVvVJSzcEY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A31B6873B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:34 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x7so2611394pgh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5NC+zoCCEDcuiSGYU0MigT7o3qUEHWZwAYy+lW+rT4=;
 b=D+boi/e/bFnQziqQi0dj6YH6oOvNgBwqKrL7z6J9vYZr5Y7XAXws591JHEvtm0I7B0
 gl/Wq+fEvhLh9cQ1m/bEFG/RrAxPZkEM4FSx5KdVbMr3izYFj3sn3Zy83B7j+zvBc4tK
 Kz+DW+o/AQTwzheBfKGU4r1E+dI4MKVLLdek+uBmw+GEkyno4nVFl7zBT4jGO06p9Ol5
 qOXbRMRTadiHVtj1Sq0FxEHH7allTsffGquP0H21lArIcqWRNfDCEkLhzoM9a9bQ973f
 yFjXxKVAZRZcNF09ZINhJnbGXVuSU70qe+DusASfrPHQWscn+4MC87JRw+g3xvbq6y9U
 2+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5NC+zoCCEDcuiSGYU0MigT7o3qUEHWZwAYy+lW+rT4=;
 b=BhoOXskA8K9s1vy7L8eE8f2ffiAUjkRHAcn7pTF0yyamBRI2yp8QY/6gS1d3FqNal9
 iL/7N9X3OVf6jCaDBSCJ+fE1+YUKplofYdVrPl/KX19TbK4zxEUOmDirvZALPiuvLd2O
 xdorzEBiKdBFwq1dbB5ibuGJB1EyyC+iFNRcSSNEgrQzi6ieOFB2wWt4GJppmipWHFv2
 WcLSQQwfXcslxS1iDt4aIx0A78Ap67rfJxuxha9lqqy+DjwhwqpTOsdImm1CVGASobIJ
 9FwbR3C4izWU18+xfCTm3frYpDIhB4As3k/gUUBcvYzGqN+26632rsMg7DPF/TbzRlA2
 lNvg==
X-Gm-Message-State: ANhLgQ0UwkirPIyxU8Ven5t8/zC/4YAjl0dNCcOChmzhXuNSUgcXxxtY
 TGN7t/wESbTGog46WKfBI24=
X-Google-Smtp-Source: ADFU+vuIZEFrMxfEWJNfNj+h2yyjTF6nwIlU8kHyyRmMpfvxUu4ti/nXpc6TgN3JBvdccJHMmg5SSQ==
X-Received: by 2002:a63:f243:: with SMTP id d3mr7159477pgk.254.1584687813876; 
 Fri, 20 Mar 2020 00:03:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:33 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:53 +0530
Message-Id: <20200320070157.4206-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 22/26] parsing_c: unparse_cocci:
	Print ParenType/FunctionType
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
 parsing_c/unparse_cocci.ml | 58 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 30e755e9..1fa3115a 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -722,6 +722,13 @@ and typeC ty =
   | Ast.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
       print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2)
 	(function _ -> ())
+  | Ast.ParenType(lp,ty,rp) ->
+      print_parentype (lp,ty,rp) (function _ -> ())
+  | Ast.FunctionType(ty,lp,params,rp) ->
+      fullType ty;
+      mcode print_string lp;
+      parameter_list params;
+      mcode print_string rp
   | Ast.Array(ty,lb,size,rb) ->
       fullType ty; mcode print_string lb; print_option expression size;
       mcode print_string rb
@@ -786,6 +793,49 @@ and storage = function
   | Ast.Register -> print_string "register"
   | Ast.Extern -> print_string "extern"
 
+(* --------------------------------------------------------------------- *)
+(* ParenType *)
+
+and print_parentype (lp,ty,rp) fn =
+  let function_pointer ty1 array_dec =
+    match Ast.unwrap ty1 with
+     Ast.Type(_,_,fty1) ->
+      (match Ast.unwrap fty1 with
+        Ast.Pointer(ty2,star) ->
+         (match Ast.unwrap ty2 with
+           Ast.Type(_,_,fty3) ->
+            (match Ast.unwrap fty3 with
+              Ast.FunctionType(ty3,lp3,params,rp3) ->
+               fullType ty3;
+               pr_space();
+               mcode print_string lp;
+               mcode print_string star;
+               fn();
+               let _ =
+                 match array_dec with
+                   Some(lb1,size,rb1) ->
+                    mcode print_string lb1;
+                    print_option expression size;
+                    mcode print_string rb1
+                 | None -> () in
+               mcode print_string rp;
+               mcode print_string lp3;
+               parameter_list params;
+               mcode print_string rp3
+           | _ -> failwith "ParenType Unparse_cocci")
+         | _ -> failwith "ParenType Unparse_cocci")
+       | _ -> failwith "ParenType Unparse_cocci")
+     | _ -> failwith "ParenType Unparse_cocci" in
+  match Ast.unwrap ty with
+    Ast.Type(_,_,fty1) ->
+      (match Ast.unwrap fty1 with
+        Ast.Array(ty1,lb1,size,rb1) ->
+          function_pointer ty1 (Some(lb1,size,rb1))
+      | Ast.Pointer(ty1,star) ->
+          function_pointer ty None
+      | _ -> failwith "ParenType Unparse_cocci")
+   | _ -> failwith "ParenType Unparse_cocci"
+
 (* --------------------------------------------------------------------- *)
 (* Variable declaration *)
 
@@ -818,6 +868,14 @@ and print_named_type ty id =
 		pretty_print_c.Pretty_print_c.type_with_ident ty
 		  (function _ -> id())
             | _ -> error name ty "type value expected")
+      | Ast.ParenType(lp,ty,rp) ->
+          print_parentype (lp,ty,rp) (function _ -> id())
+      | Ast.FunctionType(ty,lp,params,rp) ->
+          fullType ty;
+          id();
+          mcode print_string lp;
+          parameter_list params;
+          mcode print_string rp
     (*| should have a case here for pointer to array or function type
         that would put ( * ) around the variable.  This makes one wonder
         why we really need a special case for function pointer *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
