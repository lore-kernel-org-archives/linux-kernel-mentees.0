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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370FDC4332D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A32D20774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2lJQU/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A32D20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD779880D2;
	Fri, 20 Mar 2020 07:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGWLcrMXrpyf; Fri, 20 Mar 2020 07:03:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B0CEC86B53;
	Fri, 20 Mar 2020 07:03:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98C56C089E;
	Fri, 20 Mar 2020 07:03:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF4CBC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D817387432
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CjupsZxSsqZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8A1CF87347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t16so2101745plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z5Vt+kSyi/RcHyrlEg6BWuNNcdeP5nA5wISFF/Yfsqg=;
 b=h2lJQU/7zdLelLAlaIhLie2WVLu/GMSm4rRKI3ihS1JY1coGc9AJtojAAidzc+7J0w
 K8zWJPfJ0kLDIM6YIj49T6okXJaH6PmeLyduVw3JaqI5asAsjZxNiM5ZovQb2lGxHHx3
 bHtz1sC0CHDJNN3WiB3FKSDJ7PvSqKv7rU83/OuKwlf3ulUq/mpAEYy3ddmMPV8TUjpd
 SIe/14uVN3A05JreGDQ368qEiVVQda8X8X4e7xR5idJS0yZCsA241a/HeB7ct93gzzAF
 HlKnqLT1xNL4mZys9K4QnXkJYVrTo/MqfTEIiXdYJnOL9KPYMC0uCrGeApFMoYTD8lM2
 W6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z5Vt+kSyi/RcHyrlEg6BWuNNcdeP5nA5wISFF/Yfsqg=;
 b=byW9OjXMcb8bSYW4+eG9REadUvRZmdwW32NqemSszBQ+4icFI8HmN/fL2mKpnLgJiW
 m70NQZSoRTieuh1nNRRrBebRBQDFlByt29+JBHf7Ywou2pO+AfHFA/PztnpeN/AGiGGn
 ZxNLiJzBfCovREQGfLowPy/dztJJg1gCfXX/tv9iPU1xq+pT7b+dgQuzlIqyYIUcVJnc
 dgM1dsyny3yqF5h1y0eHiaiiz18GWpyaW6KQpkdfF+3dMdkqOONTiOhI4X9kRtdasmlH
 FyMLZS4AMN/M1F1CnkxoOEuhH90FhIrRjku6dlLX8v0g/E3drZzB36cx9EjN4wRgr41l
 tEhQ==
X-Gm-Message-State: ANhLgQ0ndO2QHT5sgpIrh3dCTjh7JqsQU11CMDdi1clyypvBts7MMNHs
 YXWzm3f53F9S+STMM3fhUGc=
X-Google-Smtp-Source: ADFU+vs9TTpFwFx/UTpzNrZoB+dOEhTvl/ynDB9FoEBmqaoYiyu2Pj7STIPvU8t4kWO6ugNb/uAfyg==
X-Received: by 2002:a17:902:b901:: with SMTP id
 bf1mr6998147plb.133.1584687801016; 
 Fri, 20 Mar 2020 00:03:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:20 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:49 +0530
Message-Id: <20200320070157.4206-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 18/26] parsing_cocci: unify_ast:
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
cases for these types in unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unify_ast.ml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index d4ad3030..de86b1d3 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -336,6 +336,14 @@ and unify_typeC t1 t2 =
 	 unify_fullType tya tyb &&
 	 unify_dots unify_parameterTypeDef pdots paramsa paramsb
        else false
+  | (Ast.ParenType(lpa,tya,rpa),Ast.ParenType(lpb,tyb,rpb)) ->
+      unify_fullType tya tyb && unify_mcode lpa lpb && unify_mcode rpa rpb
+  | (Ast.FunctionType(tya,lpa,paramsa,rpa),
+     Ast.FunctionType(tyb,lpb,paramsb,rpb)) ->
+      unify_fullType tya tyb &&
+      unify_mcode lpa lpb &&
+      unify_dots unify_parameterTypeDef pdots paramsa paramsb &&
+      unify_mcode rpa rpb
   | (Ast.Array(ty1,lb1,e1,rb1),Ast.Array(ty2,lb2,e2,rb2)) ->
       unify_fullType ty1 ty2 && unify_option unify_expression e1 e2
   | (Ast.Decimal(dec1,lp1,len1,comma1,prec_opt1,rp1),
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
