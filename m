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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F35C83008
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF43B20757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhnAGeaR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF43B20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C92E87118;
	Tue, 28 Apr 2020 17:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6UDWk3-K+i1; Tue, 28 Apr 2020 17:03:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 21EC38625C;
	Tue, 28 Apr 2020 17:03:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EC70C0864;
	Tue, 28 Apr 2020 17:03:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C76CBC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B469D87118
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEH-W2CKETvY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 179D88625C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:03:16 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 18so9752546pfv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2vjDY6M9kJuWsvQDE56SPl3eiXzk/sM3F8VvOJWJ5o=;
 b=OhnAGeaRr2PjwZ2hnruAV4cb1nbd464BlGzGbPu2Zza8GqQ/X91Xt8k/EBOqmK2Upy
 zkC9KBXX6BAn+3zSsu5SaYSjk53/BOIPI3IfcqgbnZaQTrk+J01hzKa5u9k1pbIrdTE8
 ArdXMF/v9Jaa1HpPqIY/7mKkEvDD+XRC7LU+tJiuy4j+RNw1iOmZUyKkQij+Q7C6/kr6
 Ul0u4hGFL1HlLcelQwYP6uNbPbPv/eCNIGyzJE9H0Bl/FuPhepirV+AsOuBHc013dz3G
 WSBJ8obaL6ZhMxj+b/5PnUVpA5reXa7h7ottwag0GM6S0UPusQ8abTUaUPQGl3cjDRls
 Pxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2vjDY6M9kJuWsvQDE56SPl3eiXzk/sM3F8VvOJWJ5o=;
 b=N7X4OOt+GuQ6JOLOuAApyDDxd/WZmWCU3/3qVU/2qTvuO91UdgmuT5+yPBEJWJCnYu
 9s+g5ryAmRUXQO+iuZOGC65l6jaNpjnmZbfI/VaI3nXsoeUI6Z+syHidNTIiSkB7lZ5j
 eXxgZWKiCRO04Jqr5mLPY/IJusaBK5mCnxdtuJCu5o2zWxq0RWetANX9LPUrVanDWv/7
 sLtUYBpBEwMsi2VJ09bmVT76LCRq+ofJdH6ZWQDiMeTwxhkaZEytHymTL4TqowHhIvYa
 9shcxsgWobLA4UK+Cij7nAC7bTq4JafWwhsRoCb8+ho6U47hILeSHDwMwo9G7VMHTsDe
 C+4g==
X-Gm-Message-State: AGi0PuZ1ql9wNa6kaB88cTUKHxvkaHTq3BcMEz2g4wNQcY+t5CZti4e8
 rmpq086YmteMt7cUETdYVb7udauk4yY=
X-Google-Smtp-Source: APiQypKoCtEpZnOmzraFt+6Lrp0QhjjlvTBvVMtyUxjZIb5Skhybxoa2p6z09JOqvFiit9tv7kodOA==
X-Received: by 2002:a62:5ac2:: with SMTP id
 o185mr30482649pfb.148.1588093395570; 
 Tue, 28 Apr 2020 10:03:15 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:03:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:04 +0530
Message-Id: <20200428170228.7002-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 08/32] parsing_cocci: type_infer:
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
type_infer.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_infer.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/type_infer.ml b/parsing_cocci/type_infer.ml
index e8aad810..2c1cc73b 100644
--- a/parsing_cocci/type_infer.ml
+++ b/parsing_cocci/type_infer.ml
@@ -291,7 +291,7 @@ let rec propagate_types env =
                | Some x ->
                    let ty = Ast0.wrap x in
                    err exp ty "non-structure pointer type in field ref")
-	| Ast0.Cast(lp,ty,rp,exp) -> Some ty
+	| Ast0.Cast(lp,ty,attr,rp,exp) -> Some ty
 	| Ast0.SizeOfExpr(szf,exp) -> Some (Ast0.wrap int_type)
 	| Ast0.SizeOfType(szf,lp,ty,rp) -> Some (Ast0.wrap int_type)
 	| Ast0.TypeExp(ty) -> None
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
