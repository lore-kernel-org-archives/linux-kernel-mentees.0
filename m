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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D774C5519C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D94F20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7yHica3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D94F20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E4C7120134;
	Mon, 27 Apr 2020 12:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffGm8CE7V115; Mon, 27 Apr 2020 12:09:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 231572011B;
	Mon, 27 Apr 2020 12:09:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D87BC1D74;
	Mon, 27 Apr 2020 12:09:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C868C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9051F8142F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PtohmoXr7fZ5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B9CEE805B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:08:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t11so8614421pgg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoZoSm0QiODt/4J+FuqA6+ZZi5LG3HLcOc7upKu+yJM=;
 b=R7yHica3shohf+92In4pjcI74a4GfMNHDik0wVV3cB42MPo/RE1K3KhhsbDQS8ZC9m
 PdQdoIL1wt2VT0/mCHnzjsmBPCGhTwu4CV0ajPIPlc2rqci4e5r9eyR5ML9YdFKjXRWY
 qtS6818TfXmknxu1JmyyXOqhjJ9ouKZ7t57ALkDxYG5xrOGWJ3KVJs+A/9/gMgRMJGLx
 HFOf9GQkxzfZtncFpVL8D5B2AEo0Gc7Vh1ousSwShJX7+4gGbNt3pRCJWZUPK2EmHD67
 4eYLm2jPG+DoepASTCix2K0M/Yu7upUddso3wep2iBqMal2/vCHMhtGF9WS6t6JiM680
 lT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoZoSm0QiODt/4J+FuqA6+ZZi5LG3HLcOc7upKu+yJM=;
 b=ba+hUFbpiVnClqqFifyiSrEyJ7QsfhhKetRThuVjj/s7zIGub+Kg6zu05EfrqpyOFG
 L2J1LlWHNQhc2YAtdi5DTrJND2HrD8QE79ve7G/4h1xUZFONjZZZpgJ4B6cNrNrKRj27
 At7n6lc1gkfXswtQygSa0fqNt4WojZxiK6DN/Tr6YDYv8+WOfoKlgpS70vOVIK60QacG
 EeZbLSlyrV4yjSC7yiU0luR3WVjQXceOup4psgdVof5UBqJHx7aPiNb2I7l96xcZHSt2
 8bJJ2L6/Mg7o/EpPTnIOt9Gqe5W0gmXk7+SEY73R0mSc4TGZRDrfZCaPh8AiiFDbSCeW
 YKmQ==
X-Gm-Message-State: AGi0PubH/A9SRCP/+VnUEIpmVJ0xhWhSOPPDMpwUIeBI2J64tO4D8i0Z
 wGqMjlx6nB4rY3uD1xjxSRk=
X-Google-Smtp-Source: APiQypIwXevV7IoRsnLu8OBV28oCnIRiQ2xXzPupX+CQDkmAlP3Bvc2kQx+rlURw+FWjonzH6Dan4w==
X-Received: by 2002:a63:e441:: with SMTP id i1mr22073345pgk.285.1587989334326; 
 Mon, 27 Apr 2020 05:08:54 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:08:53 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:13 +0530
Message-Id: <20200427120834.380-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 02/23] parsing_cocci: parser: Parse
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

Parameter attributes are added to the SmPL AST. Parse these attributes
correctly in the SmPL parser. The added production only supports
attributes after the type or the type and identifier.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/parser_cocci_menhir.mly | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/parser_cocci_menhir.mly b/parsing_cocci/parser_cocci_menhir.mly
index db5661bd..fe4ef322 100644
--- a/parsing_cocci/parser_cocci_menhir.mly
+++ b/parsing_cocci/parser_cocci_menhir.mly
@@ -1541,9 +1541,10 @@ storage:
        | s=Tregister    { P.clt2mcode Ast.Register s }
        | s=Textern      { P.clt2mcode Ast.Extern s }
 
-decl: t=ctype d=direct_declarator(disj_ident)
-	{ let (i,fn) = d in Ast0.wrap(Ast0.Param(fn t, Some i)) }
-    | t=ctype { (*verify in FunDecl*) Ast0.wrap(Ast0.Param(t, None)) }
+decl: t=ctype d=direct_declarator(disj_ident) ar=attr_list
+	{ let (i,fn) = d in Ast0.wrap(Ast0.Param(fn t, Some i, ar)) }
+    | t=ctype ar=attr_list
+        { (*verify in FunDecl*) Ast0.wrap(Ast0.Param(t, None, ar)) }
     | TMetaParam
 	{ let (nm,cstr,pure,clt) = $1 in
 	Ast0.wrap(Ast0.MetaParam(P.clt2mcode nm clt,cstr,pure)) }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
