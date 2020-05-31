Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0018C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75514206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cS6puiw5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75514206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5937D87E2E;
	Sun, 31 May 2020 15:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BY--Bmery42F; Sun, 31 May 2020 15:27:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DBD4787E3C;
	Sun, 31 May 2020 15:27:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6C83C0863;
	Sun, 31 May 2020 15:27:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC495C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B853885D7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpKbUOmoVjf3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6C71D84AAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:29 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id i17so3209234pli.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rXH065TEJpyQCEIMDnCvPM+XrRnyBZ4WAxquHZrHOUM=;
 b=cS6puiw59rez3e2hM2OPb8BOXe4U6KDFiQ0fiMdKNKppKsxx0N4bKfNERuGyJa78PH
 Q60iQ6axLHPM3Q8t5uV0eoaJ2971IWSFykat/5RlGspAqlkyMXM0QzdXBpF98iGrPZgk
 5g/Zp2l1y2Xl9kE4SDlO0x+Zda0XLU//CTx43D8rvU1HGj1MqMeapax3OCOe9h0eFKR1
 OgtbtVhCjpvg7ST+oZo2O6gUgnZwlkrvXbbmQPGa9N3xU4x+LURPNFWPII98YTt3g/Ud
 OCobeiqBD20emkeJYIS3e6W7w0BzcZxjbiOOuvyiLCZuiCl2DbkH19Gy6o7rkvWfKL+y
 pm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXH065TEJpyQCEIMDnCvPM+XrRnyBZ4WAxquHZrHOUM=;
 b=V3UB7/nljgZSf0DJeb7gyGglbq6YSTQlMmUcY0w3ZT+hlhVUvpdG8d6Qo3L/CXWxtT
 Tde/O4172S7JHU7CBcNsUl7ICrNxXqs68OKkgI0ynBzeT+OO4L7x+nUbRiewc4F7GbuV
 xHuStzF5MYH4uPW76Yzma2Z2lZ4vC82r/7s2fKFqyEGghyhNCVzFi99uaE5JNYc7oDXI
 VGA7N592KOBCv1WFQhzCk+SUzSU+hNzomeRiIORpmL7nLhWExKmw24E4mskF5rKXRQLZ
 bW5G0TevJKWR0cOZX93zPiRWFESBuIodqGR413xC+TPwWBq4j6UXYjRloHjMQADrt5gg
 QPXw==
X-Gm-Message-State: AOAM532lSGxQYmcm1Gbnb1JfondixXWMb+u67svqhyqDl3Bk2zpcWeBJ
 Eo8HaPF2iayIcevv8co2h4BOy5Ym
X-Google-Smtp-Source: ABdhPJzJ+LnJa5a8wxvqDZmbLKtOMDDNNDsfXOxVw/PaV9gL8TbZPpPRJGef0UW3kMFaviaa5gJUjw==
X-Received: by 2002:a17:90a:ba86:: with SMTP id
 t6mr19936505pjr.19.1590938849016; 
 Sun, 31 May 2020 08:27:29 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:28 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:02 +0530
Message-Id: <20200531152621.2886-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 08/27] parsing_cocci: arity: Reflect
	struct end attributes
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

Struct end attributes are added to the SmPL AST. Reflect these changes
in arity.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/arity.ml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/arity.ml b/parsing_cocci/arity.ml
index cbfb84e3..6f90616e 100644
--- a/parsing_cocci/arity.ml
+++ b/parsing_cocci/arity.ml
@@ -624,12 +624,14 @@ and declaration tgt decl =
       let sem = mcode sem in
       make_decl decl tgt arity
 	(Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem))
-  | Ast0.TyDecl(ty,sem) ->
+  | Ast0.TyDecl(ty,attr,sem) ->
       let arity =
-	all_same true tgt (mcode2line sem) [mcode2arity sem] in
+        all_same true tgt
+          (mcode2line sem) (List.map mcode2arity (attr @ [sem])) in
       let ty = typeC arity ty in
+      let attr = List.map mcode attr in
       let sem = mcode sem in
-      make_decl decl tgt arity (Ast0.TyDecl(ty,sem))
+      make_decl decl tgt arity (Ast0.TyDecl(ty,attr,sem))
   | Ast0.Typedef(stg,ty,id,sem) ->
       let arity =
 	all_same true tgt (mcode2line sem)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
