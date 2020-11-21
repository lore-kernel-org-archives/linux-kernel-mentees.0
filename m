Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BF3C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 21:24:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96ECB2168B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 21:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWcI8iwb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96ECB2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 426F487144;
	Sat, 21 Nov 2020 21:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPrCMqwxdhTx; Sat, 21 Nov 2020 21:24:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 840AF87140;
	Sat, 21 Nov 2020 21:24:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 767C3C163C;
	Sat, 21 Nov 2020 21:24:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15719C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 21:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D895F2010A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 21:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsEGBt6o+VdG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 21:24:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id ABAB420109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 21:24:46 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s63so703187pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 13:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BnOxX7b4mm9G8VJucOKIpWfXVT3cs4YugHsWF2jIPCc=;
 b=HWcI8iwbMHgmD1ojn/Y2aoCGdhDGGxzTID6QwMVCR5CdW8ePLBQISPOqAA0K2+bS+b
 u6dhxOpZmCCG//axZ73G223ihwtFoJt0iA5XzIwcoi9z13mp2V29T+q/bQzZEA+SdoaU
 xgjUMJiUiTAfUZAEjeeD+Dhzhzly9BjuLQyMMVqwTEtzrjzfEBPpL41V4TK8oLVh5KQq
 YhkzEdR42N4JXsxWOfh9IT2oljHFZGcNG7ZGWGvF6ci5JfPAj+XdYreoUJ5N9Tqg9teb
 oZYOgryGb7WlTZvyiHb3Mw2tW1mwkesn+O3n1zRQTicyWk0sgoedlZYaT3oW7pK7+Hfq
 d/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BnOxX7b4mm9G8VJucOKIpWfXVT3cs4YugHsWF2jIPCc=;
 b=p0dDgKwaOZH5Y2Utf2C+cQ/tXGa/6RkaeC1xC1f5EZ48Dos0Jd3A4nqSRVFX/sjPoK
 9JPOnI1OTg61hd+nxIcyFAOnQSl3kdZgJGtmaDPyld7NpEPaA/BiojETraPDpoLuQRh4
 lpPLlLzYpzTW6/vgMZyejLzmKkZAGixr4LIsp4iUeDdlyumUmWIgQmeaNRewZOX3YWUt
 O3S8TWVpQRueSgTTgEWI6LPSDeF+gCI9HgNjNn58VMJp551lguYRbpKqnGcJU1nYRnOt
 m7K2+g9NeIx+9bBSXPlEFGPcXEp1VOAogkwB5u698oUZwJSSRkhU/it7MyyvC1iqZWzd
 sjpg==
X-Gm-Message-State: AOAM531MNnT6eyiEw/p4PusJnvzPcsYWBJNV0b7PvRZSEboxekSBpbA+
 906BIw8hN/l/UAHXwiFKXI0=
X-Google-Smtp-Source: ABdhPJxgnlgJMm8+94QBVkRw+f835GSA1rrXa9iTK14keVvOKKig+B2+qra9RzXwbrBt1iZIpph71g==
X-Received: by 2002:a63:33c9:: with SMTP id z192mr2789015pgz.52.1605993886166; 
 Sat, 21 Nov 2020 13:24:46 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6897:89ae:e2b0:e24b:73e9])
 by smtp.gmail.com with ESMTPSA id d68sm7190134pfd.32.2020.11.21.13.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 13:24:45 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sun, 22 Nov 2020 02:54:14 +0530
Message-Id: <20201121212414.170840-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add --fix option for
	INCLUDE_LINUX
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

Provide fix option to INCLUDE_LINUX check to replace asm
includes.

Macros of type:
 #include <asm/percpu.h>

are corrected to:
 #include <linux/percpu.h>

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---

Changes in v2:
- Use \Q..\E quoting
- Use @ as regex delimiter

 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0da6422cd0fd..e4feb91a0fe4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5468,8 +5468,11 @@ sub process {
 						CHK("ARCH_INCLUDE_LINUX",
 						    "Consider using #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
 					} else {
-						WARN("INCLUDE_LINUX",
-						     "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr);
+						if (WARN("INCLUDE_LINUX",
+							 "Use #include <linux/$file> instead of <asm/$file>\n" . $herecurr) &&
+						    $fix) {
+							$fixed[$fixlinenr] =~ s@\Q<asm/$file>\E@<linux/$file>@;
+						}
 					}
 				}
 			}
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
