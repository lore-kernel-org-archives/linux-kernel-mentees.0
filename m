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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ED8C10F28
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EBEB206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Mar 2020 08:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOpaRZL3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EBEB206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E70786C8C;
	Sun,  8 Mar 2020 08:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsm98VgKp6p5; Sun,  8 Mar 2020 08:44:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB7AB86341;
	Sun,  8 Mar 2020 08:44:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B11A9C1D7E;
	Sun,  8 Mar 2020 08:44:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28D3EC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1556A204BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Blwcv8WteSmV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 43F822000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Mar 2020 08:44:56 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f8so2747657plt.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Mar 2020 00:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pN3fYF/WUsAoyz1cgrMGrvu9VIDZsdxapnqkdhrA3LQ=;
 b=ZOpaRZL3SygYG3iOy2WOLV3foacXo1ls8I2xoGnphPKx5Dzv1ypG780JKxF6mDYobH
 UGpB1eRfNehzXhegxzmBD1M5Vu1l1L5kfOj/Pm1vbnjWW2zmb2Bh7qaYY0aUtPVj7nmz
 wDMI1LgYUr3cwFLnn6jGlyGbbyr2C6MoSTOkkIrfdLFed6gY64s8hPztGiMSEF/LppLO
 mDknSqZAy/cYY2hmfXBQtoxakjV/bdGyBnBFvfI7BjwxplDJvElSLSUbiGsCO8NAR47Q
 V8gEr70MqUjiDOtGUZKsAzD2ZBlAjAj770KYVYa/BlJXWCl5SfFOP/rVnPFnnuvg6Sss
 NE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pN3fYF/WUsAoyz1cgrMGrvu9VIDZsdxapnqkdhrA3LQ=;
 b=jLN5rpg3iApxQaN9FDhyXniUvG9ozMB7DbLXHSxAguA1YFW7MmvZQrpH2DbTcr0xWo
 u4SFBsCZcxh9yepBzSZxcnQdalNBanJ0fNep4STOOfay0nx7H+cA3XFSSj0mq2FIy5Xb
 TiVl6uYzLFzkwMFFXyaP1ytNB6sEy/UavLKmgpfijrYKji/QIfoCyXGSnXYqnCOtAEmO
 P60dhKHfM9OJSqlWRolJFz1cOADD8PkcSnNPRNTuY+GfO9NCzYFCKpJo5TMyEENVouoX
 iVkTaLWZfJlFR023HsW6/vPoRVuJBp90+02vEyXOw0OgbqCbwdW/sdln7zpNDEIEHxmN
 /KuQ==
X-Gm-Message-State: ANhLgQ2KMsMzplrlNjCvss/bEOmRuhxUcnSAehME/U6BpIsGazHqzY6i
 qre/j3HOlDYWYHvFtdNjuRg=
X-Google-Smtp-Source: ADFU+vsqzlsWvo1HT7ryuvWzTajYOyQ/efsAsZtgE04qcU68NIrwoyPAYEP4rXl08DBujTEHltzz9g==
X-Received: by 2002:a17:90b:3009:: with SMTP id
 hg9mr12176644pjb.181.1583657095578; 
 Sun, 08 Mar 2020 00:44:55 -0800 (PST)
Received: from localhost.localdomain ([1.38.148.20])
 by smtp.gmail.com with ESMTPSA id b3sm14587244pjo.30.2020.03.08.00.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 00:44:55 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  8 Mar 2020 14:13:56 +0530
Message-Id: <20200308084356.14506-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
References: <20200308084356.14506-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 13/13] tools: spgen: Reflect visitor
	changes
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

Visitor_ast0 has changes with respect to enums. Reflect these
changes in spgen by adding additional arguments in the combiners
and rebuilders.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tools/spgen/source/detect_patch.ml  | 6 ++++--
 tools/spgen/source/meta_variable.ml | 6 ++++--
 tools/spgen/source/rule_body.ml     | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/spgen/source/detect_patch.ml b/tools/spgen/source/detect_patch.ml
