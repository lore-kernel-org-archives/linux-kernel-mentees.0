Return-Path: <SRS0=hY7L=4Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527CDC3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 294BC206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vTA6AwJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 294BC206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF21D87987;
	Sun,  8 Mar 2020 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jd8KMrOeamV3; Sun,  8 Mar 2020 08:44:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F329E87C5A;
	Sun,  8 Mar 2020 08:44:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3075C1D7E;
	Sun,  8 Mar 2020 08:44:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C20B0C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B114787C57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPO7jg3vPdIE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C453887987
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:08 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i13so3418526pfe.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vOKXLRyIQIQIj6PkqX4hLM7maWPHM49HWGvwgyeyiF0=;
 b=vTA6AwJeHjohV86/1Ci2LCdydD47Kve7mlRRD3CrHLsviH0R6qgKy9OVbBKE8MG+ba
 KvRK52+3zBwsbMiQnhMmHpkdgt/l+vdjlZeFlvVCOfRGCqmN/+oe40ylvkTDJI+Ndw3R
 3uTD036Z+IkaJjLsPItkQ3KPAOICgD1/9QYrE7A7yOviYEwbtw3AEMwQvzWVdYXmTf1f
 U4JK1PADDSXbH+SdksZRnkUj0iLREU+UOk/OQY9kmieYHvov8CGEZmUYDCRCGELRHME6
 KOtyqDTcrV53QpeqR98Mo18Joz4ASsKmcijpuO3vmRp4POrAXB74EIjmk6TDnyP87keA
 S2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vOKXLRyIQIQIj6PkqX4hLM7maWPHM49HWGvwgyeyiF0=;
 b=hF3HYZQHs76v/kAGX4KywUgQEYd9zFeMk4kZdfeOFT6Vnp+mKVij+vo3TANsXA6Pbj
 kjdQhfZ8pKHxOWckDi0V8vrn+y/9soVulCEYkJb//RtkZhzhMTx+2Mf/tAwkxVlPwTbM
 Tx663qR9laqENEP/O0hkv3Y345A8FsHREh3im6R/Pt4r4ANeq5mE9GtPbh3qDQ7on0As
 3ibw0+0w6Fa9wn9UnoQd8R/qbZSwR7v3dO9Zf2N9TXFloNLhpt03UEu3qEkWrJXrqvyp
 TzpQ404OWXSoJPRnJUXqV28aOGN2u1GC7DRt4LTYuBCWZ75tkktW+6sv9g6N6gmeMSjt
 fnWQ==
X-Gm-Message-State: ANhLgQ3GgtjPPeCjZiIUKjMLA0xohxImRa0PhLVe9x0cKSc6fQNRpIrP
 zquFex3fFyPRWCtYrKAe9iE=
X-Google-Smtp-Source: ADFU+vuI40k+4u0NkHaLII9DYy+ZDo82clHxyYQIt2GhVNbJg7Jgw3umyIa9SOrrENqA+SOscRBcGA==
X-Received: by 2002:a63:3111:: with SMTP id x17mr11356596pgx.422.1583657048317; 
 Sun, 08 Mar 2020 00:44:08 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:07 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:44 +0530
Message-Id: <20200308084356.14506-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 01/13] parsing_cocci: Align C AST and
	SmPL AST for enum
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

The C AST and SmPL AST differs with respect to the enum type.

For an enumerator, the C AST is as follows:
	Enum -> list of (name, (info, expression))

For the same, the SmPL AST is as follows:
	EnumDef -> list of expression

While the SmPL parser does make sure that enumerators are
parsed as per C rules, the OCaml types for an enumerator themselves
mismatch, due to their organization. This causes bugs/mismatches for
cases where enums are in disjunctions.

Make the enumerator type of the SmPL AST closer to that of
the C AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0_cocci.ml  | 11 ++++++++++-
 parsing_cocci/ast0_cocci.mli | 10 +++++++++-
 parsing_cocci/ast_cocci.ml   |  9 ++++++++-
 parsing_cocci/ast_cocci.mli  | 10 +++++++++-
 4 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index 77dc46f0..b3d8b137 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -211,7 +211,7 @@ and base_typeC =
 	               string mcode (* ) *) (* IBM C only *)
   | EnumName        of string mcode (*enum*) * ident option (* name *)
   | EnumDef  of typeC (* either StructUnionName or metavar *) *
