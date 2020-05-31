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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509D2C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25910206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPcV3klT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25910206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 06BC686B33;
	Sun, 31 May 2020 15:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6uqnjGSMDBz; Sun, 31 May 2020 15:27:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A20186ADD;
	Sun, 31 May 2020 15:27:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A000C0863;
	Sun, 31 May 2020 15:27:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3162C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D05DD87E46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GQF+WRQNgtA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7A4ED87E3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:48 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t16so3211518plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wESlDUXuHBg14Mcr12cBcG8rr8tsnmhzigRKGJW73pc=;
 b=nPcV3klTi2ct5LnQ3C7a3X3BMa2qmeAx1P7Z1gsu/EkgbMAbRU+A1mwZErODvoYuyu
 ApPveX8lxF0GVxy5RZen649AOwqlCrkCrr7c99x5U8CN8PZMWj4hXRlqnKGQBLu1g59H
 lyFYDDORmuJPUBXcgzyNqr8VH591yb2Mc4wyHSrrlRLUby1FHJfp7Be3HfB6k7hqsCRy
 +YaAlxZF4zCiYhDrpUxGhJvCbZXpvFQrI9hu9MhJJSXpIMFchwNpIFjMut/6pm6U2HjC
 B0mt1CGFZHfdSQ1YzXYvo7xNsetAbv9KOEhWcxRexSo+KLfUB/NmIftWA4SsObM1LszB
 i6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wESlDUXuHBg14Mcr12cBcG8rr8tsnmhzigRKGJW73pc=;
 b=aX7q04HOlj3KklCODcbU7dPJiBAYxKQnN1MPYlPLhgboOJ6XJVa1siV83VNpP7iJm5
 klcPsCMvosx/jHHBaCzOwyr8DQzogb/UEPm4KsZYJ5rxOo6xjbbqOtiv+LOuKUZe04Zz
 F3gkt1TbjiPLqFOxEW35Gw0SGlz5O3erZ5wCoz048xjpPNf6Jd4Py76y1CbqC2lBaaL+
 qiJWU/46eE8VzKH22atrIxqQnK3a0PcJhr3H7so2vD2+8ZmgAZkceTmjWiKNYxUdQ/Wy
 Eo0pqCsIj9peGymbLfFN+Q6tudPmi3buP3cfEsJrWig8c9BAuYpnOH22mXlIGKbLz1D5
 8oUw==
X-Gm-Message-State: AOAM533aN5JO3DczlgNbDwwUcBfbJ5wFqB0JjHvAZDCyxg6oaFC2Hzl5
 UmHmcwIYUDMN30fiBfCvV8A=
X-Google-Smtp-Source: ABdhPJzmgEZCoim+kBwdVjprXZA9b5QUu1MZsXJXvkwvKfnInx6006ChDvUR8HWSXrmnUfmpHMVJDQ==
X-Received: by 2002:a17:902:bb85:: with SMTP id
 m5mr14293924pls.23.1590938868063; 
 Sun, 31 May 2020 08:27:48 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:47 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:08 +0530
Message-Id: <20200531152621.2886-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 14/27] parsing_cocci: visitor_ast:
	Visit struct end attributes
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

Struct end attributes are added to the SmPL AST. Visit these changes in
the AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index faadfbb9..8129bcda 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -490,10 +490,11 @@ let combiner bind option_default
 	  let lini = initialiser ini in
 	  let lsem = string_mcode sem in
 	  multibind [lstg; lname; llp; largs; lrp; leq; lini; lsem]
-      | Ast.TyDecl(ty,sem) ->
+      | Ast.TyDecl(ty,attr,sem) ->
 	  let lty = fullType ty in
+	  let lattr = multibind (List.map string_mcode attr) in
 	  let lsem = string_mcode sem in
-	  bind lty lsem
+	  multibind [lty; lattr; lsem]
       | Ast.Typedef(stg,ty,id,sem) ->
 	  let lstg = string_mcode stg in
 	  let lty = fullType ty in
@@ -1448,10 +1449,11 @@ let rebuilder
 	    let lini = initialiser ini in
 	    let lsem = string_mcode sem in
 	    Ast.MacroDeclInit(lstg, lname, llp, largs, lrp, leq, lini, lsem)
-	| Ast.TyDecl(ty,sem) ->
+	| Ast.TyDecl(ty,attr,sem) ->
 	    let lty = fullType ty in
+	    let lattr = List.map string_mcode attr in
 	    let lsem = string_mcode sem in
-	    Ast.TyDecl(lty, lsem)
+	    Ast.TyDecl(lty, lattr, lsem)
 	| Ast.Typedef(stg,ty,id,sem) ->
 	    let lstg = string_mcode stg in
 	    let lty = fullType ty in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
