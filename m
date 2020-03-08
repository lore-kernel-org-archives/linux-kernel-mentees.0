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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D441AC10F28
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA1C4206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U16KbaBQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA1C4206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8998288277;
	Sun,  8 Mar 2020 08:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XM8K0T9xuYnM; Sun,  8 Mar 2020 08:44:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DA1286A98;
	Sun,  8 Mar 2020 08:44:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1752DC1D7E;
	Sun,  8 Mar 2020 08:44:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 157BFC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 045E3873E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVW29u-yKiWh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8743E86A98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c144so3403982pfb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=545xpgF/TgsFYj2C7WNNA12U+rN0HF1e2CWbfKsBxO4=;
 b=U16KbaBQMrYLdZfV1XsWmiTFXgkIyNGTAxqJj2Y4jSwQTXMf7THWgBRuxx/ilrT3ID
 axN4mDAdj1R6wlcX56WCXQfl1WrOw320o+hzwBvOdOZrD/Yvyy5y275z/F2oA9w70Zgb
 no2XcQdWO5MCnuwWAYbZEys0eLDsA7Z+PyRiSWubOZYrzFPDL8jNNASqCdbRAA6yVHca
 c6xc7/1aG+dCHNmqG3MR1UCdxqg6ECLE1nsxEFNZkZBMnGjNVV/ulYGxHqNUnt7MDOdL
 M5W9F3Bt1thfZvJibi9RKARNwaeb9KzVSsh2gJlceItS8T6fUnew6rMy8Wp4df2QpLYf
 g3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=545xpgF/TgsFYj2C7WNNA12U+rN0HF1e2CWbfKsBxO4=;
 b=HDc/H81+CEh1sALgXDH8k2aUXjsJpt3mtoIGsCt92chI9nYfPQs3ZrK36/3PGVPNwD
 JYmd0W3XWX3eWnF3e5nUMpzkCG5KjVDV3wN/aHJWTGKYKFVb5Lhz4zUMGkfidkNSjcg/
 GAZme/IRmaJTfpT3co6U231C7V77SPJfpX0Ap/ptKdFrRZJVuKCKu/zdpW3KLkzBScr9
 CwwJWLZyfBKYlaLCUDDzR4ulyWihLWICiaW3hAJOIQiaYc1TBEC/78I4eiQyrCcU+0vr
 ROl+R8/xzj4sS1CdQ0Wsf6LPHi/UFGZFSiI0VNHVtLODaQVjps7bfutMVGz7JTqcFWTy
 T6ww==
X-Gm-Message-State: ANhLgQ3MA6f5foDAhZ3MtfXN+j6mG8E8aJfLYsR+YeMWe2Qo/DC2uOqC
 PMyLZngq6VlkyJgBX7X2Sxk=
X-Google-Smtp-Source: ADFU+vtIba+N2PlB/eSjr8m8G44DahIG5XiCgdZsMvmT1LMkGPx6cQ0gnNKi4XYXqLSH2bayFS8Qxw==
X-Received: by 2002:aa7:8426:: with SMTP id q6mr11570619pfn.221.1583657050910; 
 Sun, 08 Mar 2020 00:44:10 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:10 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:45 +0530
Message-Id: <20200308084356.14506-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/13] ocaml: coccilib: Reflect
	changes in SmPL AST for EnumDef
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

The EnumDef constructor is changed in the SmPL AST. Reflect
these changes in coccilib.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index 5a913099..9b00e130 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -2713,7 +2713,7 @@ module Ast_cocci :
       | Decimal of string mcode * string mcode * expression *
           string mcode option * expression option * string mcode
       | EnumName of string mcode * ident option
-      | EnumDef of fullType * string mcode * expression dots * string mcode
+      | EnumDef of fullType * string mcode * enum_decl dots * string mcode
       | StructUnionName of structUnion mcode * ident option
       | StructUnionDef of fullType * string mcode * annotated_field dots *
           string mcode
@@ -2789,6 +2789,12 @@ module Ast_cocci :
       | ConjField of annotated_field list
       | OptField  of annotated_field
     and annotated_field = base_annotated_field wrap
+    and base_enum_decl =
+      Ast_cocci.base_enum_decl =
+        Enum of ident * (string mcode * expression) option
+      | EnumComma of string mcode
+      | EnumDots of string mcode * enum_decl option
+    and enum_decl = base_enum_decl wrap
     and base_initialiser =
       Ast_cocci.base_initialiser =
         MetaInit of meta_name mcode * constraints * keep_binding * inherited
@@ -3357,7 +3363,7 @@ module Ast0_cocci :
       | Decimal of string mcode * string mcode * expression *
           string mcode option * expression option * string mcode
       | EnumName of string mcode * ident option
-      | EnumDef of typeC * string mcode * expression dots * string mcode
+      | EnumDef of typeC * string mcode * enum_decl dots * string mcode
       | StructUnionName of Ast_cocci.structUnion mcode * ident option
       | StructUnionDef of typeC * string mcode * field dots * string mcode
       | TypeOfExpr of string mcode * string mcode * expression * string mcode
@@ -3408,6 +3414,13 @@ module Ast0_cocci :
       | OptField of field
     and bitfield = string mcode * expression
     and field = base_field wrap
+    and base_enum_decl =
+      Ast0_cocci.base_enum_decl =
+        Enum of ident * (string mcode * expression) option
+      | EnumComma of string mcode
+      | EnumDots of string mcode *
+                    (string mcode * string mcode * enum_decl) option
+    and enum_decl = base_enum_decl wrap
     and base_initialiser =
       Ast0_cocci.base_initialiser =
         MetaInit of Ast_cocci.meta_name mcode * constraints * pure
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
