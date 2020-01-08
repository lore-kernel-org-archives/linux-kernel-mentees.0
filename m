Return-Path: <SRS0=o+/b=25=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA4AC33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 11:31:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE65A206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 11:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNX63wCr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE65A206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A9FA85E43;
	Wed,  8 Jan 2020 11:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPs6Q39pZjXJ; Wed,  8 Jan 2020 11:31:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A81F85DC1;
	Wed,  8 Jan 2020 11:31:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96F3CC1D81;
	Wed,  8 Jan 2020 11:31:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F591C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 11:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 77DF485E3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 11:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h87NPtXIe+AY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 11:31:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1660C85CB8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 11:31:33 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y8so1002087pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 08 Jan 2020 03:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mmpGWOZDYQ5ojK2uvdV+A7iyhXIqlE+RBSaDjGZtHUY=;
 b=TNX63wCrk6mNjQmg9sqVJXkzXyOs7JhMVG5hZRIxVlVkI0anwd0k0x/XyVDK/MPo5b
 lt0TWV2o9FvG6Pl4gx/+8F8ltUHMGAjM8fw1FzMiVTMAQdcSboilbpxY1SVytKuvASEV
 2ZXnwAWVc+b7yLgRxh66Z/WWnaboXW0CGphwesc4tIXIlfIKjSKpZSUgAi0eVWoc0DgM
 FcBPF+vLC/G9KtPO9Zm1HWImH/ZagYK+vjnx1p2ITa0nWM5jH/0f0tEM2FH2+9q4OL5V
 juaRN5XoYldZoTl4zXDkqoH/Q9b5ap6v2/ysW8zVfVXGsRv2VVr7JYwMSlmn0ER2eZSS
 /XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mmpGWOZDYQ5ojK2uvdV+A7iyhXIqlE+RBSaDjGZtHUY=;
 b=twYT5AkYExHGC98+j0Is5lLChFZSe44Vs7qhoauDsc3SArAaJ04JqFA8k0gLHgO83q
 tVb6DCRegKEHsPV3vOtwCfaNqhrauHgXTsUombBUGmi2a6SuPjpcLjHXPbo1WIPLbhnL
 2f7Z6bjyCTtlxRkGn+5a7W3z3dIW733i9VZRop4Gtwl1RCSxV26vIgz4szUuz2UcpeOV
 MOy5rFpBFMkeukrEwM4tavggozoA2JHhgmqe/sE6kh3leLu26N7/xZOA+PSgGurGQqXL
 CyJ7ki00w5nM2uMQ9ytNQtudnLUrjVOm3Bn+TlX4bK7+3as/PaAV7Zxq0ofOEnQGenUs
 B14A==
X-Gm-Message-State: APjAAAX14t7r9B4SQLkuhb8SY6jwBvxx6e9EqZ8r7+SWjazPCQErER6L
 B8najCdByyXFBdUIX0+hVNI=
X-Google-Smtp-Source: APXvYqwzZIL1LGhOIVMeAzHippgyJC3n6ZDHdul5qRLHRW/oiDJfvwIbdoP86hAkNZ+t4sPXPiG2rQ==
X-Received: by 2002:a17:902:d902:: with SMTP id
 c2mr4590852plz.298.1578483092431; 
 Wed, 08 Jan 2020 03:31:32 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1676:e740:1cd3:2fce:2b3d:8fee])
 by smtp.gmail.com with ESMTPSA id c1sm3314747pfo.44.2020.01.08.03.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 03:31:31 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jan 2020 17:01:12 +0530
Message-Id: <20200108113112.26209-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] parsing_c: Handle case of annotation
	and ; or = after ident
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

For the following case:

[const_vol] <type> [ptr] <identifier> <annotation> <semicolon|eq>

The lookahead function in Parsing_hacks would mislabel <identifier> as a
CppDirective.

Add cases in the lookahead function for handling this case.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parsing_hacks.ml | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
index 56857f3c..43421647 100644
--- a/parsing_c/parsing_hacks.ml
+++ b/parsing_c/parsing_hacks.ml
@@ -1887,6 +1887,11 @@ let not_struct_enum = function
     (Parser_c.Tstruct _ | Parser_c.Tunion _ | Parser_c.Tenum _)::_ -> false
   | _ -> true
 
+let is_struct_enum = function
+  | (Parser_c.TIdent _)::
+    (Parser_c.Tstruct _ | Parser_c.Tunion _ | Parser_c.Tenum _)::_ -> true
+  | _ -> false
+
 let not_opar = function
     TOPar _ -> false
   | _ -> true
@@ -2061,6 +2066,32 @@ let lookahead2 ~pass next before =
 	&& is_type type_ ->
 	  TCommentCpp (Token_c.CppDirective, i1)
 
+	(* tt xx yy; : yy is an annot *)
+  | (TIdent (s, i1)::(TPtVirg _|TEq _)::_, TIdent (s2, i2)::type_::rest)
+    when (is_struct_enum (type_::rest)
+	|| is_type type_)
+	&& s ==~ regexp_annot ->
+	  TCommentCpp (Token_c.CppMacro, i1)
+
+	(* tt * xx yy; : yy is an annot *)
+  | (TIdent (s, i1)::(TPtVirg _|TEq _)::_, TIdent (s2, i2)::ptr)
+    when pointer ptr
+	&& s ==~ regexp_annot ->
+	  TCommentCpp (Token_c.CppMacro, i1)
+
+	(* tt xx yy; : yy is an annot, so xx is an ident *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::(TPtVirg _|TEq _)::_, seen::_)
+    when (is_struct_enum before
+	|| is_type seen)
+	&& s2 ==~ regexp_annot ->
+	  TIdent (s, i1)
+
+	(* tt * xx yy; : yy is an annot, so xx is an ident *)
+  | (TIdent (s, i1)::TIdent (s2, i2)::(TPtVirg _|TEq _)::_, ptr)
+    when pointer ptr
+	&& s2 ==~ regexp_annot ->
+	  TIdent (s, i1)
+
 	(* tt xx yy *)
   | (TIdent (s, i1)::TIdent (s2, i2)::_  , seen::_)
     when not_struct_enum before
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
