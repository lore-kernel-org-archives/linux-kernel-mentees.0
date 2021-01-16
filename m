Return-Path: <SRS0=IZhi=GT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_20,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AE3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 Jan 2021 12:22:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E29230F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 Jan 2021 12:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E29230F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9DE0120551;
	Sat, 16 Jan 2021 12:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGNTcor5fvOC; Sat, 16 Jan 2021 12:22:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E9D8F2037A;
	Sat, 16 Jan 2021 12:22:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB8CFC088B;
	Sat, 16 Jan 2021 12:22:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5218DC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 12:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 39C1B864C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 12:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XyEix4-1voO2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 12:22:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 148CC86375
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 12:22:30 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id h10so7240681pfo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Jan 2021 04:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=aSfzfxIe+vWkGzjQ/ybBnvuSI7c1jyrJfCj9Y090KJs=;
 b=KWAhOsnMzE5t0o/gUiPZJ2CRiccd19rGKFouMHRyo61Dur8KWqz5XY1YDtvF4D/e64
 HwhZII5aDVT+LQrvFYvjYCqwrtsdN8MhthSJfjoVqwTOyhw+ouj8KjCXCRmcksOXAj8i
 FranQZaJM+AOWpWvfJ8Sf6auP4MoRUV3gsxev9DKZwI6RvkG+fSmGVWfwLTLYW+P8Ik4
 ZuBi1Hp8A5kyOF3gwuci9KxEyLoOFj9/poGox/BZ817Wjol3Y6stcDaydeyl2a9wJZBx
 UIj/R3h2WHNJ1N9mUmRfl2CpdPLb2zqXlE3tijg4PWFjkOmHplY+/i5zq9iZDQdXA2aP
 gxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aSfzfxIe+vWkGzjQ/ybBnvuSI7c1jyrJfCj9Y090KJs=;
 b=SFfcy4Dw84mXiITpzYc/RNxedgmr7Lqp8Lh3z8aWdE0L+Q5akP4fJDu4QyCteNCXyC
 lh3C4JuvD+Ng8bL6dETbq5IVWEzSd7SEzXGt0XT9vdiDiBs2cBTnRQV0+bTTwBF2P0L8
 hb6EwVy+uWrpR3B0vKkz8wUSBiY7qI8di+8raNbZMPjpW6iB07nZYXsRHiChNXvyKiAw
 P5Ok3x2ikhTWw71jFfSHdEYr1JGK64R1ENtKc1IF558lCVXLGhJreO0TpxmqxewLjmKP
 FCPMLhKIo9oW9VXOcjNkWnriZStVNtzOOAo/Cu1VjYDJIaWQs7azY+C6oPhaAQnJqaqf
 QY5w==
X-Gm-Message-State: AOAM532kCy1bx32drz6K5NkiM49ZB+BVHpQLnLwZgua1aoMMAXn6E6Lo
 YwPuulbUcdLMjJqLb5tm3ts=
X-Google-Smtp-Source: ABdhPJwCDGm7/RgV7UXFvU2BZF10v3N1pFOdFSWrHJjhEUVUVuE+t5vtDWUg1RcSHf7V6XuHlSAPMQ==
X-Received: by 2002:a63:3246:: with SMTP id y67mr17363709pgy.438.1610799749499; 
 Sat, 16 Jan 2021 04:22:29 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:d5f1:b937:d897:55ba])
 by smtp.googlemail.com with ESMTPSA id h1sm11535789pgj.59.2021.01.16.04.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 04:22:28 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sat, 16 Jan 2021 17:52:20 +0530
Message-Id: <20210116122220.27261-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for avoiding
	.L prefix symbols in assembly files
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

Local symbols prefixed with '.L' do not emit symbol table entries, as
they have special meaning for the assembler.

'.L' prefixed symbols can be used within a code region, but should be
avoided for denoting a range of code via 'SYM_*_START/END' annotations.

Add a new check to emit warning on finding the usage of '.L' symbols
in '.S' files.

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk/
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7030c4d6d126..87d96a039e64 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3590,6 +3590,12 @@ sub process {
 			}
 		}
 
+# check for .L prefix local symbols in .S files
+		if ($realfile =~ /\.S$/ && $line =~ /\.L\S+/) {
+			WARN("AVOID_L_PREFIX",
+			     "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotations.rst\n" . $herecurr);
+		}
+
 # check we are in a valid source file C or perl if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
