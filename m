Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8A5C00A8F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Oct 2023 11:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94FA04311D;
	Tue, 24 Oct 2023 11:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94FA04311D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VpZ34DOO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7Kao8dHNfpA; Tue, 24 Oct 2023 11:28:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4F4B64054E;
	Tue, 24 Oct 2023 11:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F4B64054E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15573C0071;
	Tue, 24 Oct 2023 11:28:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B35DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 11:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C80DD4ED03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 11:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C80DD4ED03
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VpZ34DOO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mp7s5Lla8iYz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 11:28:48 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 435BD4ED02
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 11:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 435BD4ED02
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ca85ff26afso8234955ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 04:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698146927; x=1698751727;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CX4+doENGmNchlwWpwv+1yjRTi3YVh0wXhBLOXVVrzE=;
 b=VpZ34DOO0D4RdcjsrXqlstNqxGGSfECaoc3ckjkAgCaQye94dXRg5D+SJJJGcGHxjd
 uc2CO7wFDMwbfg4KjRxHGToEGHI66JBDs/lzAWP4uZFPMNzB+x+uLLUKvVIlBqgw4xZN
 FS85gXGKLSEyDPA6l9MeWZHZi885ArVGLx3TdJ4NHCq16dgluIcogcMqcX/M1Y/uDNoJ
 eRZ5q3CZzLI9ik+kxhLuNe4/RADjDD+t7FVobTR+Xwo7HBXG/TJtq0cw8vk8rskqRkaE
 11cQLkruB2I1L64uoblVcZvx0PJNbegbadoEEY06hTjq0RlxJvn/La3TFxjvH9eoetiE
 NLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698146927; x=1698751727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CX4+doENGmNchlwWpwv+1yjRTi3YVh0wXhBLOXVVrzE=;
 b=EyaBJwozrDnjSbvGsWxxkyN4xeHbXhIQCCIH0IdX4Y83YpweA1F9GqNv6bvNor/jsO
 OWEfBGMCAzMKe8gyCOMAD8kp5eE5y5iqoImOVOTpYbaKvVlPNeP1hGNMpYKBwc9Nqo8n
 MFVcdNsftAbkxm7dac79mPFW4O06m5htd7GcCyYFzPYbwiDEABrFXK7CbZHM0RLY6a3t
 9dgItmO/gg76Nm3UYDFAuaZ2YWqJVHt3HlH/BAZv+uzmVIghdvqKHbMSC/gioyOSlIAh
 +1omOYFq6PeCgLiGMBdDhCJMR7nswXvY1zbouzl8y+oIH1NG96dbNp+W1d8rJsmm7260
 slYg==
X-Gm-Message-State: AOJu0YzXH8+L6qgmOAI/xe6FRZxmfM6PNh4VbAUMA/S4MUNympNeHDqq
 XPb+cqiTXiqP0GX5A6M+hl4=
X-Google-Smtp-Source: AGHT+IHnUt4lOv0br/JRsZPJbyPC+wE41o4TMvkk1en97kacjTGvMMNuo1FHRQVaytnmZikbIAVbCw==
X-Received: by 2002:a17:902:dac6:b0:1c1:fbec:bc3f with SMTP id
 q6-20020a170902dac600b001c1fbecbc3fmr11428938plx.5.1698146927571; 
 Tue, 24 Oct 2023 04:28:47 -0700 (PDT)
Received: from abhinav.. ([103.75.161.208]) by smtp.gmail.com with ESMTPSA id
 q13-20020a17090311cd00b001b7f40a8959sm7219640plh.76.2023.10.24.04.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 04:28:47 -0700 (PDT)
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com
Subject: [PATCH] Fixing warning cast removes address space '__iomem' of
 expression
Date: Tue, 24 Oct 2023 16:58:32 +0530
Message-Id: <20231024112832.737832-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: Abhinav Singh <singhabhinav9051571833@gmail.com>,
 linux-hyperv@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

This patch fixes sparse complaining about the removal of __iomem address
space when casting the return value of this function ioremap_cache(...)
from `void __ioremap*` to `void*`.

I think there are two way of fixing it, first one is changing the
datatype of variable `ghcb_va` from `void*` to `void __iomem*` . 
Second way of fixing it is using the memremap(...) which is 
done in this patch.

Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
---
 arch/x86/hyperv/hv_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
index 21556ad87f4b..c14161add274 100644
--- a/arch/x86/hyperv/hv_init.c
+++ b/arch/x86/hyperv/hv_init.c
@@ -70,7 +70,7 @@ static int hyperv_init_ghcb(void)
 
 	/* Mask out vTOM bit. ioremap_cache() maps decrypted */
 	ghcb_gpa &= ~ms_hyperv.shared_gpa_boundary;
-	ghcb_va = (void *)ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
+	ghcb_va = memremap(ghcb_gpa, HV_HYP_PAGE_SIZE, MEMREMAP_WB);
 	if (!ghcb_va)
 		return -ENOMEM;
 
-- 
2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
