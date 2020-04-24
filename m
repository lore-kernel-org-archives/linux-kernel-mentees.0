Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89D6C55186
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC87C20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tuBh/zCO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC87C20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 84EAB20198;
	Fri, 24 Apr 2020 09:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPZZCbyu840V; Fri, 24 Apr 2020 09:18:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CE96120107;
	Fri, 24 Apr 2020 09:18:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBDDDC089E;
	Fri, 24 Apr 2020 09:18:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 128E0C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0FB27887C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQR0tZE3i2nl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 82EF6887BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:40 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id k18so3530260pll.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XBHD63aqXEwnWVqUZFm4dZkI8++//l/bmx4QlYKk4A=;
 b=tuBh/zCO6Y5ell5682/HmQmdBOCUBIH1kRLxYvV46GoCvTscljl3UBEz++PNDL5zHY
 H0Bf2ENZ6EAuofqPe/qoUfJSCWmWhc9llxxY/ZM6CWZxuQ92EkvAvLOY1EJ14LspvC0Q
 xs278w3dKBbyyy2i+RhqOF26YdJFnFkpwb5+GAQBQAwTbVJhchRYftyWiyeBS+pzytKJ
 5YZYIpnijKyhxBtwSc/gf4XSeWpjAD/5jAodvqUfEqLi1e9ipbSDj4s3AvHEGbsaewrE
 Yqxuqv+mPjUbYBGXJoITR2P5eS8+my0DfkyMCaqnJWyk/HxryRJ5RP2ri+wccBSm4rbW
 YAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XBHD63aqXEwnWVqUZFm4dZkI8++//l/bmx4QlYKk4A=;
 b=Fhj/IzgIwMqqCk9CHe1kxz7xSEu30yqzCGZdeBYmG8ngcsR5sKnz+6NCSzsZdeNjHb
 UfFeZuNsMfc6+/T7F+l6+XmzPmSEOyV1U1KYOR2vBMdDjwtNYPzSZbYORWDTsosPQcU+
 61yOmpFnApXlk5LbhJAupMlu9jCTQfpMX2Ydu+Wkjo3za1/g4hW6S+IjtIzcxAbKZDUP
 LRCZGsJrBybu8S0b9TDxyB6t0MRplxaYudwOetSjvq+gA/8a6Pu42ccWmBMjUZtNEkgr
 n7YxME/Ap2UhhpMh2y0vJ2ysjWhZb/JPrUij9TxsN0Q//aXpuGuRh2iQhHgx3QjS7iwO
 iKSQ==
X-Gm-Message-State: AGi0PubPFeupZPvO+yce0y5KqvzHAHImA9FsVpg1p0gZdfFn+DIkGxQ2
 UxtzW2zcXcZ5Bg2dLWI4CuM=
X-Google-Smtp-Source: APiQypLKon+9FsdzguRzip1t5PHqEXcXx56b81TFdtClkP/lbDR68jraNp4jchX4YZcX5d2KEoDR8Q==
X-Received: by 2002:a17:90a:b293:: with SMTP id
 c19mr5196698pjr.22.1587719920004; 
 Fri, 24 Apr 2020 02:18:40 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:18:39 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:42 +0530
Message-Id: <20200424091801.13871-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 06/25] parsing_c: parser: Add
	attribute production in spec_qualif_list
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

As per GCC's C grammar, the specifier-qualifier-list has the following
production:

	specifier-qualifier-list:
	  gnu-attributes specifier-qualifier-list[opt]

Add this production to the spec_qualif_list rule of Coccinelle's C
parser. This parses attributes in struct fields and casts
successfully. Some code examples from Linux v5.5-rc4:

  kernel/rcu/tree.h:

	struct rcu_node {
		...
		raw_spinlock_t __private lock;
		...
	};

  kernel/sysctl.c:

 	char __user **buffer = (char __user **)buf;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index a858db56..a5b0d214 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1500,10 +1500,12 @@ abstract_declaratorp:
 /*(* for struct and also typename *)*/
 /*(* can't put decl_spec cos no storage is allowed for field struct *)*/
 spec_qualif_list2:
- | type_spec                    { addTypeD ($1, nullDecl) }
- | type_qualif                  { {nullDecl with qualifD = (fst $1,[snd $1])}}
- | type_spec   spec_qualif_list { addTypeD ($1,$2)   }
- | type_qualif spec_qualif_list { addQualifD ($1,$2) }
+ | type_spec                    { ([], addTypeD ($1, nullDecl)) }
+ | type_qualif                  { ([], {nullDecl with qualifD = (fst $1,[snd $1])})}
+ | attribute                    { ([$1], nullDecl) }
+ | type_spec   spec_qualif_list { (fst $2, addTypeD ($1,snd $2)) }
+ | type_qualif spec_qualif_list { (fst $2, addQualifD ($1,snd $2)) }
+ | attribute   spec_qualif_list { ([$1]@(fst $2), snd $2) }
 
 spec_qualif_list: spec_qualif_list2            {  dt "spec_qualif" (); $1 }
 
@@ -1521,9 +1523,13 @@ type_qualif_list:
 
 type_name:
  | spec_qualif_list
-     { let (returnType, _) = fixDeclSpecForDecl $1 in  returnType }
+     { let (attrs, ds) = $1 in
+       let (returnType, _) = fixDeclSpecForDecl ds in returnType }
  | spec_qualif_list abstract_declaratort
-     { let (returnType, _) = fixDeclSpecForDecl $1 in $2 returnType }
+     { let (attrs1, ds) = $1 in
+       let (attrs2, fn) = $2 in
+       let (returnType, _) = fixDeclSpecForDecl ds in
+       fn returnType }
 
 
 
@@ -1808,7 +1814,8 @@ struct_decl2:
 field_declaration:
  | spec_qualif_list struct_declarator_list TPtVirg
      {
-       let (returnType,storage) = fixDeclSpecForDecl $1 in
+       let (attrs, ds) = $1 in
+       let (returnType,storage) = fixDeclSpecForDecl ds in
        if fst (unwrap storage) <> NoSto
        then internal_error "parsing don't allow this";
 
@@ -1823,8 +1830,9 @@ field_declaration:
 
  | spec_qualif_list TPtVirg
      {
+       let (attrs, ds) = $1 in
        (* gccext: allow empty elements if it is a structdef or enumdef *)
-       let (returnType,storage) = fixDeclSpecForDecl $1 in
+       let (returnType,storage) = fixDeclSpecForDecl ds in
        if fst (unwrap storage) <> NoSto
        then internal_error "parsing don't allow this";
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
