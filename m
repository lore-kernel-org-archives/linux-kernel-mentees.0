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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60097C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325C42074D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 12:10:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwI7iK9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325C42074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B1A788485;
	Fri, 29 May 2020 12:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cZ8RaBwM+7H; Fri, 29 May 2020 12:10:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BAD188847F;
	Fri, 29 May 2020 12:10:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A80FEC0893;
	Fri, 29 May 2020 12:10:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2825C0890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EDCC78847F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJoTcbG86Ubb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9068F88453
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:10:11 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d3so1106275pln.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rrzz3VKyAplkiQoSTk8Ir4A1V86JltGAz16X3d5PyBk=;
 b=FwI7iK9oZSq3JzOLnRL2D2txLv2lBqcpbxv57gSNM42+HdP7X3/RIYdCHO9z3FSWkZ
 DiyEBMyOTFHSEmKZmEj/eD9f5Ws48mIWQ7/1nNFvwqBa9ykxQQmc8Y42TUMQNkAFqv5g
 TEIcVaFbKQ7cK0Z0hVCDQsCXTOs1UHQRs16yNvNeMjAnrbPHnVp7oiLgGVJxV7IbJQC4
 irR7kpuvAuizy8ALBUjaarq31rMgp8xEmHQvsoSva7avusQWJTHQJQ66Hxy+6yoAe6ac
 /mIUr21FOLMWQUQcFpLXGFkOz5PdSldcSTMNzM0bl5IiVgPEgTOATG467eh+Ay+iRh0i
 wMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rrzz3VKyAplkiQoSTk8Ir4A1V86JltGAz16X3d5PyBk=;
 b=kyEKcEgEPKZs6ZhTXvQ5f2AHjOTqtzCnakWeXqeM4UGPlznKChD0v2S6tnDFA9Ojus
 9PvWidC6iqo138tDTJfKfTnY5EFcpMCZMjLSHkTCs2TJBMtMRogmVpoj6GfimX/Fwmpk
 /VHdDOwTJoh7DjchoGZw3L/Vm3O9EqROkbwoyI07iOU4+m81Rk3cbF/ylwoBJBpOCkPF
 HU3p2CQqeQfcs+0VH9ieGpqHHnzH3FZBaoTPLzbSmCYqpzCGXKFkcqtKIgrOLZo27t/c
 zFPk+0Z37EKZtAmEmz1NzLRHi4qIBbjWJnFSHIcM6HoFj9tbYGIT1BMM5Bp3d0PnddPD
 xcww==
X-Gm-Message-State: AOAM533d3BFNwXAgGuy+1PZwV1Hxzzpl8HltDGiCC/+ZyIWxQ6YXList
 +7bBBPe9a0Y7UvLn78YDd54=
X-Google-Smtp-Source: ABdhPJyPjI+r/IC2c3zc+IChSKwm5QUQMCYlZvALKxIroBwVeTRmfw0Bpw+jSmhpYMXWRA5G9JM4jA==
X-Received: by 2002:a17:90a:3622:: with SMTP id
 s31mr1298703pjb.222.1590754211066; 
 Fri, 29 May 2020 05:10:11 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:10:10 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:56 +0530
Message-Id: <20200529120703.31145-27-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 26/32] engine:
	check_exhaustive_pattern: Reflect Cast attributes
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
check_exhaustive_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/check_exhaustive_pattern.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/engine/check_exhaustive_pattern.ml b/engine/check_exhaustive_pattern.ml
index 903c32ff..d7785fc7 100644
--- a/engine/check_exhaustive_pattern.ml
+++ b/engine/check_exhaustive_pattern.ml
@@ -123,7 +123,7 @@ let dumb_astcocci_expr = function
  | A.ArrayAccess (ea1, _, ea2, _) -> ()
  | A.RecordAccess (ea, _, ida) -> ()
  | A.RecordPtAccess (ea, _, ida) -> ()
- | A.Cast (_, typa, _, ea) -> ()
+ | A.Cast (_, typa, attra, _, ea) -> ()
  | A.SizeOfExpr (_, ea) -> ()
  | A.SizeOfType (_, _, typa, _) -> ()
  | A.TypeExp (typa) -> ()
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
