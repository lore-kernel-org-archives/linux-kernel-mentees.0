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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4770DC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2FC206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICUogsdn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D2FC206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E082F221D2;
	Sun, 24 May 2020 17:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3ko0cPQn8lM; Sun, 24 May 2020 17:20:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3AAC721F76;
	Sun, 24 May 2020 17:20:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 289BFC0178;
	Sun, 24 May 2020 17:20:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11502C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0ED2B880C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nctGRmqureYg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A255F88098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:20:27 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id x10so6622260plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7JayPzVO73mHgocfSrJ3HFPybIFIGUU87Sf08ZFQsyc=;
 b=ICUogsdnfr6UZE4IPq0kCgbYua8Rm36w3b/wlNvqhwxztWwQ9HtkTrXthYM6Qzj06s
 kKM4plh7UNxwV47iomgAbgE6/vqfLM9u2l9M3EfQthWTufEE1Dsguk3DFTGDfIC7lxeg
 oTtNXg+2fr7dJBxIZrvm73rs2pD0Uuy0PnXmu3XC0pFeIDmdsckj1m6Yvo+4tISAUB/w
 YZv7rxw5S5PX/sMIWzQVbyqOs0ImVqJL7gn9FgiS2rDEmpJzC+6K2qG5MZOQfr224SuO
 N4KVwbrdnyvqUT6At0aHzlWCR1zAF7I/ujlvvz+QQrjZ5fSqGDqc+a6pn0q3KCvFc6/b
 i5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7JayPzVO73mHgocfSrJ3HFPybIFIGUU87Sf08ZFQsyc=;
 b=QF8QxRQjWId41Ce3vzCi4ssJzpo4407CXVvGANrYoA9Z0gKlEcBhyxfH5yoykRdLW8
 cTySLE5UwRhfgypVTmcPG7f0wvaKwrKBCPH6Nxv3Lq2PY1CAMMY6p1z3c1JG9ExQxhOy
 bxeKc0jqsb84RyNCfyhFxF7DXPpNxMQReGv4Pk0zBjOriSmCs3kYmeOd31+vAKvYZ2ok
 F81qFCvJdeXct4ZjJxOmNbnnaxfpwbtYoZ0z3UEm52bfw/3VYQQIsQsYPsi4dyq9UJwO
 Eo7PeG6/NXVTTSH/HV2mfuLtlVNt2lL6Et7FpRSemDrw2nnCICjh7WU55f0/lcLPWUA6
 VfQA==
X-Gm-Message-State: AOAM533VWz9rJqyBNgY68D7M10cJ/mr1Xl2bZhw85OcmT7yVdqXjtxE3
 n6Rpl6lm3/F1CH8NtwceJ0MH0nXBNKw=
X-Google-Smtp-Source: ABdhPJyQpH4Dy8Dz8sIUBmyiIcmR6FNtyrFXaHs+stWQupsaCtiAyRB70ru/+FXFCC5J+ky9tmtReg==
X-Received: by 2002:a17:90a:248c:: with SMTP id
 i12mr16513450pje.213.1590340827224; 
 Sun, 24 May 2020 10:20:27 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:26 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:10 +0530
Message-Id: <20200524171935.2504-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/30] parsing_cocci: index: Reflect
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
index.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/index.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index 6bda797e..3d74fc41 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -117,7 +117,7 @@ let declaration d =
   | Ast0.Init(stg,ty,id,attr,eq,exp,sem) -> [54]
   | Ast0.UnInit(stg,ty,id,attr,sem) -> [55]
   | Ast0.FunProto(fi,name,lp1,params,va,rp1,sem) -> [132]
-  | Ast0.MacroDecl(stg,name,lp,args,rp,sem) -> [137]
+  | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) -> [137]
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) -> [157]
   | Ast0.TyDecl(ty,sem) -> [116]
   | Ast0.Typedef(stg,ty,id,sem) -> [143]
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
