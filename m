Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF05AC0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82CEB2071C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj+1dwRK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82CEB2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6457589AA8;
	Mon, 16 Mar 2020 10:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXv1ZQMWChH5; Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C170089AA3;
	Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEFB4C1D7C;
	Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AC43C1D85
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 28B4185643
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otYXDij3Atyo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BD951855C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:01 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 3so1800232pff.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6sjOqxS7d54zf4aLI3lcmfbO7ppNxNf6CCvjF5yxP4Q=;
 b=Gj+1dwRKHSqYsHJ6qD2LMhpUfq8+VNT4DbunAzafEnGjUNGD4YiRhYCbEzNeW/SCUG
 yo5MPZKGvFPZZdL5nzkEacEX9AILH1LyvCEUsoN8eblIJkQmL+WExwj/+fyMEvyC0j5q
 UxPCGmNEioa8Inm1i9xTcx1/iNCEyFt/Av5OG1ROWO0Fu+SktR3riwUTJN2cC+OBYpIr
 7KDRoibooXzUbogD1QW48xtnUJ+ZvlTCFoL6IK07k9dmFXybYD4BFrbUS8+cX0xFNNEW
 g6zI02368rzhRxxwX3HzEd6o/vkDFhRmrtjcw0Uskk3qan3UtEFz1W0KTDNEGN2kRUrz
 /ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6sjOqxS7d54zf4aLI3lcmfbO7ppNxNf6CCvjF5yxP4Q=;
 b=QX8B/28eRqyIONy6vbLiw2YtXzaKRL8w8jBQp/u7czRP8frjV9ZItPxQJ745yHVq5n
 +fsdT13/kTBvP5u8rMBvLrRDs9q6w4SmvoUVGQ9P/ov2AE7T7zv1/PtAqeoffKOWpJss
 Ow+HUnRGbq7J4lSV89tkJEJIGlS9x/ZC+KeM6gNvtxjEuBMrpkpdJPJkJN8bPni+wrIM
 Zg9fKNEMPZ0fqnw9K02xCFM6jPMUiUQLRnrlGccK5ttQpwVPIec+2+AZbnnGJN6R6lRw
 eodzr2w2VJu1v3gsZdq5t7dpEtjXTQGBjAP977B7JlV+8fXQ2269latRXWwc4MsMZCmG
 a/Yw==
X-Gm-Message-State: ANhLgQ3W0tJ3pT5QKGw8Rd2UJHAiHVOvkScWjgrnNMEne7Ov7p5IdxMJ
 HeFFlC3TEBTGdmK61u650TY=
X-Google-Smtp-Source: ADFU+vuAflvs79Tr+OyPNdCnqOcqcdiiq+FqzfdMDbOgDUnB3Dtqjr4ZM1o2QzMBaijMtmHxoKzY2g==
X-Received: by 2002:a63:27c5:: with SMTP id n188mr9244527pgn.345.1584353041238; 
 Mon, 16 Mar 2020 03:04:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:00 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:02 +0530
Message-Id: <20200316100319.27935-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 09/26] parsing_cocci: unparse_ast0:
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

ParenType/FunctionType are now types in the SmPL ASTs. Add
cases for these types in unparse_ast0.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unparse_ast0.ml | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
index 5d450e0e..f8684dd2 100644
--- a/parsing_cocci/unparse_ast0.ml
+++ b/parsing_cocci/unparse_ast0.ml
@@ -292,6 +292,40 @@ and print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2) fn =
   mcode print_string rp1; mcode print_string lp2;
   parameter_list params; mcode print_string rp2
 
+and print_parentype (lp,ty,rp) fn =
+ match Ast0.unwrap ty with
+   Ast0.Pointer(ty1,star) ->
+     (match Ast0.unwrap ty1 with
+       Ast0.FunctionType(ty2,lp2,params,rp2) ->
+         typeC ty2;
+         mcode print_string lp;
+         mcode print_string star;
+         fn();
+         mcode print_string rp;
+         mcode print_string lp2;
+         parameter_list params;
+         mcode print_string rp2;
+       | _ -> failwith "ParenType Unparse_ast0")
+ | Ast0.Array(ty1,lb1,size1,rb1) ->
+     (match Ast0.unwrap ty1 with
+       Ast0.Pointer(ty2,star) ->
+         (match Ast0.unwrap ty2 with
+           Ast0.FunctionType(ty3,lp3,params,rp3) ->
+             typeC ty3;
+             mcode print_string lp;
+             mcode print_string star;
+             fn();
+             mcode print_string lb1;
+             print_option expression size1;
+             mcode print_string rb1;
+             mcode print_string rp;
+             mcode print_string lp3;
+             parameter_list params;
+             mcode print_string rp3;
+ 	| _ -> failwith "ParenType Unparse_ast0")
+     | _ -> failwith "ParenType Unparse_ast0")
+ | _ -> failwith "ParenType Unparse_ast0"
+
 and typeC t =
   print_context t
     (function _ ->
@@ -306,6 +340,13 @@ and typeC t =
       | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
 	  print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2)
 	    (function _ -> ())
+      | Ast0.ParenType(lp,ty,rp) ->
+          print_parentype (lp,ty,rp) (function _ -> ())
+      | Ast0.FunctionType(ty,lp,params,rp) ->
+          typeC ty;
+          mcode print_string lp;
+          parameter_list params;
+          mcode print_string rp
       | Ast0.Array(ty,lb,size,rb) ->
 	  typeC ty; mcode print_string lb; print_option expression size;
 	  mcode print_string rb
@@ -367,6 +408,8 @@ and print_named_type ty id =
 		mcode print_string rb)
 	| _ -> typeC ty; ident id; k () in
       loop ty (function _ -> ())
+  | Ast0.ParenType(lp,ty,rp) ->
+      print_parentype (lp,ty,rp) (function _ -> ident id)
   | _ -> typeC ty; ident id
 
 and declaration d =
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
