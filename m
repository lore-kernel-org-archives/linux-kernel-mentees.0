Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3961C54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 773EF2075E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVAxggjS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 773EF2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B51B87885;
	Mon, 11 May 2020 10:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlMpxkpeO-XG; Mon, 11 May 2020 10:14:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF12087858;
	Mon, 11 May 2020 10:14:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E97F6C0176;
	Mon, 11 May 2020 10:14:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2BD4C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9270586250
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4c7HHZ12Yvpe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3980285D40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l12so4343240pgr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rp94vOsb/WaVd2HONzi5/Y3mPcPmoWehtgmjY+02Yc=;
 b=mVAxggjSUktZATDW/AKuRVG6NV6v6VAYOz6SPYtFE2XbqMJnTbFsFRWqfbOUSazZL6
 qFFQ6MPRUQWb2lBhFFUtLeY5mrsk2IgaLBcERRzIFXTSdkdaWD0L8J1zPtvC8qnpq6KO
 DA6fdVVJB6tsHLCNaMNbLBMYzboKsaza782mT+8S9iPT0OYxxAJHYoq49W21z1IwyyEf
 x+NdXaTaoErVv0Nqr++8gIkaZaDvzK6mbFG2MoZ7RbIi8xawDJk6wYyOQJCITT4ZJd0q
 kptuDd8qroeVtALhDHrhWExRNEg6N2/QZsCun1UYreJFrjiXbDAltq2cBTW5xNJHnba/
 FZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rp94vOsb/WaVd2HONzi5/Y3mPcPmoWehtgmjY+02Yc=;
 b=CwqG9kk4omXzLN6dAFmN30XG8nj+2DFQOEk5R0su+vtk3ykNL5aiaO+SIMVoPXSpBk
 cugNqgtxQrRx+JVG/9T4K481fGJMxAWu9BxMqGdrrGGdAOWI8/uuB8KSTusnN2RSm5sX
 wVah5CN7XVHYRa25BC2SpxdC2MDKf26jMiKXZuoAoshWlCegKFKtPrzzadEWhP0uc7i0
 gO5i4XfU2Apz2kDrmRLj4EXazDd+USHHNZAxAmi1Xgy64w0GoU9n77HccSeF0j+jyh1N
 o4tpuAILsuIIwpAnRZNWYAZ7uku+jt1h/PbEjpXFLC/tzsHOiwzQJC2PploEMyBbWSGs
 usPg==
X-Gm-Message-State: AGi0PuY6iYp6dCIi6A4YaoKizm5KWR5H1f0vUzTlVSO7tmDLLio7Srra
 yqn2PgcPDsSMufhiVyoDrGg=
X-Google-Smtp-Source: APiQypKkEsjecjpPON+uAKVh4rqgd934MqnjM1VhCYaY39ZAp7bqP1hNcQoIYgHOo4urQowhg70yuA==
X-Received: by 2002:aa7:9a11:: with SMTP id w17mr15331171pfj.314.1589192076774; 
 Mon, 11 May 2020 03:14:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:36 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:58 +0530
Message-Id: <20200511101300.11101-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 21/23] ocaml: coccilib: Reflect
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
