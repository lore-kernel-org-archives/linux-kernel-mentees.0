Return-Path: <SRS0=Jgkt=7V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0C7C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:21:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D038E2074B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS3/9IJX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D038E2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9EDEA86031;
	Mon,  8 Jun 2020 12:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GidBprAhtzTe; Mon,  8 Jun 2020 12:21:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 487A684F9F;
	Mon,  8 Jun 2020 12:21:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 433AAC07FF;
	Mon,  8 Jun 2020 12:21:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF8DBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9D33F86DBD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SvH-qVK6FJ1j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:21:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 23FD386DAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:21:04 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id n9so6611695plk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Jun 2020 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V61hFh062MPOVM6xadp3R7XyrJnfYC9d8EOqi4vVvvo=;
 b=TS3/9IJXWVQKNjleb6c45nn3uwJdId5IKPBDPBZsQOLlTdbRg5QoA3yJg0DpqGzyxT
 RembV061Vh8r8C/Pygn0r3S4CKNrwg7l/DHd8WwYbHshU6Y8ae4WxM9W5TNqgYN9nOhS
 C+qSPyQS0yVip5CLCRdAC7ebqd29yHLFiFqDre/R1qqExwfe7oVcv7qEEkoSpjfbrwRa
 ZzcOMjt8A3AvQ9UeHZfCFXKSVhe8mMAjwwwexLzg0eiYre1Ruifh9xFAXVQiLy4H9Cqx
 O2IPlnsybfaANqOWyfgHi7ktaULaUctnFb82wRtCNkZFdQdiOYk97VMlw7dwAOojRyyr
 LLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V61hFh062MPOVM6xadp3R7XyrJnfYC9d8EOqi4vVvvo=;
 b=ULCeGfXWMqPUt5Bl1RszvJIPZa24QKqemMYem5kt93v/dUD+nIUn3J3XGvSMBSylcW
 nMbWfvKGxxc+l06QK67EQJGm0/bAEk0TXvq6yauVt5Jtprs7k5hVxkcRGR9tr30kJgUt
 gRbQQt+74FKliG0jMj/IYR5cNjSH+mZoV1haR3WEDa1JL8RjV4uVwikV7psKGdAvz8JN
 a72DwXM2fIA9pkTl6goaUWTyxAeRNwEP2pbb1N3AnuTPy6gymOIzOe+m2E750itDVIvc
 RAfP1zSGEIufDqyHiA4QTkGrt264mJZDGInqx5kUyZOQweFVIIHryWU+QJtrhxSeJJ3G
 UiAw==
X-Gm-Message-State: AOAM530QQSbq4v9HiAzTRFUtVTMtHhgQJXYhsD0pwYiFuGcI6WxsF2iq
 Sw4YzIlhkaLtBjvj/mrGRWY=
X-Google-Smtp-Source: ABdhPJxEp/w5rHlhfY5OzIkoKwW0J8sfVn60llfvuCtqnPZx4idjz+WpoQ+Uain97dx+18+Ak9JkPQ==
X-Received: by 2002:a17:90a:a405:: with SMTP id
 y5mr16621347pjp.15.1591618863674; 
 Mon, 08 Jun 2020 05:21:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:1863:7add:d8e9:7114:e8b0:51a9])
 by smtp.gmail.com with ESMTPSA id i5sm15747657pjd.23.2020.06.08.05.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:21:03 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon,  8 Jun 2020 17:50:37 +0530
Message-Id: <20200608122037.28019-5-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
References: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 4/4] parsing_c: parser: Use
	end_attributes_opt in cpp_other
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

The cpp_other rule has redundant code due to an additional production
for end attributes. Use end_attributes_opt to resolve this.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 61bb1ca0..10cd4435 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -2202,39 +2202,7 @@ cpp_other:
     * the rule are slightly different, they can't be statement and so expr
     * at the top, only decl or function definition.
     *)*/
- | identifier TOPar argument_list TCPar TPtVirg
-     {
-       if args_are_params $3
-       then
-	 (* if all args are params, assume it is a prototype of a function
-	    with no return type *)
-	 let parameters = args_to_params $3 None in
-	 let paramlist = (parameters, (false, [])) in (* no varargs *)
-	 let id = RegularName (mk_string_wrap $1) in
-	 let ret =
-	   warning "type defaults to 'int'"
-	     (mk_ty defaultInt [fakeInfo fake_pi]) in
-	 let ty =
-	   fixOldCDecl (mk_ty (FunctionType (ret, paramlist)) [$2;$4]) in
-	 let attrs = Ast_c.noattr in
-	 let sto = (NoSto, false), [] in
-	 let iistart = Ast_c.fakeInfo () in
-	 Declaration(
-	 DeclList ([{v_namei = Some (id,NoInit); v_type = ty;
-                      v_storage = unwrap sto; v_local = NotLocalDecl;
-                      v_attr = attrs; v_endattr = Ast_c.noattr;
-		      v_type_bis = ref None;
-                    },[]],
-                   ($5::iistart::snd sto)))
-       else
-	 Declaration
-	   (MacroDecl
-             ((NoSto, fst $1, $3, Ast_c.noattr, true),
-               [snd $1;$2;$4;$5;fakeInfo()]))
-           (* old: MacroTop (fst $1, $3,    [snd $1;$2;$4;$5])  *)
-     }
-
- | identifier TOPar argument_list TCPar end_attributes TPtVirg
+ | identifier TOPar argument_list TCPar end_attributes_opt TPtVirg
      {
        if args_are_params $3
        then
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
