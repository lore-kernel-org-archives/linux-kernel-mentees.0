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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01592C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C575B206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVmUROJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C575B206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 87AB7875F0;
	Sun, 24 May 2020 17:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Siy+M1SCDOkS; Sun, 24 May 2020 17:20:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA87887527;
	Sun, 24 May 2020 17:20:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4DE5C0178;
	Sun, 24 May 2020 17:20:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 047B5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 01D81863E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqDYsJuMUR0n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 03AB2863A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:13 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n18so7868423pfa.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8PXTaNekHVw8RwigDgdt/Lh4SU9vlQcFnioxggbCotQ=;
 b=WVmUROJGqRfZ//qiP35iQ2hDZBpsH4KCtBN8fCkwHFk2RKrmXmnr0h7VF0qjGpbBhf
 uRkDOT5zubn7bonK3uGHhCB9/nmfuKRenNJhp496gbr4q1oohI1f/ptV7F3jusIADWlF
 mzAfR4oZDIMy5REPS4ZXD3fhfLGPZZW2//Qb4SXa1l12XtoTYkBMD5nysGYQMFDyuH/i
 P+56a3j2BVHWpaoNRvem4Vr7PimFDy0X2yte2GOB6FEXIxvJ/rxWD8lyS5vT+qoO2Og7
 txNq096fOLQ2FkGaJW7KCdFTvtchO088APY52xVrscfFdvVhQM2HHzRz8+gNsgXHvb7L
 uhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8PXTaNekHVw8RwigDgdt/Lh4SU9vlQcFnioxggbCotQ=;
 b=kvYqb6Mz/MVRwmiG5FXLSCOxOWROt4i5hguaQ86TUlwfkKayDyhAl9d9fzC6fFaoft
 vR84gtk2a2PCKeFp7Twjo7FZ+H23Y9DlnoghlcxOC7V3j30r7I/9mPurst++NTAC0wrY
 nh3O0fAxbhZfVjbQLr83MT6LprL2wtS84+DH4hjwRg7cvs/ykL96v4u7SdKtsDf9WLKw
 QAV5cZWKFfDhNU+kXxvfrBPJ9pO4Euw0vvToY8+nb9f1tLtpOoTfP60MyW7fgFgEaTN0
 UnPmA4+wJQntpqI2250cABFGPngnuqLGyxilzrbkD3GEEuw42iTA9Z+b2mPDj0lFkhH3
 fqmQ==
X-Gm-Message-State: AOAM531n5ZZRGgFQ3ml01l8RRq3+tN4eP8pNJAhe5Z9UxF6DJh6OGtle
 /mrzaWy/nQ4i5A8M6Wj+WSo=
X-Google-Smtp-Source: ABdhPJy7yLcwMTXwkuXfDw97DzoQ0MmikG/FEaVVnMFPPaMmIrPH5BLWM4UV/GoiOz0ShAIHR+iPPw==
X-Received: by 2002:a65:5287:: with SMTP id y7mr22283905pgp.86.1590340812435; 
 Sun, 24 May 2020 10:20:12 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:12 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:07 +0530
Message-Id: <20200524171935.2504-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/30] parsing_cocci: parser: Parse
	Macrodecl attributes
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

Macrodecl attributes are added to the SmPL ASTs. Parse these attributes
in the SmPL parser and place them in the SmPL AST. The added production
only supports attributes before the semicolon.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/parser_cocci_menhir.mly | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
index db5661bd..d5d5df8c 100644
--- a/parsing_cocci/parser_cocci_menhir.mly
+++ b/parsing_cocci/parser_cocci_menhir.mly
@@ -1710,9 +1710,9 @@ decl_var:
       [Ast0.wrap(Ast0.Init(s,fn idtype,id,a,P.clt2mcode "=" q,e,
 			   P.clt2mcode ";" pv))] }
   | s=ioption(storage) d=decl_ident o=TOPar e=eexpr_list_option c=TCPar
-      p=TPtVirg
+      ar=attr_list p=TPtVirg
       { [Ast0.wrap(Ast0.MacroDecl(s,d,P.clt2mcode "(" o,e,
-				  P.clt2mcode ")" c,P.clt2mcode ";" p))] }
+				  P.clt2mcode ")" c,ar,P.clt2mcode ";" p))] }
   | s=ioption(storage)
       d=decl_ident o=TOPar e=eexpr_list_option c=TCPar q=TEq i=initialize
       p=TPtVirg
@@ -1758,9 +1758,9 @@ one_decl_var:
       Ast0.wrap(Ast0.Init(s,fn idtype,id,a,P.clt2mcode "=" q,e,
 			   P.clt2mcode ";" pv)) }
   | s=ioption(storage) d=decl_ident o=TOPar e=eexpr_list_option c=TCPar
-      p=TPtVirg
+      ar=attr_list p=TPtVirg
       { Ast0.wrap(Ast0.MacroDecl(s,d,P.clt2mcode "(" o,e,
-				  P.clt2mcode ")" c,P.clt2mcode ";" p)) }
+				  P.clt2mcode ")" c,ar,P.clt2mcode ";" p)) }
   | s=ioption(storage)
       d=decl_ident o=TOPar e=eexpr_list_option c=TCPar q=TEq i=initialize
       p=TPtVirg
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
