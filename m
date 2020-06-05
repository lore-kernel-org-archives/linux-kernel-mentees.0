Return-Path: <SRS0=7LP4=7S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8E0C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05A1206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMLELhXt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B05A1206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88151887E5;
	Fri,  5 Jun 2020 13:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A359q100tObI; Fri,  5 Jun 2020 13:44:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 27D5C884DC;
	Fri,  5 Jun 2020 13:44:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16B7FC0888;
	Fri,  5 Jun 2020 13:44:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24166C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1226F88778
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P+KKgWW6031F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A26B9884DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:39 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q24so2750351pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AG7aKTjYrpWO29CJRPMqYtbq2fkHSj17rRnvdb8I1QQ=;
 b=GMLELhXtIhZu3O5zhm2xEv/q6Rb707cFKYmAoi/uMaKvDVpSNIIrweBhPAsQKqBYU0
 uyo1elA3C9u4/M7Puk6w6Jw2VQ4F1k1h4z/Z789euSIVNu20VwJW8wlsSd7tpAZowHHx
 pJZ+oWYuDQ5+EagG4u9C7QbaAbCWNMiYY/Et7kB4laF1kyQB1OMIIsl48vEOjE7urG/d
 uHGwP3erj5K9Uqzsifg/H8YBCaJId3kYmJqUPEGZecL3xRQfzL9Rs8HHmHXE20xHU69+
 pLtZTjzAK0Ox0mCOlw+45vQ+6Zls+Yunj1IGAKAjcf/pOR/n+rvkdPa/RZs22RqLVcPQ
 i3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AG7aKTjYrpWO29CJRPMqYtbq2fkHSj17rRnvdb8I1QQ=;
 b=MV3T08EzHWfSyvGyQ85YK8S8iWLe0s1YoxCbAR68wbpmnZblPcvtByFkIrwDL5AsJ6
 ZjPIxusA76LGbSip00Gu8DCy+w8K5LfpWcYA64QTdJt74oLggq6+xVWF5z32xcyNjUHy
 /2OziEdwRDmN4qFX/AxyvmKmUsbPYLPocaXyi2N8bktUQVG+hr8Nvu0d9pGYqFrBTwYQ
 lFRviZaTHSrOQTc8MKNOpekeoVagJ74L9HGYxhmbe4YkN4MM9T2TuaI6NheUZKLrrjK6
 81hmU7d11X2qOUqPw+vRG1T9yUfZYGFE65YWh8cSQF2Lxa5cwxgyZUsCGmKgQGv/+kv7
 vj0A==
X-Gm-Message-State: AOAM530edJ5S2spZEnK/Rb9lxwsJIiyJNbYIVnbaHEIRpn7Js5Y2fUn6
 xLaQIT9nWy3D4FA4zU8UGlnK5JToyHc=
X-Google-Smtp-Source: ABdhPJwEHmzCXmTgCaQlLMtflPrrQ46g8M8a/u1NwhPSVWkt2cdYAS7vaM4NUKvcCa3RZC9OEQZWkw==
X-Received: by 2002:a17:90a:70c6:: with SMTP id
 a6mr2945733pjm.16.1591364679227; 
 Fri, 05 Jun 2020 06:44:39 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:38 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:17 +0530
Message-Id: <20200605134322.15307-10-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 09/14] parsing_c: parser: Add
	field declaration end attributes production
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

As per GCC's C grammar, the struct-declarator rule has the following
productions:

	struct-declarator:
	  declarator gnu-attributes[opt]
	  declarator[opt] : constant-expression gnu-attributes[opt]

While these productions are handled in the struct_declarator rule of
Coccinelle's C grammar, end attributes are not.

Add productions for end attributes in the field_declaration rule of
Coccinelle's C parser. This parses the following C code from Linux
v5.6-rc7 successfully:

  kernel/sched/sched.h:

	struct task_group {
		...
		atomic_t load_avg __cacheline_aligned;
		...
	};

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 9afbd68c..5b7e1faf 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1830,7 +1830,7 @@ struct_decl2:
 
 
 field_declaration:
- | spec_qualif_list struct_declarator_list TPtVirg
+ | spec_qualif_list struct_declarator_list end_attributes_opt TPtVirg
      {
        let (attrs, ds) = $1 in
        let (returnType,storage) = fixDeclSpecForDecl ds in
@@ -1840,13 +1840,13 @@ field_declaration:
        let iistart = Ast_c.fakeInfo () in (* for parallelism with DeclList *)
        FieldDeclList ($2 +> (List.map (fun (f, iivirg) ->
          f returnType, iivirg))
-                         ,[$3;iistart])
+                         ,[$4;iistart])
          (* don't need to check if typedef or func initialised cos
           * grammar don't allow typedef nor initialiser in struct
           *)
      }
 
- | spec_qualif_list TPtVirg
+ | spec_qualif_list end_attributes_opt TPtVirg
      {
        let (attrs, ds) = $1 in
        (* gccext: allow empty elements if it is a structdef or enumdef *)
@@ -1855,7 +1855,7 @@ field_declaration:
        then internal_error "parsing don't allow this";
 
        let iistart = Ast_c.fakeInfo () in (* for parallelism with DeclList *)
-       FieldDeclList ([(Simple (None, returnType)) , []], [$2;iistart])
+       FieldDeclList ([(Simple (None, returnType)) , []], [$3;iistart])
      }
 
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
