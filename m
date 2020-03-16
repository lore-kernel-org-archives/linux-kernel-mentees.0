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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2EBC0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE642051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkPjBvPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE642051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3D18854E0;
	Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUFKq52iZYp0; Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 61FE587009;
	Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 508D2C013E;
	Mon, 16 Mar 2020 10:04:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D75BC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4818729168
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cYrWn5zvXjxF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id A38BD29434
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:19 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d25so1641728pfn.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xD9df8bv9wIYUBatbkENn7i6mJZ18F2Xo6z3HsOAU7Q=;
 b=rkPjBvPMbZCSTDjFv0Jgl6CGcnV0+GzWoZPTBlYoZroCMPFR3FMd8jPi845jVF4YIw
 QGlL9LOvpxRuJapA9E15dgxxiIDOXRYZHVCijs3YqjnilmFgVHZVchHQqPnr5Bwo0c9M
 9LLG1rKH9epCk0RNKxJ+HnbJvmAjSLbKcsNvbzOAgH1y0hQ7yENPTUN7y/wXHguI4+Ow
 e/HFYMXKGgeudZbdm+pGDcNgoPrBwutojJqH1Ht3hoOBUq6eGtehPwREnS5iwq/CpCnO
 4UayFMi5otNdag3m0MgOIxLUZFcCaTO0yTONExArOGM8nsfIf0tt9XRmJAYomJPdbhF0
 VYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xD9df8bv9wIYUBatbkENn7i6mJZ18F2Xo6z3HsOAU7Q=;
 b=AAsBFdEgE/SSQkjnVhID9e00DTGpEK+WJef8QKQQr2S9rHXwZCtv6gmiYXZyBc7X0T
 NJM08JCFL3xBFNH2E4VL07TfKFS6Kz6q3pNLH3tY7aojVGcVAU2YWVzqNZ8w58xoR5uz
 unF06viD7dpxN/B8dFMg2UtpzIitRwcW38e8TpNJDh+dkq56giKaJ6JKscVUOlOgVAQ+
 b9X6SevlhjP2mJGtR+cnp6QYs34xmX4fKr2X9gy4n6NnHXPWBlvOhq5iJuwXrTU57rf0
 ylFz2tAXecPD7cvXOopwoXlgVK8GfUjxJ39bZ3YA4cMRDqSKZLiyw84VgZ87w4lvFYCm
 DjEQ==
X-Gm-Message-State: ANhLgQ1/LhAziJbD5SJKQ28eXchGIEgOx/QFaG7sTb43OtKvJY1GkY5M
 oxUfmKbEEXWEBp91DdrARMs=
X-Google-Smtp-Source: ADFU+vuM52W17+/747GrdB4L+PSxYqj2/8Miydnbr4IaPTKx1SWZPHMSF1nj9LbYR0xGMMJx6i4Z7Q==
X-Received: by 2002:a62:31c3:: with SMTP id x186mr15929273pfx.5.1584353059227; 
 Mon, 16 Mar 2020 03:04:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:07 +0530
Message-Id: <20200316100319.27935-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 14/26] parsing_cocci: adjust_pragmas:
	Add cases for ParenType/FunctionType
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
cases for these types in adjust_pragmas.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/adjust_pragmas.ml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_cocci/adjust_pragmas.ml b/parsing_cocci/adjust_pragmas.ml
index 73b5ff5f..537150e7 100644
--- a/parsing_cocci/adjust_pragmas.ml
+++ b/parsing_cocci/adjust_pragmas.ml
@@ -171,6 +171,10 @@ let rec left_ty t =
   | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) ->
       call_right left_ty ty t
 	(function ty -> Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2))
+  | Ast0.ParenType(lp,ty,rp) ->
+      call_right left_ty ty t (function ty -> Ast0.ParenType(lp,ty,rp))
+  | Ast0.FunctionType(ty,lp,params,rp) ->
+      call_right left_ty ty t (function ty -> Ast0.FunctionType(ty,lp,params,rp))
   | Ast0.Array(ty,lb,size,rb) ->
       call_right left_ty ty t (function ty -> Ast0.Array(ty,lb,size,rb))
   | Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