index 6cf1c538..0489afec 100644
--- a/tools/spgen/source/detect_patch.ml
+++ b/tools/spgen/source/detect_patch.ml
@@ -101,11 +101,13 @@ let patch_combiner =
   let dotsparamfn = donothing in
   let dotsdeclfn = donothing in
   let dotsfieldfn = donothing in
+  let dotsenumdeclfn = donothing in
   let dotscasefn = donothing in
   let dotsdefparfn = donothing in
   let assignOpfn = donothing in
   let binaryOpfn = donothing in
   let initfn = donothing in
+  let enumdeclfn = donothing in
   let paramfn = donothing in
   let forinfofn = donothing in
   let string_fragmentfn = donothing in
@@ -159,9 +161,9 @@ let patch_combiner =
     fix_mcode unary_mcode arithOp_mcode logicalOp_mcode cv_mcode sign_mcode
     struct_mcode storage_mcode inc_mcode
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
-    dotscasefn dotsdefparfn
+    dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn binaryOpfn tyfn initfn paramfn declfn fieldfn
-    stmtfn forinfofn casefn string_fragmentfn topfn
+    enumdeclfn stmtfn forinfofn casefn string_fragmentfn topfn
 
 
 (* ------------------------------------------------------------------------- *)
diff --git a/tools/spgen/source/meta_variable.ml b/tools/spgen/source/meta_variable.ml
index 7adfacad..a1804a05 100644
--- a/tools/spgen/source/meta_variable.ml
+++ b/tools/spgen/source/meta_variable.ml
@@ -390,11 +390,13 @@ let metavar_combiner rn =
   let dotsstmtfn = donothing in
   let dotsdeclfn = donothing in
   let dotsfieldfn = donothing in
+  let dotsenumdeclfn = donothing in
   let dotscasefn = donothing in
   let dotsdefparfn = donothing in
   let forinfofn = donothing in
   let casefn = donothing in
   let topfn = donothing in
+  let enumdeclfn = donothing in
 
   (* --- These are shortened formatting functions that return MVSets --- *)
 
@@ -574,9 +576,9 @@ let metavar_combiner rn =
     fix_mcode unary_mcode arithOp_mcode logicalOp_mcode cv_mcode sign_mcode
     struct_mcode storage_mcode inc_mcode
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
-    dotscasefn dotsdefparfn
+    dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn binaryOpfn tyfn initfn paramfn declfn fieldfn
-    stmtfn forinfofn casefn string_fragmentfn topfn
+    enumdeclfn stmtfn forinfofn casefn string_fragmentfn topfn
 
 
 (* ------------------------------------------------------------------------- *)
diff --git a/tools/spgen/source/rule_body.ml b/tools/spgen/source/rule_body.ml
index 6345c9df..163dff9a 100644
--- a/tools/spgen/source/rule_body.ml
+++ b/tools/spgen/source/rule_body.ml
@@ -219,12 +219,14 @@ let rec gen_combiner ~context_mode =
   let dotsparamfn = donothing in
   let dotsdeclfn = donothing in
   let dotsfieldfn = donothing in
+  let dotsenumdeclfn = donothing in
   let dotscasefn = donothing in
   let dotsdefparfn = donothing in
   let assignOpfn = donothing in
   let binaryOpfn = donothing in
   let tyfn = donothing in
   let initfn = donothing in
+  let enumdeclfn = donothing in
   let paramfn = donothing in
   let forinfofn = donothing in
   let casefn = donothing in
@@ -349,9 +351,9 @@ let rec gen_combiner ~context_mode =
     fix_mcode unary_mcode arithOp_mcode logicalOp_mcode cv_mcode sign_mcode
     struct_mcode storage_mcode inc_mcode
     dotsexprfn dotsinitfn dotsparamfn dotsstmtfn dotsdeclfn dotsfieldfn
-    dotscasefn dotsdefparfn
+    dotsenumdeclfn dotscasefn dotsdefparfn
     identfn exprfn assignOpfn binaryOpfn tyfn initfn paramfn declfn fieldfn
-    stmtfn forinfofn casefn string_fragmentfn topfn
+    enumdeclfn stmtfn forinfofn casefn string_fragmentfn topfn
 
 
 (* ------------------------------------------------------------------------- *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
