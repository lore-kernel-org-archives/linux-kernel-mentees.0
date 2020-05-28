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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B1BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4958F20888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSd+nS5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4958F20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 274F2882BE;
	Thu, 28 May 2020 12:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpnowM-f3sAc; Thu, 28 May 2020 12:25:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1327880C6;
	Thu, 28 May 2020 12:25:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1801C088D;
	Thu, 28 May 2020 12:25:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 632C4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 488AE2588A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrSPTPO8JGm0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id DB9FC25406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:18 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y198so13479271pfb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LL6ZxXzagbOZAMBjCaJZisg3zIcPtkLdKtjR0GrIzA8=;
 b=BSd+nS5aE4MU+Bk0DXUJqlikadcFjV44wMX+QfwDRbyF5CwJg2iNHDE/9bukoMvhUB
 fEdmLM+xvSrej9T2nfFDEja5tCH5uCMenUZJPzj5Z7d5raLL/I/xYevikHN5IeZSUQfA
 kNWmguLy/Or8AVaXBowjNbzPElhQanHZEmAKeMCXmGCyHUYyvWgTnN6wf3Y+1TyCmObo
 aQNnTbs+K+gqsOTwzaojU9INixBaci2GSEpp//i7Ksty7nJfwqQpKxv2ZE2M/9wYclAw
 5X8Enp/6Oq17ll3IffNj4AqlKqvyAxLT5zoqC4fD92HLDTHCLCz7udAoLUPznYAqRyfX
 gBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LL6ZxXzagbOZAMBjCaJZisg3zIcPtkLdKtjR0GrIzA8=;
 b=axFzZPkJ/WLcmrzAslfiBIIIM6s2+x3JxuSOKJoDdu7cVX253MUSQbd8hCTHYnu7x0
 8EY6h/hQzi8i1qh89zlGtKzkIZL1ijQb5BWas0+8fOHnFYL4oGjamXfgvLI7zw1vciS1
 9McN5sQluMglpgv7Ptoj1ulKiWna0J14EOdy+mksC+wEdxXPl7IY3P1M2jSALikCaCee
 4wqNru75GMk0EBRnMiQzyrtzOXq5rSKBBJuk8+ulJwtrOa7WqA5gqtoINq2GPwGhwRqx
 cDk9Zmoj/lFxpiyzulnzXy2PHpPHkKWyvQ2uF0RzZD/uHC3n4mGHdnKM8bUusGeR45Ks
 LqWg==
X-Gm-Message-State: AOAM532sNhB/w2gLkN6bIRD3zBScw1TA5o4cPzofv53NBkktBaaftp8K
 JZ8dhM/m+39WU3mzP4aoJMs=
X-Google-Smtp-Source: ABdhPJyPPSXfqkkdkevDX80z0Ic5XuovSWpqVF5EsMdszFtaE6vDIAdh0s8DJFyLZwREx/Nw0Rsldw==
X-Received: by 2002:aa7:9ac5:: with SMTP id x5mr1089086pfp.234.1590668718425; 
 Thu, 28 May 2020 05:25:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:13 +0530
Message-Id: <20200528122428.4212-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 11/25] parsing_c: parser:
	cpp_other end attributes production
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

Add a production for a macro call in the cpp_other rule of Coccinelle's
C parser. This parses the following C code from Linux v5.6-rc7
successfully:

  arch/x86/kernel/irq_64.c:

	DEFINE_PER_CPU_PAGE_ALIGNED(struct irq_stack, irq_stack_backing_store) __visible;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index d36ac2a6..2caf4974 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -2261,6 +2261,37 @@ cpp_other:
            (* old: MacroTop (fst $1, $3,    [snd $1;$2;$4;$5])  *)
      }
 
+ | identifier TOPar argument_list TCPar end_attributes TPtVirg
+     {
+       if args_are_params $3
+       then
+	 (* if all args are params, assume it is a prototype of a function
+	    with no return type *)
+	 let parameters = args_to_params $3 None in
+	 let paramlist = (parameters, (false, [])) in (* no varargs *)
+	 let id = RegularName (mk_string_wrap $1) in
+	 let ret =
+	   warning "type defaults to 'int'"
+	     (mk_ty defaultInt [fakeInfo fake_pi]) in
+	 let ty =
+	   fixOldCDecl (mk_ty (FunctionType (ret, paramlist)) [$2;$4]) in
+	 let attrs = Ast_c.noattr in
+	 let sto = (NoSto, false), [] in
+	 let iistart = Ast_c.fakeInfo () in
+	 Declaration(
+	 DeclList ([{v_namei = Some (id,NoInit); v_type = ty;
+                      v_storage = unwrap sto; v_local = NotLocalDecl;
+                      v_attr = attrs; v_endattr = $5;
+		      v_type_bis = ref None;
+                    },[]],
+                   ($6::iistart::snd sto)))
+       else
+	 Declaration
+	   (MacroDecl((NoSto, fst $1, $3, true), [snd $1;$2;$4;$6;fakeInfo()]))
+           (* old: MacroTop (fst $1, $3,    [snd $1;$2;$4;$5])  *)
+     }
+
+
  /* cheap solution for functions with no return type.  Not really a
        cpp_other, but avoids conflicts */
  | identifier TOPar argument_list TCPar compound {
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
