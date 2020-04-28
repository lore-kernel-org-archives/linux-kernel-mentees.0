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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC31FC83001
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:04:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A18D720730
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWs+T5Nk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A18D720730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7F30420372;
	Tue, 28 Apr 2020 17:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4plo1ntn2ELj; Tue, 28 Apr 2020 17:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C46EA22846;
	Tue, 28 Apr 2020 17:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0E42C0889;
	Tue, 28 Apr 2020 17:04:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AEAAC0864
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4AB2C864EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XM6BqtgjNrDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4B77C8651C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:32 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id n24so8613628plp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOnyLzO8txfwyXdMk5xZdnI9RRWzBI9eFOCxN8utaI8=;
 b=PWs+T5NkLLr9kvjHBiwf4JR9a/hk1A0LWsmipHoRZKTugbxUAYtp+49K28Qs/sXcoq
 WgH1U5V2ryiLvnU/rNGKXlGbFSQwsPVTZyhCJbtYqjCmIyx5raBcTPcmMlwPtUlUUsRA
 O3EgdAL08eq7VcjiCyZe87j9cf7B/D6YLBs4qj1KPyl/6GAitMQRrZrLKwa12sdYazCd
 EosseqWqJngZd2VB0BAEg6V4IDAVQa+Thlqbw7hJB0ZaQOkgB0Q0i92J8yq/50DGCrBF
 +u47nUM9+sOYMETJY/cITiMRABXCvDcF1piEqwpxmTpL9yRkWONk0y6BT+TB0l2g/50v
 cRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOnyLzO8txfwyXdMk5xZdnI9RRWzBI9eFOCxN8utaI8=;
 b=K2WcJkCvlVY4ww3+rhLg4oltKg7TXTpzRpiS/E+6u2FuF4TSuQpcs+k7Aqso7tTT9B
 6KplQliSzb46qD2eo54fNRfz/0vkuvSd4GQmkm8gun58JYJFhsozDjAJjuHD0IFx+UWU
 5S277nTbBS/zXrU/xA6PJFn5FHTJQOR+GyXSFSZTKSVVI0rwkowq6kOdSHv6s1YlYECU
 LFpnB9tb8jjFhDHejjTYBEiy6JxvRCFr6FGaGkANepkPpzr0QfIF/Zeeq36iSp9QaCPx
 suvDD7+Ys5oEPOEY0kQMRx7+C2Mb0RaZ9gM0k7uZQ837hEFbbf//l/Zh0kH9M8IM/vzg
 YbQA==
X-Gm-Message-State: AGi0PuZPJgGmM3dtWHhoYK0qtjTuxaaBJX9OYmpVEeEQnWxJn63BvDbg
 8SnVwGE2z2zvYC5idbykiY9iCIpkjHM=
X-Google-Smtp-Source: APiQypIQrFkcoKmIGiA5COLWgRpZU2Mr3OhLi3XqZaHDISWSQm0BuG4dLWksHKZhcby5M5BWBF27uw==
X-Received: by 2002:a17:90a:7486:: with SMTP id
 p6mr6315890pjk.62.1588093471888; 
 Tue, 28 Apr 2020 10:04:31 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:04:31 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:18 +0530
Message-Id: <20200428170228.7002-23-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 22/32] parsing_c: pretty_print_c:
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
index 99a7e0ed..96a11d72 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -146,8 +146,9 @@ let mk_pretty_printers
 	pp_expression e
     | SizeOfType  (t),     [i1;i2;i3] ->
         pr_elem i1; pr_elem i2; pp_type t; pr_elem i3
-    | Cast    (t, e),      [i1;i2] ->
-        pr_elem i1; pp_type t; pr_elem i2; pp_expression e
+    | Cast    (t, e, a),      [i1;i2] ->
+        pr_elem i1; pp_type t; pr_elem i2; pp_expression e;
+        a +> pp_attributes pr_elem pr_space
 
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
