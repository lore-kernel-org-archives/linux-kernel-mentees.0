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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AB4C18E5B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE6592051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwpSVSAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE6592051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9869584FDD;
	Mon, 16 Mar 2020 10:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-heKd16aWpd; Mon, 16 Mar 2020 10:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 14985850E6;
	Mon, 16 Mar 2020 10:03:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11B8AC1D7C;
	Mon, 16 Mar 2020 10:03:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6A93C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A32C4864FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPkPV7wrZjRe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1FE7386456
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:50 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x2so9279851pfn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wc/ouDmQcpoUdKtqYW09f9QABpL2Tr3bOwlqrqm68xY=;
 b=nwpSVSAc0E/qkwwcNKzaq0uzwBRszBcoCrvj2hDLKMKUk4yy0vqG50i0WmlLjI7yKh
 xveyrA4F+W5KTwyq5ZhJbtDN4Qx9WJlO4oegZGUqTQmrb2b758Bn0lCMRudsaFn1HlFO
 eIPWLbFn2XPczVpY4kj+RUXQcPk8LDKudEBzQxlvAdqtmwvcSfX4ZTNKR3Tjqwn6sryV
 sbEM7bPJmq77ynxPD3hR1Xe7VH0KzFu0IKyOWh6VcBETZvCsbcH6e/aD4Qmc0419NxAv
 gWNq9icm9nWtWDhKGUcXNeYCaqFacJwXIUir4Z7GBLVp2rUiVLTgWMq1Utd+e4zKK/Xo
 1jUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wc/ouDmQcpoUdKtqYW09f9QABpL2Tr3bOwlqrqm68xY=;
 b=pNVn5EMiupCIEIVeYvCFmn/aC0Fk5UjMUHql3f89uMxLF1Gq+ydJiRJmQnMBymyRKM
 VrMx2CBQkPgRjaMjqpKIexq+s2YGKQECvNs6+7oMSyJHmpHpmkJJhyOmC2/2W8AMmMqE
 8qZ6NHr0lmjZu8x4dGnyWo8x+I0PlH505GcxE3MRxkYP4cuUs1qJtb83lOq5ZqCwVhNq
 ggWnWVeDpA5XUK8OrCH+zwXzwnLaUW4pqXSIn3O8TW9LRM9CFvLMYUiGuiE4wTmOBNXa
 QHqzm7kD6tW2yS5hBsUxaVLM+GISKgXclko5m7DcqrrSft8/WyhpADLmuSqix3mg/RG2
 XAWQ==
X-Gm-Message-State: ANhLgQ1l+UzBewGWEFw8fUGmyM58yxcENW1BW7pUHLuhvLQ3NaZ21ggN
 e15vxwBs2TAOuKcc+UNwqTQ=
X-Google-Smtp-Source: ADFU+vsQ74MNrnP+adcvHvLKv54f8bAJ6j66s1K9X5UiNIVQgo0+cpngkVSSH/iApP9OEPhwRx6p9w==
X-Received: by 2002:a63:c40a:: with SMTP id h10mr25701509pgd.291.1584353029587; 
 Mon, 16 Mar 2020 03:03:49 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:03:49 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:32:58 +0530
Message-Id: <20200316100319.27935-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/26] parsing_cocci: visitor_ast0:
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
