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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF3DC54E8E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482FB20720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjgMzA/R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482FB20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C7268745C;
	Mon, 11 May 2020 10:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 290N0ZcSL3oq; Mon, 11 May 2020 10:08:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D364786E3A;
	Mon, 11 May 2020 10:08:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3302C0178;
	Mon, 11 May 2020 10:08:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2C70C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BFE1A86925
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqyViE_MFnOO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6D2AF85C05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:59 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w65so4517248pfc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1+jQvFfCERdvlbrN50zvK3j7kjY87WUidq4SpOe7Ai4=;
 b=bjgMzA/RK7LgstBkIfT3MaYCw7K1EW5u+hfBiBBLKVOBs5evicIVY0V5L6rr/DkD5b
 JYORsB2fHY4KdOP/zT7wCGU5+Y0Qyrd77K+a73WhM2g5Dt27oT5FNkUUy4z+h5FpI0oe
 HrQgAuDBdNc6z6aw+nFGxBbSGUFcHTIdJ1vmRXQex5mu3UhEg0Uu1gmQLcMUL+MUnWKU
 65mjMC36YxSBfWUi/Ql/ZBjR68cqw3W+csmNsizQFmty26iewvSx201KMxgkSZQW62pR
 t4rbnYWusWjWnobw4bqPUYuISB0OZv41vjIIljX+hkleatoCKV/WFjwb3OWa/UhtabQq
 D71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+jQvFfCERdvlbrN50zvK3j7kjY87WUidq4SpOe7Ai4=;
 b=edEvgMLv/Z5sM2zXim/RGf7C0133d3ZEpsFDiynpkRVlXsnj+n9J85GZ2dGeuBQTsK
 51HVoKkhHuXqRaoU845hJmx2fTjPG4pF510ciwnPoTRt56M/QCVtBhbDi3G8He8JYVcA
 uxNbs4HORNFxXFwbNivk7rNjqS7ZBWE8c5M4JIu/elM2aAPd33g+96G9rJxaUgTDzQiq
 WP5UWy4TNDJX2mJY12hr/md4vFTPb8R6PkmeAa3NFq578CEiDyfxOtMH24V2VVZ2Rq49
 KKyppWd8Wd+Wf8WVnZF6BP+BfFwDm8OhoAnHjxk96tYamMhLJvlQwAdETsdVpdeDnMxd
 xrBw==
X-Gm-Message-State: AGi0PuawCgTxiWICG4db2LvetfjbJlsHV3Pk7/LRGt8tvtfXnX/R2/N1
 3cwtwpK5uiFdxlYfFqkAB8E=
X-Google-Smtp-Source: APiQypKG+yzHImovqpGgz0UsdW7B8LkY/Ld1xRv+Qk0Szuk7kxhwBm8nmOsl3J6e/SIKedaCkhkSaQ==
X-Received: by 2002:a62:2544:: with SMTP id l65mr15615321pfl.288.1589191679055; 
 Mon, 11 May 2020 03:07:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:07:58 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:49 +0530
Message-Id: <20200511100715.19819-7-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 06/32] parsing_cocci: index:
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
index.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/index.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index f7ae48b4..a3b92c12 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -61,7 +61,7 @@ let expression e =
   | Ast0.ArrayAccess(exp1,lb,exp2,rb) -> [27]
   | Ast0.RecordAccess(exp,pt,field) -> [28]
   | Ast0.RecordPtAccess(exp,ar,field) -> [29]
-  | Ast0.Cast(lp,ty,rp,exp) -> [30]
+  | Ast0.Cast(lp,ty,attr,rp,exp) -> [30]
   | Ast0.SizeOfExpr(szf,exp) -> [98] (* added after *)
   | Ast0.SizeOfType(szf,lp,ty,rp) -> [99] (* added after *)
   | Ast0.TypeExp(ty) -> [123] (* added after *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
