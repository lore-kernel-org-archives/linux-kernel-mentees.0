Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910C7C7C8A0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6245B20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTUKl3nY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6245B20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4888387D9E;
	Mon, 27 Apr 2020 12:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21IFTRPMgDfG; Mon, 27 Apr 2020 12:10:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBFB287D9F;
	Mon, 27 Apr 2020 12:10:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9F4CC1D87;
	Mon, 27 Apr 2020 12:10:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24F43C1D74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 009578671A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z90OU5s1qZSe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5EDA78670F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:10:07 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id a5so7444478pjh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rp94vOsb/WaVd2HONzi5/Y3mPcPmoWehtgmjY+02Yc=;
 b=MTUKl3nYdwXWzJYe10mdc4vBI+I+lB+g8bn0UlmiKN6OUFPpinSaiabKfIwAGvF0DU
 wygegplKBpp3GFjelM+lgzLYJjsE6MpUh3ycWjOZtcmnu/25LHbKckzGN82+wWEDiQG6
 BKdctNdt1MFThdMt0/STr2PG8seDfBbSOqZNUPJKVmCik8ymocf392L/q2Umj5+T6imU
 6Jpztiv5UeSx3wWbl5eigKCZaZvj7OvRrGUQwM81axH6kc+sKHQngNyZAYroR2C0mCRN
 ehlWOitxWhfOhYZ4R28ygAE8jUo8QpvfnfuNC3IwqvRn3dkHJai6A4yvd/lQwXCm3pI6
 8nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rp94vOsb/WaVd2HONzi5/Y3mPcPmoWehtgmjY+02Yc=;
 b=ZB+dX/WN/TaeT2amnXDK8IM3FDHIGgDO5sLjAtcaN+NMVxv3u+ZQzfMtAeRskxNO7f
 z9wMxQwH8Mkb3N8JMWHuk6aGJIFi7a0hI31sMArBKH/0suGezjc+4CpSIS1t7LEMkvix
 jTAWfM64bMuZMYwyEXis0FPHtXq7/jzkTIj1wVP4A5cpCu+YabtC16yLLZamPjPjJNK6
 mHZq/EgQOn/BzHPk7RdM8fcfubmFMmkcGV1Kzg6Ayt/a/tvxad4vWTWJ1nOVLnpjKJZ8
 8m5QTat6d+kkfv7lQuzLUGPxJt3uMGan3nYXWTQKSZ/QMF0nqcej9tFx+LiBBnWATkQg
 hiVA==
X-Gm-Message-State: AGi0PubuK/fxQtsprT/Zbs0aU13CF+irq9f8H/tw0lYC9Rv271La7cEm
 ozpeOYaQ6MmtdFovkfY7L1c=
X-Google-Smtp-Source: APiQypLttKCJQx25f1PpyqB57wNN+tRB8JaesQWDcryJdWNNGdba10b3PR6gCeEbOsYMXAyllRkh4A==
X-Received: by 2002:a17:90a:21ee:: with SMTP id
 q101mr22653052pjc.24.1587989406854; 
 Mon, 27 Apr 2020 05:10:06 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:10:06 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:32 +0530
Message-Id: <20200427120834.380-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 21/23] ocaml: coccilib: Reflect
	Parameter attributes
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

Parameter attributes are added to the SmPL AST. Reflect these changes in
coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index 0e807c9a..59c58aea 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -2825,8 +2825,8 @@ module Ast_cocci :
     and initialiser = base_initialiser wrap
     and base_parameterTypeDef =
       Ast_cocci.base_parameterTypeDef =
-        VoidParam of fullType
-      | Param of fullType * ident option
+        VoidParam of fullType * attr list
+      | Param of fullType * ident option * attr list
       | MetaParam of meta_name mcode * constraints * keep_binding * inherited
       | MetaParamList of meta_name mcode * listlen * constraints *
           keep_binding * inherited
@@ -3455,8 +3455,8 @@ module Ast0_cocci :
     and initialiser_list = initialiser dots
     and base_parameterTypeDef =
       Ast0_cocci.base_parameterTypeDef =
-        VoidParam of typeC
-      | Param of typeC * ident option
+        VoidParam of typeC * attr list
+      | Param of typeC * ident option * attr list
       | MetaParam of Ast_cocci.meta_name mcode * constraints * pure
       | MetaParamList of Ast_cocci.meta_name mcode * listlen * constraints *
           pure
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
