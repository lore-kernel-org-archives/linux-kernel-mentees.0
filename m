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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1437C7C8A1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 966B820656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qilYU/Dk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 966B820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 79E2D86566;
	Mon, 27 Apr 2020 12:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hj93GgpG2-IS; Mon, 27 Apr 2020 12:09:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DECEC82067;
	Mon, 27 Apr 2020 12:09:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE929C1D74;
	Mon, 27 Apr 2020 12:09:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85B76C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6D4232156B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmVQ0V0Cw6C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id D47102011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:49 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d24so6922781pll.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxQ5yleQGOYivsLqM0BuUraugLRpcVwNM1GXoeWyL5U=;
 b=qilYU/Dkw12TQZlxoUFznMw9AZDcCHfHfsWIrQOiDrRSuiq8hQN/ZQL+zPYpPRajAc
 1Diwc3iqROFJBaN3u+60/kcRjhTxRogjd/63hCCtvMlzYkvkI0I/UwolABbkq2Hr0ydM
 RqOjg1mdPgt/nAnhsaLGDhgUsvC5LdvAzOug/ocDbvf2CzrBRjFFVjaU4CA4qY75Zgnp
 N9w4lbEfNk9d+gBKqqDupoGc07wFFfHIi3dkXTDXXVM/v5onbXArks493oMXeyjB2jYG
 c3D0BUu0W8lQBF8UhakGsdyki1z+nExsZYSyP2VYRwwyxk0tlXxNvcaL45I7V39TUYb/
 GJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxQ5yleQGOYivsLqM0BuUraugLRpcVwNM1GXoeWyL5U=;
 b=XmoHNPZgqG/+MHwWPTL3XYexNtbkHJx9QQsFzt9fxeOtCa/ZtKGj3oXn84Ewj3SncV
 8ZPsfCx7BJsVWqYPl5i+SLUXwef//ceLkIs8sy7cnHexUmJdTDNkJj8bPm/SK6a+UWVz
 LjR4wxpKgLEJPKL5NWfsFfYMSIknlCCR9rYvSwuUxB4GvRseHKj5zykz2JQ2x4C11en0
 EmLAnf6oLw/LfCfxkpMe5+AeYEM7/MFnAexcoYl/BE6XKbqvv6TtsmmL0O7LCx19NyAU
 vRZwHrNzMX5sAfe1Eg/3RdOmMNvveErcAQ0aQ4JrWAVAlpESEEkeYPmYZmYECdT9YJ2k
 ViBw==
X-Gm-Message-State: AGi0PuaWzpaTw4cxbp2qGdGoSSreW7sldwADKk3ERMdCmXQ14Zxu2kEP
 4Wj3jsNjVif7djT3i4f77GU=
X-Google-Smtp-Source: APiQypLb3W7WuPxWyKvEaTMtBT9ebuXNb3xvimxfUAzf3PqgLnuNBJ764u/+/XDTWifJWy6uSFBFFQ==
X-Received: by 2002:a17:902:b58a:: with SMTP id
 a10mr23398184pls.129.1587989389300; 
 Mon, 27 Apr 2020 05:09:49 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:47 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:26 +0530
Message-Id: <20200427120834.380-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 15/23] parsing_cocci: visitor_ast:
	Visit Parameter attributes
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

Parameter attributes are added to the SmPL AST. Visit these attributes in
the AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 8e530114..f1e78d8c 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -621,9 +621,18 @@ let combiner bind option_default
   and parameterTypeDef p =
     let k p =
       match Ast.unwrap p with
-	Ast.VoidParam(ty) -> fullType ty
-      | Ast.Param(ty,Some id) -> named_type ty id
-      | Ast.Param(ty,None) -> fullType ty
+	Ast.VoidParam(ty,attr) ->
+          let lty = fullType ty in
+	  let lattr = multibind (List.map string_mcode attr) in
+          bind lty lattr
+      | Ast.Param(ty,Some id,attr) ->
+          let lid = named_type ty id in
+	  let lattr = multibind (List.map string_mcode attr) in
+          bind lid lattr
+      | Ast.Param(ty,None,attr) ->
+          let lty = fullType ty in
+	  let lattr = multibind (List.map string_mcode attr) in
+          bind lty lattr
       | Ast.MetaParam(name,_,_,_) -> meta_mcode name
       | Ast.MetaParamList(name,_,_,_,_) -> meta_mcode name
       |	Ast.AsParam(p,asexp) ->
@@ -1582,8 +1591,11 @@ let rebuilder
     let k p =
       Ast.rewrap p
 	(match Ast.unwrap p with
-	  Ast.VoidParam(ty) -> Ast.VoidParam(fullType ty)
-	| Ast.Param(ty,id) -> Ast.Param(fullType ty, get_option ident id)
+	  Ast.VoidParam(ty,attr) ->
+            Ast.VoidParam(fullType ty,List.map string_mcode attr)
+	| Ast.Param(ty,id,attr) ->
+            Ast.Param
+              (fullType ty, get_option ident id,List.map string_mcode attr)
 	| Ast.MetaParam(name,constraints,keep,inherited) ->
 	    Ast.MetaParam(meta_mcode name,constraints,keep,inherited)
 	| Ast.MetaParamList(name,lenname_inh,constraints,keep,inherited) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
