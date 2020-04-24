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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BA9C2BA1A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC77220724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvXpW81o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC77220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9180486443;
	Fri, 24 Apr 2020 09:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkh5XWyFeHRp; Fri, 24 Apr 2020 09:19:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2BE88880DC;
	Fri, 24 Apr 2020 09:19:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19611C089E;
	Fri, 24 Apr 2020 09:19:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FC77C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 42A6B20198
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4pctpnuH9BS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 98E8720107
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:18:59 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id r14so4530853pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WJXJOG837ljJDf1BCpsh0Gm8keDx/MYNVfJwGzLbhs4=;
 b=TvXpW81ovHbfhs+kawU5obrDOyv265F6F6k5FAR9uv2eXlEdYgoq5AASqmS+A1K3vW
 u+WC+0mmNBJFXElJNYQ+9SmyT2vmsvrL22RJ1rGrfcVyFjE+4/MSf/nc2RwMRhqGAoAt
 jwBf9XEmSV4WGor59LLvR1gij0nZ/XNMj4PO8VdQImFts13r2iYeMiV0tnT55ltquxxU
 Ik7Xwbv5j7f0WMeUmtWTq+Rw7DJI59iQuYB2sMSne7P1lvHVfxcUFuRWJ7O0UNbAKmSS
 5YYzrDvYt59qkB/tQ8CPMp8U3Z74baNp8qWNFW5BOyaZwXMi9ypLfDXCNDu5hDTBCK4Q
 Cozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJXJOG837ljJDf1BCpsh0Gm8keDx/MYNVfJwGzLbhs4=;
 b=XjMDXOwXdV3if+UdZFcWo4XqfNPzZRK1VbGCjTL1m2rOsfQrF4qV4RrpXFChnX/WK+
 TMyD/AK37vwpVXVcAuYH4cMSYjhxOlaUOwe7IxUDsIWNbHRMzL3f1sI59XQ6iPWpP8JT
 Y2XAQcjXXWFJfAxQ0uLCp/My0ifi3aw1SwskGQYVeXG6EotLnhslw3gy+EMeC8GTJ268
 cfY72S4DcnWdVXCzb6nISYWWW1UthTKf+K2SGbrOKofpvUE7NWCZXIoXirO/x8CKdBnT
 Us4RCDh8mSTlRrmRPNitD8Rgs0aJIT2Lh3OwledV1BlXllHqUG+2F0IPDEtZzBalFaSu
 1prw==
X-Gm-Message-State: AGi0PuabtBJscIrwCX9KYyWjLtlO5GJOBtS4E9iQ+3wGm/7jML7WRJBL
 9K0cKZf98WAaI08OGHfhJuo=
X-Google-Smtp-Source: APiQypJIg9N7H441n+AG4PB2KacFR9P7niMfDBVY03Rxk4J34lcHHsgVssvh4+NDXHv0+qHokq5NLg==
X-Received: by 2002:a63:1705:: with SMTP id x5mr8361728pgl.12.1587719939202;
 Fri, 24 Apr 2020 02:18:59 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:18:58 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:44 +0530
Message-Id: <20200424091801.13871-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 08/25] parsing_c: parser: Add
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
 parsing_c/parser_c.mly | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 1ff2fd87..8def5f0d 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1847,6 +1847,22 @@ field_declaration:
           *)
      }
 
+ | spec_qualif_list struct_declarator_list end_attributes TPtVirg
+     {
+       let (attrs, ds) = $1 in
+       let (returnType,storage) = fixDeclSpecForDecl ds in
+       if fst (unwrap storage) <> NoSto
+       then internal_error "parsing don't allow this";
+
+       let iistart = Ast_c.fakeInfo () in (* for parallelism with DeclList *)
+       FieldDeclList ($2 +> (List.map (fun (f, iivirg) ->
+         f returnType, iivirg))
+                         ,[$4;iistart])
+         (* don't need to check if typedef or func initialised cos
+          * grammar don't allow typedef nor initialiser in struct
+          *)
+     }
+
  | spec_qualif_list TPtVirg
      {
        let (attrs, ds) = $1 in
@@ -1859,6 +1875,18 @@ field_declaration:
        FieldDeclList ([(Simple (None, returnType)) , []], [$2;iistart])
      }
 
+ | spec_qualif_list end_attributes TPtVirg
+     {
+       let (attrs, ds) = $1 in
+       (* gccext: allow empty elements if it is a structdef or enumdef *)
+       let (returnType,storage) = fixDeclSpecForDecl ds in
+       if fst (unwrap storage) <> NoSto
+       then internal_error "parsing don't allow this";
+
+       let iistart = Ast_c.fakeInfo () in (* for parallelism with DeclList *)
+       FieldDeclList ([(Simple (None, returnType)) , []], [$3;iistart])
+     }
+
 
 
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
