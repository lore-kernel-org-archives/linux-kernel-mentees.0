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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337F6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07DE6206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxNc46aO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07DE6206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E553720030;
	Sun, 31 May 2020 15:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRwkCO1adC6l; Sun, 31 May 2020 15:28:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 48E2220425;
	Sun, 31 May 2020 15:28:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35467C0863;
	Sun, 31 May 2020 15:28:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46CEBC0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3692B86B05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgdEA1Wp1Qif
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BF6D386ADD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:04 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y18so1426394plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=obqNGxFsfHrERCBXtTBHwvV1zwpfqul+fXkOGRiP1R4=;
 b=YxNc46aOSu7nfqHQ882OAhGogOqY8qKxndjpe0hUgzV1Dy2Rz32F0u+acJTKp4pyOc
 QaQDLiuRMQj2s0zePXTlIz8UepPtujll/C+uHrU+T7SJaVnzeD1eNIAbzLEw2LfdYTCQ
 nstibB//ib5a14qU3ohO5Qhl64o2QFgQ91E0wT6t0ApHVxq9bDpnL6bv7XHCNUTeakX7
 RH1w1qCokZBuZSrerf1C3EA2MS82vuezbTYEcnVG9n/BF3MJWKbWjWAGJwflz+iDvGfy
 gnbfNibGZLXDRudEmPJlBXDX7V7BWl8gyk0MABM59Le5c4k65Vie8LxjA+gw/PIztHNT
 QbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=obqNGxFsfHrERCBXtTBHwvV1zwpfqul+fXkOGRiP1R4=;
 b=oBdt+qAb++DW36n62vYUD0oMqrqlMT7DuVTU3Ru1RneJkk3tHzCKRr8lG9H6yR17Gk
 OP+Ck+bsfLn+Fc0pC8lSY3PH1bmp7/vqDDTNSyP5ir3hDVErEYjr9lTXck+4zwARO3OW
 B6wECktFR2mbyIJSnZ7Eh+pzwSCIhp57oDqKBP59zs7JskfA4woghT2gcFHxpPwf5QKR
 SKiKJaN2tTiSOLd+oRg2TzVK7RVJhzruPB26nXrfS+ajZqebBSfWdi/kEY1oH8A0EFdJ
 lbjVWpQFnCoWcLB+At2G6gdfYaZ1DY/hRVPxF+WVXeDOvorUcS7adfShujoVD5YCqhbr
 gS9w==
X-Gm-Message-State: AOAM531hGN1tIcqZBZeGKvAqYDwUfjqKX8N9VL9hoPcgXKfP3EsmoheA
 9NVvbtRomkwijeS7bUaDe+0=
X-Google-Smtp-Source: ABdhPJznDS+HNNBCyhjJlQ40vBSqmQrmslTeUYRFYxgO+5r82BKKA3sgQNO5p/CjkUU9Yk/FDc3wdA==
X-Received: by 2002:a17:90a:cb0b:: with SMTP id
 z11mr19293884pjt.58.1590938884324; 
 Sun, 31 May 2020 08:28:04 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:03 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:13 +0530
Message-Id: <20200531152621.2886-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 19/27] parsing_cocci: ast0toast:
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
in ast0toast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/ast0toast.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/ast0toast.ml b/parsing_cocci/ast0toast.ml
index 30e27cc5..cba32af6 100644
--- a/parsing_cocci/ast0toast.ml
+++ b/parsing_cocci/ast0toast.ml
@@ -679,9 +679,10 @@ and declaration d =
 	let ini = initialiser ini in
 	let sem = mcode sem in
 	Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem)
-    | Ast0.TyDecl(ty,sem) ->
+    | Ast0.TyDecl(ty,attr,sem) ->
 	let allminus = check_allminus.VT0.combiner_rec_declaration d in
-	Ast.TyDecl(typeC allminus ty,mcode sem)
+	let attr = List.map mcode attr in
+	Ast.TyDecl(typeC allminus ty,attr,mcode sem)
     | Ast0.Typedef(stg,ty,id,sem) ->
 	let allminus = check_allminus.VT0.combiner_rec_declaration d in
 	let id = typeC allminus id in
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