-	string mcode (* { *) * expression dots * string mcode (* } *)
+	string mcode (* { *) * enum_decl dots * string mcode (* } *)
   | StructUnionName of Ast.structUnion mcode * ident option (* name *)
   | StructUnionDef  of typeC (* either StructUnionName or metavar *) *
 	string mcode (* { *) * field dots * string mcode (* } *)
@@ -288,6 +288,15 @@ and bitfield = string mcode (* : *) * expression
 
 and field = base_field wrap
 
+and base_enum_decl =
+    Enum of ident * (string mcode (* = *) * expression) option
+  | EnumComma of string mcode (* , *)
+  | EnumDots of string mcode (* ... *) * (string mcode * string mcode *
+                enum_decl) option (* whencode *)
+
+and enum_decl = base_enum_decl wrap
+
+
 (* --------------------------------------------------------------------- *)
 (* Initializers *)
 
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index 274c6bc2..732a1345 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -202,7 +202,7 @@ and base_typeC =
 	               string mcode (* ) *) (* IBM C only *)
   | EnumName        of string mcode (*enum*) * ident option (* name *)
   | EnumDef  of typeC (* either StructUnionName or metavar *) *
-	string mcode (* { *) * expression dots * string mcode (* } *)
+	string mcode (* { *) * enum_decl dots * string mcode (* } *)
   | StructUnionName of Ast_cocci.structUnion mcode * ident option (* name *)
   | StructUnionDef  of typeC (* either StructUnionName or metavar *) *
 	string mcode (* { *) * field dots * string mcode (* } *)
@@ -276,6 +276,14 @@ and bitfield = string mcode (* : *) * expression
 
 and field = base_field wrap
 
+and base_enum_decl =
+    Enum of ident * (string mcode (* = *) * expression) option
+  | EnumComma of string mcode (* , *)
+  | EnumDots of string mcode (* ... *) * (string mcode * string mcode *
+                enum_decl) option (* whencode *)
+
+and enum_decl = base_enum_decl wrap
+
 (* --------------------------------------------------------------------- *)
 (* Initializers *)
 
diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index ba6ec29e..8fa64dcc 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -351,7 +351,7 @@ and base_typeC =
 	               string mcode (* ) *) (* IBM C only *)
   | EnumName        of string mcode (*enum*) * ident option (* name *)
   | EnumDef  of fullType (* either EnumName or metavar *) *
-	string mcode (* { *) * expression dots * string mcode (* } *)
+	string mcode (* { *) * enum_decl dots * string mcode (* } *)
   | StructUnionName of structUnion mcode * ident option (* name *)
   | StructUnionDef  of fullType (* either StructUnionName or metavar *) *
 	string mcode (* { *) * annotated_field dots * string mcode (* } *)
@@ -443,6 +443,13 @@ and base_annotated_field =
 
 and annotated_field = base_annotated_field wrap
 
+and base_enum_decl =
+    Enum of ident * (string mcode (* = *) * expression) option
+  | EnumComma of string mcode (* , *)
+  | EnumDots of string mcode (* ... *) * enum_decl option (* whencode *)
+
+and enum_decl = base_enum_decl wrap
+
 (* --------------------------------------------------------------------- *)
 (* Initializers *)
 
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index 5f21664b..e921f917 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -333,7 +333,7 @@ and base_typeC =
 	               string mcode (* ) *) (* IBM C only *)
   | EnumName        of string mcode (*enum*) * ident option (* name *)
   | EnumDef  of fullType (* either EnumName or metavar *) *
-	string mcode (* { *) * expression dots * string mcode (* } *)
+	string mcode (* { *) * enum_decl dots * string mcode (* } *)
   | StructUnionName of structUnion mcode * ident option (* name *)
   | StructUnionDef  of fullType (* either StructUnionName or metavar *) *
 	string mcode (* { *) * annotated_field dots * string mcode (* } *)
@@ -424,6 +424,14 @@ and base_annotated_field =
 
 and annotated_field = base_annotated_field wrap
 
+and base_enum_decl =
+    Enum of ident * (string mcode (* = *) * expression) option
+  | EnumComma of string mcode (* , *)
+  | EnumDots of string mcode (* ... *) * enum_decl option (* whencode *)
+
+and enum_decl = base_enum_decl wrap
+
+
 (* --------------------------------------------------------------------- *)
 (* Initializers *)
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
