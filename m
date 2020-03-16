Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698D0C5ACD7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D20C2051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a06Pyq2O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D20C2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E48989033;
	Mon, 16 Mar 2020 10:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZpSQtFwugnO; Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A60ED89071;
	Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9338AC1D7C;
	Mon, 16 Mar 2020 10:04:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 675DEC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C4BC291A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSXrBPCT7YZk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id A6419274B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 2so9628343pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dqkv3oqMwtTa6d0C2gk8rkkDFXuoowFPaClNAY6dKVA=;
 b=a06Pyq2Ojb7wEsGm91//1BvYSdvaZSgtgA98Pgkgv6vQSfwtmyyMdiFcupEjBi92W0
 piY2Tc3qXthxI/VTaBSp0iIQvpyxA07lgjSKDfgL1PKJmVkAoCqvIaUdB/xbjbk8YJAq
 u9imwvMu+0uTIYnH31boT1mRVPWtbSn/zmXSf2j5U9z0mgCRn8e0aRrRKDvsQ25J4l6/
 mhlRXpp9vGz3WWQJctokd3qfjxCyXdPVKm1jqYN4kAJv0DFU9z0X/VwnPTtzZ0eqGcto
 /kjzSxB9h4ZTK4On29kN7bEx+m+vujihAwFxEf84OH2NWgC/LpVqVY5HVkIx+qV1SkYM
 NtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqkv3oqMwtTa6d0C2gk8rkkDFXuoowFPaClNAY6dKVA=;
 b=h6b7s8vQ7tfnTi5Kr1nHEjhapOrG5Wm3dCMvQSJsf666EVhvPIB58EulCwhetFCDJL
 SIxi2BfnzIqEwHKzql1gGILwLyutbG8vdnw1Ax3K4+biTwKg0QV69yRHiy/K5zWnjUZE
 kgPrNA4bh0PV6+v1wrfshPkXltPgKUUIhT1gPZt1TEwsdu9vCzvtKYzZbnF+HVHA7LdY
 FU+nMp38CpaVh8BiX078W8Y5xogc27k4tIBAOUmiABH4FWIuCeQb5riLb5O6e27uJOTu
 DF7h7b8A6RMeysxwAPxqopzZBd9ntwqFiSjtq7dapkZZOzaDg+e3zAKVwidV1vai0fbU
 +9KQ==
X-Gm-Message-State: ANhLgQ36OTTgNPYT6lDdYR/L5dZ1J8DB9F5EO+Jm+KQDjOtjb3ywcgOd
 So0EX3ZrTGhUI3NST0oCuOE=
X-Google-Smtp-Source: ADFU+vuNSGvnN+XiyxhDBk0Y1sCD9fMNs/PcYnfwmBm7gAZ4+5uhfaKAuLrTXNqCTU6N3HIbs9pJDw==
X-Received: by 2002:a65:4081:: with SMTP id t1mr3387890pgp.134.1584353079205; 
 Mon, 16 Mar 2020 03:04:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:38 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:12 +0530
Message-Id: <20200316100319.27935-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 19/26] parsing_cocci: disjdistr: Add
	cases for ParenType/FunctionType
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

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in disjdistr.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/disjdistr.ml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/parsing_cocci/disjdistr.ml b/parsing_cocci/disjdistr.ml
index 668a8810..91d7f1b8 100644
--- a/parsing_cocci/disjdistr.ml
+++ b/parsing_cocci/disjdistr.ml
@@ -73,6 +73,16 @@ and disjtypeC bty =
 	(function ty ->
 	  Ast.rewrap bty (Ast.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2)))
 	ty
+  | Ast.ParenType(lp,ty,rp) ->
+      let ty = disjty ty in
+      List.map
+        (function ty ->
+          Ast.rewrap bty (Ast.ParenType(lp,ty,rp))) ty
+  | Ast.FunctionType(ty,lp,params,rp) ->
+      let ty = disjty ty in
+      List.map
+        (function ty ->
+          Ast.rewrap bty (Ast.FunctionType(ty,lp,params,rp))) ty
   | Ast.Array(ty,lb,size,rb) ->
       disjmult2 (disjty ty) (disjoption disjexp size)
 	(function ty -> function size ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
