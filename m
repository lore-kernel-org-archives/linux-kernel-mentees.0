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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C277C18E5B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42ACD206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1GC4AC+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42ACD206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 37733204BE;
	Sun,  8 Mar 2020 08:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDq23M+6pRgM; Sun,  8 Mar 2020 08:44:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 75E7620004;
	Sun,  8 Mar 2020 08:44:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64BBAC1D7E;
	Sun,  8 Mar 2020 08:44:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F505C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3EC2087C57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tKBoPV01Fas
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9EEC787C56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:19 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t14so2755875plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qagemmdAByghWog/PZSgjV9lDfhA1TgFTR47PU95//M=;
 b=d1GC4AC+XpmzJ+bm7oLAgwMAh0wGT2P3Lm9WsnOHeJnIkX/mOrLiHVnxqdTeoCq85Q
 Mh2t9hGbQWkdxgowh4LvC55kBfDAqKVwvOf2SXWqpOAEPxbBajnSTDztXuPhSXZyAq8c
 9QW7kqLBe8Id8mVUk4wzI4CXnYbNaA7RbEmJa3N7sZj3d+UOhzfnBcKLPgtGPQgTSPjW
 eJWTUW+nw3VTRI7Kkzzfi/zO0EcQQDqlLx3g0rJbafKJVE5L6N9rqCPHN0UqIksSBSbD
 2jpaSlIcLoaLAmSlNrdbwhSbfkM4m+1FY1jbBVY0cwgpE39MflRaMvoT05CSuy5iwJDr
 e3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qagemmdAByghWog/PZSgjV9lDfhA1TgFTR47PU95//M=;
 b=fibtHNRSgio/ZAQZDPSNg9te6KLQsjKpc7XXGjOwfVd6otjvXSnKFP9S4M82nRPDio
 hToT9ZxJtsCcJar3GjVA3L+QhoyEVs0F+T2s1+Y9FM4+l/iNMsj4zHGI5QEtp6EIrUC3
 7aqYTtcjN4OzYYYOeaWDmqyFXJpqosN0Lx/lSPjmUOBLtdJM9pF4dz96PL03y2ev/dhX
 eJLW8hxjRVaz0HudqvLkT58sRHgT3h2HVoWhHy0yfXwh4PvVDHHgmPQ8nc8rIUr/op4e
 54CUgPDxwbDwnGZdqT/tCJz1rVITB+iDbsdAZ78DJhrUGd0BHsauRiPN4KBS61fhYAIT
 EifA==
X-Gm-Message-State: ANhLgQ1Iq2UR5fgsJ7HC2GyXNRbbMbZGKRZjuW5XSw4QwVHyRgyYiCJw
 zDtc0CG6pvLnEPwmH+Rb9Yo=
X-Google-Smtp-Source: ADFU+vtnKOaVgntM6nicPE6H1uYoM812COQm0nIquik+g1h1po5hkvx/uc8LKlp1J5aoWnnq63bqhg==
X-Received: by 2002:a17:90a:1b4c:: with SMTP id
 q70mr12992692pjq.106.1583657059060; 
 Sun, 08 Mar 2020 00:44:19 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:18 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:47 +0530
Message-Id: <20200308084356.14506-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 04/13] parsing_cocci: Add EnumDeclTag
	and EnumDeclDotsTag to SmPL ASTs
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

These constructors are needed by the visitor and various other
functions in the codebase. Maintain consistency and add these
constructs w/r/t changes in the SmPL AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0_cocci.ml  | 4 ++++
 parsing_cocci/ast0_cocci.mli | 4 ++++
 parsing_cocci/ast_cocci.ml   | 4 ++++
 parsing_cocci/ast_cocci.mli  | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/parsing_cocci/ast0_cocci.ml b/parsing_cocci/ast0_cocci.ml
index b3d8b137..70486e4c 100644
--- a/parsing_cocci/ast0_cocci.ml
+++ b/parsing_cocci/ast0_cocci.ml
@@ -553,6 +553,7 @@ and anything =
   | DotsStmtTag of statement dots
   | DotsDeclTag of declaration dots
   | DotsFieldTag of field dots
+  | DotsEnumDeclTag of enum_decl dots
   | DotsCaseTag of case_line dots
   | DotsDefParamTag of define_param dots
   | IdentTag of ident
@@ -566,6 +567,7 @@ and anything =
   | InitTag of initialiser
   | DeclTag of declaration
   | FieldTag of field
+  | EnumDeclTag of enum_decl
   | StmtTag of statement
   | ForInfoTag of forinfo
   | CaseLineTag of case_line
@@ -585,6 +587,7 @@ let dotsInit x = DotsInitTag x
 let dotsStmt x = DotsStmtTag x
 let dotsDecl x = DotsDeclTag x
 let dotsField x = DotsFieldTag x
+let dotsEnumDecl x = DotsEnumDeclTag x
 let dotsCase x = DotsCaseTag x
 let dotsDefParam x = DotsDefParamTag x
 let ident x = IdentTag x
