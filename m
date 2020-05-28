Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DFBC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3637920888
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 12:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+7Jd6Q8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3637920888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1433F25931;
	Thu, 28 May 2020 12:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etkwL04tOhl5; Thu, 28 May 2020 12:25:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EECC225935;
	Thu, 28 May 2020 12:25:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD1FFC088D;
	Thu, 28 May 2020 12:25:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95BE9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 91C1625935
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sA4BQ925PmOp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id E282A25931
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 12:25:26 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id q24so3056986pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 05:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufMl+xv8bNr3ftwXMxG2RrjAxFKAfKqTdDmc4xiwlvI=;
 b=O+7Jd6Q8CQdT8Kq2RVIbSOgnEIR1L/AiYUCZRg4PUWRMs7v8g7ZaWFUmRl19bwJphz
 oeYIdVlSfRvzDpmm2Sga/xB2TnKi6Licgc4IfDopuedyGXlW847kAy1GOfb7RhlNC5mf
 ObmAZoagAVxDmKOyKmZDjpOzDO705LG5ZVOA/JMNu6ctvbueXfHSQZXSNnHw1R1qrKBN
 1og/1BLwbTjXTvei85SL79fwFlXlP753N19qQf8seSeHC65IakdW1W/3WGI0Rprqs16a
 H4MSma3T3qOqWYPHXsQjayBDTnut9ILXSJSh9TztMFyAqA01lHf+0i6KW0JoN9APReOV
 +U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufMl+xv8bNr3ftwXMxG2RrjAxFKAfKqTdDmc4xiwlvI=;
 b=pbXTQDLafuOOxaC8rkwNPQqtZiMlpNWqvnO89/RVmp4HdPG8c7ELSLHe3brfO2vPTG
 8QAoAQPBd3Pc8sHIhHSbuhhMIl8fSa0Y4qvb1Sm0NQpmHhgknIyTdGaTLpF7g2HEl8U1
 tz2NuFpW5Gslk0XXFEBWkEXRX13yyM2VqsyoaxzYlcX+wvs/TLb+1kCj6yAraxrHgt+H
 K0J+XI3yHuaK4NF9s2LuQwoiwSSYZF1MHvqYUs5Pr1yOJNoZ2mWGil3lm688yMi8nxDa
 kq3JvXIr21zaRcx0yX1jLF22N6HsoWHI7YnqtMc4PfUJkNlrIGMEfibHFUf3kqVE9KFG
 P4RA==
X-Gm-Message-State: AOAM533hpC87cXUrq1/6npo9JpAwuXSRBhn5mt0xN3lHB9rXlxObnnOY
 vARZ1DHSnKro9uDrd2iFDv0=
X-Google-Smtp-Source: ABdhPJyjvIwv70j87l6AhrCSB0oeNCIPLizRd7L0qORxeWSunNKxThl8tG6HS6T1XtdDRcJQisSrjg==
X-Received: by 2002:a17:902:d711:: with SMTP id
 w17mr3118850ply.139.1590668726409; 
 Thu, 28 May 2020 05:25:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2183:e360:deba:7bf4:98ef:5568])
 by smtp.gmail.com with ESMTPSA id 1sm5722888pje.26.2020.05.28.05.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:25:25 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Thu, 28 May 2020 17:54:15 +0530
Message-Id: <20200528122428.4212-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
References: <20200528122428.4212-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 13/25] cocci: standard.h: Annotate
	attributes with MACROANNOTATION
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

Apply the MACROANNOTATION hint to select attributes in standard.h. These
hints can be replaced, removed or added by the user as their use case
demands.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 standard.h | 116 ++++++++++++++++++++++++++---------------------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/standard.h b/standard.h
index 7a7f96ea..a25d2ae7 100644
--- a/standard.h
+++ b/standard.h
@@ -87,46 +87,46 @@
 // ----------------------------------------------------------------------------
 // Attributes. could perhaps generalize via "__.*"
 // ----------------------------------------------------------------------------
