Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33A4C55194
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A829B20728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr036kb7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A829B20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9939686F47;
	Fri, 24 Apr 2020 09:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzI9mMMij-yK; Fri, 24 Apr 2020 09:19:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 44B2986F3B;
	Fri, 24 Apr 2020 09:19:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34501C089E;
	Fri, 24 Apr 2020 09:19:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD90BC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AC82488116
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JuprLYfWXM7I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3029386443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:49 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x2so815188pfx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tg8TivWc/r8jtttAIWUADKtf5xjAapRVbCp7eqUmDZg=;
 b=cr036kb7+dj1kGPnNMn1pw2kAY+Jf3MCdzgNxOZLkTu8ILKaxgUlSToKp4+86g22H2
 wR24CzQqyh/VCESeJ3VdynuWf8zbl8JvwhcKYvaaX4lRhYIGq2cBr40lt2pUioYJ5xFC
 SJUD6rcimvKXUEfRDTpB8odZpZ8nwdR5tGyyW6gU2QAmATGYU2ysoGp3I3jT8kXjkrlh
 hJ+5W6dRVMZSJyTBbtUyutO735oASS6D2XOWAoDO2woY6IpNeO/jE7R4xQ5YQ3duD5Y0
 29l9rC/NJkatK/HZkkq5GxZijxzUSR9m+2IPoJhzftPsv+FHwdZErYOj4n+icRfJ6yki
 GJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tg8TivWc/r8jtttAIWUADKtf5xjAapRVbCp7eqUmDZg=;
 b=sIMxaQ63Y8VyowUq2cT6notpfTLkCpakrL3BDOO1nxVEDjxETknUYZo+y7sfCOAOfC
 B6vl6n92JivPnf/a/HWdDuAM9S4HVEj2FT+MoQWhvtKtjtV4ymWnKGnteB15Waox8g9I
 rxRIS1FNxNccA25qOJefl1IwmOlwSgJ+o4RR76roj1R5ILx9zoqLcKh56O9+u+3SDCMr
 hXTB8Ey2+DOIIED8Kcg/dOMRLfdSvhJJYI4nkTrg+oOOGBSpGuMZd5+nmjNqo+6J9bVd
 m8FZmKQkox0F3gSPBw3FN7gs5elIlXowlkFV3zSIVGqJzPODD+ti63YDd3VgVTttSiaw
 um9Q==
X-Gm-Message-State: AGi0PuZGi1XaJ6F3AEbFmN+5Wg/dA6R1hOwm0fNeZvyA5BKuWhBcVGJq
 wegpvFB+QHk8I4rMzT5gr64=
X-Google-Smtp-Source: APiQypJ5ziW/ZyiXo/Eug9f4zByFPVbtjIh+G4M6CjjBGM6I73cdWNF50d/GmXn+S2IoS2XRa+46Sg==
X-Received: by 2002:a63:6a84:: with SMTP id f126mr8244943pgc.14.1587719988766; 
 Fri, 24 Apr 2020 02:19:48 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:48 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:57 +0530
Message-Id: <20200424091801.13871-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 21/25] parsing_c: visitor_c:
	Visit parameter attributes
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
