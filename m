Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97BBC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 20:44:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF1E61601
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 20:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FF1E61601
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FCC16063B;
	Tue, 30 Mar 2021 20:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yHkytfMOP2Y; Tue, 30 Mar 2021 20:44:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098EF60592;
	Tue, 30 Mar 2021 20:44:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3B3AC000B;
	Tue, 30 Mar 2021 20:44:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 056E6C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEED640248
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raDlQvk4QCEM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:44:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2063440243
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:44:16 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id m7so12569675pgj.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 13:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ikt8x9vsRo6fslY+KskypKUYg47GoKmKr0e0fK5lyqs=;
 b=JOV+dSI+6xbFizW0GgAZEadJ7Yl6usRyPRvG8pEMD4usKP+v2u2XOL9I5igrHZ+4Ux
 NuwtPUVfHV44u4dlDxgGdRggIolexZp8vx5fwUXRT6ElTZZ7LyLXCcSu2ZhOuYQw1luW
 8ioLGidpIcdruYRWThFp5pkaUrgrd/ECMlam+UKE85BHzcmdLTt6Af5kTsvUPmJRWgI7
 9E7OjOYrKdUlYjdjuOB08X9y3IlfyCJBZkzkmAC+KR6N6JPH6HXSbUeiQ8c9kSyyX/LN
 yp9pwtsX6/L3wcGODP77YSHph3ZDvoGTuhqRN7cB68wam9MNCWyTxoVKeE5bsJ8U3V0p
 dI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ikt8x9vsRo6fslY+KskypKUYg47GoKmKr0e0fK5lyqs=;
 b=qV1fIENW3LvfTWWYZbsG4TwpMenNLxlmt2EBD7NjDBKoRTGhqxGrIZ8yDMZzpBTsVy
 qmcSG8IV7ifEGc7i+truGvwuwCjsF26xRi9bbqpLnxxq9XR4JTk96lV5eqR/1vgiFPHV
 IKU0SXGH6BHMQI7CTwnjeqgBZ3+5H0AFCCidJgmHKY7ZvtuvuWCiCpwCbRqbH+ZjkLg1
 sy2123Bxbi9BhGPKnG2VnxLQnZ1RN03L2lH1Ur/7xliQsarbRBRmREqwMf6ZWDXRclP3
 LUa3zZ5QOhlVqQSYqI9c/1h3nMDGCsMTaJzFZpdvAtr1YvQQsmn5lRqNkEYwS26aF0Jo
 PMlg==
X-Gm-Message-State: AOAM530AilqdkA83V1uednx9o62DBg+8rQW5yYLWUbY1VqVw10dp3vBo
 scJ3JMbrYryweAygnKLmZ6w=
X-Google-Smtp-Source: ABdhPJxXNIpzrMiiqr0IM1h/qYcKH97qDHg9IAvuD6XcLfhFJZwojDnKm64sW/vAW7w6ew4gvOOI3Q==
X-Received: by 2002:a63:81:: with SMTP id 123mr29439711pga.307.1617137055341; 
 Tue, 30 Mar 2021 13:44:15 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d1c0:d79d:e260:a650])
 by smtp.googlemail.com with ESMTPSA id
 b140sm21677434pfb.98.2021.03.30.13.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 13:44:14 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux@armlinux.org.uk
Subject: [PATCH] ARM: mach-sa1100: fix incorrect kernel-doc comment syntax in
 file
Date: Wed, 31 Mar 2021 02:14:07 +0530
Message-Id: <20210330204407.25690-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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
The header for arch/arm/mach-sa1100/jornada720_ssp.c follows this syntax,
but the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes these warnings from kernel-doc:
"warning: Function parameter or member 'jornada_ssp_lock' not described in 'DEFINE_SPINLOCK'"
"warning: expecting prototype for mac(). Prototype was for DEFINE_SPINLOCK() instead"

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 arch/arm/mach-sa1100/jornada720_ssp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/jornada720_ssp.c b/arch/arm/mach-sa1100/jornada720_ssp.c
index 1dbe98948ce3..148bcee3ee58 100644
--- a/arch/arm/mach-sa1100/jornada720_ssp.c
+++ b/arch/arm/mach-sa1100/jornada720_ssp.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  *  arch/arm/mac-sa1100/jornada720_ssp.c
  *
  *  Copyright (C) 2006/2007 Kristoffer Ericson <Kristoffer.Ericson@gmail.com>
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
