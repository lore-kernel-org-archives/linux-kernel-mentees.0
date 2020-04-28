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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D79C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E19320757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciAxJqGa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E19320757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3C7F286505;
	Tue, 28 Apr 2020 17:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id woubuuemUQEu; Tue, 28 Apr 2020 17:03:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78AD2864C3;
	Tue, 28 Apr 2020 17:03:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67A3BC0864;
	Tue, 28 Apr 2020 17:03:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 193AAC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0D5E722668
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwZNsi7oRUBj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 7EE6F20464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:24 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id t40so1424053pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ya/wxKSqb2SwN0YcwXa6DDweA8dU0H84ms/FmoW8w/8=;
 b=ciAxJqGap2Gfw4XqoDGw8Xm0xjnvvpr2TkfRyuj4k9co9w+iGCesptcDlY0AA530Hd
 uzHNEqGUG8t6afjjjWMJS2bVFY+tM2fb2vcfvmeWbPrUCyXbPMsphIoug17tjuqxYtzZ
 tMhiIX9F7eUBRkyJFWNvLVEzwYb9ImZ3RF2OxETQtLYtLaVXZ8Mb/vK7p37zA0wJdxng
 o4rZvZHBIyz6SZXMwHv4AxDavOHjLr2Q0Jp8oVhu6Py3bq0KP01WR9ii4Q40RKZEF7XU
 FB4kEwdmmouQC+d2JwSRt0y49AAFWMbKqHHV37GjCdwB3ZL9wwwiUNbxBpbekdZkescb
 VqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ya/wxKSqb2SwN0YcwXa6DDweA8dU0H84ms/FmoW8w/8=;
 b=hbQ5tIRud83UQidGuMMVvbseNLvfEvhRCmU+ux0OF0NmxNW081Lo1YL6SSs9WHUfAN
 njD4TPwRucnYQcW0ytmgVzqbY6WYmSN+6UAeqFyyQm0vEc/1qFC8FbPoQwoWbkIhft/t
 7pjTHuukgQWkhUOSU6lJcRQwUmHLN6wLTw/iW5EZIyqEyR6THpQoK47jePtbjcq9PspL
 eFl2TpF+uVINvth81UORjI8jSYekIK14eVL53W5k2BsRG8CEo0/DQhCovJIiaKx8scCR
 j9ey+NM2KUZc/d2pAoiW9exvNx3avyCseRL6gNvQp+ftvMaxZ2PDbT5shMBcPjSiwzHA
 Xu3w==
X-Gm-Message-State: AGi0PuapfDTwlj51cxi1e/xUFU5TduJfCOHG0iyY2F8LARoXXqjqAq0K
 2S1lS9MZcxDxRObg8c3AZmiikC+oP9Y=
X-Google-Smtp-Source: APiQypLo2JcMy/Df4oIXcS76rGPjFRgY7+gbrmqvWvmjSjSkNSpA8jShc+CZQwcNUuf2gvgy75enbA==
X-Received: by 2002:a17:902:b097:: with SMTP id
 p23mr29727841plr.263.1588093404032; 
 Tue, 28 Apr 2020 10:03:24 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:22 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:06 +0530
Message-Id: <20200428170228.7002-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/32] parsing_cocci: check_meta:
	Reflect Cast attributes
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
check_meta.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/check_meta.ml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/check_meta.ml b/parsing_cocci/check_meta.ml
index 5a348ba3..4f7db813 100644
--- a/parsing_cocci/check_meta.ml
+++ b/parsing_cocci/check_meta.ml
@@ -172,7 +172,8 @@ let rec expression context old_metas table minus e =
   | Ast0.RecordPtAccess(exp,ar,field) ->
       expression ID old_metas table minus exp;
       ident FIELD old_metas table minus field
-  | Ast0.Cast(lp,ty,rp,exp) ->
+  | Ast0.Cast(lp,ty,attr,rp,exp) ->
+      (* No meta attribute yet *)
       typeC old_metas table minus ty; expression ID old_metas table minus exp
   | Ast0.SizeOfExpr(szf,exp) -> expression ID old_metas table minus exp
   | Ast0.SizeOfType(szf,lp,ty,rp) -> typeC old_metas table minus ty
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
