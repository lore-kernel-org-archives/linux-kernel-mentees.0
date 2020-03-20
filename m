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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26E6C4332E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C881020774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dap1DcRa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C881020774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 86EC187432;
	Fri, 20 Mar 2020 07:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r67gkgiY1GUW; Fri, 20 Mar 2020 07:03:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E2DB87347;
	Fri, 20 Mar 2020 07:03:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E1F0C089E;
	Fri, 20 Mar 2020 07:03:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA632C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E4AD687432
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pb8IGbHBOJOo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C1A5387347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:30 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id v13so2072570pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m2efzd5IZRl0b0Z89qpMcgnyNMT8Z6sNaXDMpfksIfQ=;
 b=Dap1DcRaANmR5V5iQdY+kYI5aorAHAg/wtiKDaaaAwZLm8lWHqyPNjdildC6b/iiZ7
 eDvINVZNZukfa2qV2dvTnbzpNQDEJkLsX08/1j8dUTMivBtXCm7pRZrYo/q/zV8XRDiU
 hty2vVO4KOLPMZauREEXiIhefTRQjg327TdLtMIDexwOP/07+MwMhksQ9pPNBwS0ahn8
 W0s3gbaMWtP0ohDj7yh/sNGH3+lKU/y5o8FUPfpoCdakn6sVMVKgK2XXGmaJTj8/v7ko
 +tUbqk5Y8/rxeztzlvjC5QPSVDwWInzGOzfUzWeXTZXoGKRplm6FAcyanYBRejaG4vRG
 VSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m2efzd5IZRl0b0Z89qpMcgnyNMT8Z6sNaXDMpfksIfQ=;
 b=bELNWEZ8ojNXLFcB3qNp5eaKAyslMELYuRX09hlqsHo0AuibzsUPvYKTQjhQBy/za0
 ciSGpX2zQF6QFesirx0EAl9zE9DsDP9F59VOqF5MidJC3mdnyP7ZDJgnIleAUQWEnuyl
 /HcCJTwgvVGvniLbRfrhrTrLOUc/trA2+IuYByazoCXOW/m0GF9NokE1XD7+WaHXWr7A
 02mCTtt9mMn1VBauGs2FbE2QIUAZLrFWlf5K6OUUHj+NtDefso/nLG/TeJjMFxikui+C
 NeXR0q334K1K70douQl6hsIRdYuvg2e2Ok/B1J8+yzpbKG9v/6rDxhOaPHlQCrYqKeLr
 U3bg==
X-Gm-Message-State: ANhLgQ3MBTOD9Q+jINPa1DKhs3NHP951C63Mb3/sa0+yhIeAqWbtfVFB
 5lhjiymLM9RKVG3sSt4j7rg=
X-Google-Smtp-Source: ADFU+vsYGWlDAP47bxMdGxZx7YzKb4jCJX1sVr4zXcUVMru9HrxEYzDbwcoLkxuHEgPhXhC7lK8jhg==
X-Received: by 2002:a17:90a:cf96:: with SMTP id
 i22mr8181121pju.66.1584687810292; 
 Fri, 20 Mar 2020 00:03:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:29 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:52 +0530
Message-Id: <20200320070157.4206-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 21/26] parsing_cocci:
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
 parsing_cocci/pretty_print_cocci.ml | 50 +++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/parsing_cocci/pretty_print_cocci.ml b/parsing_cocci/pretty_print_cocci.ml
index 6338e464..8055ba3b 100644
--- a/parsing_cocci/pretty_print_cocci.ml
+++ b/parsing_cocci/pretty_print_cocci.ml
@@ -403,6 +403,47 @@ and print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2) fn =
   mcode print_string rp1; mcode print_string lp1;
   parameter_list params; mcode print_string rp2
 
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
+               print_space();
+               mcode print_string lp;
+               mcode print_string star;
+               fn();
+               let _ =
+                 match array_dec with
+                   Some(lb1,size,rb1) ->
+                      mcode print_string lb1;
+                      print_option expression size;
+                      mcode print_string rb1
+                 | None -> () in
+               mcode print_string rp;
+               mcode print_string lp3;
+               parameter_list params;
+               mcode print_string rp3
+           | _ -> failwith "ParenType Pretty_print_cocci")
+         | _ -> failwith "ParenType Pretty_print_cocci")
+       | _ -> failwith "ParenType Pretty_print_cocci")
+     | _ -> failwith "ParenType Pretty_print_cocci" in
+  match Ast.unwrap ty with
+    Ast.Type(_,_,fty1) ->
+      (match Ast.unwrap fty1 with
+        Ast.Array(ty1,lb1,size,rb1) ->
+          function_pointer ty1 (Some(lb1,size,rb1))
+      | Ast.Pointer(ty1,star) ->
+          function_pointer ty None
+      | _ -> failwith "ParenType Pretty_print_cocci")
+   | _ -> failwith "ParenType Pretty_print_cocci"
+
+
 and varargs = function
   | None -> ()
   | Some (comma, ellipsis) ->
@@ -424,6 +465,13 @@ and typeC ty =
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
@@ -498,6 +546,8 @@ and print_named_type ty id =
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
