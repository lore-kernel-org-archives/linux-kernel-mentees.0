Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED41C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62478206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVlgWYse"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62478206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4CF62221BB;
	Sun, 24 May 2020 17:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYHSBJypqrxY; Sun, 24 May 2020 17:22:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AC61C20022;
	Sun, 24 May 2020 17:22:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A29D6C0178;
	Sun, 24 May 2020 17:22:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF1D4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7456922246
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8K9hPi4m6pWD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 123C320022
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:22:20 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id 5so7572491pjd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Az+F0PEMm7+AO/Nvbjule0aCiqTJupDpFvzo6TVkawI=;
 b=IVlgWYselt5YusLrrGFz9pI+96XQSeMg/DHxNFtOMH03SL0AX50sBgEQlqmkw3CARS
 Yh5RPcgSGXbSV6o7X1/4QYTbE/8xr8Pla5hxUvjHwzA41PtqgRgVnadkvS7ikHq5p9pj
 f/IbGs/3AZ31uPKvtmY11f0S6kXBjB95GFCSjUWc/hmTlRFx2bOoXyI2RIC6SF+4mUqB
 JQJydbIHQCxbMQNck4tteIgOsbGQR8wS3oZzVSQBlWaBK1pIAFo+DSw19w8WK2Oi6Opu
 PBo2aq0iEug3xUqB2QfnLh9+20HtioCj2U7kkJwBc05ur9MOdk6qoataqQdogWMBYxHX
 RD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Az+F0PEMm7+AO/Nvbjule0aCiqTJupDpFvzo6TVkawI=;
 b=Fcf2zIZb9olfG/FxM54ba3ve6/4vrf7MA2cR1frgb6JcZDoaH02bgsnv1h2Ecmctgx
 GNl9vYMM0qeheBd6fXF24QyjSK21TTHqkCJWR4xZkPRfkOhWBqk3oGktxN48hk8qQ8OO
 kpjmAAnfbWwPN1un04Z78Jlr0oBGKSu9A5FkO49Gblqp2bcUF2za7YgADhGuyNf+tajw
 LlvTOYdN4pfrO2HxHmZe2J0C9yTSlXB2+N2c8I/U0spIR8w1p6yKH9Xe6SnE00pe/oS1
 1t6gpb/z3Pefs9tncofYJhxeliObZnWXaNu9z5z58yTDjYGLk2qnGj8gyGIpJxDWgN+b
 L7Vg==
X-Gm-Message-State: AOAM530+3c5grGJLV998H4aeRYXTJ8Rx46N97Jc0zJhbdsiRxj5GHw0E
 M7B6K73uV3FWHRIJPPXwVJI=
X-Google-Smtp-Source: ABdhPJxqxaSa1yQi6sDfPveaCEMBwPuIGSXG73PgkwaIooJBIV5vXIeA8KPW1hGsctyX77VeZ4TC8w==
X-Received: by 2002:a17:90a:ad92:: with SMTP id
 s18mr16761563pjq.30.1590340939616; 
 Sun, 24 May 2020 10:22:19 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:22:19 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:30 +0530
Message-Id: <20200524171935.2504-26-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 25/30] engine:
	check_exhaustive_pattern: Reflect Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
check_exhaustive_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/check_exhaustive_pattern.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/engine/check_exhaustive_pattern.ml b/engine/check_exhaustive_pattern.ml
index 903c32ff..2f1ef4a3 100644
--- a/engine/check_exhaustive_pattern.ml
+++ b/engine/check_exhaustive_pattern.ml
@@ -63,7 +63,7 @@ let dumb_astcocci_decl = function
  | A.Init (stg, typa, sa, attr, _, expa, _) -> ()
  | A.FunProto _ -> ()
  | A.TyDecl (typa, _)     -> ()
- | A.MacroDecl(stg, fn, _, eas, _, _) -> ()
+ | A.MacroDecl(stg, fn, _, eas, _, _, _) -> ()
  | A.MacroDeclInit(stg, fn, _, eas, _, _, _, _) -> ()
  | A.MetaDecl _ -> ()
  | A.AsDecl _ -> ()
@@ -76,7 +76,7 @@ let dumb_astcocci_initialiser = function (* seems same as the above *)
     A.Init(stg,ty,id,attr,eq,ini,sem) -> ()
   | A.UnInit(stg,ty,id,attr,sem) -> ()
   | A.FunProto _ -> ()
-  | A.MacroDecl(_, fn, _, eas, _, _) -> ()
+  | A.MacroDecl(_, fn, _, eas, _, _, _) -> ()
   | A.MacroDeclInit(_, fn, _, eas, _, _, _, _) -> ()
   | A.TyDecl(ty,sem) -> ()
   | A.Typedef(d,ty1,ty2,pv) -> ()
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
