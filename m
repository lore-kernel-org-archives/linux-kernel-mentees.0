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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9E6C47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E1B20731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdKEpAvj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6E1B20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7843D86169;
	Mon, 11 May 2020 10:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6XEg4j28Q4P; Mon, 11 May 2020 10:13:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5919D85D40;
	Mon, 11 May 2020 10:13:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 492F9C0176;
	Mon, 11 May 2020 10:13:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF868C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9E55024C10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBe0sdvavnb6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 3456024B6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:13:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r10so3862446pgv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZyzlIWNwdkp9Rh6rKkpnyNaMorCGqrIfrYY1rTdq+DE=;
 b=GdKEpAvjvlQ4UG+ptorIXw5vHIPchGzNBE0ldIEykqUvnxCcVgUebw15TS2o8a2cix
 X8aShB3pEwv6jrU/q8eZ6upkDOZ+cHQSbud0RtUptjKpN4Ah3tMZfoNOCsl26N6nwL7S
 X9f7tsfr0iRPw36Dfrkwi6vEKPrhwXAuSCLyu94EgiLMmdRo+cHrMqIL4VpUGGLUXf77
 KfQVI/7KA9jFNWPBQu48yGE46LRasiRjvS37tsl2ora2RSuCwzABxCL9VDi1BznogJZl
 UmhOH33c1gMImB+0PSLum4CK0SWYIuA+UgDnFRJgZP+340nOy/3fXNGJ+2JMmqsmkBZv
 r3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZyzlIWNwdkp9Rh6rKkpnyNaMorCGqrIfrYY1rTdq+DE=;
 b=KjivfYdbtZA3Thtnj+BcPuoQ6h9B592Y2qNhhVGQg2T8l/xxWNNG6nG29TT1brD8SN
 CpE9r8Z6E3ial3yq1J1H6Vl53JO7h6hkWOf5NrN2dkiELXsYU6HvVPj8OIBubMLXolV5
 SRs7fAzeDqvBd2s/l+i7vXvokt5ZPiNBd8o4BUMllb8iicj/wgEBrBJ01KaaLdZdShFO
 uwuJRpTAy5MLAYcnWJxGQo/IHdWByNvDuEb7VA7RWXg99UgRo3P9NZICi5lwhfYGrI/l
 3w9TgZM4TURhkP9ZI+7xwxe6afIpOQRZg8tUnkflASTMyR0WvPBSHXHL8jZzCJ2svNHH
 zQXQ==
X-Gm-Message-State: AGi0PubMUFj/nvS1u4A6rCEPIoLgHA2cOAuz6HFBUrG9e1JNwVACFKFF
 MYlii1pIMItfpE4Ijf1nrVY=
X-Google-Smtp-Source: APiQypI/UgKcbKFrc9Xamq6WcE5y8eDdT8C77XPHs4ufeyMWzfHV2o63kwOTxAFSvbJ8smcdz1w1XA==
X-Received: by 2002:a63:6543:: with SMTP id z64mr14200468pgb.260.1589192022774; 
 Mon, 11 May 2020 03:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:13:42 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:44 +0530
Message-Id: <20200511101300.11101-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 07/23] parsing_cocci: context_neg:
	Reflect Parameter attributes
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

Parameter attributes are added to the SmPL AST. Reflect these changes in
context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index dd768a61..98b96ac5 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -466,9 +466,11 @@ let classify is_minus all_marked table code =
   let param r k e =
     compute_result Ast0.param e
       (match Ast0.unwrap e with
-	Ast0.Param(ty,Some id) ->
+	Ast0.Param(ty,Some id,attr) ->
 	  (* needed for the same reason as in the Init and UnInit cases *)
-	  bind (r.VT0.combiner_rec_typeC ty) (r.VT0.combiner_rec_ident id)
+	  bind (r.VT0.combiner_rec_typeC ty)
+           (bind (r.VT0.combiner_rec_ident id)
+              (List.fold_right bind (List.map mcode attr) option_default))
       |	_ -> k e) in
 
   let typeC r k e =
@@ -839,8 +841,8 @@ let equal_initialiser i1 i2 =
 
 let equal_parameterTypeDef p1 p2 =
   match (Ast0.unwrap p1,Ast0.unwrap p2) with
-    (Ast0.VoidParam(_),Ast0.VoidParam(_)) -> true
-  | (Ast0.Param(_,_),Ast0.Param(_,_)) -> true
+    (Ast0.VoidParam(_,_),Ast0.VoidParam(_,_)) -> true
+  | (Ast0.Param(_,_,_),Ast0.Param(_,_,_)) -> true
   | (Ast0.MetaParam(name1,_,_),Ast0.MetaParam(name2,_,_))
   | (Ast0.MetaParamList(name1,_,_,_),Ast0.MetaParamList(name2,_,_,_)) ->
       equal_mcode name1 name2
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
