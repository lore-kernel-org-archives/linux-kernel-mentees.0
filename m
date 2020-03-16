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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FCEC18E5B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73882051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwnPrx/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73882051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9E79B220A9;
	Mon, 16 Mar 2020 10:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGadKTvk0l8O; Mon, 16 Mar 2020 10:04:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E85A020134;
	Mon, 16 Mar 2020 10:04:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D80D9C1D7C;
	Mon, 16 Mar 2020 10:04:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E497C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E0DC87009
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDq9e_IP9W8x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B995887ADA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so9473213pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O40XMfKoBGsiadoKnr5LmawGLF1uWP0L2JS6q5pD5LQ=;
 b=FwnPrx/3qUif+z0KhKkBBjxFOfGYWrI14fZYtfOamJZnYBRazzFktR70yMqIFkdYCR
 S1PNg/yWsl1dfUSlJiFLCKEqi9zQ7PPjq1mk7CX76V5OzZxfQ3cYB+0UMvsXxB36XTlu
 M4DdAyI2Uyc6EfJkzr8gHEj8r6tuyZsgAqHkhsgjhxotrNqWCgLRsBrbym09EnVUEYpg
 g9Alvo9hxeixvP7Xwhi18nDPXlruFubf52yX8rdyyR1lfQMpfN0qx5h7SCSSvYsZG/CH
 w10Jwea7wLiK6b+I/W8lzybQm4/JChcdxQDIWXjP6wnbue4rNjxxUQF/mz5dY/qgSziG
 hLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O40XMfKoBGsiadoKnr5LmawGLF1uWP0L2JS6q5pD5LQ=;
 b=VWjytDLVbM8lJpnT66CIVhvhklzoSJz+3jm4kBWnTgfKu4uGAxtNRNnCJCnf8REkoh
 WsRU91US1ZnfXeUeJFdHNomXhLYJrJdQoNAS9jV2ljplWDgZqxrkTYcBozmjdPVaCIPZ
 lIYj7Ny2GNPMjT/+8IBY8bylDDnB40x44F1rd8FMqxITfNhtBCX9kx0R26n//b1cBkvH
 WaFcRqip1iBaYo+S0I4ys7Gn6CcnZcNBEunLfiay/rYp3plSDnEA3aotBXgGspOYrwKa
 CWfsRpAJRixdNZe226CJ81XuR7cz6UT05pIezMJlQnoz7bhFWMvdZTILvYkaxEgdMoKt
 hxvg==
X-Gm-Message-State: ANhLgQ31nBBdGMNjEui7I9uUYrRa1ytm5x7+xAYGlWod0SmDq3lMSJuf
 09A+7b5Rxe0iPhvKDOSvViASWy5K
X-Google-Smtp-Source: ADFU+vvKiEjCZKoYrkje8oVJ3phykPHO80xfEcbrmSuGhdFzEZ5ShYb5vaOpBtZu4E3TL5xhXH3svQ==
X-Received: by 2002:a63:cf4a:: with SMTP id b10mr13717971pgj.354.1584353087316; 
 Mon, 16 Mar 2020 03:04:47 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:47 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:14 +0530
Message-Id: <20200316100319.27935-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 21/26] parsing_cocci:
	pretty_print_cocci: Print ParenType/FunctionType
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
 parsing_cocci/pretty_print_cocci.ml | 57 +++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/parsing_cocci/pretty_print_cocci.ml b/parsing_cocci/pretty_print_cocci.ml
index 6338e464..ef60106c 100644
--- a/parsing_cocci/pretty_print_cocci.ml
+++ b/parsing_cocci/pretty_print_cocci.ml
@@ -403,6 +403,54 @@ and print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2) fn =
   mcode print_string rp1; mcode print_string lp1;
   parameter_list params; mcode print_string rp2
 
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
+             print_space();
+             mcode print_string lp;
+             mcode print_string star;
+             fn();
+             mcode print_string rp;
+             mcode print_string lp2;
+             parameter_list params;
+             mcode print_string rp2
+         | _ -> failwith "ParenType Pretty_print_cocci")
+       | _ -> failwith "ParenType Pretty_print_cocci")
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
+                  print_space();
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
+                | _ -> failwith "ParenType Pretty_print_cocci")
+             | _ -> failwith "ParenType Pretty_print_cocci")
+          | _ -> failwith "ParenType Pretty_print_cocci")
+       | _ -> failwith "ParenType Pretty_print_cocci")
+    | _ -> failwith "ParenType Pretty_print_cocci")
+  | _ -> failwith "ParenType Pretty_print_cocci"
+
 and varargs = function
   | None -> ()
   | Some (comma, ellipsis) ->
@@ -424,6 +472,13 @@ and typeC ty =
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
@@ -498,6 +553,8 @@ and print_named_type ty id =
 		| _ -> failwith "complex array types not supported")
 	    | _ -> typeC ty; id(); k () in
 	  loop ty1 (function _ -> ())
+      | Ast.ParenType(lp,ty,rp) ->
+          print_parentype (lp,ty,rp) (function _ -> id())
       | _ -> fullType ty; id())
   | _ -> fullType ty; id()
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
