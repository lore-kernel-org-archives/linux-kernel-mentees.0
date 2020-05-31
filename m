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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9067C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABCC206EB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXd9k+du"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABCC206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E99587E3C;
	Sun, 31 May 2020 15:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkwwoO8mVfil; Sun, 31 May 2020 15:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FC1487E2E;
	Sun, 31 May 2020 15:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C638C0863;
	Sun, 31 May 2020 15:27:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93874C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8363487E3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kIX6nX-S3sSk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 26DB287E2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:36 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id p21so2318517pgm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5KaC2XBql1jkacWCMm+Iba/ysMxpoPIQRvYs5v86B6E=;
 b=DXd9k+duR+ULG5yVLMr0NodpfRqW33Fm0DRZ6cNpkgr0ycf8cpT0eFotGVWerqmZPz
 EGPktpLeIlpAK3fvBx9Z+MuALp7KxntpcvMpgxE7AJNUI9q+rzB+AKCqMAwLf3s9rQo6
 Xs+3ZyIqZC10Bq7pIPaHf9Tg3btOUObhuwe9OjFCXkV0yXjA4c86KM5iKg0vSBvzyiyC
 3fTfZ3PUZ5ZNErGMNyCaJTlmQ6eWcYK6wTL1g6YhO1jGmXm6nQ+EDyUw/rmXiN+WDf4c
 YhXdJKYj8Ry6m+f1HM5xVlX2zOGs35M3jDUdioeXoMe5zvcGuGAiQgK8WPaMHpgcQj3O
 E51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KaC2XBql1jkacWCMm+Iba/ysMxpoPIQRvYs5v86B6E=;
 b=EAAMjphDsqzlJ/a2xP7pUBJVa8wmbOHeoJBIGDXJ6wQ2MlXRoIMD57KCWhfwfgOjsl
 OX6NxP4vEBEpRGnuiIrOxIdMThxNDWXXEBPPt5jQK1qMtVXjUqJdQXTikGMCdcSHk5bh
 WEfhk39oRC5PXsXB0l0r5MlzLsIHwyyuN085ahYoGwkQW4THHYBK2+OoQscFQyMnOwji
 4wc6G298v0ewxEj8JOOYHGZLkJmpXcSxPG8Hl4NJEQRGcmVApq2DW+M1bUBJy8JVrvB5
 QrDd/Dh+QkoAeukNJluI+IF2smdmjE4aVBCaGbozqCGoUTGqDl4qyCq1ZZDMODedqwgt
 /yqA==
X-Gm-Message-State: AOAM531cs/5/pgbcLxye6CztERM1CWaVahxAYS3l6yU2xogjRi+45vY/
 yvIv88AOlW0vgNo/hE0yW8k=
X-Google-Smtp-Source: ABdhPJyCFnE65dUpbCrKfZhCxvP0gMkIo9GTwH41MVZW8mHgmoxZ2w/Axb2pFYDCtKWDcOtzinqW+g==
X-Received: by 2002:a65:4488:: with SMTP id l8mr15797886pgq.327.1590938855645; 
 Sun, 31 May 2020 08:27:35 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:35 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:04 +0530
Message-Id: <20200531152621.2886-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/27] parsing_cocci: compute_lines:
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
in compute_lines.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/compute_lines.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index 682e41a4..4f273307 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -747,10 +747,11 @@ and declaration d =
 	  let stg = Some (normal_mcode x) in
 	  mkres d (Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem))
 	    (promote_mcode x) (promote_mcode sem))
-  | Ast0.TyDecl(ty,sem) ->
+  | Ast0.TyDecl(ty,attr,sem) ->
       let ty = typeC ty in
+      let attr = List.map normal_mcode attr in
       let sem = normal_mcode sem in
-      mkres d (Ast0.TyDecl(ty,sem)) ty (promote_mcode sem)
+      mkres d (Ast0.TyDecl(ty,attr,sem)) ty (promote_mcode sem)
   | Ast0.Typedef(stg,ty,id,sem) ->
       let stg = normal_mcode stg in
       let ty = typeC ty in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
