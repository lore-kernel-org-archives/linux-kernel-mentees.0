Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96E1C55194
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:20:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B079F20728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oS2wCle9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B079F20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 97C5424BFC;
	Fri, 24 Apr 2020 09:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1Lx67yeRzJf; Fri, 24 Apr 2020 09:20:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 282A424C93;
	Fri, 24 Apr 2020 09:20:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23E16C089E;
	Fri, 24 Apr 2020 09:20:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EB35C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 89A4B887DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tfX-SvgZHuzO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:20:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 892A6887CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:20:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c21so2708679plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iL12afvc8E+4S7BFOl5ZbAwj/mn8D1h40NLooKUmeGU=;
 b=oS2wCle9Es28t0G/GMwjhIPSvDOInw9z7ReW7oSae07JHHEFoDyNjGTyK28Cf9Mtrk
 oOLYjVL904Ft3uFcBlOdRAOEt5waeKRCybbQbCcA1Ak+0774GlSFuGXI8Tzoxs2Dq762
 HgsGJuJN8Vppu0nhcEwPgmxNbHYM9Z/RB7S62t24H6f4RV+8m7+DNEEScM4qiPnZj4OP
 4rRR5tJ4BeXEdgF1voiDVQ8yMxcWq0j8uisHChlisPScBaFCnhzI3bVSMm6nK8JM2hVg
 dRNN7nLWCODS0gwMFftL701AYhfUeFSUhTad4uWVWrN2AqXQFE0SZfZYBS9/tlSkxecd
 syjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iL12afvc8E+4S7BFOl5ZbAwj/mn8D1h40NLooKUmeGU=;
 b=OfKqDlBXQnIyOoJJ/GzbHWeNM4TIgjBpJuU71WPfZyV3xls6xsrF35aYYvjOpJs8Hb
 o9XdjC3HQMA5h6qgGjyY6xtIW5jVwauCq3MtHoy+hHcODOj/tM4cOGyBRlNSqOv88cOX
 ULtM+WTbRS3Xby+jsDjILsvffKe/QBXZywb/XvhYOgdyFurAe3Er0GcwF2YTm2Cox9Mi
 PnPX7MFE7zogdb7lzEdXgQJqUnxw97fNj6Xrjg5EtI3KqIhTJxsDguEb7pkqL6cjIZ5P
 +3ZgNxvPDunCzASY9+ZNED5WNGsClov6/tB1QWQp/Zs8Wp+KDVTPygOfLc5qiduHkZQL
 GWbg==
X-Gm-Message-State: AGi0Pua5NJ3npmeidQ1HmUcnIxV+muaONQFlBz1ADWYxzikQS6AAzABV
 uZ/rIZgIEhTe9teEn69EY+Q=
X-Google-Smtp-Source: APiQypJU4cwD96oP6iDF5aUJ3DTvmMp5wiGoiuBLDLquMCidYs2SbgMVGRW1t0XGPfCbcVbZCA21og==
X-Received: by 2002:a17:902:b685:: with SMTP id
 c5mr8622192pls.323.1587720003037; 
 Fri, 24 Apr 2020 02:20:03 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:20:02 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:48:01 +0530
Message-Id: <20200424091801.13871-26-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 25/25] engine: c_vs_c: Match
	parameter attributes
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

Parameter attributes are added to the C AST. Add an expression to check
if attributes are equal on both sides to the parameter case in c_vs_c.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 engine/c_vs_c.ml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/engine/c_vs_c.ml b/engine/c_vs_c.ml
index e2bd7408..b569c244 100644
--- a/engine/c_vs_c.ml
+++ b/engine/c_vs_c.ml
@@ -135,9 +135,11 @@ and typeC tya tyb =
           let iix = iia in
           acc >>= (fun xs ->
 
-            let {p_register = (ba,iiba); p_namei = saopt; p_type = ta} =
+            let {p_register = (ba,iiba); p_namei = saopt; p_type = ta;
+                 p_attr = attrsa} =
               parama in
-            let {p_register = (bb,iibb); p_namei = sbopt; p_type = tb} =
+            let {p_register = (bb,iibb); p_namei = sbopt; p_type = tb;
+                 p_attr = attrsb} =
               paramb in
 
             let bx = ba in
@@ -145,13 +147,15 @@ and typeC tya tyb =
 
             let sxopt = saopt in
 
+            let attrsx = attrsa in
 
             (* todo?  iso on name or argument ? *)
-            (ba = bb && same_s saopt sbopt) >&&>
+            (ba = bb && same_s saopt sbopt && attrsa = attrsb) >&&>
             fullType ta tb >>= (fun tx ->
               let paramx = { p_register = (bx, iibx);
                              p_namei = sxopt;
-                             p_type = tx; } in
+                             p_type = tx;
+                             p_attr = attrsx; } in
               return ((paramx,iix)::xs)
             )
           )
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
