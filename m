Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D085EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A674D212CC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpcOTYav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A674D212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A9BC882BE;
	Thu, 28 May 2020 12:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rix9cUz1fBJ; Thu, 28 May 2020 12:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04993880C6;
	Thu, 28 May 2020 12:25:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0571C088D;
	Thu, 28 May 2020 12:25:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88085C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8153D871B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQ5z9wp9qBgc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3129A871A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:57 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k22so11514299pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tg8TivWc/r8jtttAIWUADKtf5xjAapRVbCp7eqUmDZg=;
 b=ZpcOTYavyMve6iKZyvv0doSOJMqQ1H5yjLdD/v7rd+LBMsXdPyHv26GNj6b2sbz03N
 V6LcK44HiiyCEtvNyLMzXy1386rhI78baq3WJ/J7j+Zok/Uvr/Ay40WcHvwtz/35Rn9+
 BLHGVOH1NJRTBTc4QeSBciGRaFP0PtG0k7ezw322s+g0+NMCVSMIFxDPfDiSUHRbqZ3R
 gwIRXRgZDIGBti7uXTYLN/QOCvfhbDyMKvuI3TOau0QdCnSSp2nCK5I3M+/pgrmaXbjt
 9i/KjwrUr8uYqekmKlNSz2x4hmSbp6DIBeNyUfzRTkByIDK8hCkIu93qxk37e5hRNvg5
 3urQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tg8TivWc/r8jtttAIWUADKtf5xjAapRVbCp7eqUmDZg=;
 b=j2+65W34wggPUZk0KINBuoXYIqvKlSmxB7ZqTRTgOLumcsuKrZDdB7uSYEA16nJNT0
 r3cqGvubWfQy8oJgp4xCwzjSSR02rYuD9jR2ANz8WobuF5sEvnPnboMrvEqqpalwtYsz
 S124jIKxp9ylNqKhcfoq4cEv1WFdx49YMowJGG8XzRB6IDFLkmITrG7HAlqaHDh4C2sU
 jeg44oSKYYJgTr0VqsMkRwbEGzOetKqA+D++588eFHVhYSw2gB/iyMHq+bGKsT+k8cFR
 G3lsf1/AmS0hlRYQHv7jI5H7ABc+2vkJCccCOR6EvqacPgoumJ2rre6MWHv0zQdFACYe
 VyPw==
X-Gm-Message-State: AOAM530w7cgXFG9CbjEBg43/rQ0RVmbmPDWxdB0Mu/yhu6dF95kIuxEn
 7j3IrY64ZqOmwh2+ZZEssmjV/+zQ
X-Google-Smtp-Source: ABdhPJwcSRi2nEet8mF3iqpY2pKpFOPYpoe4AduNQIAMdsCycI7Otofo5E1U8HVYpE61s6ejytfobg==
X-Received: by 2002:a17:90b:80f:: with SMTP id
 bk15mr3633472pjb.51.1590668756753; 
 Thu, 28 May 2020 05:25:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:56 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:23 +0530
Message-Id: <20200528122428.4212-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 21/25] parsing_c: visitor_c: Visit
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

As attributes are added to the parameter type, have the C AST visitor
visit these attributes as well.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/visitor_c.ml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/parsing_c/visitor_c.ml b/parsing_c/visitor_c.ml
index aaef1acc..57b5f32b 100644
--- a/parsing_c/visitor_c.ml
+++ b/parsing_c/visitor_c.ml
@@ -1929,10 +1929,15 @@ and vk_node_s = fun bigf node ->
 (* ------------------------------------------------------------------------ *)
 and vk_param_s = fun bigf param ->
   let iif ii = vk_ii_s bigf ii in
-  let {p_namei = swrapopt; p_register = (b, iib); p_type=ft} = param in
+  let
+    {p_namei = swrapopt;
+     p_register = (b, iib);
+     p_type=ft;
+     p_attr = attrs} = param in
   { p_namei = swrapopt +> Common.map_option (vk_name_s bigf);
     p_register = (b, iif iib);
     p_type = vk_type_s bigf ft;
+    p_attr = attrs +> List.map (vk_attribute_s bigf);
   }
 
 let vk_arguments_s = fun bigf args ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
