Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C7DC83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:04:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1102620730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzFJgw9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1102620730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07365864D0;
	Tue, 28 Apr 2020 17:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-V85rx0-GnM; Tue, 28 Apr 2020 17:04:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 812F68679B;
	Tue, 28 Apr 2020 17:04:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E935C0864;
	Tue, 28 Apr 2020 17:04:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B181CC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9A5D184415
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUPUtXU7+FBW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AC339875EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:16 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u22so776218plq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4tue06gQmHfFX9AI66O32ZUH/JCMTyGAYTbjMe2OGSw=;
 b=fzFJgw9oW9k7Ah+jojaKm5kxzBfh6nodICFDQ+fW/6jcfZ6ND1JP8h6hpSjIB4wbpC
 AS70FREGzrTNoz3VfApO4vkXmAteaa6QLK5d/4pm+RkIXWU1yXr0cyYoV1IFLeCyJ93F
 TxiHh2XD0rkzQDwuqqa1zew+5Lfmg0PCEIvR4+FGQN/OPS/XyJoteXBlavabwSjwQpWX
 PujqZ4KD1RnRWHU8k5licdg227/XpYZ/dGwU2QRCqdPIO+p5rXsepTHcX0eHLToWMdPu
 5oXNvTUGEsGYaTnpZii7w0PMCZyFHmjHQYcC+VDei/nlRw/i7aCetDNrIHSyTdKipw8d
 /NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4tue06gQmHfFX9AI66O32ZUH/JCMTyGAYTbjMe2OGSw=;
 b=SQjRC4pUI4Hhea0mypyhtAnoR9Dx6fmP31Lo5ZpJ0v7zOj1pKHG0piL0ZhM/wJNoa3
 91ZaLnbA+cW0bV6LXOIGGtQOpjrf3/bTKMOQUsB9oXfu6oiBFilo0PVqgpH2Z1UrL2EM
 68CNo73Gc+xr9lfgzWyTYn3hjsHz2k0uYX9yxgmDlL0gBtxwVfa+rB1Zq2P2efKt+GBZ
 u5oUFecB3qqxWl+LuYtLCAZ1IqZSGH3Ndkug3Cd0/U6VgE7O4gwkEN3KaOwA3U0ujce/
 CEubAnMp6/Ff4Pyc/s+La84tyrylKcHf3DyjUwrhkNNmXgoWsN00zOkYu187NsrNK4sJ
 xWWA==
X-Gm-Message-State: AGi0PuYUs69L1uYYTlPDAywxkXIzcywZSyXPy/xIHH5H30RxZXA2eozY
 TNIq/CQjshQNz2mDvgJCwf4=
X-Google-Smtp-Source: APiQypLGSlggN5yXluqTABwmvQpcUEEOqDrHcvFWpVMmTm8yozpNImc1s0rr4QcrRkS1mZ9h+9yEYQ==
X-Received: by 2002:a17:90a:fb89:: with SMTP id
 cp9mr6164217pjb.40.1588093456221; 
 Tue, 28 Apr 2020 10:04:16 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:04:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:16 +0530
Message-Id: <20200428170228.7002-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 20/32] parsing_c: ast_c: Add Cast
	attributes
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

Add cast attributes to the C AST. This is a list of attributes in the
Cast type of the C AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/ast_c.ml  | 2 +-
 parsing_c/ast_c.mli | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_c/ast_c.ml b/parsing_c/ast_c.ml
index f25f9b55..6a828943 100644
--- a/parsing_c/ast_c.ml
+++ b/parsing_c/ast_c.ml
@@ -343,7 +343,7 @@ and expression = (expressionbis * exp_info ref (* semantic: *)) wrap3
 
   | SizeOfExpr     of expression
   | SizeOfType     of fullType
-  | Cast           of fullType * expression
+  | Cast           of fullType * expression * attribute list
 
   (* gccext: *)
   | StatementExpr of compound wrap (* ( )     new scope *)
diff --git a/parsing_c/ast_c.mli b/parsing_c/ast_c.mli
index 8923a335..8a9a6f66 100644
--- a/parsing_c/ast_c.mli
+++ b/parsing_c/ast_c.mli
@@ -104,7 +104,7 @@ and expressionbis =
   | RecordPtAccess of expression * name
   | SizeOfExpr of expression
   | SizeOfType of fullType
-  | Cast of fullType * expression
+  | Cast of fullType * expression * attribute list
   | StatementExpr of compound wrap
   | Constructor of fullType * initialiser
   | ParenExpr of expression
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
