Return-Path: <SRS0=beAO=7G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CDCC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F8B7206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 May 2020 17:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lN1JFHjX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F8B7206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC57F866F2;
	Sun, 24 May 2020 17:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8BL2ek4Tktxh; Sun, 24 May 2020 17:21:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7742E86670;
	Sun, 24 May 2020 17:21:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65FDFC0178;
	Sun, 24 May 2020 17:21:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 222DCC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 11E9286670
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKE_019t1PYu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BFB8E8666C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 17:21:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x10so6622698plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 May 2020 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=os3s+iiu3kRUhEBpBGoWTbPu1B0JO7uZ2SeONoSREVg=;
 b=lN1JFHjXy6Z2Xn9NgQNwCSGkqzi3SZU1f3l4aB/NxvM7JHO+hJPskAXo10NiyleEou
 ZDiuQflg7lQoWDj4gzg9YX8KBdO6n7FxgAQ2OZsiBVKFJKmaRzcLtob8xcI6ee+tVI0X
 U+bxWkS8wx4aggXGxgKF3FKsMA26FuAZSjImEYQCBDb2FPMAA1B6xPsT4Qixt7uZZwGj
 GzLqX24fVWMKnmwbEOe3rtu12eJjmLHdYYq3ph7dFWapVX6arpsSmZds6LCi04VhFPJt
 iw+p8fuWPM5wQsbEQuRcjPaAfITwxcKq+pz7IVfxAwLmFU7aisG6+I4Pym9b/ED+e86z
 +WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=os3s+iiu3kRUhEBpBGoWTbPu1B0JO7uZ2SeONoSREVg=;
 b=pKTIuCSH9tse9lKMeVX4vDqVcHRnBcDYLKljcuATJOfKC27ZP1pYuStRlv11v3gLqV
 lS0cSsO71t4bL0vsDHptjTyW1SCANTtoVNs7B0xsd64DMlseRH0cKVPFR1YiQujyLOFP
 ToQRH4aa9f5k6h+ZzX6SmkZ8XtGl4tP14wyUaPtwfbhoQ6XU+gwt9xE95zBhU5SoqAma
 RPFU+GlIIKeJ/j3vrRhx7TmHR7VPkMpAsoLt5uWRjqB8/wuogOPPbIs2fZpi5rLAQu9X
 WiHRcyOFDxIxV6l49KPRLO6Atp9ldyQFT7jkwek4QU1oiouxNMS/Pd1WYf+MpMWWST9h
 xQyA==
X-Gm-Message-State: AOAM532mKWwmn7uhrXwbyDCH7L4Iwejsuo/90WeEWoo1OxV+ZhAURdUC
 ytuCDG69U1GmaOYznjmwQwU=
X-Google-Smtp-Source: ABdhPJyT7AmwQVVJMt44XvefjBQQvprCe+glU2wY4o9ENb4QyI+bO2vj48Bmvw1Y/Jewy7ZCLSco3g==
X-Received: by 2002:a17:90a:7ace:: with SMTP id
 b14mr14598962pjl.116.1590340881350; 
 Sun, 24 May 2020 10:21:21 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:20 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:21 +0530
Message-Id: <20200524171935.2504-17-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 16/30] parsing_cocci: disjdistr:
	Reflect Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
disjdistr.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/disjdistr.ml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/disjdistr.ml b/parsing_cocci/disjdistr.ml
index 6724bb25..8a42743a 100644
--- a/parsing_cocci/disjdistr.ml
+++ b/parsing_cocci/disjdistr.ml
@@ -342,10 +342,10 @@ and disjdecl d =
       disjmult2 (disjmult disjfninfo fninfo) (disjident name)
 	(fun fninfo name ->
 	  Ast.rewrap d (Ast.FunProto(fninfo,name,lp1,params,va,rp1,sem)))
-  | Ast.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
       disjmult2 (disjident name) (disjdots disjexp args)
 	(fun name args ->
-	  Ast.rewrap d (Ast.MacroDecl(stg,name,lp,args,rp,sem)))
+	  Ast.rewrap d (Ast.MacroDecl(stg,name,lp,args,rp,attr,sem)))
   | Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
       disjmult3 (disjident name) (disjdots disjexp args) (disjini ini)
 	(fun name args ini ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
