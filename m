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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58BEC47255
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC4120720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8O5CTm5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBC4120720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8666624A2C;
	Mon, 11 May 2020 10:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PW2l2j0yO6N0; Mon, 11 May 2020 10:09:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC6E32050E;
	Mon, 11 May 2020 10:09:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB861C0176;
	Mon, 11 May 2020 10:09:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8A8AC0890
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C83BB24B59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIOqsrMNJh8w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id BD1892050E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:03 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g11so507342plp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tn9edAsW1urCa0RXAKnfsOWITWdzvvWWDpT5zU7AZJA=;
 b=g8O5CTm5oAUlHGo1vUcdXS97l40z3DmnqGVu45l9YeUbp3hmz1CKayQeje+Ps4KFdZ
 YGfwaSPzsrt3gsVpF6pzwlZWktrEQcGlD78hiOBlIC7AWbOhNExn20JOahnC6ySkmqG0
 s4C33VzAWz4xbOrw8PmWJVWGd1X4Gc/WgXJFSPro9g3zomJ9X6cVgolDYasTB44d002n
 yZcBPjLdPpAWZNU4zyMaDjwN8M3SOELf109lV7urjo9+G1nWPZyFNX4343gc/bySbqOw
 vGsnmuXE7eSPwk71KM+7x+vD+hiagA6H3FIxM/SZxrd6XX22yvQsBn0ydfVB1joq41tn
 g7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tn9edAsW1urCa0RXAKnfsOWITWdzvvWWDpT5zU7AZJA=;
 b=Idf3VwlDLrw6sbeq/bv6cW60KcANQKugoINrVRwqim5JEihE6dLCBuWELinIc1KcD2
 02pj0H/oNtmGT5voM/9B3bEPNDFA1LTCgzqt5XFYoe19ByuytLAU5ZJhdOJOVfnHRHdj
 KnrgrvLoOKaNrs6Ec6SUUIgw5wl/yVudk97EMUkMnFDHsaZVsfE5kz9dwWqLhsWbycwN
 j7y30Qd7HZVx9V0H6a6Bv84ru1ktzNt0JM9Rs7n9Ca387ZnRcYcUxlQMi5tZidhwzH2q
 80mATn6mSGzNoDFtgL+/KlyiJC5iUOgcNXC/s2nWWpNRIsDPuUhgqoKSpMLeH09JZ+Q8
 QQgA==
X-Gm-Message-State: AGi0PuaH/GNPFW27E+A94cShglS7QEyni5KwqQcAwHo26ZwOf+DFDl6b
 acxU5NFaeBABmoaKKBhYFWw=
X-Google-Smtp-Source: APiQypIpkKwC38Q+YSAON//qf+kPnCwjI6WyDSmpJR2uqaWE4dtH7tZsYWZkK5DNiEg9IPSdYp3wSw==
X-Received: by 2002:a17:90a:d312:: with SMTP id
 p18mr20612736pju.200.1589191743346; 
 Mon, 11 May 2020 03:09:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:02 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:05 +0530
Message-Id: <20200511100715.19819-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 22/32] parsing_c: pretty_print_c:
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

Cast attributes are added to the SmPL AST. Print these attributes in
pretty_print_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/pretty_print_c.ml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
index 99a7e0ed..6e9a418e 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -146,8 +146,9 @@ let mk_pretty_printers
 	pp_expression e
     | SizeOfType  (t),     [i1;i2;i3] ->
         pr_elem i1; pr_elem i2; pp_type t; pr_elem i3
-    | Cast    (t, e),      [i1;i2] ->
-        pr_elem i1; pp_type t; pr_elem i2; pp_expression e
+    | Cast    (t, a, e),   [i1;i2] ->
+        pr_elem i1; pp_type t; a +> pp_attributes pr_elem pr_space;
+        pr_elem i2; pp_expression e;
 
     | StatementExpr (statxs, [ii1;ii2]),  [i1;i2] ->
         pr_elem i1;
@@ -184,7 +185,7 @@ let mk_pretty_printers
     | CondExpr (_,_,_) | Sequence (_,_) | Assignment (_,_,_)
     | Postfix (_,_) | Infix (_,_) | Unary (_,_) | Binary (_,_,_)
     | ArrayAccess (_,_) | RecordAccess (_,_) | RecordPtAccess (_,_)
-    | SizeOfExpr (_) | SizeOfType (_) | Cast (_,_)
+    | SizeOfExpr (_) | SizeOfType (_) | Cast (_,_,_)
     | StatementExpr (_) | Constructor _
     | ParenExpr (_) | New (_) | Delete (_,_)
     | Defined (_)),_ -> raise (Impossible 95)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
