Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5938C2BB1D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBADF2051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix1Md+nu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBADF2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A1D03220A9;
	Mon, 16 Mar 2020 10:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R+5zCRwRZKYs; Mon, 16 Mar 2020 10:04:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 10D9420134;
	Mon, 16 Mar 2020 10:04:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DA5AC1D7C;
	Mon, 16 Mar 2020 10:04:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD9D7C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CD07689033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCSlxHCZYq3K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5CBB688672
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z5so9651942pfn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YP8chb4YLhUSAHVqKo/Ox5/Ns8GtQ+94RvYTwzBShIo=;
 b=Ix1Md+nuQOP1YawTkyWlECWZlfBG0qx9JMf1zcdeKjxqLXVtHbDBPHvsoz9w2LUYLf
 2ozGp8ZNMn9R9FVqxCPMsTvDr7gK+y6VlwF5vBxFJff4Zc1savPrXyOQPORAEaQA1SdY
 aH6SafgYgNo+UMmHf+JPkbpf8ogCQcImJk5WUdTVN60tJaqDYtIeQ/I7LeNIpGjj2KQy
 Vwh5jFvESx+jmH2ir16Et0yqjSJzJkY3pJjBJjgAkW54Ec3uUsIcJ2AzqeabZcXw651n
 v1XL30GnW9V/ACS69Kk1PHEjkPPHzud506Icx7oPN0JFogn7mKRvPd+/S8FxgcJiAW/a
 b01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YP8chb4YLhUSAHVqKo/Ox5/Ns8GtQ+94RvYTwzBShIo=;
 b=BFEQR/7my35Czsgp5DlrsgglduF9ddKBor7MjrBxLhTXGqqEcnhJdfQEO6cXvRf5Ev
 +qbM7tDduG/tFGK6TnVC3D2iatizQtuMtC46ntSyFK6NjVMPoRN+NpW7MMx52cCJ0Mai
 M6mSjkql4tUXkbiFVCJ86CSI+9+BEI2B91l6k4gyAWUqC2qXYzraMOYUkWbLgC80N0X8
 IfVQCfxZN9PVdelc+ri6WVKg/ZtgsK0H4hVpla7xk0t/NbP6yAOUGQfTViaEX9zgzysC
 RxR15NeXkBjNUPjIJ0BVTj7kCSB4LExXsb9tBIftYih1TzkDP//FZa/inNiwlsLoAGHU
 /Jgw==
X-Gm-Message-State: ANhLgQ32dmiyqh/Ygvr00NGemHhSphXG3uCvXL++wj4YsNgj3iRB43Rr
 O3P/ra/Nla+sxgpNiq7lAZHiBuWb
X-Google-Smtp-Source: ADFU+vs3I8j/KuwpO8HfIFEaD2vYElXsLusPl3AwSFvu5/WYzekgLVHLNml1pg5A6ZF6eUiZd+5WxA==
X-Received: by 2002:a62:382:: with SMTP id 124mr26700784pfd.11.1584353089877; 
 Mon, 16 Mar 2020 03:04:49 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:15 +0530
Message-Id: <20200316100319.27935-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 22/26] parsing_c: unparse_cocci:
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
 parsing_c/unparse_cocci.ml | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 30e755e9..9dd84821 100644
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
@@ -786,6 +793,57 @@ and storage = function
   | Ast.Register -> print_string "register"
   | Ast.Extern -> print_string "extern"
 
+(* --------------------------------------------------------------------- *)
+(* ParenType *)
+
+and print_parentype (lp,ty,rp) fn =
+  match Ast.unwrap ty with
+   Ast.Type(_,_,fty1) ->
+    (match Ast.unwrap fty1 with
+      Ast.Pointer(ty1,star) ->
+       (match Ast.unwrap ty1 with
+         Ast.Type(_,_,fty2) ->
+          (match Ast.unwrap fty2 with
+            Ast.FunctionType(ty2,lp2,params,rp2) ->
+             fullType ty2;
+             pr_space();
+             mcode print_string lp;
+             mcode print_string star;
+             fn();
+             mcode print_string rp;
+             mcode print_string lp2;
+             parameter_list params;
+             mcode print_string rp2
+         | _ -> failwith "ParenType Unparse_cocci")
+       | _ -> failwith "ParenType Unparse_cocci")
+    | Ast.Array(ty1,lb1,size1,rb1) ->
+       (match Ast.unwrap ty1 with
+         Ast.Type(_,_,fty2) ->
+          (match Ast.unwrap fty2 with
+            Ast.Pointer(ty2,star) ->
+             (match Ast.unwrap ty2 with
+               Ast.Type(_,_,fty3) ->
+                (match Ast.unwrap fty3 with
+                  Ast.FunctionType(ty3,lp3,params,rp3) ->
+                  fullType ty3;
+                  pr_space();
+                  mcode print_string lp;
+                  mcode print_string star;
+                  fn();
+                  mcode print_string lb1;
+                  print_option expression size1;
+                  mcode print_string rb1;
+                  mcode print_string rp;
+                  mcode print_string lp3;
+                  parameter_list params;
+                  mcode print_string rp3
+                | _ -> failwith "ParenType Unparse_cocci")
+             | _ -> failwith "ParenType Unparse_cocci")
+          | _ -> failwith "ParenType Unparse_cocci")
+       | _ -> failwith "ParenType Unparse_cocci")
+    | _ -> failwith "ParenType Unparse_cocci")
+  | _ -> failwith "ParenType Unparse_cocci"
+
 (* --------------------------------------------------------------------- *)
 (* Variable declaration *)
 
@@ -818,6 +876,8 @@ and print_named_type ty id =
 		pretty_print_c.Pretty_print_c.type_with_ident ty
 		  (function _ -> id())
             | _ -> error name ty "type value expected")
+      | Ast.ParenType(lp,ty,rp) ->
+          print_parentype (lp,ty,rp) (function _ -> id())
     (*| should have a case here for pointer to array or function type
         that would put ( * ) around the variable.  This makes one wonder
         why we really need a special case for function pointer *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
