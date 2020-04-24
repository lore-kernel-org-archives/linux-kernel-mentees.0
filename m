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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DC5C55186
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958F820728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iv8PGlmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958F820728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56A8986F51;
	Fri, 24 Apr 2020 09:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQP4no2u8UZ0; Fri, 24 Apr 2020 09:19:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B97F586F49;
	Fri, 24 Apr 2020 09:19:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5ED9C089E;
	Fri, 24 Apr 2020 09:19:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C7FFC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5C726880B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOrA-E6rlVKg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D7C438811A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:37 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id h11so3518521plr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6sHL+daGjFtrlFNbl9xtJCyZuqsxj+72Q2ol8+9r+0=;
 b=Iv8PGlmuwbkD0guC8QIFoOL9a5hzEmaY1L1iNLcUE5NGuRwKhR3p2yCPWWMQTbaCao
 1/E7kLHf7TKQ/gkW7fABWuoJWwKm+ppW4TrI1kFSS68kWHkCrH7wsYBspjBN2M5guVq1
 Yg2faEEDsnJl9xU95Yb0iTJvQ9P18kercYHLeua6Ks3agmYJXpBRX8MGBoHtZz/4/USg
 rtyhzeR+Zr2xgVTJTbdWWc7u85xFj6I4ufWgP4rHJGRvwui3udU1fC70y8JQ96t2Xda6
 8WUDiEDIZDnrSW4V/5PFdiFkBceI9IFxQH/Vk1sePoIZFW0XaJ+QZ0zI7HhOu6U761DU
 JNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6sHL+daGjFtrlFNbl9xtJCyZuqsxj+72Q2ol8+9r+0=;
 b=LVf3ri6hWJmgvhdkx6clSJxpeu6Hctbvg8M8llRCGqnMywuoZHQaLf2flgEqJHh5Aj
 EwhhC2XFo6IsERFDXZa15JPwsUc/sMdb41YwHYhK3KUcLPnPDZ+gfO+88fc2tx9h/0ym
 37JX+0vnJjuqVqHdiVi6+H2fyDrflviwvk1zys9vRCARWKt0k0U0QKsws19rB+mVUQh7
 DMcN8frptcUoU9ELsha78ET++cmOSfxL0nrjPYlAYOytApi52MO2cSGah3oPoQicqqse
 6PcGUEIskUIhfbZaRmkxJoeGxDZLgW7+/GG59UcGMsOmk9tEiNzeup5vEp3A3QqSuctF
 z6+A==
X-Gm-Message-State: AGi0PubRqI9EAp3VxUr0UycxMYNMUs2cyngCM1PcbNxDNz5+qumjDvOQ
 jFb5ICoQNcuW4I/QreZDwJQ=
X-Google-Smtp-Source: APiQypJgkh/ILYXOcHq22DB3g6nBMjiSUyILPmk6zxPMOsWywXF6FioWrPKVRE3wXMuQOLNnxMEnjA==
X-Received: by 2002:a17:902:40a:: with SMTP id
 10mr7980835ple.183.1587719977430; 
 Fri, 24 Apr 2020 02:19:37 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:37 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:54 +0530
Message-Id: <20200424091801.13871-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 18/25] parsing_c: parser: Make
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
 parsing_c/parser_c.mly | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index da6b9c7b..0c3da206 100644
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
@@ -2118,7 +2119,7 @@ define_val:
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
