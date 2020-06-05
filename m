Return-Path: <SRS0=7LP4=7S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EB8C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD7B206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jco1elIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CD7B206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3CD42253CA;
	Fri,  5 Jun 2020 13:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEnHayf6BfbI; Fri,  5 Jun 2020 13:44:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 70F572038B;
	Fri,  5 Jun 2020 13:44:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DB1CC0888;
	Fri,  5 Jun 2020 13:44:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C04DC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8C2AE88778
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e806ZUMFQ7Hw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 11106884DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:56 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id b7so3300591pju.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufMl+xv8bNr3ftwXMxG2RrjAxFKAfKqTdDmc4xiwlvI=;
 b=jco1elIY88esd4lvN4ib1FkM04X2Ci2a+T7TQY/IT86WvP16gePldUZgYMrDLZskUS
 yLUyX2za5ozM84o48jhMfyiHSm3k1+2hwKOHpqEdhfq5MliHtkMLhJbm7rupb02Kh9g+
 eMdKvn54RKB90HqGLoaXEKrZw6kxS46I7UqQD+gKH2sqkoV/GqZZZUAujO2W2qcLXZgV
 NtIBiOmI5qVwKZDb+tUKRsj8/skvTBEjOPvjje4/yIx11cnnU67VcvBVmdNqk9SvDZlK
 5/rnxZm0aA8MJs+ON6nRJ5tGG/iJ1rYkgvaYtZSNWdqwvHA/ioJx7JAI83oX/71yIiFh
 CZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufMl+xv8bNr3ftwXMxG2RrjAxFKAfKqTdDmc4xiwlvI=;
 b=czZ2mhR7slVmjI6OfI30Yzy2eRyYOnQJMhmNr0tWhjvcbbL0KbxIhpJDbRDysWSIBz
 ErEFVE394RZSIaX7Lbk6ZxtDue2uf2q/5RCugvbBLC9mglHxjuNl98Njvsy8Ovz2qj7j
 OTjqz9g6Q4eNKZo3AiXaMiWL1FGivyfvIhyvfQJri0IaiEdtRpwschAbgLB2BEwAPi7f
 uSt9ok8gT51LG3baT4VpbHY8ZK26J1DzgPoY2uwWzFNlouN6096of3DicUa+1pmWghOm
 B1mbf2qgCpZ4GXsyFZNFNbeyVRqkP7JyqeVrnKBlkWhM08R+d8EvyqelHtFUDHZtEADg
 H12A==
X-Gm-Message-State: AOAM532Qpt3LW7ovkLRSHo6OovrX8/sVGXL+Z0ABX2DNWu96YeO8U2HN
 yH5VnRMU/4ZzV+xax70USmd6nDirXnI=
X-Google-Smtp-Source: ABdhPJyWgd8RVFqhI0JH8x9SbBV5wn51O1ubimAVV5zXLgj0Fnmb4XCODLKjwA0zx07mMbbO5KyPiQ==
X-Received: by 2002:a17:902:301:: with SMTP id 1mr9805577pld.65.1591364695591; 
 Fri, 05 Jun 2020 06:44:55 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:22 +0530
Message-Id: <20200605134322.15307-15-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 14/14] cocci: standard.h: Annotate
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
