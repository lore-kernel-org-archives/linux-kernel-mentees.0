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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6117EC4332E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B8920774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhMRFCVt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B8920774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D49F87483;
	Fri, 20 Mar 2020 07:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKZnohtvuOWi; Fri, 20 Mar 2020 07:03:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D48F087479;
	Fri, 20 Mar 2020 07:03:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C14E9C089E;
	Fri, 20 Mar 2020 07:03:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29836C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1812387D86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZOqF-vl3+30
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9A4D8873E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:24 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 37so2590238pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dqkv3oqMwtTa6d0C2gk8rkkDFXuoowFPaClNAY6dKVA=;
 b=fhMRFCVtgW5WofbO8MhxOTJFbhWyCfqPBSFUIK0Wt3RkU7mC9lCkS5pIaxoUwfJZL9
 jp2riFRfFtvxu2Qmr0ZWS7ue/qSptOkqluvKLhg0Ey1rXFafmdRmm5Rz5a5bZxi+5qzE
 6J9ctkFjk9ydTMxVmzQU34dOwo1tNwc3rIY6toVE1ybPFrY04Jukl7Qq03uR19u2zJhJ
 AltNckXN/pAcuuUTB9IPGcO9kTkqEnE84gDiABmQn82rk+BWqzZ0qoi1UlSEixzuC0Lb
 NCACSxFFsy1qcUkmeEGGZYrneqezdJmVcCQUbyxVEKyNDTTE0jDq7Ip84R6AHk6551Qh
 sUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqkv3oqMwtTa6d0C2gk8rkkDFXuoowFPaClNAY6dKVA=;
 b=Xr9qpxMpZtpEbO2KyKZYV6tXf26WnJIRvEX23VF+j9ot7iH5t8YOZCdMtgeIoZkkqJ
 eQm95QAKEcKuPMrGhBGsgE7aWmZ1oibRAHkM60BfrWz+90kKM2twGrfKQjtBrraEY/y3
 f2fpX7YDgWGwRbvGhCMthcW/PVvBPj46LSbUV7+ylRp4Cd0zvPoWt3/AHjnU1EjEG7Aq
 DVMe6MRewrHW+1hzpg//CG/iwpGElwTogUx1cZPtaCMmapcy7JKLMa8k8xgn+WPPVPuV
 v6Y5ZtU/5VkMvw+D8ddJh+gb20Sh/eRAC5Bb+VUo2QJ+gws9JHg/lZ18GOTCFiNnbfDn
 QY0Q==
X-Gm-Message-State: ANhLgQ2iiX5iGUgoC2oZQY8WGHAeG77c9Zk+BmBvjO/lBIWl7kSwrq53
 /02PHS/POFusPOwGBhrLbWOgtSLq
X-Google-Smtp-Source: ADFU+vuC53C/Ph5T5zHAYKVBl0U8l7AyPfXjl5hf9M+58LIRtpd+DowwtNLTOiWSZz2S6soqRp1gVg==
X-Received: by 2002:a62:4ed1:: with SMTP id c200mr8076751pfb.207.1584687804156; 
 Fri, 20 Mar 2020 00:03:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:23 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:50 +0530
Message-Id: <20200320070157.4206-20-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 19/26] parsing_cocci: disjdistr:
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
