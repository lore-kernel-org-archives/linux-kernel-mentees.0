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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C69C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB38206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZ3oSTiz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB38206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3061E87E3F;
	Sun, 31 May 2020 15:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zwbcKL705xt2; Sun, 31 May 2020 15:28:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C384087E3C;
	Sun, 31 May 2020 15:28:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0216C0863;
	Sun, 31 May 2020 15:28:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06E1AC0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0142C87E3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udhxI6RN2IO9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A8BB587E3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:17 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id q9so3798759pjm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4uwuGVmkBXskVvKyLUdthnTRx01/P3EiKMFAZiwawPY=;
 b=cZ3oSTiznmsJWvteVmwQ4sEH4+7KgvOuH4Mgkcu30DJpQTEBEftTXLDcsx5x+72PIx
 cN4kvMXEWTsGc1tcSyuRVj79I6M/doJ/SLTXAGbg+B89Yl2ORu6P2Vh359PHi2BV5Bah
 8TYVvTpOA9B6U45+4XcrvRrdLcU4IREqrVCTwMZjbCbEkINzctJW7EVwM0FlY6yBcHxC
 oXOcb+FAMQKYvkD5p+RrLi5wLzooWwsKooc3/MMdsoA5B4d/0c04feyU1o85XJQuV7/9
 btMZnQWpg31nTi5nSpV/dq1wU/Uw+bpAY4ucMUKinhc3GhjmXreT0sAwkXIll/Sththv
 IFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4uwuGVmkBXskVvKyLUdthnTRx01/P3EiKMFAZiwawPY=;
 b=LWIwYDAlwGEn2a+IfMKKiNEYWLYDXvCCS0t6n7uTtArHg3D9QnOPhyH0utZk7IyymV
 BprhwA8Cjw6JSqQWgMTnZWpfsTKpZm2yetod3+r+YxXhWcfjJxs5seEAgqA8N/fEiFsS
 Bx9utkPbb6aX5LaeX08ymMlVrY9lLW9fCZtT8xf4ZnVd+jmNwXKfVdFp73ExqZSuhG2s
 ebe2v49huaDnoa7mm1xNb+bFlbDA3RAlYU4IBmWHDjJeyuZXQ2u9waC+w0rKJ3GThMW/
 r8WTAwKkXH4Zqk/picnVci3z+sJlhCyBxqFB8V70tZdPGrKp44mfkBrcEYvgsjX1wUfK
 g+SA==
X-Gm-Message-State: AOAM532ulgeJMEHCJ8XuQW4SkLri/gOk3F7Ptv10G/yFtW0eXJCTjaOp
 b7+zzFtVrC0ekSJsxeQf2EA=
X-Google-Smtp-Source: ABdhPJyEEd0lFJKzpZQFytrB2xFWI0/tbrZ+j08LpSmyvXpSrFqpPJ8qQ2vi3ZFgd9Uo55Vja7NUyg==
X-Received: by 2002:a17:902:d711:: with SMTP id
 w17mr16061018ply.139.1590938897259; 
 Sun, 31 May 2020 08:28:17 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:16 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:17 +0530
Message-Id: <20200531152621.2886-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 23/27] ocaml: coccilib: Reflect
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
in coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index c5195084..24b5f1ae 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -2766,7 +2766,7 @@ module Ast_cocci :
           string mcode
       | FunProto of fninfo list * ident * string mcode * parameter_list *
           (string mcode * string mcode) option * string mcode * string mcode
-      | TyDecl of fullType * string mcode
+      | TyDecl of fullType * attr list * string mcode
       | MacroDecl of storage mcode option * ident * string mcode *
           expression dots * string mcode * attr list * string mcode
       | MacroDeclInit of storage mcode option * ident * string mcode *
@@ -3401,7 +3401,7 @@ module Ast0_cocci :
           attr list * string mcode
       | FunProto of fninfo list * ident * string mcode * parameter_list *
           (string mcode * string mcode) option * string mcode * string mcode
-      | TyDecl of typeC * string mcode
+      | TyDecl of typeC * attr list * string mcode
       | MacroDecl of Ast_cocci.storage mcode option * ident * string mcode *
           expression dots * string mcode * attr list * string mcode
       | MacroDeclInit of Ast_cocci.storage mcode option * ident *
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
