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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB4EC10F28
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03CF6206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGR9rIC1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03CF6206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DA9A788277;
	Sun,  8 Mar 2020 08:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIdc9qj3ZC21; Sun,  8 Mar 2020 08:44:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 829B8873E3;
	Sun,  8 Mar 2020 08:44:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8018EC1D7E;
	Sun,  8 Mar 2020 08:44:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0298DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E609388277
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z4qMyOzw2GRf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E6727873E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:21 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id f5so3406067pfk.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWmU0CCIAJ+awXhzPRis2ZnBs9YE2AOgvD/U4w8cFVI=;
 b=fGR9rIC1Won/UochR+VtI8cmUmtayiA7fU1kYtzLKcdXc/1fcm2MqUegMmNKYCscDQ
 /QkalyLLmuX+s3tlHK7MWQ2sqNZl+HHnWcjsABEZMkElZb26lrzW5NfYB0E1wy/x2tK+
 DXWwjFRFLF/NVLg099getxrCql+VsdtFfhzw9Gde+hdlv0rA09VboJUe4xcJOpCNA40d
 sUKrN6Q/XhHIxKtnCC77SAf7Q8PNl8bhksN+3Ff/9CeZg4hloWMSO/i49WrUZETCpzFq
 I3Jom6XuOwFo8L4FS/g++W+6mZo7AfGX4viS08a02Myx57IBysG6lKc9EC9mE36dyHR+
 ATVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BWmU0CCIAJ+awXhzPRis2ZnBs9YE2AOgvD/U4w8cFVI=;
 b=QhD+wb4WTEB67Znnf4aOV880h+VyWhad5YrLItN0oRh4E0GMCE0IXAuYAT4Php3aMM
 0BLeZxymvjiRxlq/PVy63cvR+16gM8jkNs02fXuSmuEaeaDsiv3bY6vkpdvuTYjEvfV+
 Di+RxbQB/8GX/7MuHQ6HOSHWwx8WvrXszMezjernOKb8ebAF62Nqj5BwQQrPR3UdoOY6
 OOu1vTknWk/6cTOM6qmywP33YQ++scPbpMsy8xidRDy5huBCB+FayqZFOQ44jkfgTKss
 NzUt1JwgXoKKVA54H24+/T56t4076PvEEkUijxuiELrTbBn2oxnhyAQoHbSQvlYMZvmw
 T1Wg==
X-Gm-Message-State: ANhLgQ3ONqcP1ua9iGOw0hMmwW2IluaMkiSIhZMQLrN00EUuV1Gnih6L
 2YT52LP+MX4x1FpJJg2mQg0=
X-Google-Smtp-Source: ADFU+vuybUjwe/vqOERl050UPJBWNHBNHjJHvvhLMvaa9xdofrmZZ/AoXTIKfcNOfisuKCg1hozHVQ==
X-Received: by 2002:a63:c507:: with SMTP id f7mr10830711pgd.278.1583657061509; 
 Sun, 08 Mar 2020 00:44:21 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:21 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:48 +0530
Message-Id: <20200308084356.14506-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/13] ocaml: coccilib: Reflect
	EnumDeclTag and EnumDeclDotsTag
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

The SmPL AST now has these constructors. Reflect these changes in
coccilib.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index 9b00e130..d01d2a93 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -3056,6 +3056,7 @@ module Ast_cocci :
       | LogicalOpTag of logicalOp
       | DeclarationTag of declaration
       | FieldTag of field
+      | EnumDeclTag of enum_decl
       | InitTag of initialiser
       | StorageTag of storage
       | IncFileTag of inc_file
@@ -3073,6 +3074,7 @@ module Ast_cocci :
       | StmtDotsTag of statement dots
       | AnnDeclDotsTag of annotated_decl dots
       | AnnFieldDotsTag of annotated_field dots
+      | EnumDeclDotsTag of enum_decl dots
       | DefParDotsTag of define_param dots
       | TypeCTag of typeC
       | ParamTag of parameterTypeDef
@@ -3621,6 +3623,7 @@ module Ast0_cocci :
       | DotsStmtTag of statement dots
       | DotsDeclTag of declaration dots
       | DotsFieldTag of field dots
+      | DotsEnumDeclTag of enum_decl dots
       | DotsCaseTag of case_line dots
       | DotsDefParamTag of define_param dots
       | IdentTag of ident
@@ -3634,6 +3637,7 @@ module Ast0_cocci :
       | InitTag of initialiser
       | DeclTag of declaration
       | FieldTag of field
+      | EnumDeclTag of enum_decl
       | StmtTag of statement
       | ForInfoTag of forinfo
       | CaseLineTag of case_line
@@ -3651,6 +3655,7 @@ module Ast0_cocci :
     val dotsStmt : statement dots -> anything
     val dotsDecl : declaration dots -> anything
     val dotsField : field dots -> anything
+    val dotsEnumDecl : enum_decl dots -> anything
     val dotsCase : case_line dots -> anything
     val dotsDefParam : define_param dots -> anything
     val ident : ident -> anything
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
