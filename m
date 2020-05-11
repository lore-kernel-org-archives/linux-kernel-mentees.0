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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5F4C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22F7520731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8qND20r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22F7520731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9A61869EA;
	Mon, 11 May 2020 10:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmkjcUGzkdeP; Mon, 11 May 2020 10:08:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D25486990;
	Mon, 11 May 2020 10:08:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C04FC0178;
	Mon, 11 May 2020 10:08:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58006C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 549B987880
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptRJ1RU1Togc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EBFB087865
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:21 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b8so4332145pgi.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1Jx1GCzpkJYz5KJHR+2EEkLhsdfIdOz4vT4XJi1p5g=;
 b=K8qND20raiDMYWGc9hBPhjLeMzCbSDyiEEk9gJhUvl7mHhsSlvw9pwfm5u97EooNKP
 WwJSLtlDOJUQaQ6uYjU1kDhH2m6QVk8ukw+k7clMmpBqaszPgefX88ndlEplHSWp6wsp
 zc/wF6ypIY+sAVizVh263uzN2iMoA5tH4xecb/H370F5ZnbPFoz9dRRu2nxMloXFdu4J
 INoSnIYkczx7SqiVfpI8yHumUgxjizUYnGEXVM3PJ4B7BWx2rBiznfxOw7+8TFdN7Ivl
 eCB/k9mK2ojIJaF65FqVCLY5usIcxo0QQDUrZR+cPR19eMVF6lDcd1iVc/V8JSy4J8fI
 Vs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1Jx1GCzpkJYz5KJHR+2EEkLhsdfIdOz4vT4XJi1p5g=;
 b=G7L6xEp64jGWzqHJx4ITg2c/ETX0UiFIorKbmf49zBwO4Xz0e1ltgg3OjNJaLWqnMD
 BoW+kmjSB18id/rZRD3BhwZMqGBpVZ0++bqT9BqB+tCBT01YlgavRURxmfkBcUaLTgGT
 Mu7xVB1P4/xmE+i+kD8JC8i+FlFUYEvvFCC1EreknTn/QJxxsWZKJnyTYc2mgnaELQr1
 vHT7Ukn7A8RJQy90JuQ4U9mb8SLRaCTymZDCqQh7UdukC7J7/2XTkMAZBzD1DD08JyEP
 svwxJblH5KkjLixFKvExRYItYZ4ERVSqFNHy6fsaoEW/+fsikUZoyiBNg+zl5WgpygGQ
 zyDg==
X-Gm-Message-State: AGi0PuZLe2xEe6x9FAIBpWP7t2EEPmp9gT0yonBQCSRFgm+X0WJw0UFw
 Ttcuce+UJ8nHiQMQCvDGlGo=
X-Google-Smtp-Source: APiQypIX6LNikNIHjT12JuagNMMKefabWKB2cK0FpcIhrHij65JzP4EIrHjs/SWLXwOJk/2su8+Lew==
X-Received: by 2002:a62:7c51:: with SMTP id x78mr14782655pfc.227.1589191701520; 
 Mon, 11 May 2020 03:08:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:21 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:55 +0530
Message-Id: <20200511100715.19819-13-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 12/32] parsing_cocci: context_neg:
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
context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index dd768a61..b6378512 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -628,7 +628,7 @@ let rec equal_expression e1 e2 =
       equal_mcode pt1 pt2
   | (Ast0.RecordPtAccess(_,ar1,_),Ast0.RecordPtAccess(_,ar2,_)) ->
       equal_mcode ar1 ar2
-  | (Ast0.Cast(lp1,_,rp1,_),Ast0.Cast(lp2,_,rp2,_)) ->
+  | (Ast0.Cast(lp1,_,_,rp1,_),Ast0.Cast(lp2,_,_,rp2,_)) ->
       equal_mcode lp1 lp2 && equal_mcode rp1 rp2
   | (Ast0.SizeOfExpr(szf1,_),Ast0.SizeOfExpr(szf2,_)) ->
       equal_mcode szf1 szf2
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
