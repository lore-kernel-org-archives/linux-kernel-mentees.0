Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992F4C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AFE0206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRbjdy8X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AFE0206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 12EEA2035C;
	Sun, 31 May 2020 15:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvMvsuNYUm4u; Sun, 31 May 2020 15:27:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C80A820030;
	Sun, 31 May 2020 15:27:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB1E9C0863;
	Sun, 31 May 2020 15:27:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C030AC0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9ECCE20438
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQgunYZsU+-O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id CD28F20030
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id u5so2334801pgn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SF0fEKNRQE0hfdZKrqQAWSzMC2Wucfj6sXpz+PSSvjI=;
 b=MRbjdy8Xmv8HMZ1M8j9QUSwReZa81/7D706bTMwbPJ+aCPEmgJruA2pWhdGyydpJMY
 trFoaL3Fq/57dgxj+87rWp0P2LcWvLJhnVWPGqaEkZbO+ukZn4uXsrNyvzB9d9YZ9hRt
 OKYzIBjAlyS/tt9vOb3kQN8yxrvmt3V574fFjaYrBHnwp2ndMcWi0uUpCUxp67Ub4uC7
 rp7wi7qihb48NGBLhEN/DTyFKHH+87snXEfKEnxDHMC+mTOhbqfS9PsWU6OjSqC0k9ta
 ENVs1RSQZftP/XAd3Sw0AsqidshdBkQNB9H1kbwCTa8BVuBixJgaut9ZsV0Ny62A63LZ
 FVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SF0fEKNRQE0hfdZKrqQAWSzMC2Wucfj6sXpz+PSSvjI=;
 b=dAcG9SWB65g6gDxi8Sv92LdkbMt0zTx5TaC6s6q7Zfw7J5lEuuL44wqAsRM692rM+b
 VPSeT1wCUecs3HhmV2dVa6uYdVxg8waQk+oMqc6mPIYIkTzD6NX/esrHp9MLvANbtYt5
 Lf8G7PYgBRcpqLFf2raIwJdvgXI9n+4il+Dz7dWuLOJjLkHwkWGEXB/5CHyC7NK0EBk3
 CH0Ig/rUJSRpRq/7UvgTaYWRMoksJom7h5jbgNezcQ7LS3w6Q2hPBb3Mbo1Pg4rLVM9N
 E/3oO+QvlbIOTpWv9xO12lX+8xUFCs+7a8IuyYYGFgfcOknpbeDPOvx90Rwx0/+hTKdl
 9fBg==
X-Gm-Message-State: AOAM5320Or2cKW6PaRE71H/cr/o4EtG6j1qgl9ZFr2M2TkyDUPwAM0m7
 V/EguoF9ysiZUhYpy0c3mGk=
X-Google-Smtp-Source: ABdhPJx7lZruaEGSlK38Q5FdcbLL1e5LT76Ki37lo4BAvSaojHpJeUNHjNdphdL+SV76KgdCi2Y32Q==
X-Received: by 2002:aa7:91da:: with SMTP id z26mr9479338pfa.64.1590938874418; 
 Sun, 31 May 2020 08:27:54 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:10 +0530
Message-Id: <20200531152621.2886-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 16/27] parsing_cocci: disjdistr:
	Reflect struct end attributes
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
in disjdistr.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/disjdistr.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/disjdistr.ml b/parsing_cocci/disjdistr.ml
index b8491931..ba2b8c02 100644
--- a/parsing_cocci/disjdistr.ml
+++ b/parsing_cocci/disjdistr.ml
@@ -351,9 +351,9 @@ and disjdecl d =
       disjmult3 (disjident name) (disjdots disjexp args) (disjini ini)
 	(fun name args ini ->
 	  Ast.rewrap d (Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem)))
-  | Ast.TyDecl(ty,sem) ->
+  | Ast.TyDecl(ty,attr,sem) ->
       let ty = disjty ty in
-      List.map (function ty -> Ast.rewrap d (Ast.TyDecl(ty,sem))) ty
+      List.map (function ty -> Ast.rewrap d (Ast.TyDecl(ty,attr,sem))) ty
   | Ast.Typedef(stg,ty,id,sem) ->
       let ty = disjty ty in (* disj not allowed in id *)
       List.map (function ty -> Ast.rewrap d (Ast.Typedef(stg,ty,id,sem))) ty
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