@@ -601,6 +604,7 @@ let forinfo x = ForInfoTag x
 let case_line x = CaseLineTag x
 let string_fragment x = StringFragmentTag x
 let top x = TopTag x
+let enum_decl x = EnumDeclTag x
 
 (* --------------------------------------------------------------------- *)
 (* Avoid cluttering the parser.  Calculated in compute_lines.ml. *)
diff --git a/parsing_cocci/ast0_cocci.mli b/parsing_cocci/ast0_cocci.mli
index 732a1345..7b2a87c4 100644
--- a/parsing_cocci/ast0_cocci.mli
+++ b/parsing_cocci/ast0_cocci.mli
@@ -542,6 +542,7 @@ and anything =
   | DotsStmtTag of statement dots
   | DotsDeclTag of declaration dots
   | DotsFieldTag of field dots
+  | DotsEnumDeclTag of enum_decl dots
   | DotsCaseTag of case_line dots
   | DotsDefParamTag of define_param dots
   | IdentTag of ident
@@ -555,6 +556,7 @@ and anything =
   | InitTag of initialiser
   | DeclTag of declaration
   | FieldTag of field
+  | EnumDeclTag of enum_decl
   | StmtTag of statement
   | ForInfoTag of forinfo
   | CaseLineTag of case_line
@@ -574,6 +576,7 @@ val dotsParam : parameterTypeDef dots -> anything
 val dotsStmt : statement dots -> anything
 val dotsDecl : declaration dots -> anything
 val dotsField : field dots -> anything
+val dotsEnumDecl : enum_decl dots -> anything
 val dotsCase : case_line dots -> anything
 val dotsDefParam : define_param dots -> anything
 val ident : ident -> anything
@@ -585,6 +588,7 @@ val param : parameterTypeDef -> anything
 val ini : initialiser -> anything
 val decl : declaration -> anything
 val field : field -> anything
+val enum_decl : enum_decl -> anything
 val stmt : statement -> anything
 val forinfo : forinfo -> anything
 val case_line : case_line -> anything
diff --git a/parsing_cocci/ast_cocci.ml b/parsing_cocci/ast_cocci.ml
index 8fa64dcc..27942992 100644
--- a/parsing_cocci/ast_cocci.ml
+++ b/parsing_cocci/ast_cocci.ml
@@ -790,6 +790,7 @@ and anything =
   | LogicalOpTag        of logicalOp
   | DeclarationTag      of declaration
   | FieldTag            of field
+  | EnumDeclTag         of enum_decl
   | InitTag             of initialiser
   | StorageTag          of storage
   | IncFileTag          of inc_file
@@ -807,6 +808,7 @@ and anything =
   | StmtDotsTag         of statement dots
   | AnnDeclDotsTag      of annotated_decl dots
   | AnnFieldDotsTag     of annotated_field dots
+  | EnumDeclDotsTag     of enum_decl dots
   | DefParDotsTag       of define_param dots
   | TypeCTag            of typeC
   | ParamTag            of parameterTypeDef
@@ -932,6 +934,7 @@ and tag2c = function
   | LogicalOpTag _ -> "LogicalOpTag"
   | DeclarationTag _ -> "DeclarationTag"
   | FieldTag _ -> "FieldTag"
+  | EnumDeclTag _ -> "EnumDeclTag"
   | InitTag _      -> "InitTag"
   | StorageTag _   -> "StorageTag"
   | IncFileTag _   -> "IncFileTag"
@@ -949,6 +952,7 @@ and tag2c = function
   | StmtDotsTag _ -> "StmtDotsTag"
   | AnnDeclDotsTag _ -> "AnnDeclDotsTag"
   | AnnFieldDotsTag _ -> "AnnFieldDotsTag"
+  | EnumDeclDotsTag _ -> "EnumDeclDotsTag"
   | DefParDotsTag _ -> "DefParDotsTag"
   | TypeCTag _ -> "TypeCTag"
   | ParamTag _ -> "ParamTag"
diff --git a/parsing_cocci/ast_cocci.mli b/parsing_cocci/ast_cocci.mli
index e921f917..8316a427 100644
--- a/parsing_cocci/ast_cocci.mli
+++ b/parsing_cocci/ast_cocci.mli
@@ -759,6 +759,7 @@ and anything =
   | LogicalOpTag        of logicalOp
   | DeclarationTag      of declaration
   | FieldTag            of field
+  | EnumDeclTag         of enum_decl
   | InitTag             of initialiser
   | StorageTag          of storage
   | IncFileTag          of inc_file
@@ -776,6 +777,7 @@ and anything =
   | StmtDotsTag         of statement dots
   | AnnDeclDotsTag      of annotated_decl dots
   | AnnFieldDotsTag     of annotated_field dots
+  | EnumDeclDotsTag     of enum_decl dots
   | DefParDotsTag       of define_param dots
   | TypeCTag            of typeC
   | ParamTag            of parameterTypeDef
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
