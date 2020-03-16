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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71083C2BB1D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:03:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442CE2051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:03:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTAHKKmA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442CE2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2327A864FB;
	Mon, 16 Mar 2020 10:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StNSR5q1LxPu; Mon, 16 Mar 2020 10:03:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D39D86456;
	Mon, 16 Mar 2020 10:03:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89FB2C1D7C;
	Mon, 16 Mar 2020 10:03:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 407BBC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3A66387AA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 607v1PtYFDHg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9641887A9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m5so9478590pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+3Ft9r0mp9w73EYF4QG/IldFw5ZluCT6wQKOTaDhbE=;
 b=QTAHKKmA/zGppCdqkRoLwOgjkrAIBAm3NV1fHQepn5jylNj3AlBKb/8JsqIGFCriGP
 rQdsJvdd02O5IIR2tx9+q0DfyazW7vFQ5oBbsa3R6fWJtLpWZiUE1Xo/+9SVhDKgCkWx
 aTaJidbpZPmGUlJZt2qD0c+yhfDTg4Ap7wsQmI3AH/YsATDeLubwL/a+L1B3Igh0OKGr
 oCyeAFQ1kv0XUCBV/tvWmuOA8ZFzAzsG4YsHSF9JHBTUh/4kjslvEo5K5WCn9RU54397
 TlPpeBMflvbVSYtDGiSx7jMFG+PRIEF0PgfCmbRRL9Ax/D2u5zrBre8v0hTevHf8IkJn
 k9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+3Ft9r0mp9w73EYF4QG/IldFw5ZluCT6wQKOTaDhbE=;
 b=tIyFHA3USFqfcgBI/zbTi8IaWd3yqp3FyJ2khTE5F8J60m8Gv/KhRn3DtkBvsZypCG
 7hNk1csJPxwsuGvjuxqgoabAzLHj5q0fPbe+ogQhljwW12zIwVUlSmR8wk45H9DwT+VO
 2aHf+T7DrRhieaXcNXS+LKi2LoGcZpT7Nb/XF2slT+bYx0nBpSZma01uHIavRattOZLf
 mJzrC5eA0oqQ3jonZy10aCWfhFEusEzKRwZ3gW1eCBYwn/b65BhKef7FF9KsZYx2ZRz6
 9UGo1O8bPpa5bO9f1Sdt0F0Apz2rpQyu/OKqjyR5az2dRsrs8UTAM6VHzF2D2UcFTOBl
 N1Pw==
X-Gm-Message-State: ANhLgQ3x0rFOKD3yV0Q1Hal7bMNz3NXSmQswYt5H8ZPobMZCDJ/EWs30
 01nL4Q5CbknvVhLjBMh6mbQP7DRy
X-Google-Smtp-Source: ADFU+vuqGMHRo2hjtMKa6FHQnihc3U9MOYtoPrkgBqq0Q2oy517H4yk5TTTgMX3rypNFizI4cRHqKg==
X-Received: by 2002:aa7:8708:: with SMTP id b8mr28664996pfo.209.1584353018969; 
 Mon, 16 Mar 2020 03:03:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:03:38 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:32:55 +0530
Message-Id: <20200316100319.27935-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/26] parsing_cocci: AST: Add
	ParenType and FunctionType to SmPL ASTs
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

ParenType and FunctionType are types present in the C AST that
are not present in the SmPL AST. In the pursuit of aligning
both the C and SmPL ASTs, add these types to the SmPL ASTs.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli           | 6 ++++++
 parsing_cocci/ast0_cocci.ml  | 3 +++
 parsing_cocci/ast0_cocci.mli | 3 +++
 parsing_cocci/ast_cocci.ml   | 3 +++
 parsing_cocci/ast_cocci.mli  | 3 +++
 5 files changed, 18 insertions(+)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index 5a913099..e5409a97 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -2709,6 +2709,9 @@ module Ast_cocci :
       | Pointer of fullType * string mcode
       | FunctionPointer of fullType * string mcode * string mcode *
           string mcode * string mcode * parameter_list * string mcode
+      | ParenType of string mcode (* ( *) * fullType * string mcode (* ) *)
+      | FunctionType of fullType *
+          string mcode (* ( *) * parameter_list * string mcode (* ) *)
       | Array of fullType * string mcode * expression option * string mcode
       | Decimal of string mcode * string mcode * expression *
           string mcode option * expression option * string mcode
@@ -3353,6 +3356,9 @@ module Ast0_cocci :
       | Pointer of typeC * string mcode
       | FunctionPointer of typeC * string mcode * string mcode *
           string mcode * string mcode * parameter_list * string mcode
+      | ParenType of string mcode * typeC * string mcode
+      | FunctionType of typeC *
+          string mcode * parameter_list * string mcode
       | Array of typeC * string mcode * expression option * string mcode
       | Decimal of string mcode * string mcode * expression *
           string mcode option * expression option * string mcode
diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index 77dc46f0..0acbeaa4 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -203,6 +203,9 @@ and base_typeC =
   | FunctionPointer of typeC *
 	          string mcode(* ( *)*string mcode(* * *)*string mcode(* ) *)*
                   string mcode (* ( *)*parameter_list*string mcode(* ) *)
+  | ParenType       of string mcode (* ( *) * typeC * string mcode (* ) *)
+  | FunctionType    of typeC *
+                  string mcode (* ( *) * parameter_list * string mcode (* ) *)
   | Array           of typeC * string mcode (* [ *) *
 	               expression option * string mcode (* ] *)
   | Decimal         of string mcode (* decimal *) * string mcode (* ( *) *
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index 274c6bc2..33bd12b2 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -194,6 +194,9 @@ and base_typeC =
   | FunctionPointer of typeC *
 	          string mcode(* ( *)*string mcode(* * *)*string mcode(* ) *)*
                   string mcode (* ( *)*parameter_list*string mcode(* ) *)
+  | ParenType       of string mcode (* ( *) * typeC * string mcode (* ) *)
+  | FunctionType    of typeC *
+                  string mcode (* ( *) * parameter_list * string mcode (* ) *)
   | Array           of typeC * string mcode (* [ *) *
 	               expression option * string mcode (* ] *)
   | Decimal         of string mcode (* decimal *) * string mcode (* ( *) *
diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index ba6ec29e..f8e6dee6 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -343,6 +343,9 @@ and base_typeC =
   | FunctionPointer of fullType *
 	          string mcode(* ( *)*string mcode(* * *)*string mcode(* ) *)*
                   string mcode (* ( *)*parameter_list*string mcode(* ) *)
+  | ParenType       of string mcode (* ( *) * fullType * string mcode (* ) *)
+  | FunctionType    of fullType *
+                  string mcode (* ( *) * parameter_list * string mcode (* ) *)
   | Array           of fullType * string mcode (* [ *) *
 	               expression option * string mcode (* ] *)
   | Decimal         of string mcode (* decimal *) * string mcode (* ( *) *
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index 5f21664b..7fb54e4d 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -325,6 +325,9 @@ and base_typeC =
   | FunctionPointer of fullType *
 	          string mcode(* ( *)*string mcode(* * *)*string mcode(* ) *)*
                   string mcode (* ( *)*parameter_list*string mcode(* ) *)
+  | ParenType       of string mcode (* ( *) * fullType * string mcode (* ) *)
+  | FunctionType    of fullType *
+                  string mcode (* ( *) * parameter_list * string mcode (* ) *)
   | Array           of fullType * string mcode (* [ *) *
 	               expression option * string mcode (* ] *)
   | Decimal         of string mcode (* decimal *) * string mcode (* ( *) *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
