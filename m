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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4735DC4332B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E09020774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awbKKoa+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E09020774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F20978667B;
	Fri, 20 Mar 2020 07:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7UIkEaHsveF; Fri, 20 Mar 2020 07:02:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F0B285A83;
	Fri, 20 Mar 2020 07:02:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B379C089E;
	Fri, 20 Mar 2020 07:02:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B1C8C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A02727431
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nT+7K9xzXJ1J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by silver.osuosl.org (Postfix) with ESMTPS id 35869273EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:02:54 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id z65so2746314pfz.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e0faUHZFhKqlJpCf1OkmBJeKUysMgYHHIjGAG+ug/PI=;
 b=awbKKoa+omDznONMTYpqWv0/VO5zH4rI/mo259qE7xtnXSvRL8xCLyNSTrtG0VR+U7
 9aeLalOhlKpTalglEHcTnNGL8N3MKwu0gSp2gjkXhRCIwjNj/4yoh1AZfSRFXdw1dI1N
 nPQVJNUHeThLmC/sYpwXyRNx68JLCpNINsoMG9mzNtamXmNxlGKMYHTtD3W19K3Rj+cW
 bVu2GB1AVpJs8j3S4VXJVb7+oTYDhv7tke4lXb77QRbGHMl8Qqa/wvX53uMib4Tg/6eZ
 v7wngPtr5tOEfTCAzjY39k2eYTG4CMaLtFFIzFW7pgPe6ar3mupc/Ectk4MfrkrUHBFZ
 s4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e0faUHZFhKqlJpCf1OkmBJeKUysMgYHHIjGAG+ug/PI=;
 b=Jn1YbJMPv9p+nxz+78Im6FMvzfkGiaNZZGcEGTe2m/ckn5U2vyyrB0PSUDwLDZtioZ
 Pq0FnLTSQR0Wm0ZCua4uuy5cQW6Li4S10IVOGCm2un5aSfHc0CuuHWsVyqU2l+SrXkzi
 VQXRCixso+2aa3NryjOTMuvR2lI8f42jJQRvCAJD8xlHUm8FWKCtOAV9TeR2zW0hy44y
 UyvT6etnFO3E53yD2BVcrBPSisKsMGkBNSf19FLgcS4otXeMxPvojsbNH1J1V5tbRxEN
 CTLPjF6DR/i5phd/6AsTrOTym8Hc1jjeeordyTAnH8oo2fldrDwDtJ94mz6Sifk2iNz/
 rXdA==
X-Gm-Message-State: ANhLgQ1GSqTkKBT8hlVhc6R9n2NzjzeQkYyZe6aYyQ3dxRUYbOFG8Fm7
 T9BG99oymaT0WqW6UY9uEO6KGGRl
X-Google-Smtp-Source: ADFU+vuMJnZPMzh8bisZWM5wlzPCE+bXiYDrTZSQPuRrkAL0RmoHbK93ml9Jzd1z4wz/JWuxBBeq7A==
X-Received: by 2002:a65:4c88:: with SMTP id m8mr1346235pgt.192.1584687773688; 
 Fri, 20 Mar 2020 00:02:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:02:53 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:42 +0530
Message-Id: <20200320070157.4206-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 11/26] parsing_cocci:
	function_prototypes: Add cases for ParenType/FunctionType
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
cases for these types in function_prototypes.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/function_prototypes.ml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_cocci/function_prototypes.ml b/parsing_cocci/function_prototypes.ml
index 2e6eea43..fd36f31b 100644
--- a/parsing_cocci/function_prototypes.ml
+++ b/parsing_cocci/function_prototypes.ml
@@ -229,6 +229,10 @@ let rec attach_right strings ty =
     | Ast0.FunctionPointer(ty,lp,star,rp,lp1,ps,rp1) ->
 	Ast0.FunctionPointer(ty,lp,star,rp,lp1,ps,
 			     right_attach_mcode strings rp1)
+    | Ast0.ParenType(lp,ty,rp) ->
+	Ast0.ParenType(lp,ty,right_attach_mcode strings rp)
+    | Ast0.FunctionType(ty,lp,ps,rp) ->
+	Ast0.FunctionType(ty,lp,ps,right_attach_mcode strings rp)
     | Ast0.Array(ty,lb,e,rb) ->
 	Ast0.Array(ty,lb,e,right_attach_mcode strings rb)
     | Ast0.Decimal(dec,lp,e1,comma,e2,rp) ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
