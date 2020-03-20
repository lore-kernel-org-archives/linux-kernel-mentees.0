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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87211C4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5911820774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNtvkkkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5911820774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CD9B880D2;
	Fri, 20 Mar 2020 07:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qK68YK2-sWuD; Fri, 20 Mar 2020 07:02:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0D51880B4;
	Fri, 20 Mar 2020 07:02:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C03DDC089E;
	Fri, 20 Mar 2020 07:02:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D635C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B7FD273EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cw91X14egp2s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 4BDF122854
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:39 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id ng8so2065737pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQGeOzvnAIMku75Z9zFKDRA+EXjMqvMkGVQ8piZaXTg=;
 b=iNtvkkkVTcDBgb8JhLocMXsLi6t20/MgRkvW3jjIWALIOo29/TKy808hvJo2L/hvJD
 MedI50cdtLq6uOwBsisC9rKu+4VaXpN57pKVefowQ1DxUe//ocqBTFbCy7nqXOyk1BY6
 RChcIRm9iADEz56fucYxRklFB71YEAD0PPMBVKsdUyEzJbCcrBTeU1kTQm3NQAKONgT4
 uBhMLxDze32uFJB9j5xQ+2SpcfFcvObKA1/B11ZegTtCmuee+9Ix02QJaU9XKHlUb7NR
 KkLHdKWwCaB/P8STIfgha75LaTdW/ssiHiHnvwbCjr71bfqJo6s6ecMUdZ8ihgG5hyG7
 u6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQGeOzvnAIMku75Z9zFKDRA+EXjMqvMkGVQ8piZaXTg=;
 b=CLkVGt85nvJIhzDhFHAKDsEjto+XMIre70aRaxWP4ZXtl8zjtVPYOzKFNy8sm2OGfK
 nbbE+OPRRJrTCI3Dh7z50qP7eWErL+IJ62FWH+EH20yVY6/iWO7tGoAaoJUu+/7rB8mf
 y9jW5hQvr9Cw95q+JdN3hsoyyVVsW70tcxEuVgObO+QMAoBkiasTZ8WELVjw7dwEzVHf
 93OnElKUg+UZa697kJgx5BZ1ursd3276nrLnAXUBrWZDwh3ncFK3w3oJnk3xNF7rcHZc
 CTkruyc4XYLUusZfN/sH2OG8TQtz4i7TDHU0k4ZFYIBIqdoTVd8sFU2o7VhcZuV6Mw1k
 C8BA==
X-Gm-Message-State: ANhLgQ1vZ/eB3rZ2IFBdSJPLAAH4RIWoCv6er3xp8Eq9/9b7DApkrYMr
 I/S2o+WFBfWtKNc77CKea5I=
X-Google-Smtp-Source: ADFU+vs0KEZnqXI1yyXlbd2jE9Z48PzPMo1R6X3cVRPlQc/xfVdMvo7qe912yZCxs9xdTBvOYjTegQ==
X-Received: by 2002:a17:90b:8f:: with SMTP id
 bb15mr7226221pjb.186.1584687758764; 
 Fri, 20 Mar 2020 00:02:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:38 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:38 +0530
Message-Id: <20200320070157.4206-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 07/26] parsing_cocci: index: Add
	cases for ParenType/FunctionType
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
cases for these types in index.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/index.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index a1103503..088db18a 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -6,7 +6,7 @@
 
 (* create an index for each constructor *)
 (* current max is 188, also unused: 8-9, 15, 39, 40, 42, 46, 57, 65, 85-86,
- 113-115, 138-140, 162 *)
+ 113-115, 140, 162 *)
 
 (* doesn't really work - requires that identical terms with no token
 subterms (eg dots) not appear on the same line *)
@@ -93,6 +93,8 @@ let typeC t =
   | Ast0.Signed(sign,ty) -> [129]
   | Ast0.Pointer(ty,star) -> [49]
   | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) -> [131]
+  | Ast0.ParenType(lp,ty,rp) -> [138]
+  | Ast0.FunctionType(ty,lp,params,rp) -> [139]
   | Ast0.Array(ty,lb,size,rb) -> [50]
   | Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) -> [160]
   | Ast0.EnumName(kind,name) -> [146]
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
