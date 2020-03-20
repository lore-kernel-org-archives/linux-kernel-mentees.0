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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA30C4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F80D20774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+sugBOL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F80D20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 97DB627431;
	Fri, 20 Mar 2020 07:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1-EY37C7b8U; Fri, 20 Mar 2020 07:02:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 008EC273EF;
	Fri, 20 Mar 2020 07:02:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0C4AC089E;
	Fri, 20 Mar 2020 07:02:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1282BC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 01E1787347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zmg4oR6M8vll
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7F03487447
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:19 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id bo3so2055282pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOy2P7xnZeB942CElSaWOrvf5AZZ+z5sEgbUodzwkbY=;
 b=E+sugBOL7VvarLIyTQ9NvrZCGdF3Wf48LyPCNJQ8248ikJL7DPydbj2WhuL6gqW/P+
 1XLm/2fFYmVJQAq8Ab0HIMUgxf3W1jUbIM1ALFksaLy50lwGzkfLXaqscqr2SI4WNsS8
 qSeIdKPS9lXqiKCkYuMHYqF1nDoY3G70CEVdIHlpYf3HdhtzZzP7szk4nH6vcPVSmtjk
 jS/q5O54DMLDWRzM7nZNZ9kNrgMiDc+dDKN7DMoYKAHsVhjg09CASYDGPhQiJHLddYor
 V9xj9T2ynwxtnL+HrNIPozkjBISRFhAdVOzncDWPXGTVZnvsrazqyPjEcoarFP8mha7i
 rfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOy2P7xnZeB942CElSaWOrvf5AZZ+z5sEgbUodzwkbY=;
 b=kvoQqZkZ6v4nQcgIDf86IW01eiaNRuQn+Uzg/xeKIh9MfEsWC20QnJ1JVas2FtNPYq
 qudydWhtVL28v7BRssY4U6fGomJjJrdDMTGVD9oA7Hzo4tEEkV/hzsrBsEmYNWKadH5K
 jnIqkT+AA/TH9zFc12KD8g8wuluIiAUKWb82fLZdHjCYem5EOYh3iO15s0xkkerpnIDT
 HDwwlJf+5jBkl10qpVq9KlfguJ6+2iHMd+lZ8zWHavdbyhCM6m3Z4tDsqMCM7tdQacko
 6dcu5U7VVgatxE/IIiQVIy9uEPuOjLmhQuwv0RrxQMRULJdd9LhTv8fggs3K85EVyDtp
 nzDw==
X-Gm-Message-State: ANhLgQ2pkP+9h0a2HpTPDFt8ttD1O54craZvtaZPVjESNtEdp8xKPLs5
 dd7EN6RKTYuwEJ9eGPf96g0=
X-Google-Smtp-Source: ADFU+vsC1RiJReC7zceZvoDJ+Te7NqL0OEVJe3GJp8kGUOPiZZPfl/LKuBYSxmUNFu1xW1ZV/Q290A==
X-Received: by 2002:a17:90a:fa11:: with SMTP id
 cm17mr8059861pjb.78.1584687738952; 
 Fri, 20 Mar 2020 00:02:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:33 +0530
Message-Id: <20200320070157.4206-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 02/26] parsing_cocci: AST: Add
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

For a function pointer as follows:

int (*x)(params)

The SmPL AST would be as follows:

ParenType -> Pointer -> FunctionType params -> BaseType int

For an array of function pointers as follows:

int (*x[2])(params)

The SmPL AST would be as follows:

ParenType -> Array 2 -> Pointer -> FunctionType params -> BaseType int

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
