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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53634C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2996E20888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rn6y/GHb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2996E20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 027BE870ED;
	Thu, 28 May 2020 12:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOCEI3Y-tPSW; Thu, 28 May 2020 12:25:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0D1F8709F;
	Thu, 28 May 2020 12:25:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9004FC088D;
	Thu, 28 May 2020 12:25:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B400C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 250A488D55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4uXzjEIty3x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A95DB88C30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:45 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id t8so3047710pju.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4dXktnt2JoaHvfulBMJF3+3oeU5k7LYjH73DfL+m17Y=;
 b=rn6y/GHbnBYmhTkrUQIxdd03jU6cxo1074rlTAsROpFFM3UdwfncMXNmmI0N6dHmxd
 UD+NG0CQBKewZtT5h5NSU+qDsrcMt5mPhpi8SlJYUntuxYpig90LG9QOjqyG3uHjdQGI
 E2g45zsca2VWq1i7Kh9zm6Q2n5Y05zy4gHWcVteRC6W6zTDGAJN2mxRKk3mN12xRALUy
 sqrwX0KYVokM6yUpH1PlMM6V9/wGB08pWflYWLVFLqceR/ps14mERGt3lzoYcaR2cO6K
 umc8/DsWrzw8bJQQnCcibtubCJVD0JS8RVZg4CUyFaX7JHHrivkmhvZZBaOSl3JdEHKO
 4aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4dXktnt2JoaHvfulBMJF3+3oeU5k7LYjH73DfL+m17Y=;
 b=Dj6cSzsP2j6RwSePOSeHE8OvkYDL3690mhGMk+jUUibAF4Pq+mntt9n+9zRNyNwti6
 fej21GyDBkeNuP58DYFkT8+OlfOf7ZHhfg+3cXX0lvncRPNSP26arbhgVCJ0bqukmEzP
 Tnr+zA3+XVerRstK0rR3FPAXwyKSk0+XaVYVhhCcYqMOu2qPRgUf6udqVqhgK9QVt2xB
 H4a2xJnaOfXMmOW1w6wyc1BEbFLSqMQxCYaF3wXYeRu+10/hmYBI+nzuPZnCUtdOz8YC
 CAXYHUUzWZKWR7y2IWhGd/A3vWhFm37YD6SNZClm0IbENSmNuvalTLYeS0+vj3bP7abK
 d2IQ==
X-Gm-Message-State: AOAM533BN4h6I9uGc4KgAmZix8mKMzcuPk6+6EUuixIyd2K9gasafmE4
 Y3zrudS5FCWjcVocFHJptCEAxvAY
X-Google-Smtp-Source: ABdhPJz1SlVkKgGS56f1S9nYrkV9pcTs0J6qMbbDLTGZBCNCg53tJuTWlSa7uuA2vaSxkVujwGJfDw==
X-Received: by 2002:a17:90b:1482:: with SMTP id
 js2mr3633155pjb.54.1590668745112; 
 Thu, 28 May 2020 05:25:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:44 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:20 +0530
Message-Id: <20200528122428.4212-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 18/25] parsing_c: parser: Make
	abstract_declarator pass attributes
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

The attributes in abstract_declarator can be used for adding parameter
attributes, cast attributes and others to the C AST. Make
abstract_declarator pass these attributes in a tuple.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 2caf4974..57528dfc 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1397,13 +1397,14 @@ tccro: TCCro { dt "tccro" ();$1 }
 
 /*(*-----------------------------------------------------------------------*)*/
 abstract_declarator:
- | pointer                            { snd $1 }
- |         direct_abstract_declarator { $1 }
- | pointer direct_abstract_declarator { fun x -> x +> $2 +> (snd $1) }
+ | pointer                            { $1 }
+ |         direct_abstract_declarator { ([], $1) }
+ | pointer direct_abstract_declarator
+     { (fst $1, fun x -> x +> $2 +> (snd $1)) }
 
 direct_abstract_declarator:
  | TOPar abstract_declarator TCPar /*(* forunparser: old: $2 *)*/
-     { fun x -> mk_ty (ParenType ($2 x)) [$1;$3] }
+     { fun x -> mk_ty (ParenType ((snd $2) x)) [$1;$3] }
 
  | TOCro            TCCro
      { fun x -> mk_ty (Array (None, x)) [$1;$2] }
@@ -1461,7 +1462,7 @@ parameter_decl2:
      { LP.kr_impossible();
        let ((returnType,hasreg), iihasreg) = fixDeclSpecForParam (snd $1) in
        { p_namei = None;
-         p_type = $2 returnType;
+         p_type = (snd $2) returnType;
          p_register = hasreg, iihasreg;
        }
      }
@@ -1527,8 +1528,9 @@ type_name:
        let (returnType, _) = fixDeclSpecForDecl ds in returnType }
  | spec_qualif_list abstract_declaratort
      { let (attrs1, ds) = $1 in
+       let (attrs2, fn) = $2 in
        let (returnType, _) = fixDeclSpecForDecl ds in
-       $2 returnType }
+       fn returnType }
 
 
 
@@ -2117,7 +2119,7 @@ define_val:
      }
  | decl_spec abstract_declarator
      { let returnType = fixDeclSpecForMacro (snd $1) in
-       let typ = $2 returnType in
+       let typ = (snd $2) returnType in
        DefineType typ
      }
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
