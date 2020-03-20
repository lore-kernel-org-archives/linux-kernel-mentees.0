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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDADC4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B542120774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoARcBd4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B542120774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A34E87479;
	Fri, 20 Mar 2020 07:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01sAPhoQGB06; Fri, 20 Mar 2020 07:02:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 300B587347;
	Fri, 20 Mar 2020 07:02:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C446C089E;
	Fri, 20 Mar 2020 07:02:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAB0FC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A7EAA880F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgklTR6ZJ06Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3D03386B53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:46 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id r3so2093475pls.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHQWLluwcRw7zGnfTxQ4FW/aOU4l5wA/J3oP9UErftM=;
 b=YoARcBd4x2AnDJa5fcow3Z4QWZom3XX4bjl4ddcL5E+dBxFhtDtf4iKpmE5jF5rFef
 OwdIu6QYDGMCyv3va2k57dVkbzYGLU3nQA1xitaS3yUAZ1TmPuQUbB+xdglVDfg4/VYK
 eFGrIwSLQjR5WfxBrXi7QnuVb3UTsYGTbjr6MdEVZ75EL1iIosXKu6W3evcAQny4dZJt
 tofXJtFOo3wADUvHVlXpzfn4jQ4d2mP12bFbS2RNNFEn3IutgfbY8eKjp8LLVn1iJsbN
 8g9PGY+gqQxq9zOBC3i8GnVbxlU2LCMuy61xyymcAIeh27hdfKhP1trWSZDd7tKrcfrX
 6U2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHQWLluwcRw7zGnfTxQ4FW/aOU4l5wA/J3oP9UErftM=;
 b=codraNxUam3pbqbbD2wSdbwzr6URHG1A+0KUaUpcjRHB+L5DObagp7H8RJmm/U09/i
 zTloVeCFVojLBAcOm3hKmDTtE+ioKIr100UsIHDbfR8qD8yvlNZuUSIqgh1dP2AQR36X
 uhQZfOiUDmP21lUCkAPq+a+VIcGnsbitm2e69L58YAC3FqOfwRzJXIjh4G6Rj9/M8PG2
 sLq4HOSQQyyFUCORfWETW2tp33t36+gsb7D5Pebl07FKpz3LKzZ/HLBjDFvo0KrUO43j
 NiA+G91i8YxYZ3c4F+Ja0VQqgMc0eqzd3/sCVKfUWl33gQUqhC+/r1+hnaNOCn1wRDik
 S+gw==
X-Gm-Message-State: ANhLgQ3ffA+EwPm3osjOEZFphaa1z/C2gEjfML7lV5+ebojc+/gT5efd
 SqXDRRHtEiN6hQXw92XMmXE=
X-Google-Smtp-Source: ADFU+vtQFp2f9ypWs/oesIE2mMv38cOEKQoUkB0UeXbqvPnl2oup0ecOqof1K9z1/z7Fn62SGZTSOg==
X-Received: by 2002:a17:902:9f87:: with SMTP id
 g7mr7176306plq.32.1584687765795; 
 Fri, 20 Mar 2020 00:02:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:45 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:40 +0530
Message-Id: <20200320070157.4206-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 09/26] parsing_cocci:
	unparse_ast0: Add cases for ParenType/FunctionType
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
 parsing_cocci/unparse_ast0.ml | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
index 5d450e0e..76288087 100644
--- a/parsing_cocci/unparse_ast0.ml
+++ b/parsing_cocci/unparse_ast0.ml
@@ -292,6 +292,35 @@ and print_function_pointer (ty,lp1,star,rp1,lp2,params,rp2) fn =
   mcode print_string rp1; mcode print_string lp2;
   parameter_list params; mcode print_string rp2
 
+and print_parentype (lp,ty,rp) fn =
+  let function_pointer ty1 array_decs =
+    match Ast0.unwrap ty1 with
+      Ast0.Pointer(ty2,star) ->
+        (match Ast0.unwrap ty2 with
+          Ast0.FunctionType(ty3,lp3,params,rp3) ->
+            typeC ty3;
+            mcode print_string lp;
+            mcode print_string star;
+            let _ =
+              match array_decs with
+                Some(lb1,size,rb1) ->
+                  mcode print_string lb1;
+                  print_option expression size;
+                  mcode print_string rb1
+              | None -> () in
+            mcode print_string rp;
+            mcode print_string lp3;
+            parameter_list params;
+            mcode print_string rp3;
+	| _ -> failwith "ParenType Unparse_ast0")
+    | _ -> failwith "ParenType Unparse_ast0" in
+  match Ast0.unwrap ty with
+    Ast0.Array(ty1,lb1,size,rb1) ->
+      function_pointer ty1 (Some(lb1,size,rb1))
+  | Ast0.Pointer(ty1,star) ->
+      function_pointer ty None
+  | _ -> failwith "ParenType Unparse_ast0"
+
 and typeC t =
   print_context t
     (function _ ->
@@ -306,6 +335,13 @@ and typeC t =
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
@@ -367,6 +403,8 @@ and print_named_type ty id =
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
