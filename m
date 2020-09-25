Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB76C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 21:21:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AB6B20738
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 21:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5FqWITr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AB6B20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0BB9B86D9A;
	Fri, 25 Sep 2020 21:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHR2qjHtiB0N; Fri, 25 Sep 2020 21:21:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8BA47866F2;
	Fri, 25 Sep 2020 21:21:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82C7BC0859;
	Fri, 25 Sep 2020 21:21:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C697C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 21:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 495C586EA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 21:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fImutZGDneyT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 21:21:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B692486D8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 21:21:29 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id f18so4449833pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u6KKWq2+b35m5c9bkcH3yComPFsYVoFlhHvMuxwCP6Q=;
 b=f5FqWITrzCt1VoD6hyYb881M2vfYba0VAWXS/PQTaO0Q9Y2ojkRRoYRs36v2MOEWCT
 D0nzWvzKTZOrT+P/lda7LXvxbgw/sqZO3baEiX216rD2KLBVu5Ygm70MqlNntKzPDbpc
 BLjAcjusBvWEPJU+pcrPCyzJzS1WmLZngnKDp+gShARzsUnQjTFs/oYFpNA4aaCNi9rt
 h9PYEhefdi8By1v9Bak5DuGXUGU4PphNmBhZvPq8FyABT0M0fFnCgGKsoADMgb8K6bfk
 Ow0WJQB348Z5bIdKHBtEVFx19sPSjlzdrMKNVLNd9o6EVbXqXsGDxxQTjvfP4Qpt31JH
 DJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u6KKWq2+b35m5c9bkcH3yComPFsYVoFlhHvMuxwCP6Q=;
 b=gwiHR1X+3BYSFP9gk2ZkKa4Wkaznm2JJdWnubucV7akulsvkZQh4rweHnJcE9O1C60
 S+xYQgoj14UZbWbfVQtSvil2WpOoPaQwEjKZPwmHOcJH2M/CF6nxpOvyMzFD3rH4b7Vr
 8/bdii/tHimpfqqKzVH0HvR/S9TdYqSg8DsQ9WSJr26ELc/qFpyjr8zXM+0mCTWGHylQ
 eWlCFuASFFrNfjlSFRqSsEM9DGitG0DwI5V3CT6Gg/vftSGdcyNs7+JZ9lzNTRULKYaR
 ZBink5MtYVcYDLXUUy+QcH7OA42OgVZ/JjRu/w/KkzlV8cvRh4Scs701Ear8IEkrrlBH
 2IYA==
X-Gm-Message-State: AOAM533yLS9+YW4HR8gpA4BDz02wY5tZ9mzeg3Aif5PJHj/WX+ZeDFch
 3D1sX5kEPasHZ1cPPu9YclY=
X-Google-Smtp-Source: ABdhPJzANHHmDU3rIAtk3vA+WteNV0+FP2dBT1+m+jrlkRNMW2HtstSGX7Ep7SI9I/ExsCV37FOsNg==
X-Received: by 2002:a63:c74f:: with SMTP id v15mr663816pgg.143.1601068889123; 
 Fri, 25 Sep 2020 14:21:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:2085:4633:7001:2dd8:81bf])
 by smtp.gmail.com with ESMTPSA id il14sm109425pjb.54.2020.09.25.14.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 14:21:28 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sat, 26 Sep 2020 02:50:08 +0530
Message-Id: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] kconfig: Prepend interpeters when
	calling scripts
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

Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
---
 init/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 91456ac0ef20..9f6ec575e3d1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -30,12 +30,12 @@ config CC_IS_GCC
 
 config GCC_VERSION
 	int
-	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
+	default $(shell,sh $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
 	default 0
 
 config LD_VERSION
 	int
-	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
+	default $(shell,$(LD) --version | awk -f $(srctree)/scripts/ld-version.sh)
 
 config CC_IS_CLANG
 	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
@@ -45,20 +45,20 @@ config LD_IS_LLD
 
 config CLANG_VERSION
 	int
-	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
+	default $(shell,sh $(srctree)/scripts/clang-version.sh $(CC))
 
 config CC_CAN_LINK
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
+	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
+	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
 
 config CC_CAN_LINK_STATIC
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
+	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
+	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
 
 config CC_HAS_ASM_GOTO
-	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
+	def_bool $(success,sh $(srctree)/scripts/gcc-goto.sh $(CC))
 
 config CC_HAS_ASM_GOTO_OUTPUT
 	depends on CC_HAS_ASM_GOTO
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
