Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C55CC4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D326820774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMC26n8A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D326820774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B58DC87479;
	Fri, 20 Mar 2020 07:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0p0ThWiGHMV; Fri, 20 Mar 2020 07:02:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6BE4587347;
	Fri, 20 Mar 2020 07:02:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65946C089E;
	Fri, 20 Mar 2020 07:02:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA61AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C999D273EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQrwownQFQQR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 6BD3222854
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d17so2039694pgo.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZmo0/Lb0Y8z14Hq9S6by+eeq93LQdEyR+kcPvQctng=;
 b=dMC26n8AsGyheA7HF1Kuoh/6tGyn4oZO5iK7bt8PHc2AfJJxZ+2WZwCPZwSXHG3/ZS
 8E2aauMRkIsuFpVQ9JXMJCWbAWQg2OvJLHnvXNN7QdyHqkfsFCbCtbjiQP9CMHzmtu6O
 WpwjB1+uG6Vvi1kDmzZjLdB7eF4FAYRg/vQxkdKgFY3/dg9gxSYUVmbsL6al55+6RwXj
 DJRsEiaHR4c2KTB9Vc+qL2g0P7aOXDLtVl2U9yH+IwhlTz8mTF8VPfyQ3LLcScm2sV01
 TyWSoArNBBoTP7OkjQE021KaXXS0vo1uEVkEP9eCrEmAx6AoT28Lfvw3LgXYSn+QSezw
 Qofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZmo0/Lb0Y8z14Hq9S6by+eeq93LQdEyR+kcPvQctng=;
 b=J7/k9lifcNpsT6BRwL86LZ03yZPGlNAmPjqtOL6AckljrTRDBf7iJQ/6FbzY+jF5/R
 5AGt8+HsOPZuh4R0uHVfWEL9gunnDD1nBZJsRH43mLYXhIxJFri6DNJaQA+50Dh2TVBo
 FQQC1q27qZgmYg+gdyeqfS09EcOI0RvpDn1pNNyhVy/9N7WVDiFjkqntl/sZBzzU2qX4
 tCZBPtKx7fgZGwPMedTg5PtmZ2ukL/TBmtodSLe/L8Rnv9r3BbWeH+H1hJsq58oRXKuV
 9FsN9AgAFUHf+P70RcEdo8JGR4/ILLzGQ8jOYh2IuLUg3ANnIkPNWQJhepCUrpnT08if
 CF/A==
X-Gm-Message-State: ANhLgQ1zGJlBT9/e1z/KsCLeDDSvdvAUPJY5JScuh5oKw/eME77c/zSJ
 2oB2JGqOxdIgJaG7LyeZikU=
X-Google-Smtp-Source: ADFU+vtjA+wHlLooR9LSnBtZr5nOOPzdwxefStc1MH/1OUoLhEsd2kLu6wmHWCB5X+a+cHzNHZMM+g==
X-Received: by 2002:a63:ce0a:: with SMTP id y10mr6997582pgf.44.1584687769011; 
 Fri, 20 Mar 2020 00:02:49 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:48 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:41 +0530
Message-Id: <20200320070157.4206-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 10/26] parsing_cocci:
	single_statement: Add cases for ParenType/FunctionType
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

ParenType/FunctionType are now types in the SmPL ASTs. Add
cases for these types in single_statement.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/single_statement.ml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/parsing_cocci/single_statement.ml b/parsing_cocci/single_statement.ml
index 46408b73..2bd4c202 100644
--- a/parsing_cocci/single_statement.ml
+++ b/parsing_cocci/single_statement.ml
@@ -166,6 +166,8 @@ and left_typeC t =
   | Ast0.Signed(sgn,ty) -> modif_before_mcode sgn
   | Ast0.Pointer(ty,star) -> left_typeC ty
   | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) -> left_typeC ty
+  | Ast0.ParenType(lp,ty,rp) -> modif_before_mcode lp
+  | Ast0.FunctionType(ty,lp,params,rp) -> left_typeC ty
   | Ast0.Array(ty,lb,size,rb) -> left_typeC ty
   | Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) ->
       modif_before_mcode dec
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
