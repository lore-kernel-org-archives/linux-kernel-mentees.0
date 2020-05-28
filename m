Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2172C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B5F20888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl2lFvU1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B5F20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 76B0D88D90;
	Thu, 28 May 2020 12:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BROCZubeuBK; Thu, 28 May 2020 12:25:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0737688C3F;
	Thu, 28 May 2020 12:25:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7C87C088D;
	Thu, 28 May 2020 12:25:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEBCEC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE2EC880C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rmmvg+2Qag0l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3C15288272
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:02 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id d66so762035pfd.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cjt6sxZFmRYyDn89xbKCN5jJbQoWEaF9AKdC/CvYNgE=;
 b=Sl2lFvU1EF5IQPx+NJykkz/nWmDFUW3kCDTWKJTZDXjVlJeFZC6LdHEeY0+9+dFPyH
 DfV+cDpocKP8gMdoccnsuYEwX+/iQKjdw7ADAv8yzhYQFqJ31C+OKXo9pccHnHtZxZQu
 7qhsetu4P6hy6lNTF5PXTXTM4tCtZRqJarPZK49WhbwSzlcFr+NJmm10si/O4KBhyW03
 OKQQsWQFGyddsiljz8jl7JDoqqP1LkXyo6Pd9/vHnPYjUMFtaT6EdlwQt0U0An02sSA2
 E5tU/cSh+sBzB6LtmMi92o6BtOawPNPZij4cVH3DQhjJjJRnGDDecs3FQmYCLylK6KRr
 Ab4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cjt6sxZFmRYyDn89xbKCN5jJbQoWEaF9AKdC/CvYNgE=;
 b=SpYIep1WuLeim6+AbV0C+erpmPWLOPDc5fyOyLdXj3KCZSKY/6JQjvw/AMQfUROorI
 XKdMsa80F5YuhYtib1IS9Jb8TzWfUIzN+7Mim1R92PmyIENQeQSQOLKqQaaCO4Uu2hRx
 8pLtghAM92vI8qMjG/PHV1tJIcyJWDd85NHwFByrYZLujwoNtaMGqGMDCf/JCjn6L1wX
 D9au4gQx/L6p6GOYDFY7a93M60jTW7XRTG0xiVMmIe3XQXni8gi7JhWdPC0uXt16NnI9
 PmYtRudjjsLbq66g4ZosJ+I049KJiCjG+cWeiTxIb5paA4S7yHtUJzF1fPNBT0PgZ2K3
 ysFw==
X-Gm-Message-State: AOAM530IC/LHj9urwK9lA771f2IOdjzx8iYlymIspRb2rC/NTgfhfyy3
 xI0HygcMAXNj/PeJWBcArxY=
X-Google-Smtp-Source: ABdhPJwtJit18e2FTsW10sv7UbzEbj6s1sQf6/Vq5tVu2h3eUm6RW1VJ/A6bYzL1KfiPzKH/FCo7Mg==
X-Received: by 2002:a62:1a91:: with SMTP id a139mr1225568pfa.149.1590668701769; 
 Thu, 28 May 2020 05:25:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:01 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:08 +0530
Message-Id: <20200528122428.4212-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 06/25] parsing_c: parser: Add
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
 parsing_c/parser_c.mly | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index e4352a61..be3fdbab 100644
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
 
@@ -1521,9 +1523,12 @@ type_qualif_list:
 
 type_name:
  | spec_qualif_list
-     { let (returnType, _) = fixDeclSpecForDecl $1 in  returnType }
+     { let (attrs, ds) = $1 in
+       let (returnType, _) = fixDeclSpecForDecl ds in returnType }
  | spec_qualif_list abstract_declaratort
-     { let (returnType, _) = fixDeclSpecForDecl $1 in $2 returnType }
+     { let (attrs1, ds) = $1 in
+       let (returnType, _) = fixDeclSpecForDecl ds in
+       $2 returnType }
 
 
 
@@ -1808,7 +1813,8 @@ struct_decl2:
 field_declaration:
  | spec_qualif_list struct_declarator_list TPtVirg
      {
-       let (returnType,storage) = fixDeclSpecForDecl $1 in
+       let (attrs, ds) = $1 in
+       let (returnType,storage) = fixDeclSpecForDecl ds in
        if fst (unwrap storage) <> NoSto
        then internal_error "parsing don't allow this";
 
@@ -1823,8 +1829,9 @@ field_declaration:
 
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