-#define  __init
-#define  __initconst
-#define  __page_aligned_data
-#define  __page_aligned_bss
-#define  __always_unused
-#define  __visible
-#define  __exit
-#define  __user
-#define  __iomem
-#define  __initdata
-#define  __exitdata
-#define  __devinit
-#define  __devexit
-#define  __devinitdata
-#define  __cpuinit
-#define  __cpuinitdata
-#define  __init_or_module
-#define  __initdata_or_module
-#define  __pminit
-#define  __pminitdata
-#define  __irq_entry
-
-#define  __cacheline_aligned
-#define  ____cacheline_aligned
-#define  __cacheline_aligned_in_smp
-#define  ____cacheline_aligned_in_smp
-#define  ____cacheline_internodealigned_in_smp
+#define  __init MACROANNOTATION
+#define  __initconst MACROANNOTATION
+#define  __page_aligned_data MACROANNOTATION
+#define  __page_aligned_bss MACROANNOTATION
+#define  __always_unused MACROANNOTATION
+#define  __visible MACROANNOTATION
+#define  __exit MACROANNOTATION
+#define  __user MACROANNOTATION
+#define  __iomem MACROANNOTATION
+#define  __initdata MACROANNOTATION
+#define  __exitdata MACROANNOTATION
+#define  __devinit MACROANNOTATION
+#define  __devexit MACROANNOTATION
+#define  __devinitdata MACROANNOTATION
+#define  __cpuinit MACROANNOTATION
+#define  __cpuinitdata MACROANNOTATION
+#define  __init_or_module MACROANNOTATION
+#define  __initdata_or_module MACROANNOTATION
+#define  __pminit MACROANNOTATION
+#define  __pminitdata MACROANNOTATION
+#define  __irq_entry MACROANNOTATION
+
+#define  __cacheline_aligned MACROANNOTATION
+#define  ____cacheline_aligned MACROANNOTATION
+#define  __cacheline_aligned_in_smp MACROANNOTATION
+#define  ____cacheline_aligned_in_smp MACROANNOTATION
+#define  ____cacheline_internodealigned_in_smp MACROANNOTATION
 
 #define  __ALIGNED__
 #define  __3xp_aligned
 
-#define  __pmac
-#define  __force
-#define  __nocast
-#define  __read_mostly
+#define  __pmac MACROANNOTATION
+#define  __force MACROANNOTATION
+#define  __nocast MACROANNOTATION
+#define  __read_mostly MACROANNOTATION
 
-#define  __must_check
+#define  __must_check MACROANNOTATION
 // pb
-#define  __unused
-#define  __maybe_unused
+#define  __unused MACROANNOTATION
+#define  __maybe_unused MACROANNOTATION
 
 
 #define  __attribute_used__
@@ -139,27 +139,27 @@
 #define  __xipram
 
 // in the other part of the kernel, in arch/, mm/, etc
-#define  __sched
-#define  __initmv
-#define  __exception
-#define  __cpuexit
-#define  __kprobes
-#define  __meminit
-#define  __meminitdata
-#define  __nosavedata
-#define  __kernel
-#define  __nomods_init
-#define  __apicdebuginit
-#define  __ipc_init
-#define  __modinit
-#define  __lockfunc
-#define  __weak
-#define  __tlb_handler_align
-#define  __lock_aligned
-#define  __force_data
-#define  __nongprelbss
-#define  __nongpreldata
-#define  __noreturn
+#define  __sched MACROANNOTATION
+#define  __initmv MACROANNOTATION
+#define  __exception MACROANNOTATION
+#define  __cpuexit MACROANNOTATION
+#define  __kprobes MACROANNOTATION
+#define  __meminit MACROANNOTATION
+#define  __meminitdata MACROANNOTATION
+#define  __nosavedata MACROANNOTATION
+#define  __kernel MACROANNOTATION
+#define  __nomods_init MACROANNOTATION
+#define  __apicdebuginit MACROANNOTATION
+#define  __ipc_init MACROANNOTATION
+#define  __modinit MACROANNOTATION
+#define  __lockfunc MACROANNOTATION
+#define  __weak MACROANNOTATION
+#define  __tlb_handler_align MACROANNOTATION
+#define  __lock_aligned MACROANNOTATION
+#define  __force_data MACROANNOTATION
+#define  __nongprelbss MACROANNOTATION
+#define  __nongpreldata MACROANNOTATION
+#define  __noreturn MACROANNOTATION
 
 #define  __section_jiffies
 #define  __vsyscall_fn
@@ -193,9 +193,9 @@
 
 
 // last last
-#define __net_init
-#define __net_exit
-#define __net_initdata
+#define __net_init MACROANNOTATION
+#define __net_exit MACROANNOTATION
+#define __net_initdata MACROANNOTATION
 
 #define __paginginit // in mm
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
