Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB644C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:30:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573A5619DC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573A5619DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12D764046F;
	Tue, 30 Mar 2021 21:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2nrUkwsfoz1; Tue, 30 Mar 2021 21:30:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0248840444;
	Tue, 30 Mar 2021 21:30:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE2CBC000C;
	Tue, 30 Mar 2021 21:30:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE364C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC02860775
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEYw-ob5Ukar
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:30:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4711960768
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:30:34 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id q10so1455768pgj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 14:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=z5Pwgcx5jldQHTjihKz5LQ36Y/UBnw6DyXH2bNjldL4=;
 b=UGG9UGBn4yDKVdheETHJU7898bNJ/rOuhIOxBtRrO5s7lVCtAFCACSWJtixvuDw64V
 avttHcBLJfEOaTetoOchdDeXmg0e/gnTTNc2CAUmr2qFiBqbvq+y3GI/BXAGLoZ+/3Ha
 sNQx0aUpHlWBg46RtfrfkgktB7PCDcDfyy1H9egsSNoshINTjQgFHy7WkdS1FMaFP3KM
 fLzvEYZp+VpSkB/yc9qXQ6DDR7xWj1AR9pb2m4o+Nd4wKAyD4xOe663Rh/LWfcpv528Z
 z2VaP3/CoRKF+g/ttZgVDUG6w37MCDne5WFQEAbAjg2vSRCgjr9bOXYaEx7wAFkjScE7
 Kv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=z5Pwgcx5jldQHTjihKz5LQ36Y/UBnw6DyXH2bNjldL4=;
 b=iarSmvwQGE4TC9XEPVDqMddmrEDN/83Lk6Mc6oGZK4od0whooYzdt/iJP/ctV3pVol
 +UC2gt2ANQtMIfyzChfmKfEGPA406mvik7/2whHBEjs47aUAEFgymJDfBOnhnicTkXBA
 DemmmsL2aepVfhPhXsxev+ZeUybIdEfsjxMOjfA6duYPiO3yrc9Mx4MzgBRMCrNLoR1k
 k3LQloPgSis3zttpzNeJEVO3G385dVeFanrG3wDEllsXZRvOuP0y3bXU3MJCvmQ4XxtZ
 Uf9gYoHQIroxYtaq93kTJw1afPHjPf7ny8I8bts1vwRB5x7yKGgsoN1duBBToZPMkoae
 LJ6Q==
X-Gm-Message-State: AOAM533dVFQO1jfSTdLiYAQ8eXeagd/OKQLlmilaYwkBBzfX4/Xrdh4Q
 i8aiU9ghDs08eyaydJnEJYg=
X-Google-Smtp-Source: ABdhPJzHUE6m7pRCZgtHJX31O2SfZcliToVP6diuEqC05Weo1MXgQ7Ug5Zw6trKkMAWPqAgGvlDy8w==
X-Received: by 2002:a62:764c:0:b029:1ef:20d2:b44 with SMTP id
 r73-20020a62764c0000b02901ef20d20b44mr30852603pfc.45.1617139833611; 
 Tue, 30 Mar 2021 14:30:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d1c0:d79d:e260:a650])
 by smtp.googlemail.com with ESMTPSA id i10sm8332761pjm.1.2021.03.30.14.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:30:33 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] x86/platform/intel/quark: fix incorrect kernel-doc comment
 syntax in files
Date: Wed, 31 Mar 2021 03:00:22 +0530
Message-Id: <20210330213022.28769-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: x86@kernel.org, hpa@zytor.com, yashsri421@gmail.com, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 mingo@redhat.com, bp@alien8.de, dvhart@infradead.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, andy@infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
There are certain files in arch/x86/platform/intel-quark, which follow this
syntax, but the content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in the header lines for
arch/x86/platform/intel-quark/imr.c causes these warnings:
"warning: Function parameter or member 'fmt' not described in 'pr_fmt'"
"warning: expecting prototype for c(). Prototype was for pr_fmt() instead"

Similarly for arch/x86/platform/intel-quark/imr_selftest.c too.

Provide a simple fix by replacing these occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 arch/x86/platform/intel-quark/imr.c          | 2 +-
 arch/x86/platform/intel-quark/imr_selftest.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/intel-quark/imr.c b/arch/x86/platform/intel-quark/imr.c
index 122e0f37b1f5..d3d456925b2a 100644
--- a/arch/x86/platform/intel-quark/imr.c
+++ b/arch/x86/platform/intel-quark/imr.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * imr.c -- Intel Isolated Memory Region driver
  *
  * Copyright(c) 2013 Intel Corporation.
diff --git a/arch/x86/platform/intel-quark/imr_selftest.c b/arch/x86/platform/intel-quark/imr_selftest.c
index 570e3062faac..761f3689f60a 100644
--- a/arch/x86/platform/intel-quark/imr_selftest.c
+++ b/arch/x86/platform/intel-quark/imr_selftest.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * imr_selftest.c -- Intel Isolated Memory Region self-test driver
  *
  * Copyright(c) 2013 Intel Corporation.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
