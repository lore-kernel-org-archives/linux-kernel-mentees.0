Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A24C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867C0206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5n3vDmd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867C0206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68B4A893C7;
	Fri, 29 May 2020 12:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dACQa7JJoq9T; Fri, 29 May 2020 12:09:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 15BD4893C5;
	Fri, 29 May 2020 12:09:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3F06C0890;
	Fri, 29 May 2020 12:09:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26EC2C0890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 908AD25D72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rBWsaP114tm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id B042D20410
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:09:10 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t16so1089330plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8KQVzS3ah3vs2qqwXtIf9FY1LkUh04IBlZi8QJebGs=;
 b=p5n3vDmd6kWPoFJ8EeIHIaaVjiqoqcGubzctsYJyFCE1y4ifeZcIpyOozCWtnDCWD5
 O5QLaUO2e4EpWbTdkx9MneW9JY37OjLcKgaZLul2yA/34A67Q6sPKPjbKDxqzU+XtT2j
 1pCArHyEjYg4VTUmIpcuV4oEs0pr33Hg0Ax0TWrg9KAkoPHT7AH85eN9aKi494Sya6+0
 +tpnynICAq75DHo2FuPsQ540K6HPUQyfmFVkjJs2zRjJAB5ViNpmNkItaWI6KeTJVOeI
 FBvHVUifQlX7a/L8kaoIzpZsGfxU9bvbB2EOiZttOdoCc2hz8Kca7a7GVAvDEgVP+l1b
 xDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u8KQVzS3ah3vs2qqwXtIf9FY1LkUh04IBlZi8QJebGs=;
 b=bBvlHhW7Slg17oMDbZ8YOCQBYOj5HtYXLb9Oombj0B/S+T2yDsXsxVbgGyNFQnboW6
 XtQwrye4HN5CrvtylrcOQlmtiVrjxfUZfTLKtS6lW6sXKmZ4G2/pZtCCMIt0SrvXjgDF
 hdtPtGdjA2RSHXDZShxj616f4am0cyj1Dt67LUdQEnPR/JfnnsftfgPKG0JLBg2LQcAk
 pOSRPj0dbqf5/bgRTbp+ywEQygMqUw1RAqDQ3gH+PTqIOoXUqybZyAxlxhJL2cuJQgUv
 IdL/kD/ZfuR0JPt1hhqxv1wH4+gVSyKEvK3No7tVVToMVYAwWrhJBc+HVNKk3Gs4jmhq
 JdXg==
X-Gm-Message-State: AOAM5312xNwvOVF5yPNrLoMkl5RcADaGMxgtHyZI35QIy1BLgEG/VoSV
 Owz6Xll/pHk7Ts9aecTDYWE=
X-Google-Smtp-Source: ABdhPJzaHqCz4BBF0TkP3dQt2Pfsf/PTvmEsjRkh5qK1TdpEWuA8UzK8QhYNE1/VWbyrUhj6mhMLhQ==
X-Received: by 2002:a17:90a:3201:: with SMTP id
 k1mr8889683pjb.202.1590754150195; 
 Fri, 29 May 2020 05:09:10 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:09 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:43 +0530
Message-Id: <20200529120703.31145-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 13/32] parsing_cocci:
	single_statement: Reflect Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
single_statement.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/single_statement.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/single_statement.ml b/parsing_cocci/single_statement.ml
index 4ad1c4e4..73554e9c 100644
--- a/parsing_cocci/single_statement.ml
+++ b/parsing_cocci/single_statement.ml
@@ -138,7 +138,7 @@ let rec left_expression e =
   | Ast0.ArrayAccess(exp1,lb,exp2,rb) -> left_expression exp1
   | Ast0.RecordAccess(exp,pt,field) -> left_expression exp
   | Ast0.RecordPtAccess(exp,ar,field) -> left_expression exp
-  | Ast0.Cast(lp,ty,rp,exp) -> modif_before_mcode lp
+  | Ast0.Cast(lp,ty,attr,rp,exp) -> modif_before_mcode lp
   | Ast0.SizeOfExpr(szf,exp) -> modif_before_mcode szf
   | Ast0.SizeOfType(szf,lp,ty,rp) -> modif_before_mcode szf
   | Ast0.TypeExp(ty) -> left_typeC ty
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
