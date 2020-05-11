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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B29C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D93320720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYE8YFmQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D93320720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0252186169;
	Mon, 11 May 2020 10:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NV3djOH0csI7; Mon, 11 May 2020 10:13:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F8CB85D40;
	Mon, 11 May 2020 10:13:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E84EC0176;
	Mon, 11 May 2020 10:13:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1CEFC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AC30424B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zu2lC-XmIxvK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 3BA9820358
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:26 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id fu13so7551098pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoZoSm0QiODt/4J+FuqA6+ZZi5LG3HLcOc7upKu+yJM=;
 b=cYE8YFmQ6IDPFzfo1kFv2uiAJ0RKuDf+NMfBaB8rZOQtuE0vBTuulZ7EJha4OW1LSE
 dsEKjyilml+HhGP3reEJjnDtSG8xXXzNy6Q01gVkNU/giP4DXTunuqPSVeJa9DVHaC0R
 F5+JWAp7X6IAAq3M+Ka7sJ34SMNunhK1d5ykfV4GVbEXEppJerkm04WzI/f2k/l73et/
 eHVJamPKyWmJ//9taKqwShUNIlN5FeJLmrCPrlRTOCqpcjxEnXHun/XORZVmYbsjxHxZ
 X9hzRkr5YA50e36gFLJ4npA5Rlk+hHdfFEQ3RuX0fwY4k2qIiVcvBpI284SFhShZN5kS
 wGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoZoSm0QiODt/4J+FuqA6+ZZi5LG3HLcOc7upKu+yJM=;
 b=Sn5sMT9qUkpfL8imm+27FEflPY4I0BR25kQi0ONqG0zcLXe+G+tHKQL+8muj1fsO8b
 asgBnnQOYyaV9jmiGOFJBbt2v7ZHwYoSnUvMJcTTiC/vbXO8myj6DEXwXvdUp9xN6LLF
 dw9looSdaXnYMe8U55rQpWlQ+MAa9za3jmXxw8TcShuQmW3V1YwdJAf2kH0l6zlZX6j3
 EH6l62bXB0pmoqqeBES2/eXlVTx+OlkefBZFP0ioJN1a35QcG3j9MXpAblcIjR7jksy4
 KKGl9k3qkYQ1a1EGY/BXE/H5Xmdr6+GrNowU9FsWb2Ei5f9q9EPcuGx/i3PIOOcgnRhG
 STPQ==
X-Gm-Message-State: AGi0PuYGG8M18A5LOa6zakcs2YPWSEyD6oXDI8ANY/c1MJPcqsPGXGQc
 S+8G3Bo/5EAWNWIOST/XqWE=
X-Google-Smtp-Source: APiQypK5Yi5Ac8AkWi22B/7AAR5vBfiFx5OM0TadenrlfR7I5M4UEo0Mz9L67sjxk3A1RK3s7MrDxA==
X-Received: by 2002:a17:902:778a:: with SMTP id
 o10mr13930114pll.76.1589192005779; 
 Mon, 11 May 2020 03:13:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:25 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:39 +0530
Message-Id: <20200511101300.11101-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 02/23] parsing_cocci: parser:
	Parse Parameter attributes
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
